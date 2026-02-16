<!--#include file="rptinc/ewrcfg4.asp"-->
<!--#include file="rptinc/ewrfn4.asp"-->
<!--#include file="rptinc/ewrusrfn.asp"-->
<%

' Variable for table object
Dim Report1

' Define table class
Class crReport1
	Dim ShowCurrentFilter ' Show current filter
	Dim FilterPanelOption ' Filter panel option
	Dim CurrentOrder ' Current order
	Dim CurrentOrderType ' Current order type
	Dim RestoreSession ' Restore Session

	' Table variable
	Public Property Get TableVar()
		TableVar = "Report1"
	End Property

	' Table name
	Public Property Get TableName()
		TableName = "Report1"
	End Property

	' Table type
	Public Property Get TableType()
		TableType = "REPORT"
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
			Set m_CODCLI = NewFldObj("Report1", "Report1", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_DIG = NewFldObj("Report1", "Report1", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_PATERNO = NewFldObj("Report1", "Report1", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_MATERNO = NewFldObj("Report1", "Report1", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_NOMBRE = NewFldObj("Report1", "Report1", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOMBRE.DateFilter = ""
			m_NOMBRE.SqlSelect = ""
			m_NOMBRE.SqlOrderBy = ""
		End If
		Set NOMBRE = m_NOMBRE
	End Property

	' fecmat
	Private m_fecmat

	Public Property Get fecmat()
		Dim ar
		If Not IsObject(m_fecmat) Then
			Set m_fecmat = NewFldObj("Report1", "Report1", "x_fecmat", "fecmat", "[fecmat]", 135, EWRPT_DATATYPE_DATE, 5)
			m_fecmat.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateYMD"), "%s", "/")
			m_fecmat.DateFilter = ""
			m_fecmat.SqlSelect = "SELECT DISTINCT [fecmat] FROM " & SqlFrom
			m_fecmat.SqlOrderBy = "[fecmat]"
		End If
		Set fecmat = m_fecmat
	End Property

	' JORNADA
	Private m_JORNADA

	Public Property Get JORNADA()
		Dim ar
		If Not IsObject(m_JORNADA) Then
			Set m_JORNADA = NewFldObj("Report1", "Report1", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			m_JORNADA.DateFilter = ""
			m_JORNADA.SqlSelect = "SELECT DISTINCT [JORNADA] FROM " & SqlFrom
			m_JORNADA.SqlOrderBy = "[JORNADA]"
		End If
		Set JORNADA = m_JORNADA
	End Property

	' CODCARR
	Private m_CODCARR

	Public Property Get CODCARR()
		Dim ar
		If Not IsObject(m_CODCARR) Then
			Set m_CODCARR = NewFldObj("Report1", "Report1", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
			m_CODCARR.DateFilter = ""
			m_CODCARR.SqlSelect = ""
			m_CODCARR.SqlOrderBy = ""
		End If
		Set CODCARR = m_CODCARR
	End Property

	' NOMBRE_C
	Private m_NOMBRE_C

	Public Property Get NOMBRE_C()
		Dim ar
		If Not IsObject(m_NOMBRE_C) Then
			Set m_NOMBRE_C = NewFldObj("Report1", "Report1", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOMBRE_C.DateFilter = ""
			m_NOMBRE_C.SqlSelect = "SELECT DISTINCT [NOMBRE_C] FROM " & SqlFrom
			m_NOMBRE_C.SqlOrderBy = "[NOMBRE_C]"
		End If
		Set NOMBRE_C = m_NOMBRE_C
	End Property

	' EstadoAcad
	Private m_EstadoAcad

	Public Property Get EstadoAcad()
		Dim ar
		If Not IsObject(m_EstadoAcad) Then
			Set m_EstadoAcad = NewFldObj("Report1", "Report1", "x_EstadoAcad", "EstadoAcad", "[EstadoAcad]", 200, EWRPT_DATATYPE_STRING, -1)
			m_EstadoAcad.DateFilter = ""
			m_EstadoAcad.SqlSelect = "SELECT DISTINCT [EstadoAcad] FROM " & SqlFrom
			m_EstadoAcad.SqlOrderBy = "[EstadoAcad]"
		End If
		Set EstadoAcad = m_EstadoAcad
	End Property

	' COMUNA
	Private m_COMUNA

	Public Property Get COMUNA()
		Dim ar
		If Not IsObject(m_COMUNA) Then
			Set m_COMUNA = NewFldObj("Report1", "Report1", "x_COMUNA", "COMUNA", "[COMUNA]", 200, EWRPT_DATATYPE_STRING, -1)
			m_COMUNA.DateFilter = ""
			m_COMUNA.SqlSelect = "SELECT DISTINCT [COMUNA] FROM " & SqlFrom
			m_COMUNA.SqlOrderBy = "[COMUNA]"
		End If
		Set COMUNA = m_COMUNA
	End Property

	' CIUDADACT
	Private m_CIUDADACT

	Public Property Get CIUDADACT()
		Dim ar
		If Not IsObject(m_CIUDADACT) Then
			Set m_CIUDADACT = NewFldObj("Report1", "Report1", "x_CIUDADACT", "CIUDADACT", "[CIUDADACT]", 200, EWRPT_DATATYPE_STRING, -1)
			m_CIUDADACT.DateFilter = ""
			m_CIUDADACT.SqlSelect = "SELECT DISTINCT [CIUDADACT] FROM " & SqlFrom
			m_CIUDADACT.SqlOrderBy = "[CIUDADACT]"
		End If
		Set CIUDADACT = m_CIUDADACT
	End Property

	' ESTACAD
	Private m_ESTACAD

	Public Property Get ESTACAD()
		Dim ar
		If Not IsObject(m_ESTACAD) Then
			Set m_ESTACAD = NewFldObj("Report1", "Report1", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			m_ESTACAD.DateFilter = ""
			m_ESTACAD.SqlSelect = "SELECT DISTINCT [ESTACAD] FROM " & SqlFrom
			m_ESTACAD.SqlOrderBy = "[ESTACAD]"
		End If
		Set ESTACAD = m_ESTACAD
	End Property

	' AñoIng
	Private m_AF1oIng

	Public Property Get AF1oIng()
		Dim ar
		If Not IsObject(m_AF1oIng) Then
			Set m_AF1oIng = NewFldObj("Report1", "Report1", "x_AF1oIng", "AñoIng", "[AñoIng]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_AF1oIng.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_AF1oIng.DateFilter = ""
			m_AF1oIng.SqlSelect = "SELECT DISTINCT [AñoIng] FROM " & SqlFrom
			m_AF1oIng.SqlOrderBy = "[AñoIng]"
		End If
		Set AF1oIng = m_AF1oIng
	End Property

	' AñoMat
	Private m_AF1oMat

	Public Property Get AF1oMat()
		Dim ar
		If Not IsObject(m_AF1oMat) Then
			Set m_AF1oMat = NewFldObj("Report1", "Report1", "x_AF1oMat", "AñoMat", "[AñoMat]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_AF1oMat.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_AF1oMat.DateFilter = ""
			m_AF1oMat.SqlSelect = "SELECT DISTINCT [AñoMat] FROM " & SqlFrom
			m_AF1oMat.SqlOrderBy = "[AñoMat]"
		End If
		Set AF1oMat = m_AF1oMat
	End Property

	' TIPOCARR
	Private m_TIPOCARR

	Public Property Get TIPOCARR()
		Dim ar
		If Not IsObject(m_TIPOCARR) Then
			Set m_TIPOCARR = NewFldObj("Report1", "Report1", "x_TIPOCARR", "TIPOCARR", "[TIPOCARR]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_TIPOCARR.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_TIPOCARR.DateFilter = ""
			m_TIPOCARR.SqlSelect = "SELECT DISTINCT [TIPOCARR] FROM " & SqlFrom
			m_TIPOCARR.SqlOrderBy = "[TIPOCARR]"
		End If
		Set TIPOCARR = m_TIPOCARR
	End Property

	' MATRICULADO
	Private m_MATRICULADO

	Public Property Get MATRICULADO()
		Dim ar
		If Not IsObject(m_MATRICULADO) Then
			Set m_MATRICULADO = NewFldObj("Report1", "Report1", "x_MATRICULADO", "MATRICULADO", "[MATRICULADO]", 200, EWRPT_DATATYPE_STRING, -1)
			m_MATRICULADO.DateFilter = ""
			m_MATRICULADO.SqlSelect = "SELECT DISTINCT [MATRICULADO] FROM " & SqlFrom
			m_MATRICULADO.SqlOrderBy = "[MATRICULADO]"
		End If
		Set MATRICULADO = m_MATRICULADO
	End Property

	' PERIODO_MAT
	Private m_PERIODO_MAT

	Public Property Get PERIODO_MAT()
		Dim ar
		If Not IsObject(m_PERIODO_MAT) Then
			Set m_PERIODO_MAT = NewFldObj("Report1", "Report1", "x_PERIODO_MAT", "PERIODO_MAT", "[PERIODO_MAT]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_PERIODO_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_PERIODO_MAT.DateFilter = ""
			m_PERIODO_MAT.SqlSelect = "SELECT DISTINCT [PERIODO_MAT] FROM " & SqlFrom
			m_PERIODO_MAT.SqlOrderBy = "[PERIODO_MAT]"
		End If
		Set PERIODO_MAT = m_PERIODO_MAT
	End Property

	' SEXO
	Private m_SEXO

	Public Property Get SEXO()
		Dim ar
		If Not IsObject(m_SEXO) Then
			Set m_SEXO = NewFldObj("Report1", "Report1", "x_SEXO", "SEXO", "[SEXO]", 200, EWRPT_DATATYPE_STRING, -1)
			m_SEXO.DateFilter = ""
			m_SEXO.SqlSelect = "SELECT DISTINCT [SEXO] FROM " & SqlFrom
			m_SEXO.SqlOrderBy = "[SEXO]"
		End If
		Set SEXO = m_SEXO
	End Property

	' NACIONALIDAD
	Private m_NACIONALIDAD

	Public Property Get NACIONALIDAD()
		Dim ar
		If Not IsObject(m_NACIONALIDAD) Then
			Set m_NACIONALIDAD = NewFldObj("Report1", "Report1", "x_NACIONALIDAD", "NACIONALIDAD", "[NACIONALIDAD]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NACIONALIDAD.DateFilter = ""
			m_NACIONALIDAD.SqlSelect = "SELECT DISTINCT [NACIONALIDAD] FROM " & SqlFrom
			m_NACIONALIDAD.SqlOrderBy = "[NACIONALIDAD]"
		End If
		Set NACIONALIDAD = m_NACIONALIDAD
	End Property

	' FECNAC
	Private m_FECNAC

	Public Property Get FECNAC()
		Dim ar
		If Not IsObject(m_FECNAC) Then
			Set m_FECNAC = NewFldObj("Report1", "Report1", "x_FECNAC", "FECNAC", "[FECNAC]", 135, EWRPT_DATATYPE_DATE, 5)
			m_FECNAC.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateYMD"), "%s", "/")
			m_FECNAC.DateFilter = ""
			m_FECNAC.SqlSelect = "SELECT DISTINCT [FECNAC] FROM " & SqlFrom
			m_FECNAC.SqlOrderBy = "[FECNAC]"
			ReDim ar(2,2) ' Popup filter for FECNAC
			ar(0,0) = "@@1"
			ar(1,0) = ReportLanguage.Phrase("LastYear")
			ar(2,0) = ewrpt_IsLastYear() ' Return sql part
			ar(0,1) = "@@2"
			ar(1,1) = ReportLanguage.Phrase("ThisYear")
			ar(2,1) = ewrpt_IsThisYear() ' Return sql part
			ar(0,2) = "@@3"
			ar(1,2) = ReportLanguage.Phrase("NextYear")
			ar(2,2) = ewrpt_IsNextYear() ' Return sql part
			m_FECNAC.AdvancedFilters = ar
		End If
		Set FECNAC = m_FECNAC
	End Property

	' PUNTAJE
	Private m_PUNTAJE

	Public Property Get PUNTAJE()
		Dim ar
		If Not IsObject(m_PUNTAJE) Then
			Set m_PUNTAJE = NewFldObj("Report1", "Report1", "x_PUNTAJE", "PUNTAJE", "[PUNTAJE]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_PUNTAJE.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_PUNTAJE.DateFilter = ""
			m_PUNTAJE.SqlSelect = "SELECT DISTINCT [PUNTAJE] FROM " & SqlFrom
			m_PUNTAJE.SqlOrderBy = "[PUNTAJE]"
		End If
		Set PUNTAJE = m_PUNTAJE
	End Property

	' PAA
	Private m_PAA

	Public Property Get PAA()
		Dim ar
		If Not IsObject(m_PAA) Then
			Set m_PAA = NewFldObj("Report1", "Report1", "x_PAA", "PAA", "[PAA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_PAA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_PAA.DateFilter = ""
			m_PAA.SqlSelect = "SELECT DISTINCT [PAA] FROM " & SqlFrom
			m_PAA.SqlOrderBy = "[PAA]"
		End If
		Set PAA = m_PAA
	End Property

	' ANOEEM
	Private m_ANOEEM

	Public Property Get ANOEEM()
		Dim ar
		If Not IsObject(m_ANOEEM) Then
			Set m_ANOEEM = NewFldObj("Report1", "Report1", "x_ANOEEM", "ANOEEM", "[ANOEEM]", 200, EWRPT_DATATYPE_STRING, -1)
			m_ANOEEM.DateFilter = ""
			m_ANOEEM.SqlSelect = "SELECT DISTINCT [ANOEEM] FROM " & SqlFrom
			m_ANOEEM.SqlOrderBy = "[ANOEEM]"
		End If
		Set ANOEEM = m_ANOEEM
	End Property

	' NOTAEM
	Private m_NOTAEM

	Public Property Get NOTAEM()
		Dim ar
		If Not IsObject(m_NOTAEM) Then
			Set m_NOTAEM = NewFldObj("Report1", "Report1", "x_NOTAEM", "NOTAEM", "[NOTAEM]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOTAEM.DateFilter = ""
			m_NOTAEM.SqlSelect = "SELECT DISTINCT [NOTAEM] FROM " & SqlFrom
			m_NOTAEM.SqlOrderBy = "[NOTAEM]"
		End If
		Set NOTAEM = m_NOTAEM
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
		Call ewrpt_SetArObj(Fields, "fecmat", fecmat)
		Call ewrpt_SetArObj(Fields, "JORNADA", JORNADA)
		Call ewrpt_SetArObj(Fields, "CODCARR", CODCARR)
		Call ewrpt_SetArObj(Fields, "NOMBRE_C", NOMBRE_C)
		Call ewrpt_SetArObj(Fields, "EstadoAcad", EstadoAcad)
		Call ewrpt_SetArObj(Fields, "COMUNA", COMUNA)
		Call ewrpt_SetArObj(Fields, "CIUDADACT", CIUDADACT)
		Call ewrpt_SetArObj(Fields, "ESTACAD", ESTACAD)
		Call ewrpt_SetArObj(Fields, "AF1oIng", AF1oIng)
		Call ewrpt_SetArObj(Fields, "AF1oMat", AF1oMat)
		Call ewrpt_SetArObj(Fields, "TIPOCARR", TIPOCARR)
		Call ewrpt_SetArObj(Fields, "MATRICULADO", MATRICULADO)
		Call ewrpt_SetArObj(Fields, "PERIODO_MAT", PERIODO_MAT)
		Call ewrpt_SetArObj(Fields, "SEXO", SEXO)
		Call ewrpt_SetArObj(Fields, "NACIONALIDAD", NACIONALIDAD)
		Call ewrpt_SetArObj(Fields, "FECNAC", FECNAC)
		Call ewrpt_SetArObj(Fields, "PUNTAJE", PUNTAJE)
		Call ewrpt_SetArObj(Fields, "PAA", PAA)
		Call ewrpt_SetArObj(Fields, "ANOEEM", ANOEEM)
		Call ewrpt_SetArObj(Fields, "NOTAEM", NOTAEM)
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
		SqlFrom = "Vista_Autoevaglobal"
	End Property

	Public Property Get SqlSelect() ' Select
		SqlSelect = "SELECT Vista_Autoevaglobal.* FROM " & SqlFrom
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

	' Table Level Group SQL
	Public Property Get SqlFirstGroupField()
		SqlFirstGroupField = ""
	End Property

	Public Property Get SqlSelectGroup()
		SqlSelectGroup = "SELECT DISTINCT " & SqlFirstGroupField & " FROM " & SqlFrom
	End Property

	Public Property Get SqlOrderByGroup()
		SqlOrderByGroup = ""
	End Property

	Public Property Get SqlSelectAgg()
		SqlSelectAgg = "SELECT * FROM " & SqlFrom
	End Property

	Public Property Get SqlAggPfx()
		SqlAggPfx = ""
	End Property

	Public Property Get SqlAggSfx()
		SqlAggSfx = ""
	End Property

	Public Property Get SqlSelectCount()
		SqlSelectCount = "SELECT COUNT(*) FROM " & SqlFrom
	End Property

	' Sort URL
	Function SortUrl(fld)
		SortUrl = ""
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
Response.Expires = 0
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "pragma", "no-cache"
Response.AddHeader "cache-control", "private, no-cache, no-store, must-revalidate"
%>
<%

' Define page object
Dim Report1_summary
Set Report1_summary = New crReport1_summary
Set Page = Report1_summary

' Page init processing
Call Report1_summary.Page_Init()

' Page main processing
Call Report1_summary.Page_Main()
%>
<!--#include file="rptinc/header.asp"-->
<% If Report1.Export = "" Then %>
<link rel="stylesheet" type="text/css" media="all" href="jscalendar/calendar-win2k-1.css" title="win2k-1" />
<script type="text/javascript" src="jscalendar/calendar.js"></script>
<script type="text/javascript" src="jscalendar/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar/calendar-setup.js"></script>
<script language="JavaScript" type="text/javascript">
<!--
// Write your client script here, no need to add script tags.
//-->
</script>
<% End If %>
<% Report1_summary.ShowPageHeader() %>
<% If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_DebugMsg() %>
<% Report1_summary.ShowMessage() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If Report1.Export = "" Then %>
<script src="rptjs/popup.js" type="text/javascript"></script>
<script src="rptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
<% Dim jsdata %>
// popup fields
<% jsdata = ewrpt_GetJsData(Report1.fecmat, Report1.fecmat.FldType) %>
ewrpt_CreatePopup("Report1_fecmat", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.JORNADA, Report1.JORNADA.FldType) %>
ewrpt_CreatePopup("Report1_JORNADA", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.NOMBRE_C, Report1.NOMBRE_C.FldType) %>
ewrpt_CreatePopup("Report1_NOMBRE_C", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.EstadoAcad, Report1.EstadoAcad.FldType) %>
ewrpt_CreatePopup("Report1_EstadoAcad", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.COMUNA, Report1.COMUNA.FldType) %>
ewrpt_CreatePopup("Report1_COMUNA", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.CIUDADACT, Report1.CIUDADACT.FldType) %>
ewrpt_CreatePopup("Report1_CIUDADACT", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.ESTACAD, Report1.ESTACAD.FldType) %>
ewrpt_CreatePopup("Report1_ESTACAD", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.AF1oIng, Report1.AF1oIng.FldType) %>
ewrpt_CreatePopup("Report1_AF1oIng", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.AF1oMat, Report1.AF1oMat.FldType) %>
ewrpt_CreatePopup("Report1_AF1oMat", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.TIPOCARR, Report1.TIPOCARR.FldType) %>
ewrpt_CreatePopup("Report1_TIPOCARR", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.MATRICULADO, Report1.MATRICULADO.FldType) %>
ewrpt_CreatePopup("Report1_MATRICULADO", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.PERIODO_MAT, Report1.PERIODO_MAT.FldType) %>
ewrpt_CreatePopup("Report1_PERIODO_MAT", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.SEXO, Report1.SEXO.FldType) %>
ewrpt_CreatePopup("Report1_SEXO", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.NACIONALIDAD, Report1.NACIONALIDAD.FldType) %>
ewrpt_CreatePopup("Report1_NACIONALIDAD", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.FECNAC, Report1.FECNAC.FldType) %>
ewrpt_CreatePopup("Report1_FECNAC", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.PUNTAJE, Report1.PUNTAJE.FldType) %>
ewrpt_CreatePopup("Report1_PUNTAJE", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.PAA, Report1.PAA.FldType) %>
ewrpt_CreatePopup("Report1_PAA", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.ANOEEM, Report1.ANOEEM.FldType) %>
ewrpt_CreatePopup("Report1_ANOEEM", [<%= jsdata %>]);
<% jsdata = ewrpt_GetJsData(Report1.NOTAEM, Report1.NOTAEM.FldType) %>
ewrpt_CreatePopup("Report1_NOTAEM", [<%= jsdata %>]);
</script>
<div id="Report1_fecmat_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_JORNADA_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_NOMBRE_C_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_EstadoAcad_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_COMUNA_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_CIUDADACT_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_ESTACAD_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_AF1oIng_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_AF1oMat_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_TIPOCARR_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_MATRICULADO_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_PERIODO_MAT_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_SEXO_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_NACIONALIDAD_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_FECNAC_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_PUNTAJE_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_PAA_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_ANOEEM_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<div id="Report1_NOTAEM_Popup" class="ewPopup">
<span class="aspreportmaker"></span>
</div>
<% End If %>
<% If Report1.Export = "" Then %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<%= Report1.TableCaption %>
<% If Report1.Export = "" Then %>
&nbsp;&nbsp;<a href="<%= Report1_summary.ExportExcelUrl %>"><%= ReportLanguage.Phrase("ExportToExcel") %></a>
<% If Report1_summary.FilterApplied Then %>
&nbsp;&nbsp;<a href="Report1smry.asp?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
<br><br>
<% If Report1.Export = "" Then %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspreportmaker">
	<!-- Left slot -->
<% End If %>
<% If Report1.Export = "" Then %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspreportmaker">
	<!-- center slot -->
<% End If %>
<!-- summary report starts -->
<div id="report_summary">
<% If Report1.ShowCurrentFilter Then %>
<div id="ewrptFilterList">
<% Call Report1_summary.ShowFilterList() %>
</div>
<br>
<% End If %>
<table class="ewGrid" cellspacing="0"><tr>
	<td class="ewGridContent">
<% If Report1.Export = "" Then %>
<div class="ewGridUpperPanel">
<form action="Report1smry.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(Report1_summary.StartGrp, Report1_summary.DisplayGrps, Report1_summary.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="Report1smry.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="Report1smry.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="Report1smry.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="Report1smry.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If Report1_summary.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If Report1_summary.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="20"<% If Report1_summary.DisplayGrps = 20 Then Response.Write " selected=""selected""" %>>20</option>
<option value="30"<% If Report1_summary.DisplayGrps = 30 Then Response.Write " selected=""selected""" %>>30</option>
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
If (Report1.ExportAll And Report1.Export <> "") Then
	Report1_summary.StopGrp = Report1_summary.TotalGrps
Else
	Report1_summary.StopGrp = Report1_summary.StartGrp + Report1_summary.DisplayGrps - 1
End If

' Stop group <= total number of groups
If CLng(Report1_summary.StopGrp) > CLng(Report1_summary.TotalGrps) Then
	Report1_summary.StopGrp = Report1_summary.TotalGrps
End If
Report1_summary.RecCount = 0

' Init Summary Values
Call Report1_summary.ResetLevelSummary(0)

' Get first row
If Report1_summary.TotalGrps > 0 Then
	Call Report1_summary.GetRow(1)
	Report1_summary.GrpCount = 1
End If
Do While (Not rs.Eof And Report1_summary.GrpCount <= Report1_summary.DisplayGrps) Or (Report1_summary.ShowFirstHeader)

	' Show Header
	If Report1_summary.ShowFirstHeader Then
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.CODCLI.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.CODCLI) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.CODCLI.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.CODCLI) %>',0);"><%= Report1.CODCLI.FldCaption %></td><td style="width: 10px;">
		<% If Report1.CODCLI.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.CODCLI.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.DIG.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.DIG) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.DIG.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.DIG) %>',0);"><%= Report1.DIG.FldCaption %></td><td style="width: 10px;">
		<% If Report1.DIG.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.DIG.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.PATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.PATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.PATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.PATERNO) %>',0);"><%= Report1.PATERNO.FldCaption %></td><td style="width: 10px;">
		<% If Report1.PATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.PATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.MATERNO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.MATERNO) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.MATERNO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.MATERNO) %>',0);"><%= Report1.MATERNO.FldCaption %></td><td style="width: 10px;">
		<% If Report1.MATERNO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.MATERNO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.NOMBRE.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.NOMBRE) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.NOMBRE.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.NOMBRE) %>',0);"><%= Report1.NOMBRE.FldCaption %></td><td style="width: 10px;">
		<% If Report1.NOMBRE.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.NOMBRE.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.fecmat.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.fecmat) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.fecmat.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.fecmat) %>',0);"><%= Report1.fecmat.FldCaption %></td><td style="width: 10px;">
		<% If Report1.fecmat.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.fecmat.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_fecmat', false, '<%= Report1.fecmat.RangeFrom %>', '<%= Report1.fecmat.RangeTo %>');return false;" name="x_fecmat<%= Report1_summary.Cnt(0,0) %>" id="x_fecmat<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.JORNADA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.JORNADA) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.JORNADA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.JORNADA) %>',0);"><%= Report1.JORNADA.FldCaption %></td><td style="width: 10px;">
		<% If Report1.JORNADA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.JORNADA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_JORNADA', false, '<%= Report1.JORNADA.RangeFrom %>', '<%= Report1.JORNADA.RangeTo %>');return false;" name="x_JORNADA<%= Report1_summary.Cnt(0,0) %>" id="x_JORNADA<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.NOMBRE_C.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.NOMBRE_C) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.NOMBRE_C.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.NOMBRE_C) %>',0);"><%= Report1.NOMBRE_C.FldCaption %></td><td style="width: 10px;">
		<% If Report1.NOMBRE_C.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.NOMBRE_C.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_NOMBRE_C', false, '<%= Report1.NOMBRE_C.RangeFrom %>', '<%= Report1.NOMBRE_C.RangeTo %>');return false;" name="x_NOMBRE_C<%= Report1_summary.Cnt(0,0) %>" id="x_NOMBRE_C<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.EstadoAcad.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.EstadoAcad) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.EstadoAcad.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.EstadoAcad) %>',0);"><%= Report1.EstadoAcad.FldCaption %></td><td style="width: 10px;">
		<% If Report1.EstadoAcad.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.EstadoAcad.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_EstadoAcad', false, '<%= Report1.EstadoAcad.RangeFrom %>', '<%= Report1.EstadoAcad.RangeTo %>');return false;" name="x_EstadoAcad<%= Report1_summary.Cnt(0,0) %>" id="x_EstadoAcad<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.COMUNA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.COMUNA) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.COMUNA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.COMUNA) %>',0);"><%= Report1.COMUNA.FldCaption %></td><td style="width: 10px;">
		<% If Report1.COMUNA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.COMUNA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_COMUNA', false, '<%= Report1.COMUNA.RangeFrom %>', '<%= Report1.COMUNA.RangeTo %>');return false;" name="x_COMUNA<%= Report1_summary.Cnt(0,0) %>" id="x_COMUNA<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.CIUDADACT.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.CIUDADACT) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.CIUDADACT.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.CIUDADACT) %>',0);"><%= Report1.CIUDADACT.FldCaption %></td><td style="width: 10px;">
		<% If Report1.CIUDADACT.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.CIUDADACT.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_CIUDADACT', false, '<%= Report1.CIUDADACT.RangeFrom %>', '<%= Report1.CIUDADACT.RangeTo %>');return false;" name="x_CIUDADACT<%= Report1_summary.Cnt(0,0) %>" id="x_CIUDADACT<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.ESTACAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.ESTACAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.ESTACAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.ESTACAD) %>',0);"><%= Report1.ESTACAD.FldCaption %></td><td style="width: 10px;">
		<% If Report1.ESTACAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.ESTACAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_ESTACAD', false, '<%= Report1.ESTACAD.RangeFrom %>', '<%= Report1.ESTACAD.RangeTo %>');return false;" name="x_ESTACAD<%= Report1_summary.Cnt(0,0) %>" id="x_ESTACAD<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.AF1oIng.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.AF1oIng) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.AF1oIng.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.AF1oIng) %>',0);"><%= Report1.AF1oIng.FldCaption %></td><td style="width: 10px;">
		<% If Report1.AF1oIng.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.AF1oIng.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_AF1oIng', false, '<%= Report1.AF1oIng.RangeFrom %>', '<%= Report1.AF1oIng.RangeTo %>');return false;" name="x_AF1oIng<%= Report1_summary.Cnt(0,0) %>" id="x_AF1oIng<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.AF1oMat.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.AF1oMat) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.AF1oMat.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.AF1oMat) %>',0);"><%= Report1.AF1oMat.FldCaption %></td><td style="width: 10px;">
		<% If Report1.AF1oMat.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.AF1oMat.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_AF1oMat', false, '<%= Report1.AF1oMat.RangeFrom %>', '<%= Report1.AF1oMat.RangeTo %>');return false;" name="x_AF1oMat<%= Report1_summary.Cnt(0,0) %>" id="x_AF1oMat<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.TIPOCARR.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.TIPOCARR) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.TIPOCARR.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.TIPOCARR) %>',0);"><%= Report1.TIPOCARR.FldCaption %></td><td style="width: 10px;">
		<% If Report1.TIPOCARR.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.TIPOCARR.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_TIPOCARR', false, '<%= Report1.TIPOCARR.RangeFrom %>', '<%= Report1.TIPOCARR.RangeTo %>');return false;" name="x_TIPOCARR<%= Report1_summary.Cnt(0,0) %>" id="x_TIPOCARR<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.MATRICULADO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.MATRICULADO) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.MATRICULADO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.MATRICULADO) %>',0);"><%= Report1.MATRICULADO.FldCaption %></td><td style="width: 10px;">
		<% If Report1.MATRICULADO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.MATRICULADO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_MATRICULADO', false, '<%= Report1.MATRICULADO.RangeFrom %>', '<%= Report1.MATRICULADO.RangeTo %>');return false;" name="x_MATRICULADO<%= Report1_summary.Cnt(0,0) %>" id="x_MATRICULADO<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.PERIODO_MAT.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.PERIODO_MAT) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.PERIODO_MAT.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.PERIODO_MAT) %>',0);"><%= Report1.PERIODO_MAT.FldCaption %></td><td style="width: 10px;">
		<% If Report1.PERIODO_MAT.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.PERIODO_MAT.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_PERIODO_MAT', false, '<%= Report1.PERIODO_MAT.RangeFrom %>', '<%= Report1.PERIODO_MAT.RangeTo %>');return false;" name="x_PERIODO_MAT<%= Report1_summary.Cnt(0,0) %>" id="x_PERIODO_MAT<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.SEXO.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.SEXO) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.SEXO.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.SEXO) %>',0);"><%= Report1.SEXO.FldCaption %></td><td style="width: 10px;">
		<% If Report1.SEXO.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.SEXO.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_SEXO', false, '<%= Report1.SEXO.RangeFrom %>', '<%= Report1.SEXO.RangeTo %>');return false;" name="x_SEXO<%= Report1_summary.Cnt(0,0) %>" id="x_SEXO<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.NACIONALIDAD.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.NACIONALIDAD) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.NACIONALIDAD.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.NACIONALIDAD) %>',0);"><%= Report1.NACIONALIDAD.FldCaption %></td><td style="width: 10px;">
		<% If Report1.NACIONALIDAD.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.NACIONALIDAD.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_NACIONALIDAD', false, '<%= Report1.NACIONALIDAD.RangeFrom %>', '<%= Report1.NACIONALIDAD.RangeTo %>');return false;" name="x_NACIONALIDAD<%= Report1_summary.Cnt(0,0) %>" id="x_NACIONALIDAD<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.FECNAC.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.FECNAC) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.FECNAC.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.FECNAC) %>',0);"><%= Report1.FECNAC.FldCaption %></td><td style="width: 10px;">
		<% If Report1.FECNAC.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.FECNAC.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_FECNAC', false, '<%= Report1.FECNAC.RangeFrom %>', '<%= Report1.FECNAC.RangeTo %>');return false;" name="x_FECNAC<%= Report1_summary.Cnt(0,0) %>" id="x_FECNAC<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.PUNTAJE.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.PUNTAJE) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.PUNTAJE.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.PUNTAJE) %>',0);"><%= Report1.PUNTAJE.FldCaption %></td><td style="width: 10px;">
		<% If Report1.PUNTAJE.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.PUNTAJE.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_PUNTAJE', false, '<%= Report1.PUNTAJE.RangeFrom %>', '<%= Report1.PUNTAJE.RangeTo %>');return false;" name="x_PUNTAJE<%= Report1_summary.Cnt(0,0) %>" id="x_PUNTAJE<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.PAA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.PAA) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.PAA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.PAA) %>',0);"><%= Report1.PAA.FldCaption %></td><td style="width: 10px;">
		<% If Report1.PAA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.PAA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_PAA', false, '<%= Report1.PAA.RangeFrom %>', '<%= Report1.PAA.RangeTo %>');return false;" name="x_PAA<%= Report1_summary.Cnt(0,0) %>" id="x_PAA<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.ANOEEM.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.ANOEEM) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.ANOEEM.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.ANOEEM) %>',0);"><%= Report1.ANOEEM.FldCaption %></td><td style="width: 10px;">
		<% If Report1.ANOEEM.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.ANOEEM.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_ANOEEM', false, '<%= Report1.ANOEEM.RangeFrom %>', '<%= Report1.ANOEEM.RangeTo %>');return false;" name="x_ANOEEM<%= Report1_summary.Cnt(0,0) %>" id="x_ANOEEM<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Report1.Export <> "" Then %>
<%= Report1.NOTAEM.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Report1.SortUrl(Report1.NOTAEM) = "" Then %>
		<td style="vertical-align: bottom;"><%= Report1.NOTAEM.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Report1.SortUrl(Report1.NOTAEM) %>',0);"><%= Report1.NOTAEM.FldCaption %></td><td style="width: 10px;">
		<% If Report1.NOTAEM.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Report1.NOTAEM.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
		<td style="width: 20px;" align="right"><a href="#" onclick="ewrpt_ShowPopup(this.name, 'Report1_NOTAEM', true, '<%= Report1.NOTAEM.RangeFrom %>', '<%= Report1.NOTAEM.RangeTo %>');return false;" name="x_NOTAEM<%= Report1_summary.Cnt(0,0) %>" id="x_NOTAEM<%= Report1_summary.Cnt(0,0) %>"><img src="rptimages/popup.gif" width="15" height="14" align="texttop" border="0" alt="<%= ReportLanguage.Phrase("Filter") %>"></a></td>
	</tr></table>
<% End If %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Report1_summary.ShowFirstHeader = False
	End If
	Report1_summary.RecCount = Report1_summary.RecCount + 1

		' Render detail row
		Call Report1.ResetCSS()
		Report1.RowType = EWRPT_ROWTYPE_DETAIL
		Call Report1_summary.RenderRow()
%>
	<tr<%= Report1.RowAttributes %>>
		<td<%= Report1.CODCLI.CellAttributes %>>
<div<%= Report1.CODCLI.ViewAttributes %>><%= Report1.CODCLI.ListViewValue %></div>
</td>
		<td<%= Report1.DIG.CellAttributes %>>
<div<%= Report1.DIG.ViewAttributes %>><%= Report1.DIG.ListViewValue %></div>
</td>
		<td<%= Report1.PATERNO.CellAttributes %>>
<div<%= Report1.PATERNO.ViewAttributes %>><%= Report1.PATERNO.ListViewValue %></div>
</td>
		<td<%= Report1.MATERNO.CellAttributes %>>
<div<%= Report1.MATERNO.ViewAttributes %>><%= Report1.MATERNO.ListViewValue %></div>
</td>
		<td<%= Report1.NOMBRE.CellAttributes %>>
<div<%= Report1.NOMBRE.ViewAttributes %>><%= Report1.NOMBRE.ListViewValue %></div>
</td>
		<td<%= Report1.fecmat.CellAttributes %>>
<div<%= Report1.fecmat.ViewAttributes %>><%= Report1.fecmat.ListViewValue %></div>
</td>
		<td<%= Report1.JORNADA.CellAttributes %>>
<div<%= Report1.JORNADA.ViewAttributes %>><%= Report1.JORNADA.ListViewValue %></div>
</td>
		<td<%= Report1.NOMBRE_C.CellAttributes %>>
<div<%= Report1.NOMBRE_C.ViewAttributes %>><%= Report1.NOMBRE_C.ListViewValue %></div>
</td>
		<td<%= Report1.EstadoAcad.CellAttributes %>>
<div<%= Report1.EstadoAcad.ViewAttributes %>><%= Report1.EstadoAcad.ListViewValue %></div>
</td>
		<td<%= Report1.COMUNA.CellAttributes %>>
<div<%= Report1.COMUNA.ViewAttributes %>><%= Report1.COMUNA.ListViewValue %></div>
</td>
		<td<%= Report1.CIUDADACT.CellAttributes %>>
<div<%= Report1.CIUDADACT.ViewAttributes %>><%= Report1.CIUDADACT.ListViewValue %></div>
</td>
		<td<%= Report1.ESTACAD.CellAttributes %>>
<div<%= Report1.ESTACAD.ViewAttributes %>><%= Report1.ESTACAD.ListViewValue %></div>
</td>
		<td<%= Report1.AF1oIng.CellAttributes %>>
<div<%= Report1.AF1oIng.ViewAttributes %>><%= Report1.AF1oIng.ListViewValue %></div>
</td>
		<td<%= Report1.AF1oMat.CellAttributes %>>
<div<%= Report1.AF1oMat.ViewAttributes %>><%= Report1.AF1oMat.ListViewValue %></div>
</td>
		<td<%= Report1.TIPOCARR.CellAttributes %>>
<div<%= Report1.TIPOCARR.ViewAttributes %>><%= Report1.TIPOCARR.ListViewValue %></div>
</td>
		<td<%= Report1.MATRICULADO.CellAttributes %>>
<div<%= Report1.MATRICULADO.ViewAttributes %>><%= Report1.MATRICULADO.ListViewValue %></div>
</td>
		<td<%= Report1.PERIODO_MAT.CellAttributes %>>
<div<%= Report1.PERIODO_MAT.ViewAttributes %>><%= Report1.PERIODO_MAT.ListViewValue %></div>
</td>
		<td<%= Report1.SEXO.CellAttributes %>>
<div<%= Report1.SEXO.ViewAttributes %>><%= Report1.SEXO.ListViewValue %></div>
</td>
		<td<%= Report1.NACIONALIDAD.CellAttributes %>>
<div<%= Report1.NACIONALIDAD.ViewAttributes %>><%= Report1.NACIONALIDAD.ListViewValue %></div>
</td>
		<td<%= Report1.FECNAC.CellAttributes %>>
<div<%= Report1.FECNAC.ViewAttributes %>><%= Report1.FECNAC.ListViewValue %></div>
</td>
		<td<%= Report1.PUNTAJE.CellAttributes %>>
<div<%= Report1.PUNTAJE.ViewAttributes %>><%= Report1.PUNTAJE.ListViewValue %></div>
</td>
		<td<%= Report1.PAA.CellAttributes %>>
<div<%= Report1.PAA.ViewAttributes %>><%= Report1.PAA.ListViewValue %></div>
</td>
		<td<%= Report1.ANOEEM.CellAttributes %>>
<div<%= Report1.ANOEEM.ViewAttributes %>><%= Report1.ANOEEM.ListViewValue %></div>
</td>
		<td<%= Report1.NOTAEM.CellAttributes %>>
<div<%= Report1.NOTAEM.ViewAttributes %>><%= Report1.NOTAEM.ListViewValue %></div>
</td>
	</tr>
<%

		' Accumulate page summary
		Call Report1_summary.AccumulateSummary()

		' Get next record
		Call Report1_summary.GetRow(2)
		Report1_summary.GrpCount = Report1_summary.GrpCount + 1
Loop
%>
	</tbody>
	<tfoot>
<%
If Report1_summary.TotalGrps > 0 Then
	Call Report1.ResetCSS()
	Report1.RowType = EWRPT_ROWTYPE_TOTAL
	Report1.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Report1.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER
	Call ewrpt_SetAttr(Report1.RowAttrs, "class", "ewRptGrandSummary")
	Call Report1_summary.RenderRow()
%>
	<!-- tr><td colspan="24"><span class="aspreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Report1.RowAttributes %>><td colspan="24"><%= ReportLanguage.Phrase("RptGrandTotal") %>&nbsp;(<%= ewrpt_FormatNumber(Report1_summary.TotCount,0,-2,-2,-2) %>&nbsp;<%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If Report1_summary.TotalGrps > 0 Then %>
<% If Report1.Export = "" Then %>
<div class="ewGridLowerPanel">
<form action="Report1smry.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(Report1_summary.StartGrp, Report1_summary.DisplayGrps, Report1_summary.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="Report1smry.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="Report1smry.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="Report1smry.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="Report1smry.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If Report1_summary.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If Report1_summary.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="20"<% If Report1_summary.DisplayGrps = 20 Then Response.Write " selected=""selected""" %>>20</option>
<option value="30"<% If Report1_summary.DisplayGrps = 30 Then Response.Write " selected=""selected""" %>>30</option>
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
<% If Report1.Export = "" Then %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspreportmaker">
	<!-- Right slot -->
<% End If %>
<% If Report1.Export = "" Then %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspreportmaker">
	<!-- Bottom slot -->
<% End If %>
<% If Report1.Export = "" Then %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% End If %>
<% Report1_summary.ShowPageFooter() %>
<%

' Close recordset and connection
rs.Close
Set rs = Nothing
%>
<% If Report1.Export = "" Then %>
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
Set Report1_summary = Nothing
%>
<%

' -----------------------------------------------------------------
' Page Class
'
Class crReport1_summary

	' Page ID
	Public Property Get PageID()
		PageID = "summary"
	End Property

	' Table Name
	Public Property Get TableName()
		TableName = "Report1"
	End Property

	' Page Object Name
	Public Property Get PageObjName()
		PageObjName = "Report1_summary"
	End Property

	' Page Name
	Public Property Get PageName()
		PageName = ewrpt_CurrentPage()
	End Property

	' Page Url
	Public Property Get PageUrl()
		PageUrl = ewrpt_CurrentPage() & "?"
		If Report1.UseTokenInUrl Then PageUrl = PageUrl & "t=" & Report1.TableVar & "&" ' add page token
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
		If Report1.UseTokenInUrl Then
			IsPageRequest = False
			If Request.Form("t").Count > 0 Then
				IsPageRequest = (Report1.TableVar = Request.Form("t"))
			End If
			If Request.QueryString("t").Count > 0 Then
				IsPageRequest = (Report1.TableVar = Request.QueryString("t"))
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
		Set Report1 = New crReport1

		' Initialize URLs
		ExportPrintUrl = PageUrl & "export=print"
		ExportExcelUrl = PageUrl & "export=excel"
		ExportWordUrl = PageUrl & "export=word"

		' Intialize page id
		EWRPT_PAGE_ID = "summary"

		' Initialize table name
		EWRPT_TABLE_NAME = "Report1"

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
			Report1.Export = Request.QueryString("export")
		End If
		gsExport = Report1.Export ' Get export parameter, used in header
		gsExportFile = Report1.TableVar ' Get export file, used in header
		If Report1.Export = "excel" Then
			Response.ContentType = "application/vnd.ms-excel"
			Response.AddHeader "Content-Disposition", "attachment; filename=" & gsExportFile & ".xls"
		End If

		' Global page loading event
		Call Page_Loading()

		' Page load event
		Call Page_Load()

		' Export to Email (Load content via XMLHttp)
		If Report1.Export = "email" Then
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

		'wrkstr = "&filter=" & Report1.SessionWhere
		wrkstr = wrkstr & "&u=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_USER)&"")
		wrkstr = wrkstr & "&p=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_PASSWORD)&"")
		wrkstr = wrkstr & "&f=" & ew_Encode(CStr(Session(EWRPT_SESSION_FILTER)&""))
		ar = Session(EWRPT_SESSION_COLUMN_SELECTION)
		If IsArray(ar) Then
			For i = 0 to UBound(ar)
				wrkstr = wrkstr & "&c=" & ew_Encode(CStr(ar(i)&""))
			Next
		End If
		wrkstr = wrkstr & "&o=" & ew_Encode(CStr(Report1.OrderBy&""))
		wrkstr = wrkstr & "&s=" & ew_Encode(CStr(Report1.StartGroup&""))
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
			Report1.OrderBy = GetQSValue(QS, "o")
			Report1.StartGroup = GetQSValue(QS, "s")
			Report1.RestoreSession = True
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
		Set Report1 = Nothing

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
		DisplayGrps = 20 ' Groups per page
		GrpRange = 10

		' Clear field for ext filter
		ClearExtFilter = ""

		' Filter
		UserIDFilter = ""
		Filter = ""

		' 1st dimension = no of groups (level 0 used for grand total)
		' 2nd dimension = no of fields

		Dim nDtls, nGrps
		nDtls = 24
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
		Col(24) = False

		' Set up groups per page dynamically
		SetUpDisplayGrps()
		Report1.fecmat.SelectionList = ""
		Report1.fecmat.DefaultSelectionList = ""
		Report1.fecmat.ValueList = ""
		Report1.JORNADA.SelectionList = ""
		Report1.JORNADA.DefaultSelectionList = ""
		Report1.JORNADA.ValueList = ""
		Report1.NOMBRE_C.SelectionList = ""
		Report1.NOMBRE_C.DefaultSelectionList = ""
		Report1.NOMBRE_C.ValueList = ""
		Report1.EstadoAcad.SelectionList = ""
		Report1.EstadoAcad.DefaultSelectionList = ""
		Report1.EstadoAcad.ValueList = ""
		Report1.COMUNA.SelectionList = ""
		Report1.COMUNA.DefaultSelectionList = ""
		Report1.COMUNA.ValueList = ""
		Report1.CIUDADACT.SelectionList = ""
		Report1.CIUDADACT.DefaultSelectionList = ""
		Report1.CIUDADACT.ValueList = ""
		Report1.ESTACAD.SelectionList = ""
		Report1.ESTACAD.DefaultSelectionList = ""
		Report1.ESTACAD.ValueList = ""
		Report1.AF1oIng.SelectionList = ""
		Report1.AF1oIng.DefaultSelectionList = ""
		Report1.AF1oIng.ValueList = ""
		Report1.AF1oMat.SelectionList = ""
		Report1.AF1oMat.DefaultSelectionList = ""
		Report1.AF1oMat.ValueList = ""
		Report1.TIPOCARR.SelectionList = ""
		Report1.TIPOCARR.DefaultSelectionList = ""
		Report1.TIPOCARR.ValueList = ""
		Report1.MATRICULADO.SelectionList = ""
		Report1.MATRICULADO.DefaultSelectionList = ""
		Report1.MATRICULADO.ValueList = ""
		Report1.PERIODO_MAT.SelectionList = ""
		Report1.PERIODO_MAT.DefaultSelectionList = ""
		Report1.PERIODO_MAT.ValueList = ""
		Report1.SEXO.SelectionList = ""
		Report1.SEXO.DefaultSelectionList = ""
		Report1.SEXO.ValueList = ""
		Report1.NACIONALIDAD.SelectionList = ""
		Report1.NACIONALIDAD.DefaultSelectionList = ""
		Report1.NACIONALIDAD.ValueList = ""
		Report1.FECNAC.SelectionList = ""
		Report1.FECNAC.DefaultSelectionList = ""
		Report1.FECNAC.ValueList = ""
		Report1.PUNTAJE.SelectionList = ""
		Report1.PUNTAJE.DefaultSelectionList = ""
		Report1.PUNTAJE.ValueList = ""
		Report1.PAA.SelectionList = ""
		Report1.PAA.DefaultSelectionList = ""
		Report1.PAA.ValueList = ""
		Report1.ANOEEM.SelectionList = ""
		Report1.ANOEEM.DefaultSelectionList = ""
		Report1.ANOEEM.ValueList = ""
		Report1.NOTAEM.SelectionList = ""
		Report1.NOTAEM.DefaultSelectionList = ""
		Report1.NOTAEM.ValueList = ""

		' Load default filter values
		Call LoadDefaultFilters()

		' Set up popup filter
		Call SetupPopup()

		' Extended filter
		Dim sExtendedFilter
		sExtendedFilter = ""

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
		If Report1.RestoreSession Then
			Filter = Session(EWRPT_SESSION_FILTER)
		Else
			Session(EWRPT_SESSION_FILTER) = Filter
		End If

		' Get total count
		Dim sSql
		sSql = ewrpt_BuildReportSql(Report1.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.SqlOrderBy, Filter, Sort)
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

		If Report1.ExportAll And Report1.Export <> "" Then
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
			Report1.CODCLI.DbValue = ewrpt_GetValue(rs("CODCLI"))
			Report1.DIG.DbValue = ewrpt_GetValue(rs("DIG"))
			Report1.PATERNO.DbValue = ewrpt_GetValue(rs("PATERNO"))
			Report1.MATERNO.DbValue = ewrpt_GetValue(rs("MATERNO"))
			Report1.NOMBRE.DbValue = ewrpt_GetValue(rs("NOMBRE"))
			Report1.fecmat.DbValue = ewrpt_GetValue(rs("fecmat"))
			Report1.JORNADA.DbValue = ewrpt_GetValue(rs("JORNADA"))
			Report1.CODCARR.DbValue = ewrpt_GetValue(rs("CODCARR"))
			Report1.NOMBRE_C.DbValue = ewrpt_GetValue(rs("NOMBRE_C"))
			Report1.EstadoAcad.DbValue = ewrpt_GetValue(rs("EstadoAcad"))
			Report1.COMUNA.DbValue = ewrpt_GetValue(rs("COMUNA"))
			Report1.CIUDADACT.DbValue = ewrpt_GetValue(rs("CIUDADACT"))
			Report1.ESTACAD.DbValue = ewrpt_GetValue(rs("ESTACAD"))
			Report1.AF1oIng.DbValue = ewrpt_GetValue(rs("AñoIng"))
			Report1.AF1oMat.DbValue = ewrpt_GetValue(rs("AñoMat"))
			Report1.TIPOCARR.DbValue = ewrpt_GetValue(rs("TIPOCARR"))
			Report1.MATRICULADO.DbValue = ewrpt_GetValue(rs("MATRICULADO"))
			Report1.PERIODO_MAT.DbValue = ewrpt_GetValue(rs("PERIODO_MAT"))
			Report1.SEXO.DbValue = ewrpt_GetValue(rs("SEXO"))
			Report1.NACIONALIDAD.DbValue = ewrpt_GetValue(rs("NACIONALIDAD"))
			Report1.FECNAC.DbValue = ewrpt_GetValue(rs("FECNAC"))
			Report1.PUNTAJE.DbValue = ewrpt_GetValue(rs("PUNTAJE"))
			Report1.PAA.DbValue = ewrpt_GetValue(rs("PAA"))
			Report1.ANOEEM.DbValue = ewrpt_GetValue(rs("ANOEEM"))
			Report1.NOTAEM.DbValue = ewrpt_GetValue(rs("NOTAEM"))
			Val(1) = Report1.CODCLI.CurrentValue
			Val(2) = Report1.DIG.CurrentValue
			Val(3) = Report1.PATERNO.CurrentValue
			Val(4) = Report1.MATERNO.CurrentValue
			Val(5) = Report1.NOMBRE.CurrentValue
			Val(6) = Report1.fecmat.CurrentValue
			Val(7) = Report1.JORNADA.CurrentValue
			Val(8) = Report1.NOMBRE_C.CurrentValue
			Val(9) = Report1.EstadoAcad.CurrentValue
			Val(10) = Report1.COMUNA.CurrentValue
			Val(11) = Report1.CIUDADACT.CurrentValue
			Val(12) = Report1.ESTACAD.CurrentValue
			Val(13) = Report1.AF1oIng.CurrentValue
			Val(14) = Report1.AF1oMat.CurrentValue
			Val(15) = Report1.TIPOCARR.CurrentValue
			Val(16) = Report1.MATRICULADO.CurrentValue
			Val(17) = Report1.PERIODO_MAT.CurrentValue
			Val(18) = Report1.SEXO.CurrentValue
			Val(19) = Report1.NACIONALIDAD.CurrentValue
			Val(20) = Report1.FECNAC.CurrentValue
			Val(21) = Report1.PUNTAJE.CurrentValue
			Val(22) = Report1.PAA.CurrentValue
			Val(23) = Report1.ANOEEM.CurrentValue
			Val(24) = Report1.NOTAEM.CurrentValue
		Else
			Report1.CODCLI.DbValue = ""
			Report1.DIG.DbValue = ""
			Report1.PATERNO.DbValue = ""
			Report1.MATERNO.DbValue = ""
			Report1.NOMBRE.DbValue = ""
			Report1.fecmat.DbValue = ""
			Report1.JORNADA.DbValue = ""
			Report1.CODCARR.DbValue = ""
			Report1.NOMBRE_C.DbValue = ""
			Report1.EstadoAcad.DbValue = ""
			Report1.COMUNA.DbValue = ""
			Report1.CIUDADACT.DbValue = ""
			Report1.ESTACAD.DbValue = ""
			Report1.AF1oIng.DbValue = ""
			Report1.AF1oMat.DbValue = ""
			Report1.TIPOCARR.DbValue = ""
			Report1.MATRICULADO.DbValue = ""
			Report1.PERIODO_MAT.DbValue = ""
			Report1.SEXO.DbValue = ""
			Report1.NACIONALIDAD.DbValue = ""
			Report1.FECNAC.DbValue = ""
			Report1.PUNTAJE.DbValue = ""
			Report1.PAA.DbValue = ""
			Report1.ANOEEM.DbValue = ""
			Report1.NOTAEM.DbValue = ""
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
			Report1.StartGroup = StartGrp
		ElseIf Request.QueryString("pageno").Count > 0 Then
			nPageNo = Request.QueryString("pageno")
			If IsNumeric(nPageNo) Then
				StartGrp = (nPageNo-1)*DisplayGrps+1
				If StartGrp <= 0 Then
					StartGrp = 1
				ElseIf StartGrp >= ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 Then
					StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1
				End If
				Report1.StartGroup = nStartGrp
			Else
				StartGrp = Report1.StartGroup
			End If
		Else
			StartGrp = Report1.StartGroup
		End If

		' Check if correct start group counter
		If Not IsNumeric(StartGrp) Or StartGrp = "" Then ' Avoid invalid start group counter
			StartGrp = 1 ' Reset start group counter
			Report1.StartGroup = StartGrp
		ElseIf CLng(StartGrp) > CLng(TotalGrps) Then ' Avoid starting group > total groups
			StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 ' Point to last page first group
			Report1.StartGroup = StartGrp
		ElseIf (StartGrp-1) Mod DisplayGrps <> 0 Then
			StartGrp = ((StartGrp-1)\DisplayGrps)*DisplayGrps+1 ' Point to page boundary
			Report1.StartGroup = StartGrp
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
		' Build distinct values for fecmat

		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.fecmat.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.fecmat.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.fecmat.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.fecmat.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.fecmat.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.fecmat.ViewValue = ewrpt_FormatDateTime(Report1.fecmat.CurrentValue, 5)
				Report1.fecmat.CurrentValue = ewrpt_FormatDateTime(Report1.fecmat.CurrentValue,99) ' Format date for SQL (yyyy/mm/dd hh:mm:ss)
				Call ewrpt_SetupDistinctValues(ar, Report1.fecmat.CurrentValue, Report1.fecmat.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.fecmat.ValueList = ar

		' Build distinct values for JORNADA
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.JORNADA.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.JORNADA.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.JORNADA.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.JORNADA.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.JORNADA.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.JORNADA.ViewValue = Report1.JORNADA.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.JORNADA.CurrentValue, Report1.JORNADA.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.JORNADA.ValueList = ar

		' Build distinct values for NOMBRE_C
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.NOMBRE_C.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.NOMBRE_C.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.NOMBRE_C.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.NOMBRE_C.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.NOMBRE_C.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.NOMBRE_C.ViewValue = Report1.NOMBRE_C.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.NOMBRE_C.CurrentValue, Report1.NOMBRE_C.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.NOMBRE_C.ValueList = ar

		' Build distinct values for EstadoAcad
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.EstadoAcad.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.EstadoAcad.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.EstadoAcad.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.EstadoAcad.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.EstadoAcad.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.EstadoAcad.ViewValue = Report1.EstadoAcad.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.EstadoAcad.CurrentValue, Report1.EstadoAcad.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.EstadoAcad.ValueList = ar

		' Build distinct values for COMUNA
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.COMUNA.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.COMUNA.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.COMUNA.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.COMUNA.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.COMUNA.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.COMUNA.ViewValue = Report1.COMUNA.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.COMUNA.CurrentValue, Report1.COMUNA.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.COMUNA.ValueList = ar

		' Build distinct values for CIUDADACT
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.CIUDADACT.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.CIUDADACT.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.CIUDADACT.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.CIUDADACT.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.CIUDADACT.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.CIUDADACT.ViewValue = Report1.CIUDADACT.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.CIUDADACT.CurrentValue, Report1.CIUDADACT.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.CIUDADACT.ValueList = ar

		' Build distinct values for ESTACAD
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.ESTACAD.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.ESTACAD.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.ESTACAD.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.ESTACAD.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.ESTACAD.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.ESTACAD.ViewValue = Report1.ESTACAD.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.ESTACAD.CurrentValue, Report1.ESTACAD.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.ESTACAD.ValueList = ar

		' Build distinct values for AñoIng
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.AF1oIng.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.AF1oIng.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.AF1oIng.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.AF1oIng.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.AF1oIng.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.AF1oIng.ViewValue = Report1.AF1oIng.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.AF1oIng.CurrentValue, Report1.AF1oIng.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.AF1oIng.ValueList = ar

		' Build distinct values for AñoMat
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.AF1oMat.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.AF1oMat.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.AF1oMat.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.AF1oMat.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.AF1oMat.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.AF1oMat.ViewValue = Report1.AF1oMat.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.AF1oMat.CurrentValue, Report1.AF1oMat.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.AF1oMat.ValueList = ar

		' Build distinct values for TIPOCARR
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.TIPOCARR.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.TIPOCARR.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.TIPOCARR.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.TIPOCARR.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.TIPOCARR.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.TIPOCARR.ViewValue = Report1.TIPOCARR.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.TIPOCARR.CurrentValue, Report1.TIPOCARR.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.TIPOCARR.ValueList = ar

		' Build distinct values for MATRICULADO
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.MATRICULADO.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.MATRICULADO.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.MATRICULADO.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.MATRICULADO.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.MATRICULADO.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.MATRICULADO.ViewValue = Report1.MATRICULADO.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.MATRICULADO.CurrentValue, Report1.MATRICULADO.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.MATRICULADO.ValueList = ar

		' Build distinct values for PERIODO_MAT
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.PERIODO_MAT.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.PERIODO_MAT.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.PERIODO_MAT.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.PERIODO_MAT.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.PERIODO_MAT.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.PERIODO_MAT.ViewValue = Report1.PERIODO_MAT.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.PERIODO_MAT.CurrentValue, Report1.PERIODO_MAT.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.PERIODO_MAT.ValueList = ar

		' Build distinct values for SEXO
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.SEXO.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.SEXO.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.SEXO.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.SEXO.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.SEXO.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.SEXO.ViewValue = Report1.SEXO.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.SEXO.CurrentValue, Report1.SEXO.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.SEXO.ValueList = ar

		' Build distinct values for NACIONALIDAD
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.NACIONALIDAD.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.NACIONALIDAD.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.NACIONALIDAD.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.NACIONALIDAD.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.NACIONALIDAD.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.NACIONALIDAD.ViewValue = Report1.NACIONALIDAD.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.NACIONALIDAD.CurrentValue, Report1.NACIONALIDAD.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.NACIONALIDAD.ValueList = ar

		' Build distinct values for FECNAC
		ar = ""
		Call ewrpt_SetupDistinctValuesFromFilter(ar, Report1.FECNAC.AdvancedFilters) ' Set up popup filter
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.FECNAC.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.FECNAC.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.FECNAC.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.FECNAC.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.FECNAC.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.FECNAC.ViewValue = ewrpt_FormatDateTime(Report1.FECNAC.CurrentValue, 5)
				Report1.FECNAC.CurrentValue = ewrpt_FormatDateTime(Report1.FECNAC.CurrentValue,99) ' Format date for SQL (yyyy/mm/dd hh:mm:ss)
				Call ewrpt_SetupDistinctValues(ar, Report1.FECNAC.CurrentValue, Report1.FECNAC.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.FECNAC.ValueList = ar

		' Build distinct values for PUNTAJE
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.PUNTAJE.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.PUNTAJE.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.PUNTAJE.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.PUNTAJE.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.PUNTAJE.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.PUNTAJE.ViewValue = Report1.PUNTAJE.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.PUNTAJE.CurrentValue, Report1.PUNTAJE.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.PUNTAJE.ValueList = ar

		' Build distinct values for PAA
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.PAA.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.PAA.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.PAA.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.PAA.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.PAA.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.PAA.ViewValue = Report1.PAA.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.PAA.CurrentValue, Report1.PAA.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.PAA.ValueList = ar

		' Build distinct values for ANOEEM
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.ANOEEM.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.ANOEEM.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.ANOEEM.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.ANOEEM.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.ANOEEM.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.ANOEEM.ViewValue = Report1.ANOEEM.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.ANOEEM.CurrentValue, Report1.ANOEEM.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.ANOEEM.ValueList = ar

		' Build distinct values for NOTAEM
		ar = ""
		bNullValue = False: bEmptyValue = False
		sSql = ewrpt_BuildReportSql(Report1.NOTAEM.SqlSelect, Report1.SqlWhere, Report1.SqlGroupBy, Report1.SqlHaving, Report1.NOTAEM.SqlOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Popup SQL): " & sSql)
		Set rswrk = conn.Execute(sSql)
		Do While Not rswrk.Eof
			Report1.NOTAEM.DbValue = ewrpt_GetValue(rswrk(0))
			If IsNull(Report1.NOTAEM.CurrentValue) Then
				bNullValue = True
			ElseIf Report1.NOTAEM.CurrentValue = "" Then
				bEmptyValue = True
			Else
				Report1.NOTAEM.ViewValue = Report1.NOTAEM.CurrentValue
				Call ewrpt_SetupDistinctValues(ar, Report1.NOTAEM.CurrentValue, Report1.NOTAEM.ViewValue, False)
			End If
			rswrk.MoveNext
		Loop
		rswrk.Close
		Set rswrk = Nothing
		If bEmptyValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_EMPTY_VALUE, ReportLanguage.Phrase("EmptyLabel"), False)
		If bNullValue Then Call ewrpt_SetupDistinctValues(ar, EWRPT_NULL_VALUE, ReportLanguage.Phrase("NullLabel"), False)
		Report1.NOTAEM.ValueList = ar

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
				Call ClearSessionSelection("fecmat")
				Call ClearSessionSelection("JORNADA")
				Call ClearSessionSelection("NOMBRE_C")
				Call ClearSessionSelection("EstadoAcad")
				Call ClearSessionSelection("COMUNA")
				Call ClearSessionSelection("CIUDADACT")
				Call ClearSessionSelection("ESTACAD")
				Call ClearSessionSelection("AF1oIng")
				Call ClearSessionSelection("AF1oMat")
				Call ClearSessionSelection("TIPOCARR")
				Call ClearSessionSelection("MATRICULADO")
				Call ClearSessionSelection("PERIODO_MAT")
				Call ClearSessionSelection("SEXO")
				Call ClearSessionSelection("NACIONALIDAD")
				Call ClearSessionSelection("FECNAC")
				Call ClearSessionSelection("PUNTAJE")
				Call ClearSessionSelection("PAA")
				Call ClearSessionSelection("ANOEEM")
				Call ClearSessionSelection("NOTAEM")
				Call ResetPager()
			End If
		End If

		' Load selection criteria to array
		' Get fecmat selected values

		If IsArray(Session("sel_Report1_fecmat")) Then
			Call LoadSelectionFromSession("fecmat")
		ElseIf Session("sel_Report1_fecmat") = EWRPT_INIT_VALUE Then ' Select all
			Report1.fecmat.SelectionList = ""
		End If

		' Get JORNADA selected values
		If IsArray(Session("sel_Report1_JORNADA")) Then
			Call LoadSelectionFromSession("JORNADA")
		ElseIf Session("sel_Report1_JORNADA") = EWRPT_INIT_VALUE Then ' Select all
			Report1.JORNADA.SelectionList = ""
		End If

		' Get NOMBRE C selected values
		If IsArray(Session("sel_Report1_NOMBRE_C")) Then
			Call LoadSelectionFromSession("NOMBRE_C")
		ElseIf Session("sel_Report1_NOMBRE_C") = EWRPT_INIT_VALUE Then ' Select all
			Report1.NOMBRE_C.SelectionList = ""
		End If

		' Get Estado Acad selected values
		If IsArray(Session("sel_Report1_EstadoAcad")) Then
			Call LoadSelectionFromSession("EstadoAcad")
		ElseIf Session("sel_Report1_EstadoAcad") = EWRPT_INIT_VALUE Then ' Select all
			Report1.EstadoAcad.SelectionList = ""
		End If

		' Get COMUNA selected values
		If IsArray(Session("sel_Report1_COMUNA")) Then
			Call LoadSelectionFromSession("COMUNA")
		ElseIf Session("sel_Report1_COMUNA") = EWRPT_INIT_VALUE Then ' Select all
			Report1.COMUNA.SelectionList = ""
		End If

		' Get CIUDADACT selected values
		If IsArray(Session("sel_Report1_CIUDADACT")) Then
			Call LoadSelectionFromSession("CIUDADACT")
		ElseIf Session("sel_Report1_CIUDADACT") = EWRPT_INIT_VALUE Then ' Select all
			Report1.CIUDADACT.SelectionList = ""
		End If

		' Get ESTACAD selected values
		If IsArray(Session("sel_Report1_ESTACAD")) Then
			Call LoadSelectionFromSession("ESTACAD")
		ElseIf Session("sel_Report1_ESTACAD") = EWRPT_INIT_VALUE Then ' Select all
			Report1.ESTACAD.SelectionList = ""
		End If

		' Get Año Ing selected values
		If IsArray(Session("sel_Report1_AF1oIng")) Then
			Call LoadSelectionFromSession("AF1oIng")
		ElseIf Session("sel_Report1_AF1oIng") = EWRPT_INIT_VALUE Then ' Select all
			Report1.AF1oIng.SelectionList = ""
		End If

		' Get Año Mat selected values
		If IsArray(Session("sel_Report1_AF1oMat")) Then
			Call LoadSelectionFromSession("AF1oMat")
		ElseIf Session("sel_Report1_AF1oMat") = EWRPT_INIT_VALUE Then ' Select all
			Report1.AF1oMat.SelectionList = ""
		End If

		' Get TIPOCARR selected values
		If IsArray(Session("sel_Report1_TIPOCARR")) Then
			Call LoadSelectionFromSession("TIPOCARR")
		ElseIf Session("sel_Report1_TIPOCARR") = EWRPT_INIT_VALUE Then ' Select all
			Report1.TIPOCARR.SelectionList = ""
		End If

		' Get MATRICULADO selected values
		If IsArray(Session("sel_Report1_MATRICULADO")) Then
			Call LoadSelectionFromSession("MATRICULADO")
		ElseIf Session("sel_Report1_MATRICULADO") = EWRPT_INIT_VALUE Then ' Select all
			Report1.MATRICULADO.SelectionList = ""
		End If

		' Get PERIODO MAT selected values
		If IsArray(Session("sel_Report1_PERIODO_MAT")) Then
			Call LoadSelectionFromSession("PERIODO_MAT")
		ElseIf Session("sel_Report1_PERIODO_MAT") = EWRPT_INIT_VALUE Then ' Select all
			Report1.PERIODO_MAT.SelectionList = ""
		End If

		' Get SEXO selected values
		If IsArray(Session("sel_Report1_SEXO")) Then
			Call LoadSelectionFromSession("SEXO")
		ElseIf Session("sel_Report1_SEXO") = EWRPT_INIT_VALUE Then ' Select all
			Report1.SEXO.SelectionList = ""
		End If

		' Get NACIONALIDAD selected values
		If IsArray(Session("sel_Report1_NACIONALIDAD")) Then
			Call LoadSelectionFromSession("NACIONALIDAD")
		ElseIf Session("sel_Report1_NACIONALIDAD") = EWRPT_INIT_VALUE Then ' Select all
			Report1.NACIONALIDAD.SelectionList = ""
		End If

		' Get FECNAC selected values
		If IsArray(Session("sel_Report1_FECNAC")) Then
			Call LoadSelectionFromSession("FECNAC")
		ElseIf Session("sel_Report1_FECNAC") = EWRPT_INIT_VALUE Then ' Select all
			Report1.FECNAC.SelectionList = ""
		End If

		' Get PUNTAJE selected values
		If IsArray(Session("sel_Report1_PUNTAJE")) Then
			Call LoadSelectionFromSession("PUNTAJE")
		ElseIf Session("sel_Report1_PUNTAJE") = EWRPT_INIT_VALUE Then ' Select all
			Report1.PUNTAJE.SelectionList = ""
		End If

		' Get PAA selected values
		If IsArray(Session("sel_Report1_PAA")) Then
			Call LoadSelectionFromSession("PAA")
		ElseIf Session("sel_Report1_PAA") = EWRPT_INIT_VALUE Then ' Select all
			Report1.PAA.SelectionList = ""
		End If

		' Get ANOEEM selected values
		If IsArray(Session("sel_Report1_ANOEEM")) Then
			Call LoadSelectionFromSession("ANOEEM")
		ElseIf Session("sel_Report1_ANOEEM") = EWRPT_INIT_VALUE Then ' Select all
			Report1.ANOEEM.SelectionList = ""
		End If

		' Get NOTAEM selected values
		If IsArray(Session("sel_Report1_NOTAEM")) Then
			Call LoadSelectionFromSession("NOTAEM")
		ElseIf Session("sel_Report1_NOTAEM") = EWRPT_INIT_VALUE Then ' Select all
			Report1.NOTAEM.SelectionList = ""
		End If
	End Sub

	' Reset pager to starting position
	Sub ResetPager()
		StartGrp = 1
		Report1.StartGroup = StartGrp
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
					DisplayGrps = 20 ' Non-numeric, Load Default
				End If
			End If
			Report1.GroupPerPage = DisplayGrps ' Save to Session

			' Reset Start Position (Reset Command)
			StartGrp = 1
			Report1.StartGroup = nStartGrp
		Else
			If Report1.GroupPerPage <> "" Then
				DisplayGrps = Report1.GroupPerPage ' Restore from Session
			Else
				DisplayGrps = 20 ' Load Default
			End If
		End If
	End Sub

	' Render row
	Sub RenderRow()
		If Report1.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total

			' Get total count from sql directly
			Dim sSql, rstot
			sSql = ewrpt_BuildReportSql(Report1.SqlSelectCount, Report1.SqlWhere, Report1SqlGroupBy, Report1.SqlHaving, "", Filter, "")
			If EWRPT_DEBUG_ENABLED Then Response.Write "(Total SQL): " & sSql & "<br>"
			Set rstot = ewrpt_LoadRs(sSql)
			If Not rstot.Eof Then
				TotCount = ewrpt_GetValue(rstot(0))
			Else
				TotCount = 0
			End If
		End If

		' Call Row_Rendering event
		Call Report1.Row_Rendering()

		' --------------------
		'  Render view codes
		' --------------------

		If Report1.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' CODCLI
			Report1.CODCLI.ViewValue = Report1.CODCLI.Summary

			' DIG
			Report1.DIG.ViewValue = Report1.DIG.Summary

			' PATERNO
			Report1.PATERNO.ViewValue = Report1.PATERNO.Summary

			' MATERNO
			Report1.MATERNO.ViewValue = Report1.MATERNO.Summary

			' NOMBRE
			Report1.NOMBRE.ViewValue = Report1.NOMBRE.Summary

			' fecmat
			Report1.fecmat.ViewValue = Report1.fecmat.Summary
			Report1.fecmat.ViewValue = ewrpt_FormatDateTime(Report1.fecmat.ViewValue, 5)

			' JORNADA
			Report1.JORNADA.ViewValue = Report1.JORNADA.Summary

			' NOMBRE_C
			Report1.NOMBRE_C.ViewValue = Report1.NOMBRE_C.Summary

			' EstadoAcad
			Report1.EstadoAcad.ViewValue = Report1.EstadoAcad.Summary

			' COMUNA
			Report1.COMUNA.ViewValue = Report1.COMUNA.Summary

			' CIUDADACT
			Report1.CIUDADACT.ViewValue = Report1.CIUDADACT.Summary

			' ESTACAD
			Report1.ESTACAD.ViewValue = Report1.ESTACAD.Summary

			' AñoIng
			Report1.AF1oIng.ViewValue = Report1.AF1oIng.Summary

			' AñoMat
			Report1.AF1oMat.ViewValue = Report1.AF1oMat.Summary

			' TIPOCARR
			Report1.TIPOCARR.ViewValue = Report1.TIPOCARR.Summary

			' MATRICULADO
			Report1.MATRICULADO.ViewValue = Report1.MATRICULADO.Summary

			' PERIODO_MAT
			Report1.PERIODO_MAT.ViewValue = Report1.PERIODO_MAT.Summary

			' SEXO
			Report1.SEXO.ViewValue = Report1.SEXO.Summary

			' NACIONALIDAD
			Report1.NACIONALIDAD.ViewValue = Report1.NACIONALIDAD.Summary

			' FECNAC
			Report1.FECNAC.ViewValue = Report1.FECNAC.Summary
			Report1.FECNAC.ViewValue = ewrpt_FormatDateTime(Report1.FECNAC.ViewValue, 5)

			' PUNTAJE
			Report1.PUNTAJE.ViewValue = Report1.PUNTAJE.Summary

			' PAA
			Report1.PAA.ViewValue = Report1.PAA.Summary

			' ANOEEM
			Report1.ANOEEM.ViewValue = Report1.ANOEEM.Summary

			' NOTAEM
			Report1.NOTAEM.ViewValue = Report1.NOTAEM.Summary
		Else

			' CODCLI
			Report1.CODCLI.ViewValue = Report1.CODCLI.CurrentValue
			Call ewrpt_SetAttr(Report1.CODCLI.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' DIG
			Report1.DIG.ViewValue = Report1.DIG.CurrentValue
			Call ewrpt_SetAttr(Report1.DIG.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PATERNO
			Report1.PATERNO.ViewValue = Report1.PATERNO.CurrentValue
			Call ewrpt_SetAttr(Report1.PATERNO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' MATERNO
			Report1.MATERNO.ViewValue = Report1.MATERNO.CurrentValue
			Call ewrpt_SetAttr(Report1.MATERNO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOMBRE
			Report1.NOMBRE.ViewValue = Report1.NOMBRE.CurrentValue
			Call ewrpt_SetAttr(Report1.NOMBRE.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' fecmat
			Report1.fecmat.ViewValue = Report1.fecmat.CurrentValue
			Report1.fecmat.ViewValue = ewrpt_FormatDateTime(Report1.fecmat.ViewValue, 5)
			Call ewrpt_SetAttr(Report1.fecmat.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' JORNADA
			Report1.JORNADA.ViewValue = Report1.JORNADA.CurrentValue
			Call ewrpt_SetAttr(Report1.JORNADA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOMBRE_C
			Report1.NOMBRE_C.ViewValue = Report1.NOMBRE_C.CurrentValue
			Call ewrpt_SetAttr(Report1.NOMBRE_C.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' EstadoAcad
			Report1.EstadoAcad.ViewValue = Report1.EstadoAcad.CurrentValue
			Call ewrpt_SetAttr(Report1.EstadoAcad.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' COMUNA
			Report1.COMUNA.ViewValue = Report1.COMUNA.CurrentValue
			Call ewrpt_SetAttr(Report1.COMUNA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' CIUDADACT
			Report1.CIUDADACT.ViewValue = Report1.CIUDADACT.CurrentValue
			Call ewrpt_SetAttr(Report1.CIUDADACT.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ESTACAD
			Report1.ESTACAD.ViewValue = Report1.ESTACAD.CurrentValue
			Call ewrpt_SetAttr(Report1.ESTACAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' AñoIng
			Report1.AF1oIng.ViewValue = Report1.AF1oIng.CurrentValue
			Call ewrpt_SetAttr(Report1.AF1oIng.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' AñoMat
			Report1.AF1oMat.ViewValue = Report1.AF1oMat.CurrentValue
			Call ewrpt_SetAttr(Report1.AF1oMat.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' TIPOCARR
			Report1.TIPOCARR.ViewValue = Report1.TIPOCARR.CurrentValue
			Call ewrpt_SetAttr(Report1.TIPOCARR.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' MATRICULADO
			Report1.MATRICULADO.ViewValue = Report1.MATRICULADO.CurrentValue
			Call ewrpt_SetAttr(Report1.MATRICULADO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PERIODO_MAT
			Report1.PERIODO_MAT.ViewValue = Report1.PERIODO_MAT.CurrentValue
			Call ewrpt_SetAttr(Report1.PERIODO_MAT.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' SEXO
			Report1.SEXO.ViewValue = Report1.SEXO.CurrentValue
			Call ewrpt_SetAttr(Report1.SEXO.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NACIONALIDAD
			Report1.NACIONALIDAD.ViewValue = Report1.NACIONALIDAD.CurrentValue
			Call ewrpt_SetAttr(Report1.NACIONALIDAD.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' FECNAC
			Report1.FECNAC.ViewValue = Report1.FECNAC.CurrentValue
			Report1.FECNAC.ViewValue = ewrpt_FormatDateTime(Report1.FECNAC.ViewValue, 5)
			Call ewrpt_SetAttr(Report1.FECNAC.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PUNTAJE
			Report1.PUNTAJE.ViewValue = Report1.PUNTAJE.CurrentValue
			Call ewrpt_SetAttr(Report1.PUNTAJE.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' PAA
			Report1.PAA.ViewValue = Report1.PAA.CurrentValue
			Call ewrpt_SetAttr(Report1.PAA.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' ANOEEM
			Report1.ANOEEM.ViewValue = Report1.ANOEEM.CurrentValue
			Call ewrpt_SetAttr(Report1.ANOEEM.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))

			' NOTAEM
			Report1.NOTAEM.ViewValue = Report1.NOTAEM.CurrentValue
			Call ewrpt_SetAttr(Report1.NOTAEM.CellAttrs, "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))
		End If

		' CODCLI
		Report1.CODCLI.HrefValue = ""

		' DIG
		Report1.DIG.HrefValue = ""

		' PATERNO
		Report1.PATERNO.HrefValue = ""

		' MATERNO
		Report1.MATERNO.HrefValue = ""

		' NOMBRE
		Report1.NOMBRE.HrefValue = ""

		' fecmat
		Report1.fecmat.HrefValue = ""

		' JORNADA
		Report1.JORNADA.HrefValue = ""

		' NOMBRE_C
		Report1.NOMBRE_C.HrefValue = ""

		' EstadoAcad
		Report1.EstadoAcad.HrefValue = ""

		' COMUNA
		Report1.COMUNA.HrefValue = ""

		' CIUDADACT
		Report1.CIUDADACT.HrefValue = ""

		' ESTACAD
		Report1.ESTACAD.HrefValue = ""

		' AñoIng
		Report1.AF1oIng.HrefValue = ""

		' AñoMat
		Report1.AF1oMat.HrefValue = ""

		' TIPOCARR
		Report1.TIPOCARR.HrefValue = ""

		' MATRICULADO
		Report1.MATRICULADO.HrefValue = ""

		' PERIODO_MAT
		Report1.PERIODO_MAT.HrefValue = ""

		' SEXO
		Report1.SEXO.HrefValue = ""

		' NACIONALIDAD
		Report1.NACIONALIDAD.HrefValue = ""

		' FECNAC
		Report1.FECNAC.HrefValue = ""

		' PUNTAJE
		Report1.PUNTAJE.HrefValue = ""

		' PAA
		Report1.PAA.HrefValue = ""

		' ANOEEM
		Report1.ANOEEM.HrefValue = ""

		' NOTAEM
		Report1.NOTAEM.HrefValue = ""

		' Call Row_Rendered event
		Call Report1.Row_Rendered()
	End Sub

	' Clear selection stored in session
	Sub ClearSessionSelection(parm)
		Session("sel_Report1_" & parm) = ""
		Session("rf_Report1_" & parm) = ""
		Session("rt_Report1_" & parm) = ""
	End Sub

	' Load selection from session
	Sub LoadSelectionFromSession(parm)
		Dim fld
		Set fld = Report1.GetField(parm)
		fld.SelectionList = Session("sel_Report1_" & parm)
		fld.RangeFrom = Session("rf_Report1_" & parm)
		fld.RangeTo = Session("rt_Report1_" & parm)
	End Sub

	' Load default value for filters
	Sub LoadDefaultFilters()
		Dim sWrk, sSql, arwrk

		' --------------------------------------------------
		'  Set up default values for dropdown filters
		'
		' --------------------------------------------------
		'  Set up default values for extended filters
		'
		' --------------------------------------------------
		'  Set up default values for popup filters
		'  - NOTE: if extended filter is enabled, use default values in extended filter instead
		' Field fecmat
		' Setup your default values for the popup filter below, e.g.
		' Report1.fecmat.DefaultSelectionList = Array("val1", "val2")

		Report1.fecmat.DefaultSelectionList = ""
		Report1.fecmat.SelectionList = Report1.fecmat.DefaultSelectionList

		' Field JORNADA
		' Setup your default values for the popup filter below, e.g.
		' Report1.JORNADA.DefaultSelectionList = Array("val1", "val2")

		Report1.JORNADA.DefaultSelectionList = ""
		Report1.JORNADA.SelectionList = Report1.JORNADA.DefaultSelectionList

		' Field NOMBRE_C
		' Setup your default values for the popup filter below, e.g.
		' Report1.NOMBRE_C.DefaultSelectionList = Array("val1", "val2")

		Report1.NOMBRE_C.DefaultSelectionList = ""
		Report1.NOMBRE_C.SelectionList = Report1.NOMBRE_C.DefaultSelectionList

		' Field EstadoAcad
		' Setup your default values for the popup filter below, e.g.
		' Report1.EstadoAcad.DefaultSelectionList = Array("val1", "val2")

		Report1.EstadoAcad.DefaultSelectionList = ""
		Report1.EstadoAcad.SelectionList = Report1.EstadoAcad.DefaultSelectionList

		' Field COMUNA
		' Setup your default values for the popup filter below, e.g.
		' Report1.COMUNA.DefaultSelectionList = Array("val1", "val2")

		Report1.COMUNA.DefaultSelectionList = ""
		Report1.COMUNA.SelectionList = Report1.COMUNA.DefaultSelectionList

		' Field CIUDADACT
		' Setup your default values for the popup filter below, e.g.
		' Report1.CIUDADACT.DefaultSelectionList = Array("val1", "val2")

		Report1.CIUDADACT.DefaultSelectionList = ""
		Report1.CIUDADACT.SelectionList = Report1.CIUDADACT.DefaultSelectionList

		' Field ESTACAD
		' Setup your default values for the popup filter below, e.g.
		' Report1.ESTACAD.DefaultSelectionList = Array("val1", "val2")

		Report1.ESTACAD.DefaultSelectionList = ""
		Report1.ESTACAD.SelectionList = Report1.ESTACAD.DefaultSelectionList

		' Field AñoIng
		' Setup your default values for the popup filter below, e.g.
		' Report1.AF1oIng.DefaultSelectionList = Array("val1", "val2")

		Report1.AF1oIng.DefaultSelectionList = ""
		Report1.AF1oIng.SelectionList = Report1.AF1oIng.DefaultSelectionList

		' Field AñoMat
		' Setup your default values for the popup filter below, e.g.
		' Report1.AF1oMat.DefaultSelectionList = Array("val1", "val2")

		Report1.AF1oMat.DefaultSelectionList = ""
		Report1.AF1oMat.SelectionList = Report1.AF1oMat.DefaultSelectionList

		' Field TIPOCARR
		' Setup your default values for the popup filter below, e.g.
		' Report1.TIPOCARR.DefaultSelectionList = Array("val1", "val2")

		Report1.TIPOCARR.DefaultSelectionList = ""
		Report1.TIPOCARR.SelectionList = Report1.TIPOCARR.DefaultSelectionList

		' Field MATRICULADO
		' Setup your default values for the popup filter below, e.g.
		' Report1.MATRICULADO.DefaultSelectionList = Array("val1", "val2")

		Report1.MATRICULADO.DefaultSelectionList = ""
		Report1.MATRICULADO.SelectionList = Report1.MATRICULADO.DefaultSelectionList

		' Field PERIODO_MAT
		' Setup your default values for the popup filter below, e.g.
		' Report1.PERIODO_MAT.DefaultSelectionList = Array("val1", "val2")

		Report1.PERIODO_MAT.DefaultSelectionList = ""
		Report1.PERIODO_MAT.SelectionList = Report1.PERIODO_MAT.DefaultSelectionList

		' Field SEXO
		' Setup your default values for the popup filter below, e.g.
		' Report1.SEXO.DefaultSelectionList = Array("val1", "val2")

		Report1.SEXO.DefaultSelectionList = ""
		Report1.SEXO.SelectionList = Report1.SEXO.DefaultSelectionList

		' Field NACIONALIDAD
		' Setup your default values for the popup filter below, e.g.
		' Report1.NACIONALIDAD.DefaultSelectionList = Array("val1", "val2")

		Report1.NACIONALIDAD.DefaultSelectionList = ""
		Report1.NACIONALIDAD.SelectionList = Report1.NACIONALIDAD.DefaultSelectionList

		' Field FECNAC
		' Setup your default values for the popup filter below, e.g.
		' Report1.FECNAC.DefaultSelectionList = Array("val1", "val2")

		Report1.FECNAC.DefaultSelectionList = ""
		Report1.FECNAC.SelectionList = Report1.FECNAC.DefaultSelectionList

		' Field PUNTAJE
		' Setup your default values for the popup filter below, e.g.
		' Report1.PUNTAJE.DefaultSelectionList = Array("val1", "val2")

		Report1.PUNTAJE.DefaultSelectionList = ""
		Report1.PUNTAJE.SelectionList = Report1.PUNTAJE.DefaultSelectionList

		' Field PAA
		' Setup your default values for the popup filter below, e.g.
		' Report1.PAA.DefaultSelectionList = Array("val1", "val2")

		Report1.PAA.DefaultSelectionList = ""
		Report1.PAA.SelectionList = Report1.PAA.DefaultSelectionList

		' Field ANOEEM
		' Setup your default values for the popup filter below, e.g.
		' Report1.ANOEEM.DefaultSelectionList = Array("val1", "val2")

		Report1.ANOEEM.DefaultSelectionList = ""
		Report1.ANOEEM.SelectionList = Report1.ANOEEM.DefaultSelectionList

		' Field NOTAEM
		' Setup your default values for the popup filter below, e.g.
		' Report1.NOTAEM.DefaultSelectionList = Array("val1", "val2")

		Report1.NOTAEM.DefaultSelectionList = ""
		Report1.NOTAEM.SelectionList = Report1.NOTAEM.DefaultSelectionList
	End Sub

	' Check if filter applied
	Function CheckFilter()

		' Check fecmat popup filter
		If Not ewrpt_MatchedArray(Report1.fecmat.DefaultSelectionList, Report1.fecmat.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check JORNADA popup filter
		If Not ewrpt_MatchedArray(Report1.JORNADA.DefaultSelectionList, Report1.JORNADA.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check NOMBRE_C popup filter
		If Not ewrpt_MatchedArray(Report1.NOMBRE_C.DefaultSelectionList, Report1.NOMBRE_C.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check EstadoAcad popup filter
		If Not ewrpt_MatchedArray(Report1.EstadoAcad.DefaultSelectionList, Report1.EstadoAcad.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check COMUNA popup filter
		If Not ewrpt_MatchedArray(Report1.COMUNA.DefaultSelectionList, Report1.COMUNA.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check CIUDADACT popup filter
		If Not ewrpt_MatchedArray(Report1.CIUDADACT.DefaultSelectionList, Report1.CIUDADACT.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check ESTACAD popup filter
		If Not ewrpt_MatchedArray(Report1.ESTACAD.DefaultSelectionList, Report1.ESTACAD.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check AñoIng popup filter
		If Not ewrpt_MatchedArray(Report1.AF1oIng.DefaultSelectionList, Report1.AF1oIng.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check AñoMat popup filter
		If Not ewrpt_MatchedArray(Report1.AF1oMat.DefaultSelectionList, Report1.AF1oMat.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check TIPOCARR popup filter
		If Not ewrpt_MatchedArray(Report1.TIPOCARR.DefaultSelectionList, Report1.TIPOCARR.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check MATRICULADO popup filter
		If Not ewrpt_MatchedArray(Report1.MATRICULADO.DefaultSelectionList, Report1.MATRICULADO.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check PERIODO_MAT popup filter
		If Not ewrpt_MatchedArray(Report1.PERIODO_MAT.DefaultSelectionList, Report1.PERIODO_MAT.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check SEXO popup filter
		If Not ewrpt_MatchedArray(Report1.SEXO.DefaultSelectionList, Report1.SEXO.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check NACIONALIDAD popup filter
		If Not ewrpt_MatchedArray(Report1.NACIONALIDAD.DefaultSelectionList, Report1.NACIONALIDAD.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check FECNAC popup filter
		If Not ewrpt_MatchedArray(Report1.FECNAC.DefaultSelectionList, Report1.FECNAC.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check PUNTAJE popup filter
		If Not ewrpt_MatchedArray(Report1.PUNTAJE.DefaultSelectionList, Report1.PUNTAJE.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check PAA popup filter
		If Not ewrpt_MatchedArray(Report1.PAA.DefaultSelectionList, Report1.PAA.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check ANOEEM popup filter
		If Not ewrpt_MatchedArray(Report1.ANOEEM.DefaultSelectionList, Report1.ANOEEM.SelectionList) Then
			CheckFilter = True
			Exit Function
		End If

		' Check NOTAEM popup filter
		If Not ewrpt_MatchedArray(Report1.NOTAEM.DefaultSelectionList, Report1.NOTAEM.SelectionList) Then
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

		' Field fecmat
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.fecmat.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.fecmat.SelectionList, ", ", EWRPT_DATATYPE_DATE)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.fecmat.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field JORNADA
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.JORNADA.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.JORNADA.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.JORNADA.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOMBRE_C
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.NOMBRE_C.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.NOMBRE_C.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.NOMBRE_C.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field EstadoAcad
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.EstadoAcad.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.EstadoAcad.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.EstadoAcad.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field COMUNA
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.COMUNA.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.COMUNA.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.COMUNA.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CIUDADACT
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.CIUDADACT.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.CIUDADACT.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.CIUDADACT.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ESTACAD
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.ESTACAD.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.ESTACAD.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.ESTACAD.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field AñoIng
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.AF1oIng.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.AF1oIng.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.AF1oIng.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field AñoMat
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.AF1oMat.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.AF1oMat.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.AF1oMat.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field TIPOCARR
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.TIPOCARR.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.TIPOCARR.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.TIPOCARR.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATRICULADO
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.MATRICULADO.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.MATRICULADO.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.MATRICULADO.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO_MAT
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.PERIODO_MAT.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.PERIODO_MAT.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.PERIODO_MAT.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field SEXO
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.SEXO.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.SEXO.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.SEXO.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NACIONALIDAD
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.NACIONALIDAD.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.NACIONALIDAD.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.NACIONALIDAD.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECNAC
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.FECNAC.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.FECNAC.SelectionList, ", ", EWRPT_DATATYPE_DATE)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.FECNAC.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PUNTAJE
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.PUNTAJE.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.PUNTAJE.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.PUNTAJE.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PAA
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.PAA.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.PAA.SelectionList, ", ", EWRPT_DATATYPE_NUMBER)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.PAA.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANOEEM
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.ANOEEM.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.ANOEEM.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.ANOEEM.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOTAEM
		sExtWrk = ""
		sWrk = ""
		If IsArray(Report1.NOTAEM.SelectionList) Then
			sWrk = ewrpt_JoinArray(Report1.NOTAEM.SelectionList, ", ", EWRPT_DATATYPE_STRING)
		End If
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Report1.NOTAEM.FldCaption & "<br>"
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
			If IsArray(Report1.fecmat.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.fecmat, "[fecmat]", EWRPT_DATATYPE_DATE)
			End If
			If IsArray(Report1.JORNADA.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.JORNADA, "[JORNADA]", EWRPT_DATATYPE_STRING)
			End If
			If IsArray(Report1.NOMBRE_C.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.NOMBRE_C, "[NOMBRE_C]", EWRPT_DATATYPE_STRING)
			End If
			If IsArray(Report1.EstadoAcad.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.EstadoAcad, "[EstadoAcad]", EWRPT_DATATYPE_STRING)
			End If
			If IsArray(Report1.COMUNA.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.COMUNA, "[COMUNA]", EWRPT_DATATYPE_STRING)
			End If
			If IsArray(Report1.CIUDADACT.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.CIUDADACT, "[CIUDADACT]", EWRPT_DATATYPE_STRING)
			End If
			If IsArray(Report1.ESTACAD.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.ESTACAD, "[ESTACAD]", EWRPT_DATATYPE_STRING)
			End If
			If IsArray(Report1.AF1oIng.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.AF1oIng, "[AñoIng]", EWRPT_DATATYPE_NUMBER)
			End If
			If IsArray(Report1.AF1oMat.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.AF1oMat, "[AñoMat]", EWRPT_DATATYPE_NUMBER)
			End If
			If IsArray(Report1.TIPOCARR.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.TIPOCARR, "[TIPOCARR]", EWRPT_DATATYPE_NUMBER)
			End If
			If IsArray(Report1.MATRICULADO.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.MATRICULADO, "[MATRICULADO]", EWRPT_DATATYPE_STRING)
			End If
			If IsArray(Report1.PERIODO_MAT.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.PERIODO_MAT, "[PERIODO_MAT]", EWRPT_DATATYPE_NUMBER)
			End If
			If IsArray(Report1.SEXO.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.SEXO, "[SEXO]", EWRPT_DATATYPE_STRING)
			End If
			If IsArray(Report1.NACIONALIDAD.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.NACIONALIDAD, "[NACIONALIDAD]", EWRPT_DATATYPE_STRING)
			End If
			If IsArray(Report1.FECNAC.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.FECNAC, "[FECNAC]", EWRPT_DATATYPE_DATE)
			End If
			If IsArray(Report1.PUNTAJE.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.PUNTAJE, "[PUNTAJE]", EWRPT_DATATYPE_NUMBER)
			End If
			If IsArray(Report1.PAA.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.PAA, "[PAA]", EWRPT_DATATYPE_NUMBER)
			End If
			If IsArray(Report1.ANOEEM.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.ANOEEM, "[ANOEEM]", EWRPT_DATATYPE_STRING)
			End If
			If IsArray(Report1.NOTAEM.SelectionList) Then
				If sWrk <> "" Then sWrk = sWrk & " AND "
				sWrk = sWrk & ewrpt_FilterSQL(Report1.NOTAEM, "[NOTAEM]", EWRPT_DATATYPE_STRING)
			End If
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
				Report1.OrderBy = ""
				Report1.StartGroup = 1
				Report1.CODCLI.Sort = ""
				Report1.DIG.Sort = ""
				Report1.PATERNO.Sort = ""
				Report1.MATERNO.Sort = ""
				Report1.NOMBRE.Sort = ""
				Report1.fecmat.Sort = ""
				Report1.JORNADA.Sort = ""
				Report1.NOMBRE_C.Sort = ""
				Report1.EstadoAcad.Sort = ""
				Report1.COMUNA.Sort = ""
				Report1.CIUDADACT.Sort = ""
				Report1.ESTACAD.Sort = ""
				Report1.AF1oIng.Sort = ""
				Report1.AF1oMat.Sort = ""
				Report1.TIPOCARR.Sort = ""
				Report1.MATRICULADO.Sort = ""
				Report1.PERIODO_MAT.Sort = ""
				Report1.SEXO.Sort = ""
				Report1.NACIONALIDAD.Sort = ""
				Report1.FECNAC.Sort = ""
				Report1.PUNTAJE.Sort = ""
				Report1.PAA.Sort = ""
				Report1.ANOEEM.Sort = ""
				Report1.NOTAEM.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf Request.QueryString(EWRPT_TABLE_ORDER_BY).Count > 0 Then
			Report1.CurrentOrder = Request.QueryString(EWRPT_TABLE_ORDER_BY)
			If Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE).Count > 0 Then
				Report1.CurrentOrderType = Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE)
			Else
				Report1.CurrentOrderType = ""
			End If
			sSortSql = Report1.SortSql
			Report1.OrderBy = sSortSql
			Report1.StartGroup = 1
		End If
		GetSort = Report1.OrderBy
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
