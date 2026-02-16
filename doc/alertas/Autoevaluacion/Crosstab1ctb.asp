<!--#include file="rptinc/ewrcfg4.asp"-->
<!--#include file="rptinc/ewrfn4.asp"-->
<!--#include file="rptinc/ewrusrfn.asp"-->
<%

' Variable for table object
Dim Crosstab1

' Define table class
Class crCrosstab1
	Dim ShowCurrentFilter ' Show current filter
	Dim FilterPanelOption ' Filter panel option
	Dim CurrentOrder ' Current order
	Dim CurrentOrderType ' Current order type
	Dim RestoreSession ' Restore Session

	' Table variable
	Public Property Get TableVar()
		TableVar = "Crosstab1"
	End Property

	' Table name
	Public Property Get TableName()
		TableName = "Crosstab1"
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
			Set m_CODCLI = NewFldObj("Crosstab1", "Crosstab1", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_DIG = NewFldObj("Crosstab1", "Crosstab1", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_PATERNO = NewFldObj("Crosstab1", "Crosstab1", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_MATERNO = NewFldObj("Crosstab1", "Crosstab1", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_NOMBRE = NewFldObj("Crosstab1", "Crosstab1", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOMBRE.DateFilter = ""
			m_NOMBRE.SqlSelect = ""
			m_NOMBRE.SqlOrderBy = ""
		End If
		Set NOMBRE = m_NOMBRE
	End Property

	' AñoMat
	Private m_AF1oMat

	Public Property Get AF1oMat()
		Dim ar
		If Not IsObject(m_AF1oMat) Then
			Set m_AF1oMat = NewFldObj("Crosstab1", "Crosstab1", "x_AF1oMat", "AñoMat", "[AñoMat]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_AF1oMat.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_AF1oMat.DateFilter = ""
			m_AF1oMat.SqlSelect = ""
			m_AF1oMat.SqlOrderBy = ""
		End If
		Set AF1oMat = m_AF1oMat
	End Property

	' PERIODO_MAT
	Private m_PERIODO_MAT

	Public Property Get PERIODO_MAT()
		Dim ar
		If Not IsObject(m_PERIODO_MAT) Then
			Set m_PERIODO_MAT = NewFldObj("Crosstab1", "Crosstab1", "x_PERIODO_MAT", "PERIODO_MAT", "[PERIODO_MAT]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_PERIODO_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_PERIODO_MAT.DateFilter = ""
			m_PERIODO_MAT.SqlSelect = ""
			m_PERIODO_MAT.SqlOrderBy = ""
		End If
		Set PERIODO_MAT = m_PERIODO_MAT
	End Property

	' TIPOCARR
	Private m_TIPOCARR

	Public Property Get TIPOCARR()
		Dim ar
		If Not IsObject(m_TIPOCARR) Then
			Set m_TIPOCARR = NewFldObj("Crosstab1", "Crosstab1", "x_TIPOCARR", "TIPOCARR", "[TIPOCARR]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_TIPOCARR.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_TIPOCARR.DateFilter = ""
			m_TIPOCARR.SqlSelect = ""
			m_TIPOCARR.SqlOrderBy = ""
		End If
		Set TIPOCARR = m_TIPOCARR
	End Property

	' fecmat
	Private m_fecmat

	Public Property Get fecmat()
		Dim ar
		If Not IsObject(m_fecmat) Then
			Set m_fecmat = NewFldObj("Crosstab1", "Crosstab1", "x_fecmat", "fecmat", "[fecmat]", 135, EWRPT_DATATYPE_DATE, 5)
			m_fecmat.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateYMD"), "%s", "/")
			m_fecmat.DateFilter = ""
			m_fecmat.SqlSelect = ""
			m_fecmat.SqlOrderBy = ""
		End If
		Set fecmat = m_fecmat
	End Property

	' AñoIng
	Private m_AF1oIng

	Public Property Get AF1oIng()
		Dim ar
		If Not IsObject(m_AF1oIng) Then
			Set m_AF1oIng = NewFldObj("Crosstab1", "Crosstab1", "x_AF1oIng", "AñoIng", "[AñoIng]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_AF1oIng.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_AF1oIng.DateFilter = ""
			m_AF1oIng.SqlSelect = ""
			m_AF1oIng.SqlOrderBy = ""
		End If
		Set AF1oIng = m_AF1oIng
	End Property

	' MATRICULADO
	Private m_MATRICULADO

	Public Property Get MATRICULADO()
		Dim ar
		If Not IsObject(m_MATRICULADO) Then
			Set m_MATRICULADO = NewFldObj("Crosstab1", "Crosstab1", "x_MATRICULADO", "MATRICULADO", "[MATRICULADO]", 200, EWRPT_DATATYPE_STRING, -1)
			m_MATRICULADO.DateFilter = ""
			m_MATRICULADO.SqlSelect = ""
			m_MATRICULADO.SqlOrderBy = ""
		End If
		Set MATRICULADO = m_MATRICULADO
	End Property

	' ESTACAD
	Private m_ESTACAD

	Public Property Get ESTACAD()
		Dim ar
		If Not IsObject(m_ESTACAD) Then
			Set m_ESTACAD = NewFldObj("Crosstab1", "Crosstab1", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1)
			m_ESTACAD.DateFilter = ""
			m_ESTACAD.SqlSelect = ""
			m_ESTACAD.SqlOrderBy = ""
		End If
		Set ESTACAD = m_ESTACAD
	End Property

	' EstadoAcad
	Private m_EstadoAcad

	Public Property Get EstadoAcad()
		Dim ar
		If Not IsObject(m_EstadoAcad) Then
			Set m_EstadoAcad = NewFldObj("Crosstab1", "Crosstab1", "x_EstadoAcad", "EstadoAcad", "[EstadoAcad]", 200, EWRPT_DATATYPE_STRING, -1)
			m_EstadoAcad.DateFilter = ""
			m_EstadoAcad.SqlSelect = ""
			m_EstadoAcad.SqlOrderBy = ""
		End If
		Set EstadoAcad = m_EstadoAcad
	End Property

	' JORNADA
	Private m_JORNADA

	Public Property Get JORNADA()
		Dim ar
		If Not IsObject(m_JORNADA) Then
			Set m_JORNADA = NewFldObj("Crosstab1", "Crosstab1", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1)
			m_JORNADA.GroupingFieldId = 2
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
			Set m_CODCARR = NewFldObj("Crosstab1", "Crosstab1", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_NOMBRE_C = NewFldObj("Crosstab1", "Crosstab1", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOMBRE_C.GroupingFieldId = 1
			m_NOMBRE_C.DateFilter = ""
			m_NOMBRE_C.SqlSelect = ""
			m_NOMBRE_C.SqlOrderBy = ""
		End If
		Set NOMBRE_C = m_NOMBRE_C
	End Property

	' CIUDADACT
	Private m_CIUDADACT

	Public Property Get CIUDADACT()
		Dim ar
		If Not IsObject(m_CIUDADACT) Then
			Set m_CIUDADACT = NewFldObj("Crosstab1", "Crosstab1", "x_CIUDADACT", "CIUDADACT", "[CIUDADACT]", 200, EWRPT_DATATYPE_STRING, -1)
			m_CIUDADACT.DateFilter = ""
			m_CIUDADACT.SqlSelect = ""
			m_CIUDADACT.SqlOrderBy = ""
		End If
		Set CIUDADACT = m_CIUDADACT
	End Property

	' COMUNA
	Private m_COMUNA

	Public Property Get COMUNA()
		Dim ar
		If Not IsObject(m_COMUNA) Then
			Set m_COMUNA = NewFldObj("Crosstab1", "Crosstab1", "x_COMUNA", "COMUNA", "[COMUNA]", 200, EWRPT_DATATYPE_STRING, -1)
			m_COMUNA.DateFilter = ""
			m_COMUNA.SqlSelect = ""
			m_COMUNA.SqlOrderBy = ""
		End If
		Set COMUNA = m_COMUNA
	End Property

	' SEXO
	Private m_SEXO

	Public Property Get SEXO()
		Dim ar
		If Not IsObject(m_SEXO) Then
			Set m_SEXO = NewFldObj("Crosstab1", "Crosstab1", "x_SEXO", "SEXO", "[SEXO]", 200, EWRPT_DATATYPE_STRING, -1)
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
			Set m_NACIONALIDAD = NewFldObj("Crosstab1", "Crosstab1", "x_NACIONALIDAD", "NACIONALIDAD", "[NACIONALIDAD]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NACIONALIDAD.DateFilter = ""
			m_NACIONALIDAD.SqlSelect = ""
			m_NACIONALIDAD.SqlOrderBy = ""
		End If
		Set NACIONALIDAD = m_NACIONALIDAD
	End Property

	' FECNAC
	Private m_FECNAC

	Public Property Get FECNAC()
		Dim ar
		If Not IsObject(m_FECNAC) Then
			Set m_FECNAC = NewFldObj("Crosstab1", "Crosstab1", "x_FECNAC", "FECNAC", "[FECNAC]", 135, EWRPT_DATATYPE_DATE, 5)
			m_FECNAC.FldDefaultErrMsg = Replace(ReportLanguage.Phrase("IncorrectDateYMD"), "%s", "/")
			m_FECNAC.DateFilter = ""
			m_FECNAC.SqlSelect = ""
			m_FECNAC.SqlOrderBy = ""
		End If
		Set FECNAC = m_FECNAC
	End Property

	' PUNTAJE
	Private m_PUNTAJE

	Public Property Get PUNTAJE()
		Dim ar
		If Not IsObject(m_PUNTAJE) Then
			Set m_PUNTAJE = NewFldObj("Crosstab1", "Crosstab1", "x_PUNTAJE", "PUNTAJE", "[PUNTAJE]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_PUNTAJE.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_PUNTAJE.DateFilter = ""
			m_PUNTAJE.SqlSelect = ""
			m_PUNTAJE.SqlOrderBy = ""
		End If
		Set PUNTAJE = m_PUNTAJE
	End Property

	' PAA
	Private m_PAA

	Public Property Get PAA()
		Dim ar
		If Not IsObject(m_PAA) Then
			Set m_PAA = NewFldObj("Crosstab1", "Crosstab1", "x_PAA", "PAA", "[PAA]", 131, EWRPT_DATATYPE_NUMBER, -1)
			m_PAA.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat")
			m_PAA.DateFilter = ""
			m_PAA.SqlSelect = ""
			m_PAA.SqlOrderBy = ""
		End If
		Set PAA = m_PAA
	End Property

	' ANOEEM
	Private m_ANOEEM

	Public Property Get ANOEEM()
		Dim ar
		If Not IsObject(m_ANOEEM) Then
			Set m_ANOEEM = NewFldObj("Crosstab1", "Crosstab1", "x_ANOEEM", "ANOEEM", "[ANOEEM]", 200, EWRPT_DATATYPE_STRING, -1)
			m_ANOEEM.DateFilter = ""
			m_ANOEEM.SqlSelect = ""
			m_ANOEEM.SqlOrderBy = ""
		End If
		Set ANOEEM = m_ANOEEM
	End Property

	' NOTAEM
	Private m_NOTAEM

	Public Property Get NOTAEM()
		Dim ar
		If Not IsObject(m_NOTAEM) Then
			Set m_NOTAEM = NewFldObj("Crosstab1", "Crosstab1", "x_NOTAEM", "NOTAEM", "[NOTAEM]", 200, EWRPT_DATATYPE_STRING, -1)
			m_NOTAEM.DateFilter = ""
			m_NOTAEM.SqlSelect = ""
			m_NOTAEM.SqlOrderBy = ""
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
		Dim i
		For i = 0 to UBound(Crosstab1.SummaryCellAttrs)
			Call ewrpt_SetAttr(Crosstab1.SummaryCellAttrs(i), "style", "")
			Call ewrpt_SetAttr(Crosstab1.SummaryCellAttrs(i), "class", "")
		Next
		For i = 0 to UBound(Crosstab1.SummaryViewAttrs)
			Call ewrpt_SetAttr(Crosstab1.SummaryViewAttrs(i), "style", "")
			Call ewrpt_SetAttr(Crosstab1.SummaryViewAttrs(i), "class", "")
		Next
		If IsArray(Fields) Then
			For i = 0 to UBound(Fields,2)
				Set fld = Fields(1,i)
				Call fld.ResetCSS()
			Next
		End If
	End Sub

	' Summary cells
	Dim SummaryCellAttrs
	Dim SummaryViewAttrs
	Dim SummaryCurrentValue
	Dim SummaryViewValue

	' Summary cell attributes
	Function SummaryCellAttributes(i)
		Dim sAtt, Dict, Attr
		sAtt = ""
		If IsArray(SummaryCellAttrs) Then
			If i >= 0 And i <= UBound(SummaryCellAttrs) Then
				If IsObject(SummaryCellAttrs(i)) Then
					Set Dict = SummaryCellAttrs(i)
					For Each Attr In Dict
						If Dict.Item(Attr) <> "" Then
							sAtt = sAtt & " " & Attr & "=""" & Dict.Item(Attr) & """"
						End If
					Next
				End If
			End If
		End If
		SummaryCellAttributes = sAtt
	End Function

	' Summary view attributes
	Function SummaryViewAttributes(i)
		Dim sAtt, Dict, Attr
		sAtt = ""
		If IsArray(SummaryViewAttrs) Then
			If i >= 0 And i <= UBound(SummaryViewAttrs) Then
				If IsObject(SummaryViewAttrs(i)) Then
					Set Dict = SummaryViewAttrs(i)
					For Each Attr In Dict
						If Dict.Item(Attr) <> "" Then
							sAtt = sAtt & " " & Attr & "=""" & Dict.Item(Attr) & """"
						End If
					Next
				End If
			End If
		End If
		SummaryViewAttributes = sAtt
	End Function

	'
	' Class Initialize
	'
	Private Sub Class_Initialize()
		RestoreSession = False
		ExportAll = True
		UseTokenInUrl = EWRPT_USE_TOKEN_IN_URL
		ShowCurrentFilter = EWRPT_SHOW_CURRENT_FILTER
		FilterPanelOption = EWRPT_FILTER_PANEL_OPTION
		Set RowAttrs = Server.CreateObject("Scripting.Dictionary") ' Row attributes
		Call ewrpt_SetArObj(Fields, "CODCLI", CODCLI)
		Call ewrpt_SetArObj(Fields, "DIG", DIG)
		Call ewrpt_SetArObj(Fields, "PATERNO", PATERNO)
		Call ewrpt_SetArObj(Fields, "MATERNO", MATERNO)
		Call ewrpt_SetArObj(Fields, "NOMBRE", NOMBRE)
		Call ewrpt_SetArObj(Fields, "AF1oMat", AF1oMat)
		Call ewrpt_SetArObj(Fields, "PERIODO_MAT", PERIODO_MAT)
		Call ewrpt_SetArObj(Fields, "TIPOCARR", TIPOCARR)
		Call ewrpt_SetArObj(Fields, "fecmat", fecmat)
		Call ewrpt_SetArObj(Fields, "AF1oIng", AF1oIng)
		Call ewrpt_SetArObj(Fields, "MATRICULADO", MATRICULADO)
		Call ewrpt_SetArObj(Fields, "ESTACAD", ESTACAD)
		Call ewrpt_SetArObj(Fields, "EstadoAcad", EstadoAcad)
		Call ewrpt_SetArObj(Fields, "JORNADA", JORNADA)
		Call ewrpt_SetArObj(Fields, "CODCARR", CODCARR)
		Call ewrpt_SetArObj(Fields, "NOMBRE_C", NOMBRE_C)
		Call ewrpt_SetArObj(Fields, "CIUDADACT", CIUDADACT)
		Call ewrpt_SetArObj(Fields, "COMUNA", COMUNA)
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
		Dim i
		For i = 0 to UBound(Crosstab1.SummaryCellAttrs)
			Set Crosstab1.SummaryCellAttrs(i) = Nothing
		Next
		For i = 0 to UBound(Crosstab1.SummaryViewAttrs)
			Set Crosstab1.SummaryViewAttrs(i) = Nothing
		Next
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
	Public Property Get ColumnField() ' Column field
		ColumnField = "[SEXO]"
	End Property

	Public Property Get ColumnDateType() ' Column date type
		ColumnDateType = ""
	End Property

	Public Property Get SummaryField() ' Summary field
		SummaryField = "[CODCLI]"
	End Property

	Public Property Get SummaryType() ' Summary type
		SummaryType = "COUNT"
	End Property

	Public Property Get ColumnCaptions() ' Column captions
		ColumnCaptions = ""
	End Property

	Public Property Get ColumnNames() ' Column names
		ColumnNames = ""
	End Property

	Public Property Get ColumnValues() ' Column values
		ColumnValues = ""
	End Property

	Public Property Get SqlFrom() ' From
		SqlFrom = "Vista_Autoevaglobal"
	End Property

	Public Property Get SqlSelect() ' Select
		SqlSelect = "SELECT [NOMBRE_C], [JORNADA], <DistinctColumnFields> FROM " & SqlFrom
	End Property

	Public Property Get SqlWhere() ' Where
		SqlWhere = ""
	End Property

	Public Property Get SqlGroupBy() ' Group By
		SqlGroupBy = "[NOMBRE_C], [JORNADA]"
	End Property

	Public Property Get SqlHaving() ' Having
		SqlHaving = ""
	End Property

	Public Property Get SqlOrderBy() ' Order By
		SqlOrderBy = "[NOMBRE_C] ASC, [JORNADA] ASC"
	End Property

	Public Property Get SqlDistinctSelect()
		SqlDistinctSelect = "SELECT DISTINCT [SEXO] FROM Vista_Autoevaglobal"
	End Property

	Public Property Get SqlDistinctWhere()
		SqlDistinctWhere = ""
	End Property

	Public Property Get SqlDistinctOrderBy()
		SqlDistinctOrderBy = "[SEXO] ASC"
	End Property

	' Table Level Group SQL
	Public Property Get SqlFirstGroupField()
		SqlFirstGroupField = "[NOMBRE_C]"
	End Property

	Public Property Get SqlSelectGroup()
		SqlSelectGroup = "SELECT DISTINCT " & SqlFirstGroupField & " FROM " & SqlFrom
	End Property

	Public Property Get SqlOrderByGroup()
		SqlOrderByGroup = "[NOMBRE_C] ASC"
	End Property

	Public Property Get SqlSelectAgg()
		SqlSelectAgg = "SELECT <DistinctColumnFields> FROM " & SqlFrom
	End Property

	Public Property Get SqlGroupByAgg()
		SqlGroupByAgg = ""
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
Dim Crosstab1_crosstab
Set Crosstab1_crosstab = New crCrosstab1_crosstab
Set Page = Crosstab1_crosstab

' Page init processing
Call Crosstab1_crosstab.Page_Init()

' Page main processing
Call Crosstab1_crosstab.Page_Main()
%>
<!--#include file="rptinc/header.asp"-->
<% If Crosstab1.Export = "" Then %>
<script type="text/javascript">
<!--
// Create page object
var Crosstab1_crosstab = new ewrpt_Page("Crosstab1_crosstab");
// page properties
Crosstab1_crosstab.PageID = "crosstab"; // page ID
Crosstab1_crosstab.FormID = "fCrosstab1crosstabfilter"; // form ID
var EWRPT_PAGE_ID = Crosstab1_crosstab.PageID;
// extend page with ValidateForm function
Crosstab1_crosstab.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation
	var elm = fobj.sv1_fecmat;
	if (elm && !ewrpt_CheckDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(Crosstab1.fecmat.FldErrMsg) %>"))
			return false;
	}
	var elm = fobj.sv2_fecmat;
	if (elm && !ewrpt_CheckDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(Crosstab1.fecmat.FldErrMsg) %>"))
			return false;
	}
	var elm = fobj.sv1_FECNAC;
	if (elm && !ewrpt_CheckDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(Crosstab1.FECNAC.FldErrMsg) %>"))
			return false;
	}
	var elm = fobj.sv2_FECNAC;
	if (elm && !ewrpt_CheckDate(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(Crosstab1.FECNAC.FldErrMsg) %>"))
			return false;
	}
	var elm = fobj.sv1_PUNTAJE;
	if (elm && !ewrpt_CheckNumber(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(Crosstab1.PUNTAJE.FldErrMsg) %>"))
			return false;
	}
	var elm = fobj.sv2_PUNTAJE;
	if (elm && !ewrpt_CheckNumber(elm.value)) {
		if (!ewrpt_OnError(elm, "<%= ewrpt_JsEncode2(Crosstab1.PUNTAJE.FldErrMsg) %>"))
			return false;
	}
	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}
// extend page with Form_CustomValidate function
Crosstab1_crosstab.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!
 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% If EWRPT_CLIENT_VALIDATE Then %>
Crosstab1_crosstab.ValidateRequired = true; // uses JavaScript validation
<% Else %>
Crosstab1_crosstab.ValidateRequired = false; // no JavaScript validation
<% End If %>
//-->
</script>
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
<% Crosstab1_crosstab.ShowPageHeader() %>
<% If EWRPT_DEBUG_ENABLED Then Response.Write ewrpt_DebugMsg() %>
<% Crosstab1_crosstab.ShowMessage() %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% If Crosstab1.Export = "" Then %>
<script src="rptjs/popup.js" type="text/javascript"></script>
<script src="rptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">
<% Dim jsdata %>
// popup fields
</script>
<!-- Table container (begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top container (begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspreportmaker">
<!-- top slot -->
<a name="top"></a>
<% End If %>
<%= Crosstab1.TableCaption %>
<% If Crosstab1.Export = "" Then %>
&nbsp;&nbsp;<a href="<%= Crosstab1_crosstab.ExportExcelUrl %>"><%= ReportLanguage.Phrase("ExportToExcel") %></a>
<% If Crosstab1_crosstab.FilterApplied Then %>
&nbsp;&nbsp;<a href="Crosstab1ctb.asp?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% End If %>
<% End If %>
<br><br>
<% If Crosstab1.Export = "" Then %>
</div></td></tr>
<!-- Top container (end) -->
<tr>
	<!-- Left container (begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspreportmaker">
	<!-- left slot -->
<% End If %>
<% If Crosstab1.Export = "" Then %>
	</div></td>
	<!-- Left container (end) -->
	<!-- Center container (report) (begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspreportmaker">
	<!-- center slot -->
<% End If %>
<!-- crosstab report starts -->
<div id="report_crosstab">
<% If Crosstab1.Export = "" Then %>
<%
If (Crosstab1.FilterPanelOption = 2) Or (Crosstab1.FilterPanelOption = 3 And Crosstab1_crosstab.FilterApplied) Or (Crosstab1_crosstab.Filter = "0=101") Then
	sButtonImage = "rptimages/collapse.gif"
	sDivDisplay = ""
Else
	sButtonImage = "rptimages/expand.gif"
	sDivDisplay = " style=""display: none;"""
End If
%>
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span><br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fCrosstab1crosstabfilter" id="fCrosstab1crosstabfilter" action="Crosstab1ctb.asp" class="ewForm" onsubmit="return Crosstab1_crosstab.ValidateForm(this);">
<table class="ewRptExtFilter">
<%
Dim cntf, cntd, totcnt, wrkcnt
%>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.AF1oMat.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_AF1oMat" id="sv_AF1oMat"<%= ewrpt_IIf(Crosstab1_crosstab.ClearExtFilter = "Crosstab1_AF1oMat", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Crosstab1.AF1oMat.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Crosstab1.AF1oMat.CustomFilters) Then
	cntf = UBound(Crosstab1.AF1oMat.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Crosstab1.AF1oMat.DropDownList) Then
	cntd = UBound(Crosstab1.AF1oMat.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Crosstab1.AF1oMat.CustomFilters(i).FldName = "AñoMat" Then
%>
		<option value="<%= "@@" & Crosstab1.AF1oMat.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Crosstab1.AF1oMat.DropDownValue, "@@" & Crosstab1.AF1oMat.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Crosstab1.AF1oMat.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Crosstab1.AF1oMat.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Crosstab1.AF1oMat.DropDownValue, Crosstab1.AF1oMat.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Crosstab1.AF1oMat.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.PERIODO_MAT.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODO_MAT" id="sv_PERIODO_MAT"<%= ewrpt_IIf(Crosstab1_crosstab.ClearExtFilter = "Crosstab1_PERIODO_MAT", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Crosstab1.PERIODO_MAT.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Crosstab1.PERIODO_MAT.CustomFilters) Then
	cntf = UBound(Crosstab1.PERIODO_MAT.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Crosstab1.PERIODO_MAT.DropDownList) Then
	cntd = UBound(Crosstab1.PERIODO_MAT.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Crosstab1.PERIODO_MAT.CustomFilters(i).FldName = "PERIODO_MAT" Then
%>
		<option value="<%= "@@" & Crosstab1.PERIODO_MAT.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Crosstab1.PERIODO_MAT.DropDownValue, "@@" & Crosstab1.PERIODO_MAT.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Crosstab1.PERIODO_MAT.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Crosstab1.PERIODO_MAT.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Crosstab1.PERIODO_MAT.DropDownValue, Crosstab1.PERIODO_MAT.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Crosstab1.PERIODO_MAT.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.TIPOCARR.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_TIPOCARR" id="sv_TIPOCARR"<%= ewrpt_IIf(Crosstab1_crosstab.ClearExtFilter = "Crosstab1_TIPOCARR", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Crosstab1.TIPOCARR.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Crosstab1.TIPOCARR.CustomFilters) Then
	cntf = UBound(Crosstab1.TIPOCARR.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Crosstab1.TIPOCARR.DropDownList) Then
	cntd = UBound(Crosstab1.TIPOCARR.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Crosstab1.TIPOCARR.CustomFilters(i).FldName = "TIPOCARR" Then
%>
		<option value="<%= "@@" & Crosstab1.TIPOCARR.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Crosstab1.TIPOCARR.DropDownValue, "@@" & Crosstab1.TIPOCARR.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Crosstab1.TIPOCARR.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Crosstab1.TIPOCARR.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Crosstab1.TIPOCARR.DropDownValue, Crosstab1.TIPOCARR.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Crosstab1.TIPOCARR.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.fecmat.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("BETWEEN") %><input type="hidden" name="so1_fecmat" id="so1_fecmat" value="BETWEEN"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_fecmat" id="sv1_fecmat" value="<%= ewrpt_HtmlEncode(Crosstab1.fecmat.SearchValue) %>"<% If Crosstab1_crosstab.ClearExtFilter = "Crosstab1_fecmat" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv1_fecmat" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv1_fecmat", // ID of the input field
	ifFormat : "%Y/%m/%d", // the date format
	button : "csv1_fecmat" // ID of the button
})
</script>
</span></td>
				<td><span class="ewRptSearchOpr" id="btw1_fecmat" name="btw1_fecmat">&nbsp;<%= ReportLanguage.Phrase("AND") %>&nbsp;</span></td>
				<td><span class="aspreportmaker" id="btw1_fecmat" name="btw1_fecmat">
<input type="text" name="sv2_fecmat" id="sv2_fecmat" value="<%= ewrpt_HtmlEncode(Crosstab1.fecmat.SearchValue2) %>"<% If Crosstab1_crosstab.ClearExtFilter = "Crosstab1_fecmat" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv2_fecmat" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv2_fecmat", // ID of the input field
	ifFormat : "%Y/%m/%d", // the date format
	button : "csv2_fecmat" // ID of the button
})
</script>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.AF1oIng.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_AF1oIng" id="sv_AF1oIng"<%= ewrpt_IIf(Crosstab1_crosstab.ClearExtFilter = "Crosstab1_AF1oIng", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Crosstab1.AF1oIng.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Crosstab1.AF1oIng.CustomFilters) Then
	cntf = UBound(Crosstab1.AF1oIng.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Crosstab1.AF1oIng.DropDownList) Then
	cntd = UBound(Crosstab1.AF1oIng.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Crosstab1.AF1oIng.CustomFilters(i).FldName = "AñoIng" Then
%>
		<option value="<%= "@@" & Crosstab1.AF1oIng.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Crosstab1.AF1oIng.DropDownValue, "@@" & Crosstab1.AF1oIng.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Crosstab1.AF1oIng.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Crosstab1.AF1oIng.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Crosstab1.AF1oIng.DropDownValue, Crosstab1.AF1oIng.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Crosstab1.AF1oIng.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.MATRICULADO.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_MATRICULADO" id="sv_MATRICULADO"<%= ewrpt_IIf(Crosstab1_crosstab.ClearExtFilter = "Crosstab1_MATRICULADO", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Crosstab1.MATRICULADO.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Crosstab1.MATRICULADO.CustomFilters) Then
	cntf = UBound(Crosstab1.MATRICULADO.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Crosstab1.MATRICULADO.DropDownList) Then
	cntd = UBound(Crosstab1.MATRICULADO.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Crosstab1.MATRICULADO.CustomFilters(i).FldName = "MATRICULADO" Then
%>
		<option value="<%= "@@" & Crosstab1.MATRICULADO.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Crosstab1.MATRICULADO.DropDownValue, "@@" & Crosstab1.MATRICULADO.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Crosstab1.MATRICULADO.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Crosstab1.MATRICULADO.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Crosstab1.MATRICULADO.DropDownValue, Crosstab1.MATRICULADO.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Crosstab1.MATRICULADO.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.EstadoAcad.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filter
If IsArray(Crosstab1.EstadoAcad.CustomFilters) Then
	cntf = UBound(Crosstab1.EstadoAcad.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Crosstab1.EstadoAcad.DropDownList) Then
	cntd = UBound(Crosstab1.EstadoAcad.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Crosstab1.EstadoAcad.CustomFilters(i).FldName = "EstadoAcad" Then
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Crosstab1.EstadoAcad.DropDownValue" id="Crosstab1.EstadoAcad.DropDownValue" value="<%= "@@" & Crosstab1.EstadoAcad.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Crosstab1.EstadoAcad.DropDownValue, "@@" & Crosstab1.EstadoAcad.CustomFilters(i).FilterName) Then Response.Write " checked=""checked""" %>><%= Crosstab1.EstadoAcad.CustomFilters(i).DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_EstadoAcad" id="sv_EstadoAcad" value="<%= Crosstab1.EstadoAcad.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Crosstab1.EstadoAcad.DropDownValue, Crosstab1.EstadoAcad.DropDownList(i)) Then Response.Write " checked=""checked""" %>><%= ewrpt_DropDownDisplayValue(Crosstab1.EstadoAcad.DropDownList(i), "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.CIUDADACT.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_CIUDADACT" id="sv_CIUDADACT"<%= ewrpt_IIf(Crosstab1_crosstab.ClearExtFilter = "Crosstab1_CIUDADACT", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Crosstab1.CIUDADACT.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Crosstab1.CIUDADACT.CustomFilters) Then
	cntf = UBound(Crosstab1.CIUDADACT.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Crosstab1.CIUDADACT.DropDownList) Then
	cntd = UBound(Crosstab1.CIUDADACT.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Crosstab1.CIUDADACT.CustomFilters(i).FldName = "CIUDADACT" Then
%>
		<option value="<%= "@@" & Crosstab1.CIUDADACT.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Crosstab1.CIUDADACT.DropDownValue, "@@" & Crosstab1.CIUDADACT.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Crosstab1.CIUDADACT.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Crosstab1.CIUDADACT.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Crosstab1.CIUDADACT.DropDownValue, Crosstab1.CIUDADACT.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Crosstab1.CIUDADACT.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.COMUNA.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_COMUNA" id="sv_COMUNA"<%= ewrpt_IIf(Crosstab1_crosstab.ClearExtFilter = "Crosstab1_COMUNA", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Crosstab1.COMUNA.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Crosstab1.COMUNA.CustomFilters) Then
	cntf = UBound(Crosstab1.COMUNA.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Crosstab1.COMUNA.DropDownList) Then
	cntd = UBound(Crosstab1.COMUNA.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Crosstab1.COMUNA.CustomFilters(i).FldName = "COMUNA" Then
%>
		<option value="<%= "@@" & Crosstab1.COMUNA.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Crosstab1.COMUNA.DropDownValue, "@@" & Crosstab1.COMUNA.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Crosstab1.COMUNA.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Crosstab1.COMUNA.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Crosstab1.COMUNA.DropDownValue, Crosstab1.COMUNA.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Crosstab1.COMUNA.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.NACIONALIDAD.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
<%

' Extended Filter
If IsArray(Crosstab1.NACIONALIDAD.CustomFilters) Then
	cntf = UBound(Crosstab1.NACIONALIDAD.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Crosstab1.NACIONALIDAD.DropDownList) Then
	cntd = UBound(Crosstab1.NACIONALIDAD.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Crosstab1.NACIONALIDAD.CustomFilters(i).FldName = "NACIONALIDAD" Then
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="Crosstab1.NACIONALIDAD.DropDownValue" id="Crosstab1.NACIONALIDAD.DropDownValue" value="<%= "@@" & Crosstab1.NACIONALIDAD.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Crosstab1.NACIONALIDAD.DropDownValue, "@@" & Crosstab1.NACIONALIDAD.CustomFilters(i).FilterName) Then Response.Write " checked=""checked""" %>><%= Crosstab1.NACIONALIDAD.CustomFilters(i).DisplayName %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 1) %>
<label><input type="checkbox" name="sv_NACIONALIDAD" id="sv_NACIONALIDAD" value="<%= Crosstab1.NACIONALIDAD.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Crosstab1.NACIONALIDAD.DropDownValue, Crosstab1.NACIONALIDAD.DropDownList(i)) Then Response.Write " checked=""checked""" %>><%= ewrpt_DropDownDisplayValue(Crosstab1.NACIONALIDAD.DropDownList(i), "", 0) %></label>
<%= ewrpt_RepeatColumnTable(totcnt, wrkcnt, 5, 2) %>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.FECNAC.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("BETWEEN") %><input type="hidden" name="so1_FECNAC" id="so1_FECNAC" value="BETWEEN"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_FECNAC" id="sv1_FECNAC" value="<%= ewrpt_HtmlEncode(Crosstab1.FECNAC.SearchValue) %>"<% If Crosstab1_crosstab.ClearExtFilter = "Crosstab1_FECNAC" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv1_FECNAC" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv1_FECNAC", // ID of the input field
	ifFormat : "%Y/%m/%d", // the date format
	button : "csv1_FECNAC" // ID of the button
})
</script>
</span></td>
				<td><span class="ewRptSearchOpr" id="btw1_FECNAC" name="btw1_FECNAC">&nbsp;<%= ReportLanguage.Phrase("AND") %>&nbsp;</span></td>
				<td><span class="aspreportmaker" id="btw1_FECNAC" name="btw1_FECNAC">
<input type="text" name="sv2_FECNAC" id="sv2_FECNAC" value="<%= ewrpt_HtmlEncode(Crosstab1.FECNAC.SearchValue2) %>"<% If Crosstab1_crosstab.ClearExtFilter = "Crosstab1_FECNAC" Then Response.Write " class=""ewInputCleared""" %>>
<img src="rptimages/calendar.png" id="csv2_FECNAC" alt="<%= ReportLanguage.Phrase("PickDate") %>" style="cursor:pointer;cursor:hand;">
<script type="text/javascript">
Calendar.setup({
	inputField : "sv2_FECNAC", // ID of the input field
	ifFormat : "%Y/%m/%d", // the date format
	button : "csv2_FECNAC" // ID of the button
})
</script>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.PUNTAJE.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("<=") %><input type="hidden" name="so1_PUNTAJE" id="so1_PUNTAJE" value="<="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_PUNTAJE" id="sv1_PUNTAJE" size="30" value="<%= ewrpt_HtmlEncode(Crosstab1.PUNTAJE.SearchValue) %>"<% If Crosstab1_crosstab.ClearExtFilter = "Crosstab1_PUNTAJE" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
				<td><span class="ewRptSearchOpr" id="btw0_PUNTAJE" name="btw0_PUNTAJE"><label><input type="radio" name="sc_PUNTAJE" value="AND"<% If Crosstab1.PUNTAJE.SearchCondition <> "OR" Then Response.Write " checked=""checked""" %>><%= ReportLanguage.Phrase("AND") %></label>&nbsp;<span class="ewSearchOpr" name="_sc_PUNTAJE" id="_sc_PUNTAJE"><label><input type="radio" name="sc_PUNTAJE" value="OR"<% If Crosstab1.PUNTAJE.SearchCondition = "OR" Then Response.Write " checked=""checked""" %>><%= ReportLanguage.Phrase("OR") %></label></span></span></td>
				<td><span class="ewRptSearchOpr" id="btw0_PUNTAJE" name="btw0_PUNTAJE" ><%= ReportLanguage.Phrase(">=") %><input type="hidden" name="so2_PUNTAJE" id="so2_PUNTAJE" value=">="></span></td>
				<td><span class="aspreportmaker">
<input type="text" name="sv2_PUNTAJE" id="sv2_PUNTAJE" size="30" value="<%= ewrpt_HtmlEncode(Crosstab1.PUNTAJE.SearchValue2) %>"<% If Crosstab1_crosstab.ClearExtFilter = "Crosstab1_PUNTAJE" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.ANOEEM.FldCaption %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANOEEM" id="sv_ANOEEM"<%= ewrpt_IIf(Crosstab1_crosstab.ClearExtFilter = "Crosstab1_ANOEEM", " class=""ewInputCleared""", "") %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% If ewrpt_MatchedFilterValue(Crosstab1.ANOEEM.DropDownValue, EWRPT_ALL_VALUE) Then Response.Write " selected=""selected""" %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

' Extended Filter
If IsArray(Crosstab1.ANOEEM.CustomFilters) Then
	cntf = UBound(Crosstab1.ANOEEM.CustomFilters)+1
Else
	cntf = 0
End If
If IsArray(Crosstab1.ANOEEM.DropDownList) Then
	cntd = UBound(Crosstab1.ANOEEM.DropDownList)+1
Else
	cntd = 0
End If
totcnt = cntf + cntd
wrkcnt = 0
For i = 0 to cntf-1
	If Crosstab1.ANOEEM.CustomFilters(i).FldName = "ANOEEM" Then
%>
		<option value="<%= "@@" & Crosstab1.ANOEEM.CustomFilters(i).FilterName %>"<% If ewrpt_MatchedFilterValue(Crosstab1.ANOEEM.DropDownValue, "@@" & Crosstab1.ANOEEM.CustomFilters(i).FilterName) Then Response.Write " selected=""selected""" %>><%= Crosstab1.ANOEEM.CustomFilters(i).DisplayName %></option>
<%
	End If
	wrkcnt = wrkcnt + 1
Next
For i = 0 to cntd-1
%>
		<option value="<%= Crosstab1.ANOEEM.DropDownList(i) %>"<% If ewrpt_MatchedFilterValue(Crosstab1.ANOEEM.DropDownValue, Crosstab1.ANOEEM.DropDownList(i)) Then Response.Write " selected=""selected""" %>><%= ewrpt_DropDownDisplayValue(Crosstab1.ANOEEM.DropDownList(i), "", 0) %></option>
<%
	wrkcnt = wrkcnt + 1
Next
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspreportmaker"><%= Crosstab1.NOTAEM.FldCaption %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("<=") %><input type="hidden" name="so1_NOTAEM" id="so1_NOTAEM" value="<="></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspreportmaker">
<input type="text" name="sv1_NOTAEM" id="sv1_NOTAEM" size="30" maxlength="4" value="<%= ewrpt_HtmlEncode(Crosstab1.NOTAEM.SearchValue) %>"<% If Crosstab1_crosstab.ClearExtFilter = "Crosstab1_NOTAEM" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
				<td><span class="ewRptSearchOpr" id="btw0_NOTAEM" name="btw0_NOTAEM"><label><input type="radio" name="sc_NOTAEM" value="AND"<% If Crosstab1.NOTAEM.SearchCondition <> "OR" Then Response.Write " checked=""checked""" %>><%= ReportLanguage.Phrase("AND") %></label>&nbsp;<span class="ewSearchOpr" name="_sc_NOTAEM" id="_sc_NOTAEM"><label><input type="radio" name="sc_NOTAEM" value="OR"<% If Crosstab1.NOTAEM.SearchCondition = "OR" Then Response.Write " checked=""checked""" %>><%= ReportLanguage.Phrase("OR") %></label></span></span></td>
				<td><span class="ewRptSearchOpr" id="btw0_NOTAEM" name="btw0_NOTAEM" ><%= ReportLanguage.Phrase(">=") %><input type="hidden" name="so2_NOTAEM" id="so2_NOTAEM" value=">="></span></td>
				<td><span class="aspreportmaker">
<input type="text" name="sv2_NOTAEM" id="sv2_NOTAEM" size="30" maxlength="4" value="<%= ewrpt_HtmlEncode(Crosstab1.NOTAEM.SearchValue2) %>"<% If Crosstab1_crosstab.ClearExtFilter = "Crosstab1_NOTAEM" Then Response.Write " class=""ewInputCleared""" %>>
</span></td>
			</tr></table>			
		</td>
	</tr>
</table>
<table class="ewRptExtFilter">
	<tr>
		<td><span class="aspreportmaker">
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
<% If Crosstab1.ShowCurrentFilter Then %>
<div id="ewrptFilterList">
<% Call Crosstab1_crosstab.ShowFilterList() %>
</div>
<br>
<% End If %>
<table class="ewGrid" cellspacing="0"><tr>
	<td class="ewGridContent">
<% If Crosstab1.Export = "" Then %>
<div class="ewGridUpperPanel">
<form action="Crosstab1ctb.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(Crosstab1_crosstab.StartGrp, Crosstab1_crosstab.DisplayGrps, Crosstab1_crosstab.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="Crosstab1ctb.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="Crosstab1ctb.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="Crosstab1ctb.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="Crosstab1ctb.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If Crosstab1_crosstab.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If Crosstab1_crosstab.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="40"<% If Crosstab1_crosstab.DisplayGrps = 40 Then Response.Write " selected=""selected""" %>>40</option>
</select>
		</span></td>
<% End If %>
	</tr>
</table>
</form>
</div>
<% End If %>
<!-- Report grid (begin) -->
<div class="ewGridMiddlePanel">
<table class="ewTable ewTableSeparate" cellspacing="0">
<% If Crosstab1_crosstab.ShowFirstHeader Then ' Show header %>
	<thead>
	<!-- Table header -->
	<tr class="ewTableRow">
		<td colspan="2" style="white-space: nowrap;"><div class="aspreportmaker"><%= Crosstab1.CODCLI.FldCaption %>&nbsp;(<%= ReportLanguage.Phrase("RptCnt") %>)&nbsp;</div></td>
		<td class="ewRptColHeader" colspan="<%= Crosstab1_crosstab.ColSpan %>" style="white-space: nowrap;">
			<%= Crosstab1.SEXO.FldCaption %>
		</td>
	</tr>
	<tr>
<td class="ewTableHeader">
<% If Crosstab1.Export <> "" Then %>
<%= Crosstab1.NOMBRE_C.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Crosstab1.SortUrl(Crosstab1.NOMBRE_C) = "" Then %>
		<td style="vertical-align: bottom;"><%= Crosstab1.NOMBRE_C.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Crosstab1.SortUrl(Crosstab1.NOMBRE_C) %>',0);"><%= Crosstab1.NOMBRE_C.FldCaption %></td><td style="width: 10px;">
		<% If Crosstab1.NOMBRE_C.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Crosstab1.NOMBRE_C.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<td class="ewTableHeader">
<% If Crosstab1.Export <> "" Then %>
<%= Crosstab1.JORNADA.FldCaption %>
<% Else %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% If Crosstab1.SortUrl(Crosstab1.JORNADA) = "" Then %>
		<td style="vertical-align: bottom;"><%= Crosstab1.JORNADA.FldCaption %></td>
<% Else %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Crosstab1.SortUrl(Crosstab1.JORNADA) %>',0);"><%= Crosstab1.JORNADA.FldCaption %></td><td style="width: 10px;">
		<% If Crosstab1.JORNADA.Sort = "ASC" Then %><img src="rptimages/sortup.gif" width="10" height="9" border="0"><% ElseIf Crosstab1.JORNADA.Sort = "DESC" Then %><img src="rptimages/sortdown.gif" width="10" height="9" border="0"><% End If %></td>
<% End If %>
	</tr></table>
<% End If %>
</td>
<!-- Dynamic columns begin -->
<%
	For iy = 1 to UBound(Crosstab1_crosstab.Val)
		If Crosstab1_crosstab.Col(iy).Visible Then
			Crosstab1.SummaryCurrentValue(iy-1) = Crosstab1_crosstab.Col(iy).Caption
			Crosstab1.SummaryViewValue(iy-1) = Crosstab1.SummaryCurrentValue(iy-1)
%>
		<td class="ewTableHeader"<%= Crosstab1.SEXO.CellAttributes %>><div<%= Crosstab1.SEXO.ViewAttributes %>><%= Crosstab1.SummaryViewValue(iy-1) %></div></td>
<%
		End If
	Next
%>
<!-- Dynamic columns end -->
	</tr>
	</thead>
<% End If ' End show header %>
	<tbody>
<% If Crosstab1_crosstab.TotalGrps > 0 Then %>
<%

' Set the last group to display if not export all
If Crosstab1.ExportAll And Crosstab1.Export <> "" Then
	Crosstab1_crosstab.StopGrp = Crosstab1_crosstab.TotalGrps
Else
	Crosstab1_crosstab.StopGrp = Crosstab1_crosstab.StartGrp + Crosstab1_crosstab.DisplayGrps - 1
End If

' Stop group <= total number of groups
If CLng(Crosstab1_crosstab.StopGrp) > CLng(Crosstab1_crosstab.TotalGrps) Then
	Crosstab1_crosstab.StopGrp = Crosstab1_crosstab.TotalGrps
End If

' Navigate
Crosstab1_crosstab.RecCount = 0

' Get first row
If Crosstab1_crosstab.TotalGrps > 0 Then
	Call Crosstab1_crosstab.GetGrpRow(1)
	Crosstab1_crosstab.GrpCount = 1
End If

' Process groups
Do While (Not rsgrp.Eof And Crosstab1_crosstab.GrpCount <= Crosstab1_crosstab.DisplayGrps)

	' Build detail SQL
	sWhere = ewrpt_DetailFilterSQL(Crosstab1.NOMBRE_C, Crosstab1.SqlFirstGroupField, Crosstab1.NOMBRE_C.GroupValue)
	If Crosstab1_crosstab.Filter <> "" Then
		sWhere = "(" & Crosstab1_crosstab.Filter & ") AND (" & sWhere & ")"
	End If
	sSql = ewrpt_BuildReportSql(Crosstab1_crosstab.SqlSelectWork, Crosstab1.SqlWhere, Crosstab1.SqlGroupBy, "", Crosstab1.SqlOrderBy, sWhere, Crosstab1_crosstab.Sort)
	If EWRPT_DEBUG_ENABLED Then Response.Write "(Detail SQL): " & sSql & "<br>"
	Set rs = ewrpt_LoadRs(sSql)
	rsdtlcnt = rs.RecordCount
	If rsdtlcnt > 0 Then Call Crosstab1_crosstab.GetRow(1)
	Do While Not rs.Eof
		Crosstab1_crosstab.RecCount = Crosstab1_crosstab.RecCount + 1

		' Render row
		Call Crosstab1.ResetCSS()
		Crosstab1.RowType = EWRPT_ROWTYPE_DETAIL
		Call Crosstab1_crosstab.RenderRow()
%>
	<!-- Data -->
	<tr<%= Crosstab1.RowAttributes %>>
		<!-- NOMBRE C -->
		<td<%= Crosstab1.NOMBRE_C.CellAttributes %>><div<%= Crosstab1.NOMBRE_C.ViewAttributes %>><%= Crosstab1.NOMBRE_C.GroupViewValue %></div></td>
		<!-- JORNADA -->
		<td<%= Crosstab1.JORNADA.CellAttributes %>><div<%= Crosstab1.JORNADA.ViewAttributes %>><%= Crosstab1.JORNADA.GroupViewValue %></div></td>
<!-- Dynamic columns begin -->
<%
		rowsmry = 0
		For iy = 1 to UBound(Crosstab1.SummaryViewValue)+1
			If iy <= Crosstab1_crosstab.ColCount Then
				bColShow = Crosstab1_crosstab.Col(iy).Visible
				sColDesc = Crosstab1_crosstab.Col(iy).Caption
			Else
				bColShow = True
				sColDesc = ReportLanguage.Phrase("Summary")
			End If
			If bColShow Then
%>
		<!-- <%= sColDesc %> -->
		<td<%= Crosstab1.SummaryCellAttributes(iy-1) %>><div<%= Crosstab1.SummaryViewAttributes(iy-1) %>><%= Crosstab1.SummaryViewValue(iy-1) %></div></td>
<%
			End If
		Next
%>
<!-- Dynamic columns end -->
	</tr>
<%

		' Accumulate page summary
		Call Crosstab1_crosstab.AccumulateSummary()

		' Get next record
		Call Crosstab1_crosstab.GetRow(2)
%>
<%
	Loop ' End detail records loop
	rs.Close
	Set rs = Nothing
%>
<%
	Call Crosstab1_crosstab.GetGrpRow(2)
	Crosstab1_crosstab.GrpCount = Crosstab1_crosstab.GrpCount + 1
Loop
%>
	</tbody>
	<tfoot>
<%
	Call Crosstab1.ResetCSS()
	Crosstab1.RowType = EWRPT_ROWTYPE_TOTAL
	Crosstab1.RowTotalType = EWRPT_ROWTOTAL_GRAND
	Call ewrpt_SetAttr(Crosstab1.RowAttrs, "class", "ewRptGrandSummary")
	Call Crosstab1_crosstab.RenderRow()
%>
	<!-- Grand Total -->
	<tr<%= Crosstab1.RowAttributes %>>
	<td colspan="2"><%= ReportLanguage.Phrase("RptGrandTotal") %></td>
<!-- Dynamic columns begin -->
<%
	For iy = 1 to UBound(Crosstab1.SummaryViewValue)+1
		If iy <= Crosstab1_crosstab.ColCount Then
			bColShow = Crosstab1_crosstab.Col(iy).Visible
			sColDesc = Crosstab1_crosstab.Col(iy).Caption
		Else
			bColShow = True
			sColDesc = ReportLanguage.Phrase("Summary")
		End If
		If bColShow Then
%>
		<!-- <%= sColDesc %> -->
		<td<%= Crosstab1.SummaryCellAttributes(iy-1) %>><div<%= Crosstab1.SummaryViewAttributes(iy-1) %>><%= Crosstab1.SummaryViewValue(iy-1) %></div></td>
<%
		End If
	Next
%>
<!-- Dynamic columns end -->
	</tr>
<% End If %>
	</tfoot>
</table>
</div>
<% If Crosstab1_crosstab.TotalGrps > 0 Then %>
<% If Crosstab1.Export = "" Then %>
<div class="ewGridLowerPanel">
<form action="Crosstab1ctb.asp" name="ewpagerform" id="ewpagerform" class="ewForm">
<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% If Not IsObject(Pager) Then Set Pager = ewrpt_NewPrevNextPager(Crosstab1_crosstab.StartGrp, Crosstab1_crosstab.DisplayGrps, Crosstab1_crosstab.TotalGrps) %>
<% If Pager.RecordCount > 0 Then %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% If Pager.FirstButton.Enabled Then %>
	<td><a href="Crosstab1ctb.asp?start=<%= Pager.FirstButton.Start %>"><img src="rptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--previous page button-->
	<% If Pager.PrevButton.Enabled Then %>
	<td><a href="Crosstab1ctb.asp?start=<%= Pager.PrevButton.Start %>"><img src="rptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% Else %>
	<td><img src="rptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Pager.CurrentPage %>" size="4"></td>
<!--next page button-->
	<% If Pager.NextButton.Enabled Then %>
	<td><a href="Crosstab1ctb.asp?start=<%= Pager.NextButton.Start %>"><img src="rptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>	
	<% Else %>
	<td><img src="rptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% End If %>
<!--last page button-->
	<% If Pager.LastButton.Enabled Then %>
	<td><a href="Crosstab1ctb.asp?start=<%= Pager.LastButton.Start %>"><img src="rptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
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
	<% If Crosstab1_crosstab.Filter = "0=101" Then %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% Else %>
	<span class="aspreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% End If %>
<% End If %>
		</td>
<% If Crosstab1_crosstab.TotalGrps > 0 Then %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" onchange="this.form.submit();">
<option value="40"<% If Crosstab1_crosstab.DisplayGrps = 40 Then Response.Write " selected=""selected""" %>>40</option>
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
<!-- Crosstab report ends -->
<% If Crosstab1.Export = "" Then %>
	</div><br></td>
	<!-- Center container (report) (end) -->
	<!-- Right container (begin) -->
	<td valign="top"><div id="ewRight" class="aspreportmaker">
	<!-- right slot -->
<% End If %>
<% If Crosstab1.Export = "" Then %>
	</div></td>
	<!-- Right container (end) -->
</tr>
<!-- Bottom container (begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspreportmaker">
	<!-- bottom slot -->
<% End If %>
<% If Crosstab1.Export = "" Then %>
	</div><br></td></tr>
<!-- Bottom container (end) -->
</table>
<!-- Table container (end) -->
<% End If %>
<% Crosstab1_crosstab.ShowPageFooter() %>
<%

' Close recordset and connection
rsgrp.Close
Set rsgrp = Nothing
%>
<% If Crosstab1.Export = "" Then %>
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
Set Crosstab1_crosstab = Nothing
%>
<%

' -----------------------------------------------------------------
' Page Class
'
Class crCrosstab1_crosstab

	' Page ID
	Public Property Get PageID()
		PageID = "crosstab"
	End Property

	' Table Name
	Public Property Get TableName()
		TableName = "Crosstab1"
	End Property

	' Page Object Name
	Public Property Get PageObjName()
		PageObjName = "Crosstab1_crosstab"
	End Property

	' Page Name
	Public Property Get PageName()
		PageName = ewrpt_CurrentPage()
	End Property

	' Page Url
	Public Property Get PageUrl()
		PageUrl = ewrpt_CurrentPage() & "?"
		If Crosstab1.UseTokenInUrl Then PageUrl = PageUrl & "t=" & Crosstab1.TableVar & "&" ' add page token
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
		If Crosstab1.UseTokenInUrl Then
			IsPageRequest = False
			If Request.Form("t").Count > 0 Then
				IsPageRequest = (Crosstab1.TableVar = Request.Form("t"))
			End If
			If Request.QueryString("t").Count > 0 Then
				IsPageRequest = (Crosstab1.TableVar = Request.QueryString("t"))
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
		Set Crosstab1 = New crCrosstab1

		' Initialize URLs
		ExportPrintUrl = PageUrl & "export=print"
		ExportExcelUrl = PageUrl & "export=excel"
		ExportWordUrl = PageUrl & "export=word"

		' Intialize page id
		EWRPT_PAGE_ID = "crosstab"

		' Initialize table name
		EWRPT_TABLE_NAME = "Crosstab1"

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
			Crosstab1.Export = Request.QueryString("export")
		End If
		gsExport = Crosstab1.Export ' Get export parameter, used in header
		gsExportFile = Crosstab1.TableVar ' Get export file, used in header
		If Crosstab1.Export = "excel" Then
			Response.ContentType = "application/vnd.ms-excel"
			Response.AddHeader "Content-Disposition", "attachment; filename=" & gsExportFile & ".xls"
		End If

		' Global page loading event
		Call Page_Loading()

		' Page load event
		Call Page_Load()

		' Export to Email (Load content via XMLHttp)
		If Crosstab1.Export = "email" Then
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

		'wrkstr = "&filter=" & Crosstab1.SessionWhere
		wrkstr = wrkstr & "&u=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_USER)&"")
		wrkstr = wrkstr & "&p=" & CStr(Session(EWRPT_SESSION_ENCRYPTED_PASSWORD)&"")
		wrkstr = wrkstr & "&f=" & ew_Encode(CStr(Session(EWRPT_SESSION_FILTER)&""))
		ar = Session(EWRPT_SESSION_COLUMN_SELECTION)
		If IsArray(ar) Then
			For i = 0 to UBound(ar)
				wrkstr = wrkstr & "&c=" & ew_Encode(CStr(ar(i)&""))
			Next
		End If
		wrkstr = wrkstr & "&o=" & ew_Encode(CStr(Crosstab1.OrderBy&""))
		wrkstr = wrkstr & "&s=" & ew_Encode(CStr(Crosstab1.StartGroup&""))
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
			Crosstab1.OrderBy = GetQSValue(QS, "o")
			Crosstab1.StartGroup = GetQSValue(QS, "s")
			Crosstab1.RestoreSession = True
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
		Set Crosstab1 = Nothing

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
	Dim Cnt, Col, Val, Smry
	Dim ColCount, ColSpan
	Dim SqlSelectWork, SqlSelectAggWork
	Dim SqlChartWork

	'
	' Page main
	'
	Sub Page_Main()

		' Paging variables
		RecCount = 0 ' Record count
		StartGrp = 0 ' Start group
		StopGrp = 0 ' Stop group
		TotalGrps = 0 ' Total groups
		GrpCount = 0 ' Group count
		DisplayGrps = 40 ' Groups per page
		GrpRange = 10

		' Get sort
		Sort = GetSort()
		UserIDFilter = ""
		Filter = ""

		' Set up groups per page dynamically
		Call SetUpDisplayGrps()

		' Popup values and selections
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
		Call Crosstab1.CustomFilters_Load()

		' Build extended filter
		sExtendedFilter = GetExtendedFilter()
		If sExtendedFilter <> "" Then
			If Filter <> "" Then
				Filter = "(" & Filter & ") AND (" & sExtendedFilter & ")"
			Else
				Filter = sExtendedFilter
			End If
		End If

		' Load columns to arrray
		Call GetColumns()

		' Build popup filter
		Dim sPopupFilter
		sPopupFilter = GetPopupFilter()
		If sPopupFilter <> "" Then
			If Filter <> "" Then
				Filter = "(" & Filter & ") AND (" & sPopupFilter & ")"
			Else
				Filter = sPopupFilter
			End If
		End If

		' Check if filter applied
		FilterApplied = CheckFilter()

		' Restore filter/sort from Session
		If Crosstab1.RestoreSession Then
			Filter = Session(EWRPT_SESSION_FILTER)
		Else
			Session(EWRPT_SESSION_FILTER) = Filter
		End If

		' Get total group count
		Dim sSql, sGrpSort
		sGrpSort = ewrpt_UpdateSortFields(Crosstab1.SqlOrderByGroup, Sort, 2) ' Get grouping field only
		sSql = ewrpt_BuildReportSql(Crosstab1.SqlSelectGroup, Crosstab1.SqlWhere, Crosstab1.SqlGroupBy, "", Crosstab1.SqlOrderByGroup, Filter, sGrpSort)
		Call ewrpt_SetDebugMsg("(Group SQL): " & sSql)
		TotalGrps = GetGrpCnt(sSql)

		' Display all records
		If DisplayGrps <= 0 Then
			DisplayGrps = TotalGrps
		End If
		StartGrp = 1

		' Show header
		ShowFirstHeader = (TotalGrps > 0)

		'ShowFirstHeader = True ' Uncomment to always show header
		' Set up start position if not export all

		If Crosstab1.ExportAll And Crosstab1.Export <> "" Then
			DisplayGrps = TotalGrps
		Else
			Call SetUpStartGroup()
		End If

		' Get total groups
		Set rsgrp = GetGrpRs(sSql, StartGrp, DisplayGrps)

		' Set up column attributes
		Call Crosstab1.SEXO.ResetCSS()
		Call ewrpt_SetAttr(Crosstab1.SEXO.ViewAttrs, "style", "")
		Call ewrpt_SetAttr(Crosstab1.SEXO.CellAttrs, "style", "vertical-align: top;")
	End Sub

	' Get column values
	Sub GetColumns()
		Dim i, ar
		Dim bSelected, j

		' Build sql
		Dim sSql
		sSql = ewrpt_BuildReportSql(Crosstab1.SqlDistinctSelect, Crosstab1.SqlDistinctWhere, "", "", Crosstab1.SqlDistinctOrderBy, Filter, "")
		Call ewrpt_SetDebugMsg("(Column SQL): " & sSql)

		' Load recordset
		Dim rscol
		Set rscol = ewrpt_LoadRs(sSql)

		' Get distinct column count
		ColCount = 0
		If Not rscol.Eof Then rscol.MoveFirst
		Do While Not rscol.Eof
			ColCount = ColCount + 1
			rscol.MoveNext
		Loop
		If ColCount = 0 Then
			rscol.Close
			Set rscol = Nothing
			Response.Write ReportLanguage.Phrase("NoDistinctColVals") & sSql & "<br>"
			Response.End
		End If

		' 1st dimension = no of groups (level 0 used for grand total)
		' 2nd dimension = no of distinct values

		Dim nGrps: nGrps = 2
		Redim Col(ColCount), Val(ColCount), ValCnt(ColCount), Cnt(nGrps,ColCount)
		Redim Smry(nGrps,ColCount), SmryCnt(nGrps,ColCount)

		' Reset summary values
		Call ResetLevelSummary(0)
		Dim colcnt: colcnt = 0
		Dim wrkValue, wrkCaption
		If ColCount > 0 Then rscol.MoveFirst
		Do While Not rscol.Eof
			If IsNull(rscol(0)) Then
				wrkValue = EWRPT_NULL_VALUE
				wrkCaption = ReportLanguage.Phrase("NullLabel")
			ElseIf rscol(0) = "" Then
				wrkValue = EWRPT_EMPTY_VALUE
				wrkCaption = ReportLanguage.Phrase("EmptyLabel")
			Else
				wrkValue = ewrpt_GetValue(rscol(0))
				wrkCaption = ewrpt_GetValue(rscol(0))
			End If
			colcnt = colcnt + 1
			Set Col(colcnt) = New crCrosstabColumn
			Col(colcnt).Init wrkValue, wrkCaption, True
			rscol.MoveNext
		Loop
		rscol.Close
		Set rscol = Nothing

		' Get active columns
		If Not IsArray(Crosstab1.SEXO.SelectionList) Then
			ColSpan = ColCount
		Else
			ColSpan = 0
			For i = 1 to ColCount
				bSelected = False
				For j = 0 to UBound(Crosstab1.SEXO.SelectionList)
					If ewrpt_CompareValue(Crosstab1.SEXO.SelectionList(j), Col(i).Value, Crosstab1.SEXO.FldType) Then
						ColSpan = ColSpan + 1
						bSelected = True
						Exit For
					End If
				Next
				Col(i).Visible = bSelected
			Next
		End If
		colcnt = ColCount

		' Set up summary values
		ReDim ar(colcnt-1)
		Crosstab1.SummaryCurrentValue = ar
		Crosstab1.SummaryViewValue = ar
		Crosstab1.SummaryCellAttrs = ar
		Crosstab1.SummaryViewAttrs = ar
		For i = 0 to colcnt-1
			Set Crosstab1.SummaryCellAttrs(i) = Server.CreateObject("Scripting.Dictionary")
			Set Crosstab1.SummaryViewAttrs(i) = Server.CreateObject("Scripting.Dictionary")
		Next

		' Update crosstab sql
		sSqlFlds = ""
		For colcnt = 1 to ColCount
			sFld = ewrpt_CrossTabField(Crosstab1.SummaryType, Crosstab1.SummaryField, Crosstab1.ColumnField, Crosstab1.ColumnDateType, Col(colcnt).Value, "'", "C" & colcnt)
			If sSqlFlds <> "" Then sSqlFlds = sSqlFlds & ", "
			sSqlFlds = sSqlFlds & sFld
		Next
		SqlSelectWork = Replace(Crosstab1.SqlSelect, "<DistinctColumnFields>", sSqlFlds)
		SqlSelectAggWork = Replace(Crosstab1.SqlSelectAgg, "<DistinctColumnFields>", sSqlFlds)

		' Update chart sql if Y Axis = Column Field
		SqlChartWork = ""
		For i = 0 to ColCount-1
			If Col(i+1).Visible Then
				sChtFld = ewrpt_CrossTabField("SUM", Crosstab1.SummaryField, Crosstab1.ColumnField, Crosstab1.ColumnDateType, Col(i+1).Value, "'", "")
				If SqlChartWork <> "" Then SqlChartWork = SqlChartWork & "+"
				SqlChartWork = SqlChartWork & sChtFld
			End If
		Next
	End Sub

	' Get group count
	Function GetGrpCnt(sql)

		'Response.Write "sql (GetGrpCnt): " & sql & "<br>"
		Dim rsgrpcnt
		Set rsgrpcnt = ewrpt_LoadRs(sql)
		GetGrpCnt = rsgrpcnt.RecordCount
		rsgrpcnt.Close
		Set rsgrpcnt = Nothing
	End Function

	' Get group rs
	Function GetGrpRs(sql, start, grps)
		Dim rswrk, wrksql
		wrksql = sql
		Set rswrk = ewrpt_LoadRs(wrksql)
		If Not rswrk.Eof And start > 1 Then rswrk.Move (start-1)
		Set GetGrpRs = rswrk
	End Function

	' Get group row values
	Function GetGrpRow(opt)
		If Not IsObject(rsgrp) Then Exit Function
		If opt = 1 Then ' Get first group

			'If Not rsgrp.Eof Then rsgrp.MoveFirst ' NOTE: no need to move position
			Crosstab1.NOMBRE_C.DbValue = "" ' Init first value
		Else ' Get next group
			If not rsgrp.Eof Then rsgrp.MoveNext
		End If
		If rsgrp.Eof Then
			Crosstab1.NOMBRE_C.DbValue = ""
		Else
			Crosstab1.NOMBRE_C.DbValue = ewrpt_GetValue(rsgrp(0))
		End If
	End Function

	' Get row values
	Sub GetRow(opt)
		If opt = 1 Then ' Get first row

			'If Not rs.Eof Then rs.MoveFirst ' NOTE: no need to move position
		Else ' Get next row
			If Not rs.Eof Then rs.MoveNext
		End If
		If Not rs.Eof Then
			If opt <> 1 Then
				Crosstab1.NOMBRE_C.DbValue = ewrpt_GetValue(rs("NOMBRE_C"))
			End If
			Crosstab1.JORNADA.DbValue = ewrpt_GetValue(rs("JORNADA"))
			For ix = 1 to UBound(Val)
				Val(ix) = ewrpt_GetValue(rs(ix+2-1))
			Next
		Else
			Crosstab1.NOMBRE_C.DbValue = ""
			Crosstab1.JORNADA.DbValue = ""
		End If
	End Sub

	' Check level break
	Function ChkLvlBreak(lvl)
		Select Case lvl
		Case 1: ChkLvlBreak = _
			(IsNull(Crosstab1.NOMBRE_C.CurrentValue) And Not IsNull(Crosstab1.NOMBRE_C.OldValue)) Or _
			(Not IsNull(Crosstab1.NOMBRE_C.CurrentValue) And IsNull(Crosstab1.NOMBRE_C.OldValue)) Or _
			(Crosstab1.NOMBRE_C.GroupValue <> Crosstab1.NOMBRE_C.GroupOldValue)
		Case 2: ChkLvlBreak = _
			(IsNull(Crosstab1.JORNADA.CurrentValue) And Not IsNull(Crosstab1.JORNADA.OldValue)) Or _
			(Not IsNull(Crosstab1.JORNADA.CurrentValue) And IsNull(Crosstab1.JORNADA.OldValue)) Or _
			(Crosstab1.JORNADA.GroupValue <> Crosstab1.JORNADA.GroupOldValue) Or ChkLvlBreak(1) ' Recurse upper level
		End Select
	End Function

	' Accummulate summary
	Sub AccumulateSummary()
		Dim valwrk, cntwrk
		Dim ix, iy
		For ix = 0 to UBound(Smry,1)
			For iy = 1 to UBound(Smry,2)
				valwrk = Val(iy)
				Cnt(ix,iy) = Cnt(ix,iy) + 1
				Smry(ix,iy) = ewrpt_SummaryValue(Smry(ix,iy), valwrk, Crosstab1.SummaryType)
			Next
		Next
	End Sub

	' Reset level summary
	Sub ResetLevelSummary(lvl)

		' Clear summary values
		For ix = lvl to UBound(Smry,1)
			For iy = 1 to UBound(Smry,2)
				Cnt(ix,iy) = 0
				Smry(ix,iy) = 0
			Next
		Next

		' Reset record count
		RecCount = 0
	End Sub

	'-------------------------------------------------------------------------------
	' Function SetUpStartGroup
	' - Set up Starting Record parameters based on Pager Navigation
	' - Variables setup: nStartGrp
	Sub SetUpStartGroup()
		Dim nPageNo

		' Exit if DisplayGrps = 0
		If DisplayGrps = 0 Then Exit Sub

		' Check for a START parameter
		If Request.QueryString(EWRPT_TABLE_START_GROUP).Count > 0 Then
			StartGrp = Request.QueryString(EWRPT_TABLE_START_GROUP)
			Crosstab1.StartGroup = StartGrp
		ElseIf Request.QueryString("pageno").Count > 0 Then
			nPageNo = Request.QueryString("pageno")
			If IsNumeric(nPageNo) Then
				StartGrp = (nPageNo-1)*DisplayGrps+1
				If StartGrp <= 0 Then
					StartGrp = 1
				ElseIf StartGrp >= ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 Then
					StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1
				End If
				Crosstab1.StartGroup = StartGrp
			Else
				StartGrp = Crosstab1.StartGroup
			End If
		Else
			StartGrp = Crosstab1.StartGroup
		End If

		' Check if correct start group counter
		If Not IsNumeric(StartGrp) Or StartGrp = "" Then ' Avoid invalid start group counter
			StartGrp = 1 ' Reset start group counter
			Crosstab1.StartGroup = StartGrp
		ElseIf CLng(StartGrp) > CLng(TotalGrps) Then ' Avoid starting group > total groups
			StartGrp = ((TotalGrps-1)\DisplayGrps)*DisplayGrps+1 ' Point to last page first group
			Crosstab1.StartGroup = StartGrp
		ElseIf (StartGrp-1) Mod DisplayGrps <> 0 Then
			StartGrp = ((StartGrp-1)\DisplayGrps)*DisplayGrps+1 ' Point to page boundary
			Crosstab1.StartGroup = StartGrp
		End If
	End Sub

	' Set up popup
	Sub SetupPopup()
		Dim sName, arValues, cntValues
		Dim i, ar
		Dim sSql, rswrk
		Dim bNullValue, bEmptyValue

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

	' Reset pager to start position
	Sub ResetPager()
		StartGrp = 1
		Crosstab1.StartGroup = StartGrp
	End Sub

	' Check if any column values is present
	Function HasColumnValues(rs)
		Dim i
		For i = 1 to UBound(Col)
			If Col(i).Visible Then
				If ewrpt_GetValue(rs(2+i-1)) <> 0 Then
					HasColumnValues = True
					Exit Function
				End If
			End If
		Next
		HasColumnValues = False
	End Function

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
					DisplayGrps = 40 ' Non-numeric, Load Default
				End If
			End If
			Crosstab1.GroupPerPage = DisplayGrps ' Save to Session

			' Reset Start Position (Reset Command)
			StartGrp = 1
			Crosstab1.StartGroup = nStartGrp
		Else
			If Crosstab1.GroupPerPage <> "" Then
				DisplayGrps = Crosstab1.GroupPerPage ' Restore from Session
			Else
				DisplayGrps = 40 ' Load Default
			End If
		End If
	End Sub

	Function RenderRow()
		Dim colcnt, rowsmry, rowcnt, i, thisval, thiscnt
		Dim sSql, rsagg

		' Set up summary values
		colcnt = ColCount
		ReDim arwrk(colcnt-1), arwrk2(colcnt-1)
		If Crosstab1.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total

			' aggregate sql
			sSql = ewrpt_BuildReportSql(SqlSelectAggWork, Crosstab1.SqlWhere, Crosstab1.SqlGroupByAgg, "", "", Filter, "")
			If EWRPT_DEBUG_ENABLED Then Response.Write "(Aggregate SQL): " & sSql & "<br>"
			Set rsagg = conn.Execute(sSql)
			If Not rsagg.Eof Then rsagg.MoveFirst
		End If
		For i = 1 to ColCount
			If Col(i).Visible Then
				If Crosstab1.RowType = EWRPT_ROWTYPE_DETAIL Then ' Detail row
					thisval = Val(i)
				ElseIf Crosstab1.RowTotalType = EWRPT_ROWTOTAL_GROUP Then ' Group total
					thisval = Smry(Crosstab1.RowGroupLevel,i)
				ElseIf Crosstab1.RowTotalType = EWRPT_ROWTOTAL_PAGE Then ' Page total
					thisval = Smry(0,i)
				ElseIf Crosstab1.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total
					If Not rsagg.Eof Then
						thisval = ewrpt_GetValue(rsagg(i+0-1))
					Else
						thisval = 0
					End If
				End If
				arwrk(i-1) = thisval
			End If
		Next
		If Crosstab1.RowTotalType = EWRPT_ROWTOTAL_GRAND Then ' Grand total
			rsagg.Close
			Set rsagg = Nothing
		End If
		Crosstab1.SummaryCurrentValue = arwrk

		' Call Row_Rendering event
		Call Crosstab1.Row_Rendering()
		arwrk = Crosstab1.SummaryCurrentValue

		' --------------------
		'  Render view codes
		' ---------------------

		If Crosstab1.RowType = EWRPT_ROWTYPE_TOTAL Then ' Summary row

			' NOMBRE_C
			Crosstab1.NOMBRE_C.GroupViewValue = Crosstab1.NOMBRE_C.GroupOldValue
			Call ewrpt_SetAttr(Crosstab1.NOMBRE_C.CellAttrs, "class", ewrpt_IIf(Crosstab1.RowGroupLevel = 1, "ewRptGrpSummary1", "ewRptGrpField1"))

			' JORNADA
			Crosstab1.JORNADA.GroupViewValue = Crosstab1.JORNADA.GroupOldValue
			Call ewrpt_SetAttr(Crosstab1.JORNADA.CellAttrs, "class", ewrpt_IIf(Crosstab1.RowGroupLevel = 2, "ewRptGrpSummary2", "ewRptGrpField2"))

			' Set up summary values
			For i = 0 to UBound(Crosstab1.SummaryCurrentValue)
				arwrk2(i) = arwrk(i)
				Call ewrpt_SetAttr(Crosstab1.SummaryViewAttrs(i), "style", "")
				Call ewrpt_SetAttr(Crosstab1.SummaryCellAttrs(i), "style", "")
				Call ewrpt_SetAttr(Crosstab1.SummaryCellAttrs(i), "class", ewrpt_IIf(Crosstab1.RowTotalType = EWRPT_ROWTOTAL_GROUP, "ewRptGrpSummary" & Crosstab1.RowGroupLevel, ""))
			Next
		Else

			' NOMBRE_C
			Crosstab1.NOMBRE_C.GroupViewValue = Crosstab1.NOMBRE_C.GroupValue
			Call ewrpt_SetAttr(Crosstab1.NOMBRE_C.CellAttrs, "class", "ewRptGrpField1")
			If Crosstab1.NOMBRE_C.GroupValue = Crosstab1.NOMBRE_C.GroupOldValue And Not ChkLvlBreak(1) Then
				Crosstab1.NOMBRE_C.GroupViewValue = "&nbsp;"
			End If

			' JORNADA
			Crosstab1.JORNADA.GroupViewValue = Crosstab1.JORNADA.GroupValue
			Call ewrpt_SetAttr(Crosstab1.JORNADA.CellAttrs, "class", "ewRptGrpField2")
			If Crosstab1.JORNADA.GroupValue = Crosstab1.JORNADA.GroupOldValue And Not ChkLvlBreak(2) Then
				Crosstab1.JORNADA.GroupViewValue = "&nbsp;"
			End If

			' Set up summary values
			For i = 0 to UBound(Crosstab1.SummaryCurrentValue)
				arwrk2(i) = arwrk(i)
				Call ewrpt_SetAttr(Crosstab1.SummaryViewAttrs(i), "style", "")
				Call ewrpt_SetAttr(Crosstab1.SummaryCellAttrs(i), "style", "")
				Call ewrpt_SetAttr(Crosstab1.SummaryCellAttrs(i), "class", ewrpt_IIf(RecCount Mod 2 <> 1, "ewTableAltRow", "ewTableRow"))
			Next
		End If

		' NOMBRE_C
		Crosstab1.NOMBRE_C.HrefValue = ""

		' JORNADA
		Crosstab1.JORNADA.HrefValue = ""
		Crosstab1.SummaryViewValue = arwrk2

		' Call Row_Rendered event
		Call Crosstab1.Row_Rendered()
	End Function

	' Get extended filter values
	Sub GetExtendedFilterValues()
		Dim sSelectFld, sSelect, sWhere, sOrderBy
		Dim wrkSql, wrkRs

		' Field AñoMat
		sSelect = "SELECT DISTINCT [AñoMat] FROM " & Crosstab1.SqlFrom
		sWhere = Crosstab1.SqlWhere
		sOrderBy = "[AñoMat] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Crosstab1.AF1oMat.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field PERIODO_MAT
		sSelect = "SELECT DISTINCT [PERIODO_MAT] FROM " & Crosstab1.SqlFrom
		sWhere = Crosstab1.SqlWhere
		sOrderBy = "[PERIODO_MAT] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Crosstab1.PERIODO_MAT.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field TIPOCARR
		sSelect = "SELECT DISTINCT [TIPOCARR] FROM " & Crosstab1.SqlFrom
		sWhere = Crosstab1.SqlWhere
		sOrderBy = "[TIPOCARR] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Crosstab1.TIPOCARR.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field AñoIng
		sSelect = "SELECT DISTINCT [AñoIng] FROM " & Crosstab1.SqlFrom
		sWhere = Crosstab1.SqlWhere
		sOrderBy = "[AñoIng] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Crosstab1.AF1oIng.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field MATRICULADO
		sSelect = "SELECT DISTINCT [MATRICULADO] FROM " & Crosstab1.SqlFrom
		sWhere = Crosstab1.SqlWhere
		sOrderBy = "[MATRICULADO] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Crosstab1.MATRICULADO.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field EstadoAcad
		sSelect = "SELECT DISTINCT [EstadoAcad] FROM " & Crosstab1.SqlFrom
		sWhere = Crosstab1.SqlWhere
		sOrderBy = "[EstadoAcad] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Crosstab1.EstadoAcad.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field CIUDADACT
		sSelect = "SELECT DISTINCT [CIUDADACT] FROM " & Crosstab1.SqlFrom
		sWhere = Crosstab1.SqlWhere
		sOrderBy = "[CIUDADACT] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Crosstab1.CIUDADACT.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field COMUNA
		sSelect = "SELECT DISTINCT [COMUNA] FROM " & Crosstab1.SqlFrom
		sWhere = Crosstab1.SqlWhere
		sOrderBy = "[COMUNA] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Crosstab1.COMUNA.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field NACIONALIDAD
		sSelect = "SELECT DISTINCT [NACIONALIDAD] FROM " & Crosstab1.SqlFrom
		sWhere = Crosstab1.SqlWhere
		sOrderBy = "[NACIONALIDAD] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Crosstab1.NACIONALIDAD.DropDownList = ewrpt_GetDistinctValues("", wrkSql)

		' Field ANOEEM
		sSelect = "SELECT DISTINCT [ANOEEM] FROM " & Crosstab1.SqlFrom
		sWhere = Crosstab1.SqlWhere
		sOrderBy = "[ANOEEM] ASC"
		wrkSql = ewrpt_BuildReportSql(sSelect, sWhere, "", "", sOrderBy, UserIDFilter, "")
		Call ewrpt_SetDebugMsg("(Extended filter SQL): " & sSql)
		Crosstab1.ANOEEM.DropDownList = ewrpt_GetDistinctValues("", wrkSql)
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
			' Field AñoMat

			Call SetSessionDropDownValue(Crosstab1.AF1oMat.DropDownValue, "AF1oMat")

			' Field PERIODO_MAT
			Call SetSessionDropDownValue(Crosstab1.PERIODO_MAT.DropDownValue, "PERIODO_MAT")

			' Field TIPOCARR
			Call SetSessionDropDownValue(Crosstab1.TIPOCARR.DropDownValue, "TIPOCARR")

			' Field fecmat
			Call SetSessionFilterValues(Crosstab1.fecmat.SearchValue, Crosstab1.fecmat.SearchOperator, Crosstab1.fecmat.SearchCondition, Crosstab1.fecmat.SearchValue2, Crosstab1.fecmat.SearchOperator2, "fecmat")

			' Field AñoIng
			Call SetSessionDropDownValue(Crosstab1.AF1oIng.DropDownValue, "AF1oIng")

			' Field MATRICULADO
			Call SetSessionDropDownValue(Crosstab1.MATRICULADO.DropDownValue, "MATRICULADO")

			' Field EstadoAcad
			Call SetSessionDropDownValue(Crosstab1.EstadoAcad.DropDownValue, "EstadoAcad")

			' Field CIUDADACT
			Call SetSessionDropDownValue(Crosstab1.CIUDADACT.DropDownValue, "CIUDADACT")

			' Field COMUNA
			Call SetSessionDropDownValue(Crosstab1.COMUNA.DropDownValue, "COMUNA")

			' Field NACIONALIDAD
			Call SetSessionDropDownValue(Crosstab1.NACIONALIDAD.DropDownValue, "NACIONALIDAD")

			' Field FECNAC
			Call SetSessionFilterValues(Crosstab1.FECNAC.SearchValue, Crosstab1.FECNAC.SearchOperator, Crosstab1.FECNAC.SearchCondition, Crosstab1.FECNAC.SearchValue2, Crosstab1.FECNAC.SearchOperator2, "FECNAC")

			' Field PUNTAJE
			Call SetSessionFilterValues(Crosstab1.PUNTAJE.SearchValue, Crosstab1.PUNTAJE.SearchOperator, Crosstab1.PUNTAJE.SearchCondition, Crosstab1.PUNTAJE.SearchValue2, Crosstab1.PUNTAJE.SearchOperator2, "PUNTAJE")

			' Field ANOEEM
			Call SetSessionDropDownValue(Crosstab1.ANOEEM.DropDownValue, "ANOEEM")

			' Field NOTAEM
			Call SetSessionFilterValues(Crosstab1.NOTAEM.SearchValue, Crosstab1.NOTAEM.SearchOperator, Crosstab1.NOTAEM.SearchCondition, Crosstab1.NOTAEM.SearchValue2, Crosstab1.NOTAEM.SearchOperator2, "NOTAEM")
			bSetupFilter = True ' Set up filter required
		Else

			' Field AñoMat
			If GetDropDownValue(Crosstab1.AF1oMat) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Crosstab1.AF1oMat.DropDownValue) Then
				If Crosstab1.AF1oMat.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Crosstab1_AF1oMat")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field PERIODO_MAT
			If GetDropDownValue(Crosstab1.PERIODO_MAT) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Crosstab1.PERIODO_MAT.DropDownValue) Then
				If Crosstab1.PERIODO_MAT.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Crosstab1_PERIODO_MAT")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field TIPOCARR
			If GetDropDownValue(Crosstab1.TIPOCARR) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Crosstab1.TIPOCARR.DropDownValue) Then
				If Crosstab1.TIPOCARR.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Crosstab1_TIPOCARR")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field fecmat
			If GetFilterValues(Crosstab1.fecmat) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field AñoIng
			If GetDropDownValue(Crosstab1.AF1oIng) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Crosstab1.AF1oIng.DropDownValue) Then
				If Crosstab1.AF1oIng.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Crosstab1_AF1oIng")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field MATRICULADO
			If GetDropDownValue(Crosstab1.MATRICULADO) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Crosstab1.MATRICULADO.DropDownValue) Then
				If Crosstab1.MATRICULADO.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Crosstab1_MATRICULADO")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field EstadoAcad
			If GetDropDownValue(Crosstab1.EstadoAcad) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Crosstab1.EstadoAcad.DropDownValue) Then
				If Crosstab1.EstadoAcad.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Crosstab1_EstadoAcad")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field CIUDADACT
			If GetDropDownValue(Crosstab1.CIUDADACT) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Crosstab1.CIUDADACT.DropDownValue) Then
				If Crosstab1.CIUDADACT.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Crosstab1_CIUDADACT")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field COMUNA
			If GetDropDownValue(Crosstab1.COMUNA) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Crosstab1.COMUNA.DropDownValue) Then
				If Crosstab1.COMUNA.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Crosstab1_COMUNA")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field NACIONALIDAD
			If GetDropDownValue(Crosstab1.NACIONALIDAD) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Crosstab1.NACIONALIDAD.DropDownValue) Then
				If Crosstab1.NACIONALIDAD.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Crosstab1_NACIONALIDAD")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field FECNAC
			If GetFilterValues(Crosstab1.FECNAC) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field PUNTAJE
			If GetFilterValues(Crosstab1.PUNTAJE) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			End If

			' Field ANOEEM
			If GetDropDownValue(Crosstab1.ANOEEM) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
			ElseIf Not IsArray(Crosstab1.ANOEEM.DropDownValue) Then
				If Crosstab1.ANOEEM.DropDownValue <> EWRPT_INIT_VALUE And IsEmpty(Session("sv_Crosstab1_ANOEEM")) Then
					bSetupFilter = True ' Set up filter required
				End If
			End If

			' Field NOTAEM
			If GetFilterValues(Crosstab1.NOTAEM) Then
				bSetupFilter = True ' Set up filter required
				bRestoreSession = False ' Do not restore from session
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

			' Field AñoMat
			Call GetSessionDropDownValue(Crosstab1.AF1oMat)

			' Field PERIODO_MAT
			Call GetSessionDropDownValue(Crosstab1.PERIODO_MAT)

			' Field TIPOCARR
			Call GetSessionDropDownValue(Crosstab1.TIPOCARR)

			' Field fecmat
			Call GetSessionFilterValues(Crosstab1.fecmat)

			' Field AñoIng
			Call GetSessionDropDownValue(Crosstab1.AF1oIng)

			' Field MATRICULADO
			Call GetSessionDropDownValue(Crosstab1.MATRICULADO)

			' Field EstadoAcad
			Call GetSessionDropDownValue(Crosstab1.EstadoAcad)

			' Field CIUDADACT
			Call GetSessionDropDownValue(Crosstab1.CIUDADACT)

			' Field COMUNA
			Call GetSessionDropDownValue(Crosstab1.COMUNA)

			' Field NACIONALIDAD
			Call GetSessionDropDownValue(Crosstab1.NACIONALIDAD)

			' Field FECNAC
			Call GetSessionFilterValues(Crosstab1.FECNAC)

			' Field PUNTAJE
			Call GetSessionFilterValues(Crosstab1.PUNTAJE)

			' Field ANOEEM
			Call GetSessionDropDownValue(Crosstab1.ANOEEM)

			' Field NOTAEM
			Call GetSessionFilterValues(Crosstab1.NOTAEM)
		End If

		' Call page filter validated event
		Call Crosstab1.Page_FilterValidated()

		' Build sql
		' Field AñoMat

		Call BuildDropDownFilter(Crosstab1.AF1oMat, sFilter, "")

		' Field PERIODO_MAT
		Call BuildDropDownFilter(Crosstab1.PERIODO_MAT, sFilter, "")

		' Field TIPOCARR
		Call BuildDropDownFilter(Crosstab1.TIPOCARR, sFilter, "")

		' Field fecmat
		Call BuildExtendedFilter(Crosstab1.fecmat, sFilter)

		' Field AñoIng
		Call BuildDropDownFilter(Crosstab1.AF1oIng, sFilter, "")

		' Field MATRICULADO
		Call BuildDropDownFilter(Crosstab1.MATRICULADO, sFilter, "")

		' Field EstadoAcad
		Call BuildDropDownFilter(Crosstab1.EstadoAcad, sFilter, "")

		' Field CIUDADACT
		Call BuildDropDownFilter(Crosstab1.CIUDADACT, sFilter, "")

		' Field COMUNA
		Call BuildDropDownFilter(Crosstab1.COMUNA, sFilter, "")

		' Field NACIONALIDAD
		Call BuildDropDownFilter(Crosstab1.NACIONALIDAD, sFilter, "")

		' Field FECNAC
		Call BuildExtendedFilter(Crosstab1.FECNAC, sFilter)

		' Field PUNTAJE
		Call BuildExtendedFilter(Crosstab1.PUNTAJE, sFilter)

		' Field ANOEEM
		Call BuildDropDownFilter(Crosstab1.ANOEEM, sFilter, "")

		' Field NOTAEM
		Call BuildExtendedFilter(Crosstab1.NOTAEM, sFilter)

		' Save parms to Session
		' Field AñoMat

		Call SetSessionDropDownValue(Crosstab1.AF1oMat.DropDownValue, "AF1oMat")

		' Field PERIODO_MAT
		Call SetSessionDropDownValue(Crosstab1.PERIODO_MAT.DropDownValue, "PERIODO_MAT")

		' Field TIPOCARR
		Call SetSessionDropDownValue(Crosstab1.TIPOCARR.DropDownValue, "TIPOCARR")

		' Field fecmat
		Call SetSessionFilterValues(Crosstab1.fecmat.SearchValue, Crosstab1.fecmat.SearchOperator, Crosstab1.fecmat.SearchCondition, Crosstab1.fecmat.SearchValue2, Crosstab1.fecmat.SearchOperator2, "fecmat")

		' Field AñoIng
		Call SetSessionDropDownValue(Crosstab1.AF1oIng.DropDownValue, "AF1oIng")

		' Field MATRICULADO
		Call SetSessionDropDownValue(Crosstab1.MATRICULADO.DropDownValue, "MATRICULADO")

		' Field EstadoAcad
		Call SetSessionDropDownValue(Crosstab1.EstadoAcad.DropDownValue, "EstadoAcad")

		' Field CIUDADACT
		Call SetSessionDropDownValue(Crosstab1.CIUDADACT.DropDownValue, "CIUDADACT")

		' Field COMUNA
		Call SetSessionDropDownValue(Crosstab1.COMUNA.DropDownValue, "COMUNA")

		' Field NACIONALIDAD
		Call SetSessionDropDownValue(Crosstab1.NACIONALIDAD.DropDownValue, "NACIONALIDAD")

		' Field FECNAC
		Call SetSessionFilterValues(Crosstab1.FECNAC.SearchValue, Crosstab1.FECNAC.SearchOperator, Crosstab1.FECNAC.SearchCondition, Crosstab1.FECNAC.SearchValue2, Crosstab1.FECNAC.SearchOperator2, "FECNAC")

		' Field PUNTAJE
		Call SetSessionFilterValues(Crosstab1.PUNTAJE.SearchValue, Crosstab1.PUNTAJE.SearchOperator, Crosstab1.PUNTAJE.SearchCondition, Crosstab1.PUNTAJE.SearchValue2, Crosstab1.PUNTAJE.SearchOperator2, "PUNTAJE")

		' Field ANOEEM
		Call SetSessionDropDownValue(Crosstab1.ANOEEM.DropDownValue, "ANOEEM")

		' Field NOTAEM
		Call SetSessionFilterValues(Crosstab1.NOTAEM.SearchValue, Crosstab1.NOTAEM.SearchOperator, Crosstab1.NOTAEM.SearchCondition, Crosstab1.NOTAEM.SearchValue2, Crosstab1.NOTAEM.SearchOperator2, "NOTAEM")

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
		If Not IsEmpty(Session("sv_Crosstab1_" & parm)) Then fld.DropDownValue = Session("sv_Crosstab1_" & parm)
	End Sub

	' Get filter values from Session
	Sub GetSessionFilterValues(fld)
		Dim parm
		parm = Mid(fld.FldVar,3)
		If Not IsEmpty(Session("sv1_Crosstab1_" & parm)) Then fld.SearchValue = Session("sv1_Crosstab1_" & parm)
		If Not IsEmpty(Session("so1_Crosstab1_" & parm)) Then fld.SearchOperator = Session("so1_Crosstab1_" & parm)
		If Not IsEmpty(Session("sc_Crosstab1_" & parm)) Then fld.SearchCondition = Session("sc_Crosstab1_" & parm)
		If Not IsEmpty(Session("sv2_Crosstab1_" & parm)) Then fld.SearchValue2 = Session("sv2_Crosstab1_" & parm)
		If Not IsEmpty(Session("so2_Crosstab1_" & parm)) Then fld.SearchOperator2 = Session("so2_Crosstab1_" & parm)
	End Sub

	' Set dropdown value to Session
	Sub SetSessionDropDownValue(sv, parm)
		Session("sv_Crosstab1_" & parm) = sv
	End Sub

	' Set filter values to Session
	Sub SetSessionFilterValues(sv1, so1, sc, sv2, so2, parm)
		Session("sv1_Crosstab1_" & parm) = sv1
		Session("so1_Crosstab1_" & parm) = so1
		Session("sc_Crosstab1_" & parm) = sc
		Session("sv2_Crosstab1_" & parm) = sv2
		Session("so2_Crosstab1_" & parm) = so2
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
		If Not ewrpt_CheckDate(Crosstab1.fecmat.SearchValue) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & Crosstab1.fecmat.FldErrMsg
		End If
		If Not ewrpt_CheckDate(Crosstab1.fecmat.SearchValue2) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & Crosstab1.fecmat.FldErrMsg
		End If
		If Not ewrpt_CheckDate(Crosstab1.FECNAC.SearchValue) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & Crosstab1.FECNAC.FldErrMsg
		End If
		If Not ewrpt_CheckDate(Crosstab1.FECNAC.SearchValue2) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & Crosstab1.FECNAC.FldErrMsg
		End If
		If Not ewrpt_CheckNumber(Crosstab1.PUNTAJE.SearchValue) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & Crosstab1.PUNTAJE.FldErrMsg
		End If
		If Not ewrpt_CheckNumber(Crosstab1.PUNTAJE.SearchValue2) Then
			If gsFormError <> "" Then gsFormError = gsFormError & "<br />"
			gsFormError = gsFormError & Crosstab1.PUNTAJE.FldErrMsg
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
		Session("sel_Crosstab1_" & parm) = ""
		Session("rf_Crosstab1_" & parm) = ""
		Session("rt_Crosstab1_" & parm) = ""
	End Sub

	' Load selection from session
	Sub LoadSelectionFromSession(parm)
		Dim fld
		Set fld = Crosstab1.GetField(parm)
		fld.SelectionList = Session("sel_Crosstab1_" & parm)
		fld.RangeFrom = Session("rf_Crosstab1_" & parm)
		fld.RangeTo = Session("rt_Crosstab1_" & parm)
	End Sub

	' Load default value for filters
	Sub LoadDefaultFilters()
		Dim sWrk, sSql, arwrk

		' --------------------------------------------------
		'  Set up default values for dropdown filters
		'
		' Field AñoMat

		Crosstab1.AF1oMat.DefaultDropDownValue = EWRPT_INIT_VALUE
		Crosstab1.AF1oMat.DropDownValue = Crosstab1.AF1oMat.DefaultDropDownValue

		' Field PERIODO_MAT
		Crosstab1.PERIODO_MAT.DefaultDropDownValue = EWRPT_INIT_VALUE
		Crosstab1.PERIODO_MAT.DropDownValue = Crosstab1.PERIODO_MAT.DefaultDropDownValue

		' Field TIPOCARR
		Crosstab1.TIPOCARR.DefaultDropDownValue = EWRPT_INIT_VALUE
		Crosstab1.TIPOCARR.DropDownValue = Crosstab1.TIPOCARR.DefaultDropDownValue

		' Field AñoIng
		Crosstab1.AF1oIng.DefaultDropDownValue = EWRPT_INIT_VALUE
		Crosstab1.AF1oIng.DropDownValue = Crosstab1.AF1oIng.DefaultDropDownValue

		' Field MATRICULADO
		Crosstab1.MATRICULADO.DefaultDropDownValue = EWRPT_INIT_VALUE
		Crosstab1.MATRICULADO.DropDownValue = Crosstab1.MATRICULADO.DefaultDropDownValue

		' Field EstadoAcad
		Crosstab1.EstadoAcad.DefaultDropDownValue = EWRPT_INIT_VALUE
		Crosstab1.EstadoAcad.DropDownValue = Crosstab1.EstadoAcad.DefaultDropDownValue

		' Field CIUDADACT
		Crosstab1.CIUDADACT.DefaultDropDownValue = EWRPT_INIT_VALUE
		Crosstab1.CIUDADACT.DropDownValue = Crosstab1.CIUDADACT.DefaultDropDownValue

		' Field COMUNA
		Crosstab1.COMUNA.DefaultDropDownValue = EWRPT_INIT_VALUE
		Crosstab1.COMUNA.DropDownValue = Crosstab1.COMUNA.DefaultDropDownValue

		' Field NACIONALIDAD
		Crosstab1.NACIONALIDAD.DefaultDropDownValue = EWRPT_INIT_VALUE
		Crosstab1.NACIONALIDAD.DropDownValue = Crosstab1.NACIONALIDAD.DefaultDropDownValue

		' Field ANOEEM
		Crosstab1.ANOEEM.DefaultDropDownValue = EWRPT_INIT_VALUE
		Crosstab1.ANOEEM.DropDownValue = Crosstab1.ANOEEM.DefaultDropDownValue

		' --------------------------------------------------
		'  Set up default values for extended filters
		'
		' Field fecmat

		Call SetDefaultExtFilter(Crosstab1.fecmat, "BETWEEN", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(Crosstab1.fecmat)

		' Field FECNAC
		Call SetDefaultExtFilter(Crosstab1.FECNAC, "BETWEEN", Null, "AND", "=", Null)
		Call ApplyDefaultExtFilter(Crosstab1.FECNAC)

		' Field PUNTAJE
		Call SetDefaultExtFilter(Crosstab1.PUNTAJE, "<=", Null, "AND", ">=", Null)
		Call ApplyDefaultExtFilter(Crosstab1.PUNTAJE)

		' Field NOTAEM
		Call SetDefaultExtFilter(Crosstab1.NOTAEM, "<=", Null, "AND", ">=", Null)
		Call ApplyDefaultExtFilter(Crosstab1.NOTAEM)

		' --------------------------------------------------
		'  Set up default values for popup filters
		'  - NOTE: if extended filter is enabled, use default values in extended filter instead

	End Sub

	' Check if filter applied
	Function CheckFilter()

		' Check AñoMat non-Text filter
		If NonTextFilterApplied(Crosstab1.AF1oMat) Then
			CheckFilter = True
			Exit Function
		End If

		' Check PERIODO_MAT non-Text filter
		If NonTextFilterApplied(Crosstab1.PERIODO_MAT) Then
			CheckFilter = True
			Exit Function
		End If

		' Check TIPOCARR non-Text filter
		If NonTextFilterApplied(Crosstab1.TIPOCARR) Then
			CheckFilter = True
			Exit Function
		End If

		' Check fecmat Text filter
		If TextFilterApplied(Crosstab1.fecmat) Then
			CheckFilter = True
			Exit Function
		End If

		' Check AñoIng non-Text filter
		If NonTextFilterApplied(Crosstab1.AF1oIng) Then
			CheckFilter = True
			Exit Function
		End If

		' Check MATRICULADO non-Text filter
		If NonTextFilterApplied(Crosstab1.MATRICULADO) Then
			CheckFilter = True
			Exit Function
		End If

		' Check EstadoAcad non-Text filter
		If NonTextFilterApplied(Crosstab1.EstadoAcad) Then
			CheckFilter = True
			Exit Function
		End If

		' Check CIUDADACT non-Text filter
		If NonTextFilterApplied(Crosstab1.CIUDADACT) Then
			CheckFilter = True
			Exit Function
		End If

		' Check COMUNA non-Text filter
		If NonTextFilterApplied(Crosstab1.COMUNA) Then
			CheckFilter = True
			Exit Function
		End If

		' Check NACIONALIDAD non-Text filter
		If NonTextFilterApplied(Crosstab1.NACIONALIDAD) Then
			CheckFilter = True
			Exit Function
		End If

		' Check FECNAC Text filter
		If TextFilterApplied(Crosstab1.FECNAC) Then
			CheckFilter = True
			Exit Function
		End If

		' Check PUNTAJE Text filter
		If TextFilterApplied(Crosstab1.PUNTAJE) Then
			CheckFilter = True
			Exit Function
		End If

		' Check ANOEEM non-Text filter
		If NonTextFilterApplied(Crosstab1.ANOEEM) Then
			CheckFilter = True
			Exit Function
		End If

		' Check NOTAEM Text filter
		If TextFilterApplied(Crosstab1.NOTAEM) Then
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

		' Field AñoMat
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Crosstab1.AF1oMat, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.AF1oMat.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PERIODO_MAT
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Crosstab1.PERIODO_MAT, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.PERIODO_MAT.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field TIPOCARR
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Crosstab1.TIPOCARR, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.TIPOCARR.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field fecmat
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(Crosstab1.fecmat, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.fecmat.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field AñoIng
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Crosstab1.AF1oIng, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.AF1oIng.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field MATRICULADO
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Crosstab1.MATRICULADO, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.MATRICULADO.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field EstadoAcad
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Crosstab1.EstadoAcad, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.EstadoAcad.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field CIUDADACT
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Crosstab1.CIUDADACT, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.CIUDADACT.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field COMUNA
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Crosstab1.COMUNA, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.COMUNA.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NACIONALIDAD
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Crosstab1.NACIONALIDAD, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.NACIONALIDAD.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field FECNAC
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(Crosstab1.FECNAC, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.FECNAC.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field PUNTAJE
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(Crosstab1.PUNTAJE, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.PUNTAJE.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field ANOEEM
		sExtWrk = ""
		sWrk = ""
		Call BuildDropDownFilter(Crosstab1.ANOEEM, sExtWrk, "")
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.ANOEEM.FldCaption & "<br>"
		If sExtWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sExtWrk & "<br>"
		If sWrk <> "" Then sFilterList = sFilterList & "&nbsp;&nbsp;" & sWrk & "<br>"

		' Field NOTAEM
		sExtWrk = ""
		sWrk = ""
		Call BuildExtendedFilter(Crosstab1.NOTAEM, sExtWrk)
		If sExtWrk <> "" Or sWrk <> "" Then sFilterList = sFilterList & Crosstab1.NOTAEM.FldCaption & "<br>"
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
				Crosstab1.OrderBy = ""
				Crosstab1.StartGroup = 1
				Crosstab1.NOMBRE_C.Sort = ""
				Crosstab1.JORNADA.Sort = ""
			End If

		' Check for an Order parameter
		ElseIf Request.QueryString(EWRPT_TABLE_ORDER_BY).Count > 0 Then
			Crosstab1.CurrentOrder = Request.QueryString(EWRPT_TABLE_ORDER_BY)
			If Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE).Count > 0 Then
				Crosstab1.CurrentOrderType = Request.QueryString(EWRPT_TABLE_ORDER_BY_TYPE)
			Else
				Crosstab1.CurrentOrderType = ""
			End If
			sSortSql = Crosstab1.SortSql
			Crosstab1.OrderBy = sSortSql
			Crosstab1.StartGroup = 1
		End If
		GetSort = Crosstab1.OrderBy
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
