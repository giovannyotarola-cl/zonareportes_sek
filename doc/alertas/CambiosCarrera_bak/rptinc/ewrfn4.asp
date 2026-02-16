<%

' Functions for ASP Report Maker 4.0+
' (C)2006-2010 e.World Technology Ltd.
' ------------------------
'  Language class (begin)
'
Class crLanguage
	Dim LanguageId
	Dim objDOM

	' Class initialize
	Private Sub Class_Initialize

		' Set up file list
		Call LoadFileList()

		' Set up language id
		If Request.QueryString("language").Count > 0 Then
			LanguageId = CStr(Request.QueryString("language"))
			Session(EWRPT_SESSION_LANGUAGE_ID) = LanguageId
		ElseIf Session(EWRPT_SESSION_LANGUAGE_ID) <> "" Then
			LanguageId = Session(EWRPT_SESSION_LANGUAGE_ID)
		Else
			LanguageId = EWRPT_LANGUAGE_DEFAULT_ID
		End If
		gsLanguage = LanguageId
		Call Load(LanguageId)
	End Sub

	' Terminate
	Private Sub Class_Terminate()
		Set objDOM = Nothing
	End Sub

	' Load language file list
	Private Sub LoadFileList()
		Dim i
		If IsArray(EWRPT_LANGUAGE_FILE) Then
			For i = 0 to UBound(EWRPT_LANGUAGE_FILE)
				EWRPT_LANGUAGE_FILE(i)(1) = LoadFileDesc(Server.MapPath(EWRPT_LANGUAGE_FOLDER & EWRPT_LANGUAGE_FILE(i)(2)))
			Next
		End If
	End Sub

	' Load language file description
	Private Function LoadFileDesc(File)
		LoadFileDesc = ""
		Set objDOM = ewrpt_CreateXmlDom()
		objDOM.async = False
		objDOM.Load(File)
		If objDOM.ParseError.ErrorCode = 0 Then
			LoadFileDesc = GetNodeAtt(objDOM.documentElement, "desc")
		End If
	End Function

	' Load language file
	Private Sub Load(id)
		Dim i, sFileName, sName, sMenuId, sTblName, sFldName, sPhrase, sClient, PhraseList

		' Set up from file
		sFileName = GetFileName(id)
		If sFileName = "" Then
			sFileName = GetFileName(EWRPT_LANGUAGE_DEFAULT_ID)
		End If
		If sFileName = "" Then Exit Sub
		Set objDOM = ewrpt_CreateXmlDom()
		objDOM.async = False
		objDOM.Load(sFileName)
		If objDOM.ParseError.ErrorCode = 0 Then
			objDOM.setProperty "SelectionLanguage", "XPath"
		End If
	End Sub

	' Get language file name
	Private Function GetFileName(Id)
		Dim i
		If IsArray(EWRPT_LANGUAGE_FILE) Then
			For i = 0 to UBound(EWRPT_LANGUAGE_FILE)
				If EWRPT_LANGUAGE_FILE(i)(0) = Id Then
					GetFileName = Server.MapPath(EWRPT_LANGUAGE_FOLDER & EWRPT_LANGUAGE_FILE(i)(2))
					Exit Function
				End If
			Next
		End If
		GetFileName = ""
	End Function

	' Get node attribute
	Private Function GetNodeAtt(Node, Att)
		If Not Node Is Nothing Then
			GetNodeAtt = Node.getAttribute(Att)
		Else
			GetNodeAtt = ""
		End If
	End Function

	' Get phrase
	Public Function Phrase(Name)
		Phrase = GetNodeAtt(objDOM.selectSingleNode("//global/phrase[@id='" & LCase(Name) & "']"), "value")
	End Function

	' Get project phrase
	Public Function ProjectPhrase(Id)
		ProjectPhrase = GetNodeAtt(objDOM.selectSingleNode("//project/phrase[@id='" & LCase(Id) & "']"), "value")
	End Function

	' Get menu phrase
	Public Function MenuPhrase(MenuId, Id)
		MenuPhrase = GetNodeAtt(objDOM.selectSingleNode("//project/menu[@id='" & MenuId & "']/phrase[@id='" & LCase(Id) & "']"), "value")
	End Function

	' Get table phrase
	Public Function TablePhrase(TblVar, Id)
		TablePhrase = GetNodeAtt(objDOM.selectSingleNode("//project/table[@id='" & LCase(TblVar) & "']/phrase[@id='" & LCase(Id) & "']"), "value")
	End Function

	' Get chart phrase
	Public Function ChartPhrase(TblVar, ChtVar, Id)
		ChartPhrase = GetNodeAtt(objDOM.selectSingleNode("//project/table[@id='" & LCase(TblVar) & "']/chart[@id='" & LCase(ChtVar) & "']/phrase[@id='" & LCase(Id) & "']"), "value")
	End Function

	' Get field phrase
	Public Function FieldPhrase(TblVar, FldVar, Id)
		FieldPhrase = GetNodeAtt(objDOM.selectSingleNode("//project/table[@id='" & LCase(TblVar) & "']/field[@id='" & LCase(FldVar) & "']/phrase[@id='" & LCase(Id) & "']"), "value")
	End Function

	' Output xml as JSON
	Public Function XmlToJSON(XPath)
		Dim NodeList, i, Id, Value, Str
		Set NodeList = objDOM.selectNodes(XPath)
		Str = "{"
		For i = 0 to NodeList.Length - 1
			Id = GetNodeAtt(NodeList.Item(i), "id")
			Value = GetNodeAtt(NodeList.Item(i), "value")
			Str = Str & """" & ewrpt_JsEncode2(Id) & """:""" & ewrpt_JsEncode2(Value) & ""","
		Next
		If Right(Str, 1) = "," Then Str = Left(Str, Len(Str)-1)
		Str = Str & "}" & vbCrLf
		XmlToJSON = Str
	End Function

	' Output all phrases as JSON
	Public Function AllToJSON()
		AllToJSON = "var ewLanguage = new ewrpt_Language(" & XmlToJSON("//global/phrase") & ");"
	End Function

	' Output client phrases as JSON
	Public Function ToJSON()
		ToJSON = "var ewLanguage = new ewrpt_Language(" & XmlToJSON("//global/phrase[@client='1']") & ");"
	End Function
End Class

'
'  Language class (end)
' ----------------------
' -------------
'  Field class
'
Class crField
	Dim TblName ' Table name
	Dim TblVar ' Table var
	Dim FldName ' Field name
	Dim FldVar ' Field variable name
	Dim FldExpression ' Field expression (used in SQL)
	Dim FldDefaultErrMsg ' Default error message
	Dim FldType ' Field type
	Dim FldDataType ' Field data type
	Dim FldDateTimeFormat ' Date time format
	Dim Count ' Count
	Dim Summary ' Summary
	Dim OldValue ' Old Value
	Dim CurrentValue ' Current value
	Dim ViewValue ' View value
	Dim HrefValue ' Href value
	Dim ImageWidth ' Image width
	Dim ImageHeight ' Image height
	Dim ImageResize ' Image resize
	Dim Sortable ' Sortable
	Dim GroupingFieldId ' Grouping field id
	Dim UploadPath ' Upload path
	Dim CellAttrs ' Cell attributes
	Dim ViewAttrs ' View attributes
	Dim FldGroupByType ' Group By Type
	Dim FldGroupInt ' Group Interval
	Dim FldGroupSql ' Group SQL
	Dim GroupDbValues ' Group DB Values
	Dim GroupViewValue ' Group View Value
	Dim SqlSelect ' Field SELECT
	Dim SqlGroupBy ' Field GROUP BY
	Dim SqlOrderBy ' Field ORDER BY
	Dim ValueList ' Value List
	Dim SelectionList ' Selection List
	Dim DefaultSelectionList ' Default Selection List
	Dim CustomFilters ' Custom Filters
	Dim AdvancedFilters ' Advanced Filters
	Dim RangeFrom ' Range From
	Dim RangeTo ' Range To
	Dim DropDownList ' Dropdown List
	Dim DropDownValue ' Dropdown Value
	Dim DefaultDropDownValue ' Default Dropdown Value
	Dim DateFilter ' Date Filter
	Dim SearchValue ' Search Value 1
	Dim SearchValue2 ' Search Value 2
	Dim SearchOperator ' Search Operator 1
	Dim SearchOperator2 ' Search Operator 2
	Dim SearchCondition ' Search Condition
	Dim DefaultSearchValue ' Default Search Value 1
	Dim DefaultSearchValue2 ' Default Search Value 2
	Dim DefaultSearchOperator ' Default Search Operator 1
	Dim DefaultSearchOperator2 ' Default Search Operator 2
	Dim DefaultSearchCondition ' Default Search Condition

	Public Property Get FldCaption() ' Field caption
		FldCaption = ReportLanguage.FieldPhrase(TblVar, Mid(FldVar,3), "FldCaption")
	End Property

	Public Property Get FldTitle() ' Field title
		FldTitle = ReportLanguage.FieldPhrase(TblVar, Mid(FldVar,3), "FldTitle")
	End Property

	Public Property Get FldAlt() ' Field alt
		FldAlt = ReportLanguage.FieldPhrase(TblVar, Mid(FldVar,3), "FldAlt")
	End Property

	Public Property Get FldErrMsg() ' Field err msg
		FldErrMsg = ReportLanguage.FieldPhrase(TblVar, Mid(FldVar,3), "FldErrMsg")
		If FldErrMsg = "" Then FldErrMsg = FldDefaultErrMsg & " - " & FldCaption
	End Property

	' Reset CSS styles for field object
	Public Sub ResetCSS()
		Call ewrpt_SetAttr(CellAttrs, "style", "")
		Call ewrpt_SetAttr(CellAttrs, "class", "")
		Call ewrpt_SetAttr(ViewAttrs, "style", "")
		Call ewrpt_SetAttr(ViewAttrs, "class", "")
	End Sub

	' View Attributes
	Public Property Get ViewAttributes()
		Dim sAtt, Attr
		sAtt = ""
		If CLng(ImageWidth) > 0 And (Not ImageResize Or (ImageResize And CLng(ImageHeight) <= 0)) Then
			sAtt = sAtt & " width=""" & CInt(ImageWidth) & """"
		End If
		If CLng(ImageHeight) > 0 And (Not ImageResize Or (ImageResize And CLng(ImageWidth) <= 0)) Then
			sAtt = sAtt & " height=""" & CInt(ImageHeight) & """"
		End If
		For Each Attr In ViewAttrs
			If ViewAttrs.Item(Attr) <> "" Then
				sAtt = sAtt & " " & Attr & "=""" & ViewAttrs.Item(Attr) & """"
			End If
		Next
		ViewAttributes = sAtt
	End Property

	' Cell Attributes
	Public Property Get CellAttributes()
		Dim sAtt, Attr
		sAtt = ""
		For Each Attr In CellAttrs
			If CellAttrs.Item(Attr) <> "" Then
				sAtt = sAtt & " " & Attr & "=""" & CellAttrs.Item(Attr) & """"
			End If
		Next
		CellAttributes = sAtt
	End Property

	' Sort Attributes
	Public Property Get Sort()
		Sort = Session(EWRPT_PROJECT_VAR & "_" & TblVar & "_" & EWRPT_TABLE_SORT & "_" & FldVar)
	End Property

	Public Property Let Sort(v)
		If Session(EWRPT_PROJECT_VAR & "_" & TblVar & "_" & EWRPT_TABLE_SORT & "_" & FldVar) <> v Then
			Session(EWRPT_PROJECT_VAR & "_" & TblVar & "_" & EWRPT_TABLE_SORT & "_" & FldVar) = v
		End If
	End Property

	Public Function ReverseSort()
		If Sort = "ASC" Then
			ReverseSort = "DESC"
		Else
			ReverseSort = "ASC"
		End If
	End Function

	' List View value
	Public Property Get ListViewValue()
		If Trim(ViewValue & "") = "" Then
			ListViewValue = "&nbsp;"
		Else
			Dim regEx, Result
			Set regEx = New RegExp
			regEx.IgnoreCase = True
			regEx.Global = True

'			regEx.Pattern = "<[^>]+>" ' Remove all HTML Tags
'			regEx.Pattern = "</?(b|p|span)[^>]*[^>]*?>" ' Remove empty <b>/<p>/<span> tags

			regEx.Pattern = "<[^img][^>]*>" ' Remove all except non-empty image tag
			Result = regEx.Replace(ViewValue & "", "")
			Set regEx = Nothing
			If Trim(Result) = "" Then
				ListViewValue = "&nbsp;"
			Else
				ListViewValue = ViewValue
			End If
		End If
	End Property

	' Form value
	Private m_FormValue

	Public Property Get FormValue()
		FormValue = m_FormValue
	End Property

	Public Property Let FormValue(v)
		m_FormValue = v
		CurrentValue = m_FormValue
	End Property

	' QueryString value
	Private m_QueryStringValue

	Public Property Get QueryStringValue()
		QueryStringValue = m_QueryStringValue
	End Property

	Public Property Let QueryStringValue(v)
		m_QueryStringValue = v
		CurrentValue = m_QueryStringValue
	End Property

	' Database Value
	Dim m_DbValue

	Public Property Get DbValue()
		DbValue = m_DbValue
	End Property

	Public Property Let DbValue(v)
		OldValue = m_DbValue
		m_DbValue = v
		CurrentValue = m_DbValue
	End Property

	' Group value
	Public Property Get GroupValue()
		GroupValue = getGroupValue(CurrentValue)
	End Property

	' Group old value
	Public Property Get GroupOldValue()
		GroupOldValue = getGroupValue(OldValue)
	End Property

	' Get group value
	Private Function getGroupValue(v)
		If GroupingFieldId = 1 Then
			getGroupValue = v
		ElseIf IsArray(GroupDbValues) Then
			getGroupValue = GroupDbValues(v)
		ElseIf GroupingFieldId > 0 And FldGroupByType <> "" And FldGroupByType <> "n" Then
			getGroupValue = ewrpt_GroupValue(Me, v)
		Else
			getGroupValue = v
		End If
	End Function

	' Show object as string
	Public Function AsString()

'###v4 to be updated
		AsString = "{" & _
			"FldName: " & FldName & ", " & _
			"FldVar: " & FldVar & ", " & _
			"FldExpression: " & FldExpression & ", " & _
			"FldType: " & FldType & ", " & _
			"FldDateTimeFormat: " & FldDateTimeFormat & ", " & _
			"ImageWidth: " & ImageWidth & ", " & _
			"ImageHeight: " & ImageHeight & ", " & _
			"Sort: " & Sort & ", " & _
			"CurrentValue: " & CurrentValue & ", " & _
			"ViewValue: " & ViewValue & ", " & _
			"HrefValue: " & HrefValue & ", " & _
			"FormValue: " & m_FormValue & ", " & _
			"QueryStringValue: " & m_QueryStringValue & ", " & _
			"DbValue: " & m_DbValue & ", " & _
			"Count: " & Count & ", " & _
			"Summary: " & Summary & _
			"}"
	End Function

	' Value to string
	Private Function ValueToString(value)
		If IsArray(value) Then
			ValueToString = "[Array]"
		Else
			ValueToString = value
		End If
	End Function

	' Class Initialize
	Private Sub Class_Initialize()
		ImageWidth = 0
		ImageHeight = 0
		ImageResize = False
		Sortable = True
		GroupingFieldId = 0
		UploadPath = EWRPT_UPLOAD_DEST_PATH ' Upload path
		Set CellAttrs = Server.CreateObject("Scripting.Dictionary") ' Cell attributes
		Set ViewAttrs = Server.CreateObject("Scripting.Dictionary") ' View attributes
	End Sub

	' Class terminate
	Private Sub Class_Terminate
		Set CellAttrs = Nothing
		Set ViewAttrs = Nothing
	End Sub
End Class

'
'  Field class (end)
' -------------------
' -------------
'  Chart class
'
Class crChart
	Dim TblName ' Table name
	Dim TblVar ' Table variable name
	Dim ChartName ' Chart name
	Dim ChartVar ' Chart variable name
	Dim ChartXFldName ' Chart X Field name
	Dim ChartYFldName ' Chart Y Field name
	Dim ChartSFldName ' Chart Series Field name
	Dim ChartType ' Chart Type
	Dim ChartSummaryType ' Chart Type
	Dim ChartWidth ' Chart Width
	Dim ChartHeight ' Chart Height
	Dim ChartAlign ' Chart Align
	Dim SqlSelect
	Dim SqlGroupBy
	Dim SqlOrderBy
	Dim XAxisDateFormat
	Dim NameDateFormat
	Dim SeriesDateType
	Dim SqlSelectSeries
	Dim SqlGroupBySeries
	Dim SqlOrderBySeries
	Dim ID
	Dim Parms
	Dim Trends
	Dim Data
	Dim Series

	' Chart caption
	Public Property Get ChartCaption()
		ChartCaption = ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartCaption")
	End Property

	' X Axis name
	Public Property Get ChartXAxisName()
		ChartXAxisName = ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartXAxisName")
	End Property

	' Y Axis name
	Public Property Get ChartYAxisName()
		ChartYAxisName = ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartYAxisName")
	End Property

	' Primary Y Axis name (Combination Chart)
	Public Property Get ChartPYAxisName()
		ChartPYAxisName = ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartPYAxisName")
	End Property

	' Secondary Y Axis name (Combination Chart)
	Public Property Get ChartSYAxisName()
		ChartSYAxisName = ReportLanguage.ChartPhrase(TblVar, ChartVar, "ChartSYAxisName")
	End Property

	' Set chart parameters
	Public Sub SetChartParam(Name, Value, Output)
		Dim parm, nParms
		parm = LoadParm(Name)
		If IsNull(parm) Then
			If IsArray(Parms) Then
				nParms = UBound(Parms,2)
				nParms = nParms + 1
				Redim Preserve Parms(2,nParms)
			Else
				nParms = 0
				Redim Parms(2,0)
			End If
			Parms(0,nParms) = Name
			Parms(1,nParms) = Value
			Parms(2,nParms) = Output
		Else
			Call SaveParm(Name, Value)
		End If
	End Sub

	' Set up default chart parm
	Private Sub SetupDefaultChartParm(key, value)
		Dim parm, nParms
		If IsArray(Parms) Then
			parm = LoadParm(key)
			If IsNull(parm) Then
				If IsArray(Parms) Then
					nParms = UBound(Parms,2)
					nParms = nParms + 1
					Redim Preserve Parms(2,nParms)
				Else
					nParms = 0
					Redim Parms(2,0)
				End If
				Parms(0,nParms) = key
				Parms(1,nParms) = value
				Parms(2,nParms) = True
			ElseIf parm = "" Then
				Call SaveParm(key, value)
			End If
		End If
	End Sub

	' Load chart parm
	Private Function LoadParm(key)
		Dim i
		If IsArray(Parms) Then
			For i = 0 to UBound(Parms,2)
				If LCase(Parms(0,i)) = LCase(key) Then
					LoadParm = Parms(1,i)
					Exit Function
				End If
			Next
		End If
		LoadParm = Null
	End Function

	' Save chart parm
	Sub SaveParm(key, value)
		Dim i
		If IsArray(Parms) Then
			For i = 0 to UBound(Parms,2)
				If LCase(Parms(0,i)) = LCase(key) Then
					Parms(1,i) = value
					Exit Sub
				End If
			Next
		End If
	End Sub

	' Chart Xml
	Public Function ChartXml()

		' Initialize default values
		Call SetupDefaultChartParm("caption", "Chart")

		' Show names/values/hover
		Call SetupDefaultChartParm("shownames", "1") ' Default show names
		Call SetupDefaultChartParm("showvalues", "1") ' Default show values
		Call SetupDefaultChartParm("showhover", "1") ' Default show hover

		' Get showvalues/showhovercap
		Dim cht_showValues, cht_showHoverCap
		cht_showValues = LoadParm("showvalues")
		cht_showHoverCap = LoadParm("showhovercap")

		' Format percent for Pie charts
		Dim cht_showPercentageValues, cht_showPercentageInLabel, cht_type
		cht_showPercentageValues = LoadParm("showPercentageValues")
		cht_showPercentageInLabel = LoadParm("showPercentageInLabel")
		cht_type = LoadParm("type")
		If cht_type = 2 Or cht_type = 6 Or cht_type = 8 Then
			If (cht_showHoverCap = "1" And cht_showPercentageValues = "1") Or _
			(cht_showValues = "1" And cht_showPercentageInLabel = "1") Then
				Call SetupDefaultChartParm("formatNumber", "1")
				Call SaveParm("formatNumber", "1")
			End If
		ElseIf cht_type = 20 Then
			Call SetupDefaultChartParm("bearBorderColor", "E33C3C")
			Call SetupDefaultChartParm("bearFillColor", "E33C3C")
		End If
		Dim chartseries, chartdata, cht_series, cht_series_type, cht_alpha
		Dim wrk, catwrk, cntcat, cntdata, cntseries, i, j, k, xindex
		Dim color, val, name
		Dim bShowSeries, serieswrk, seriesname
		chartseries = Series
		chartdata = Data

		' cht_series = 1 (Multi series charts)
		If CLng(cht_type) >= 9 And CLng(cht_type) <= 19 Then
			cht_series = 1
		Else
			cht_series = 0
		End If
		cht_series_type = LoadParm("seriestype")
		cht_alpha = LoadParm("alpha")
		wrk = ""
		If IsArray(chartdata) Then
			wrk = wrk & ChartHeader(1) ' Get chart header

			' Candlestick
			If cht_type = 20 Then

				' Write candlestick cat
				If UBound(chartdata,1) >= 6 Then
					catwrk = ""
					cntcat = UBound(chartdata,2)+1
					For i = 0 to cntcat-1
						xindex = i+1
						name = chartdata(6,i)
						If name <> "" Then
							catwrk = catwrk & ChartCandlestickCatContent(xindex, name)
						End If
					Next
					If catwrk <> "" Then wrk = wrk & ChartCatHeader(1) & catwrk & ChartCatHeader(2)
				End If

				' Write candlestick data
				Dim open, high, low, close
				wrk = wrk & ChartCandlestickContentHeader(1)
				cntdata = UBound(chartdata,2)+1
				For i = 0 to cntdata-1
					If IsNull(chartdata(2,i)) Then
						open = 0
					Else
						open = CDbl(chartdata(2,i))
					End If
					If IsNull(chartdata(3,i)) Then
						high = 0
					Else
						high = CDbl(chartdata(3,i))
					End If
					If IsNull(chartdata(4,i)) Then
						low = 0
					Else
						low = CDbl(chartdata(4,i))
					End If
					If IsNull(chartdata(5,i)) Then
						close = 0
					Else
						close = CDbl(chartdata(5,i))
					End If
					xindex = i+1
					wrk = wrk & ChartCandlestickContent(open, high, low, close, xindex)
				Next
				wrk = wrk & ChartCandlestickContentHeader(2)

			' Multi series
			ElseIf cht_series = 1 Then

				' Multi-Y values
				If cht_series_type = "1" Then

					' Write cat
					wrk = wrk & ChartCatHeader(1)
					cntcat = UBound(chartdata,2)+1
					For i = 0 to cntcat-1
						name = chartdata(0,i)
						wrk = wrk & ChartCatContent(name)
					Next
					wrk = wrk & ChartCatHeader(2)

					' Write series
					cntdata = UBound(chartdata,2)+1
					cntseries = UBound(chartseries)+1
					If cntseries > UBound(chartdata,1)-1 Then cntseries = UBound(chartdata,1)-1
					For i = 0 to cntseries-1
						color = GetPaletteColor(i)
						bShowSeries = EWRPT_CHART_SHOW_BLANK_SERIES
						serieswrk = ChartSeriesHeader(1, chartseries(i), color, cht_alpha)
						For j = 0 to cntdata-1
							val = chartdata(i+2,j)
							If IsNull(val) Then
								val = 0
							Else
								val = CDbl(val)
							End If
							If val <> 0 Then bShowSeries = True
							serieswrk = serieswrk & ChartSeriesContent(val)
						Next
						serieswrk = serieswrk & ChartSeriesHeader(2, chartseries(i), color, cht_alpha)
						If bShowSeries Then wrk = wrk & serieswrk
					Next

				' Series field
				Else

					' Get series names
					If IsArray(chartseries) Then
						cntseries = UBound(chartseries)+1
					Else
						cntseries = 0
					End If

					' Write cat
					Dim chartcats
					wrk = wrk & ChartCatHeader(1)
					cntdata = UBound(chartdata,2)+1
					For i = 0 to cntdata-1
						name = chartdata(0,i)
						If Not ValueInArray(chartcats, name) Then
							wrk = wrk & ChartCatContent(name)
							AddValueToArray chartcats, name
						End If
					Next
					wrk = wrk & ChartCatHeader(2)

					' Write series
					For i = 0 to cntseries-1
						If IsArray(chartseries(i)) Then
							seriesname = chartseries(i)(0)
						Else
							seriesname = chartseries(i)
						End If
						color = GetPaletteColor(i)
						bShowSeries = EWRPT_CHART_SHOW_BLANK_SERIES
						serieswrk = ChartSeriesHeader(1, seriesname, color, cht_alpha)
						cntcat = UBound(chartcats)+1
						cntdata = UBound(chartdata,2)+1
						For j = 0 to cntcat-1
							val = 0
							For k = 0 to cntdata-1
								If chartdata(0,k) = chartcats(j) And chartdata(1,k) = seriesname Then
									val = chartdata(2,k)
									If IsNull(val) Then
										val = 0
									Else
										val = CDbl(val)
									End If
									If val <> 0 Then bShowSeries = True
									Exit For
								End If
							Next
							serieswrk = serieswrk & ChartSeriesContent(val)
						Next
						serieswrk = serieswrk & ChartSeriesHeader(2, chartseries(i), color, cht_alpha)
						If bShowSeries Then wrk = wrk & serieswrk
					Next
				End If

			' Single series
			Else
				cntdata = UBound(chartdata,2)+1
				For i = 0 to cntdata-1
					name = chartdata(0,i)
					If IsNull(name) Then
						name = ReportLanguage.Phrase("NullLabel")
					ElseIf name = "" Then
						name = ReportLanguage.Phrase("EmptyLabel")
					End If
					color = GetPaletteColor(i)
					If chartdata(1,i) <> "" Then name = name & ", " & chartdata(1,i)
					val = chartdata(2,i)
					If IsNull(val) Then
						val = 0
					Else
						val = CDbl(val)
					End If
					wrk = wrk & ChartContent(name, val, color, cht_alpha, "") ' Get chart content
				Next
			End If

			' Get trend lines
			wrk = wrk & ChartTrendLines()

			' Get chart footer
			wrk = wrk & ChartHeader(2)
		End If
		ChartXml = wrk

		'ewrpt_Trace(wrk)
	End Function

	Private Function ValueInArray(ar,val)
		Dim i
		ValueInArray = False
		If IsArray(ar) Then
			For i = 0 to UBound(ar)
				If CStr(ar(i)&"") = CStr(val&"") Then
					ValueInArray = True
					Exit Function
				End If
			Next
		End If
	End Function

	Private Function AddValueToArray(ar,val)
		If IsArray(ar) Then
			ReDim Preserve ar(UBound(ar)+1)
		Else
			ReDim ar(0)
		End If
		ar(UBound(ar)) = val
	End Function

	' Show chart (FusionCharts Free)
	' typ: chart type (1/2/3/4/...)
	' id: chart id
	' parms: "bgcolor=FFFFFF|..."
	' trends: trend lines
	Public Function ShowChartFCF(xml)
		Dim wrktyp, wrkid, wrkparms, wrktrends, wrkdata, wrkseries, wrkwidth, wrkheight, wrkalign
		Dim chartswf, chartxml, wrk
		wrktyp = ChartType
		wrkid = ID
		wrkparms = Parms
		wrktrends = Trends
		wrkdata = Data
		wrkseries = Series
		wrkwidth = ChartWidth
		wrkheight = ChartHeight
		wrkalign = ChartAlign
		If IsNull(wrktyp) Or IsEmpty(wrktyp) Then
			wrktyp = 1
		End If

		' Get chart swf
		Select Case wrktyp

		' Single Series
			Case 1:	chartswf = "FCF_Column2D.swf" ' Column 2D
			Case 2:	chartswf = "FCF_Pie2D.swf" ' Pie 2D
			Case 3:	chartswf = "FCF_Bar2D.swf" ' Bar 2D
			Case 4: chartswf = "FCF_Line.swf" ' Line 2D
			Case 5: chartswf = "FCF_Column3D.swf" ' Column 3D
			Case 6: chartswf = "FCF_Pie3D.swf" ' Pie 3D
			Case 7: chartswf = "FCF_Area2D.swf" ' Area 2D
			Case 8: chartswf = "FCF_Doughnut2D.swf" ' Doughnut 2D

		' Multi Series
			Case 9: chartswf = "FCF_MSColumn2D.swf" ' Multi-series Column 2D
			Case 10: chartswf = "FCF_MSColumn3D.swf" ' Multi-series Column 3D
			Case 11: chartswf = "FCF_MSLine.swf" ' Multi-series Line 2D
			Case 12: chartswf = "FCF_MSArea2D.swf" ' Multi-series Area 2D
			Case 13: chartswf = "FCF_MSBar2D.swf" ' Multi-series Bar 2D

		' Stacked
			Case 14: chartswf = "FCF_StackedColumn2D.swf" ' Stacked Column 2D
			Case 15: chartswf = "FCF_StackedColumn3D.swf" ' Stacked Column 3D
			Case 16: chartswf = "FCF_StackedArea2D.swf" ' Stacked Area 2D
			Case 17: chartswf = "FCF_StackedBar2D.swf" ' Stacked Bar 2D

		' Combination
			Case 18: chartswf = "FCF_MSColumn2DLineDY.swf" ' Multi-series Column 2D Line Dual Y Chart
			Case 19: chartswf = "FCF_MSColumn3DLineDY.swf" ' Multi-series Column 3D Line Dual Y Chart

		' Financial
			Case 20: chartswf = "FCF_Candlestick.swf" ' Candlestick

		' Other
			Case 21: chartswf = "FCF_Gantt.swf" ' Gantt
			Case 22: chartswf = "FCF_Funnel.swf" ' Funnel

		' Default
			Case Else: chartswf = "FCF_Column2D.swf" ' Default = Column 2D
		End Select

		' Set width, height and align
		If IsNumeric(wrkwidth) And IsNumeric(wrkheight) Then

			'wrkwidth = wrkwidth
			'wrkheight = wrkheight

		Else ' default
			wrkwidth = EWRPT_CHART_WIDTH
			wrkheight = EWRPT_CHART_HEIGHT
		End If
		If LCase(wrkalign) = "left" Or LCase(wrkalign) = "right" Then
			wrkalign = LCase(wrkalign)
		Else
			wrkalign = EWRPT_CHART_ALIGN ' default
		End If

		' Output JavaScript for FCF
		chartxml = xml
		wrk = "<script type=""text/javascript"">" & vbCrLf
		wrk = wrk & "var chartwidth = """ & wrkwidth & """;" & vbCrLf
		wrk = wrk & "var chartheight = """ & wrkheight & """;" & vbCrLf
		wrk = wrk & "var chartalign = """ & wrkalign & """;" & vbCrLf
		wrk = wrk & "var chartxml = """ & ewrpt_EscapeJs(chartxml) & """;" & vbCrLf
		wrk = wrk & "var chartid = ""div_" & wrkid & """;" & vbCrLf
		wrk = wrk & "var chartswf = ""FusionChartsFree/Charts/" & chartswf & """;" & vbCrLf
		wrk = wrk & "var chart = new FusionCharts(chartswf, ""ewchart"", chartwidth, chartheight);" & vbCrLf
		wrk = wrk & "chart.addParam(""wmode"", ""transparent"");" & vbCrLf
		wrk = wrk & "chart.setDataXML(chartxml);" & vbCrLf
		wrk = wrk & "chart.render(chartid);" & vbCrLf
		wrk = wrk & "</script>" & vbCrLf

		' Add debug xml
		If EWRPT_DEBUG_ENABLED Then wrk = wrk & "<p>(Chart XML): " & ewrpt_HtmlEncode(chartxml) & "</p>"
		ShowChartFCF = wrk
	End Function

	' Show Chart Xml
	Public Sub ShowChartXml()
		Dim sChartContent

		' Build chart content
		sChartContent = ChartXml
		Response.ContentType = "text/xml; charset=UTF-8"

		' Write utf-8 BOM
		'Response.Write &HEF & &HBB & &HBF
		' Write utf-8 encoding

		Response.Write "<?xml version=""1.0"" encoding=""utf-8"" ?>"

		' Write content
		Response.Write sChartContent
	End Sub

	' Show Chart Text
	Public Sub ShowChartText()
		Dim sChartContent

		' Build chart content
		sChartContent = ChartXml
		Response.ContentType = "text/plain; charset=UTF-8"

		' Write content
		Response.Write sChartContent
	End Sub

	' Get color
	Function GetPaletteColor(i)
		Dim arColor, colorpalette
		colorpalette = LoadParm("colorpalette")
		arColor = Split(colorpalette, "|")
		If IsArray(arColor) Then
			GetPaletteColor = arColor(i Mod (UBound(arColor)+1))
		Else
			GetPaletteColor = ""
		End If
	End Function

	' Convert to HTML color
	Function ColorCode(c)
		Dim color
		If c <> "" Then

			' remove #
			color = Replace(c, "#", "")

			' fill to 6 digits
			ColorCode = String(6 - Len(color), "0") & color
		Else
			ColorCode = ""
		End If
	End Function

	' Output chart header
	Function ChartHeader(typ)
		Dim wrk, i, arVal, key, value
		If typ = 1 Then
			wrk = "<graph"
			If IsArray(Parms) Then
				For i = 0 to UBound(Parms,2)
					If Parms(2,i) Then
						Call WriteAtt(wrk, Parms(0,i), Decode(Parms(1,i)))
					End If
				Next
			End If
			wrk = wrk & ">"
		Else
			wrk = "</graph>"
		End If
		ChartHeader = wrk
	End Function

	' Decode the original value
	Function Decode(src)
		Decode = Replace(src, "%2C", ",")
	End Function

	' Get TrendLine XML
	' <trendlines>
	'    <line startvalue='0.8' displayValue='Good' color='FF0000' thickness='1' isTrendZone='0'/>
	'    <line startvalue='-0.4' displayValue='Bad' color='009999' thickness='1' isTrendZone='0'/>
	' </trendlines>
	Function ChartTrendLines()
		Dim wrk, i
		wrk = ""
		If IsArray(Trends) Then
			For i = 1 to UBound(Trends)
				wrk = wrk & "<trendlines>"

				' Get all trend lines
				wrk = wrk & ChartTrendLine(Trends(i)(0), Trends(i)(1), Trends(i)(2), Trends(i)(3), _
					Trends(i)(4), Trends(i)(5), Trends(i)(6), Trends(i)(7))
				wrk = wrk & "</trendlines>"
			Next
		End If
		ChartTrendLines = wrk
	End Function

	' Output trend line
	Function ChartTrendLine(startval, endval, color, dispval, thickness, trendzone, showontop, alpha)
		Dim wrk
		wrk = "<line"
		Call WriteAtt(wrk, "startValue", startval) ' Starting y value
		If endval <> 0 Then
			Call WriteAtt(wrk, "endValue", endval) ' Ending y value
		End If
		Call WriteAtt(wrk, "color", CheckColorCode(color)) ' Color
		If dispval <> "" Then
			Call WriteAtt(wrk, "displayValue", dispval) ' Display value
		End If
		If thickness > 0 Then
			Call WriteAtt(wrk, "thickness", thickness) ' Thickness
		End If
		Call WriteAtt(wrk, "isTrendZone", trendzone) ' Display trend as zone or line
		Call WriteAtt(wrk, "showOnTop", showontop) ' Show on top
		If alpha > 0 Then
			Call WriteAtt(wrk, "alpha", alpha) ' Alpha
		End If
		wrk = wrk & " />"
		ChartTrendLine = wrk
	End Function

	' Category header/footer XML (multi series)
	Function ChartCatHeader(typ)
		Dim wrk
		If typ = 1 Then
			wrk = "<categories>"
		Else
			wrk = "</categories>"
		End If
		ChartCatHeader = wrk
	End Function

	' Category content XML (multi series)
	Function ChartCatContent(name)
		Dim wrk
		wrk = "<category"
		Call WriteAtt(wrk, "name", name)
		wrk = wrk & " />"
		ChartCatContent = wrk
	End Function

	' Series header/footer XML (multi series)
	Function ChartSeriesHeader(typ, series, color, alpha)
		Dim wrk, seriesname
		If typ = 1 Then
			wrk = "<dataset"
			If IsArray(series) Then
				seriesname = series(0)
			Else
				seriesname = series
			End If
			If IsNull(seriesname) Then
				seriesname = ReportLanguage.Phrase("NullLabel")
			ElseIf seriesname = "" Then
				seriesname = ReportLanguage.Phrase("EmptyLabel")
			End If
			Call WriteAtt(wrk, "seriesname", seriesname)
			Call WriteAtt(wrk, "color", ColorCode(color))
			Call WriteAtt(wrk, "alpha", alpha)
			If IsArray(series) Then
				Call WriteAtt(wrk, "parentYAxis", series(1))
			End If
			wrk = wrk & ">"
		Else
			wrk = "</dataset>"
		End If
		ChartSeriesHeader = wrk
	End Function

	' Series content XML (multi series)
	Function ChartSeriesContent(val)
		Dim wrk
		wrk = "<set"
		Call WriteAtt(wrk, "value", ChartFormatNumber(val))
		wrk = wrk & " />"
		ChartSeriesContent = wrk
	End Function

	' Chart content XML
	Function ChartContent(name, val, color, alpha, lnk)
		Dim wrk, cht_shownames
		cht_shownames = LoadParm("shownames")
		wrk = "<set"
		Call WriteAtt(wrk, "name", name)
		Call WriteAtt(wrk, "value", ChartFormatNumber(val))
		Call WriteAtt(wrk, "color", ColorCode(color))

'		Call WriteAtt(wrk, "hoverText", name)
		Call WriteAtt(wrk, "alpha", alpha)
		Call WriteAtt(wrk, "link", lnk)
		If cht_shownames = "1" Then
			Call WriteAtt(wrk, "showName", "1")
		End If
		wrk = wrk & " />"
		ChartContent = wrk
	End Function

	' Category content XML (Candlestick category)
	Function ChartCandlestickCatContent(xindex, name)
		Dim wrk
		wrk = "<category"
		Call WriteAtt(wrk, "name", name)
		Call WriteAtt(wrk, "xindex", xindex)
		Call WriteAtt(wrk, "showline", "1")
		wrk = wrk & " />"
		ChartCandlestickCatContent = wrk
	End Function

	' Chart content header XML (Candlestick)
	Function ChartCandlestickContentHeader(typ)
		If typ = 1 Then
			ChartCandlestickContentHeader = "<data>"
		Else
			ChartCandlestickContentHeader = "</data>"
		End If
	End Function

	' Chart content XML (Candlestick)
	Function ChartCandlestickContent(open, high, low, close, xindex)
		Dim wrk
		wrk = "<set"
		Call WriteAtt(wrk, "open", ChartFormatNumber(open))
		Call WriteAtt(wrk, "high", ChartFormatNumber(high))
		Call WriteAtt(wrk, "low", ChartFormatNumber(low))
		Call WriteAtt(wrk, "close", ChartFormatNumber(close))
		If xindex <> "" Then
			Call WriteAtt(wrk, "xindex", xindex)
		End If
		wrk = wrk & " />"
		ChartCandlestickContent = wrk
	End Function

	' Format number for chart
	Function ChartFormatNumber(v)
		Dim cht_decimalprecision
		cht_decimalprecision = LoadParm("decimalPrecision")
		If IsNull(cht_decimalprecision) Then
			ChartFormatNumber = v
		Else
			Dim curLocale
			curLocale = GetLocale()
			SetLocale("en-us")
			ChartFormatNumber = FormatNumber(v, cht_decimalprecision, , , 0)
			SetLocale(curLocale)
		End If
	End Function

	' Write attribute
	Sub WriteAtt(str, name, val)
		If val <> "" Then
			val = CheckColorCode(val)
			str = str & " " & name & "=""" & XmlEncode(val) & """"
		End If
	End Sub

	' Check color code
	Function CheckColorCode(val)
		If Left(val,1) = "#" And Len(val) = 7 Then
			CheckColorCode = Mid(val, 2)
		Else
			CheckColorCode = val
		End If
	End Function

	' Encode for XML
	Function XmlEncode(val)
		Dim wrk
		wrk = val & ""
		wrk = Replace(wrk, "&", "&amp;") ' replace &
		wrk = Replace(wrk, "<", "&lt;") ' replace <
		wrk = Replace(wrk, ">", "&gt;") ' replace >
		XMLEncode = Replace(wrk, """", "&quot;") ' replace "
	End Function
End Class

'
'  Chart class (end)
' -------------------
'
' Column class
'
Class crCrosstabColumn
	Dim Caption
	Dim Value
	Dim Visible

	Sub Init(val, cap, vis)
		Caption = cap
		Value = val
		Visible = vis
    End Sub
End Class

'
' Custom filter class
'
Class crCustomFilter
	Dim FldName
	Dim FilterName
	Dim DisplayName
	Dim FldExpression
	Dim FunctionName

	Sub Init(fname, ftname, dname, fldexp, funcname)
		FldName = fname
		FilterName = ftname
		DisplayName = dname
		FldExpression = fldexp
		FunctionName = funcname
	End Sub
End Class

' -------------------------
'  Advanced Security class
'
Class crAdvancedSecurity
	Dim m_ArUserLevel
	Dim m_ArUserLevelPriv
	Dim m_ArUserLevelID

	' Current user level id / user level
	Dim CurrentUserLevelID
	Dim CurrentUserLevel

	' Current user id / parent user id / user id array
	Dim CurrentUserID
	Dim CurrentParentUserID
	Dim m_ArUserID

	' Class Initialize
	Private Sub Class_Initialize()

		' Init User Level
		CurrentUserLevelID = SessionUserLevelID
		If IsNumeric(CurrentUserLevelID) Then
			If CurrentUserLevelID >= -1 Then
				ReDim m_ArUserLevelID(0)
				m_ArUserLevelID(0) = CurrentUserLevelID
			End If
		End If

		' Init User ID
		CurrentUserID = SessionUserID
		CurrentParentUserID = SessionParentUserID

		' Load user level
		Call LoadUserLevel()
	End Sub

	' Session user id
	Public Property Get SessionUserID()
		SessionUserID = Session(EWRPT_SESSION_USER_ID) & ""
	End Property

	Public Property Let SessionUserID(v)
		Session(EWRPT_SESSION_USER_ID) = v
		CurrentUserID = v
	End Property

	' Session parent user id
	Public Property Get SessionParentUserID()
		SessionParentUserID = Session(EWRPT_SESSION_PARENT_USER_ID) & ""
	End Property

	Public Property Let SessionParentUserID(v)
		Session(EWRPT_SESSION_PARENT_USER_ID) = v
		CurrentParentUserID = v
	End Property

	' Current user name
	Public Property Get CurrentUserName()
		CurrentUserName = Session(EWRPT_SESSION_USER_NAME) & ""
	End Property

	Public Property Let CurrentUserName(v)
		Session(EWRPT_SESSION_USER_NAME) = v
	End Property

	' Session user level id
	Public Property Get SessionUserLevelID()
		SessionUserLevelID = Session(EWRPT_SESSION_USER_LEVEL_ID)
	End Property

	Public Property Let SessionUserLevelID(v)
		Session(EWRPT_SESSION_USER_LEVEL_ID) = v
		CurrentUserLevelID = v
		If IsNumeric(CurrentUserLevelID) Then
			If CurrentUserLevelID >= -1 Then
				ReDim m_ArUserLevelID(0)
				m_ArUserLevelID(0) = CurrentUserLevelID
			End If
		End If
	End Property

	' Session user level value
	Public Property Get SessionUserLevel()
		SessionUserLevel = Session(EWRPT_SESSION_USER_LEVEL)
	End Property

	Public Property Let SessionUserLevel(v)
		Session(EWRPT_SESSION_USER_LEVEL) = v
		CurrentUserLevel = v
	End Property

	' Can list
	Public Property Get CanList()
		CanList = ((CurrentUserLevel And EWRPT_ALLOW_LIST) = EWRPT_ALLOW_LIST)
	End Property

	Public Property Let CanList(b)
		If b Then
			CurrentUserLevel = (CurrentUserLevel Or EWRPT_ALLOW_LIST)
		Else
			CurrentUserLevel = (CurrentUserLevel And (Not EWRPT_ALLOW_LIST))
		End If
	End Property

	' Can report
	Public Property Get CanReport()
		CanReport = ((CurrentUserLevel And EWRPT_ALLOW_REPORT) = EWRPT_ALLOW_REPORT)
	End Property

	Public Property Let CanReport(b)
		If b Then
			CurrentUserLevel = (CurrentUserLevel Or EWRPT_ALLOW_REPORT)
		Else
			CurrentUserLevel = (CurrentUserLevel And (Not EWRPT_ALLOW_REPORT))
		End If
	End Property

	' Can admin
	Public Property Get CanAdmin()
		CanAdmin = ((CurrentUserLevel And EWRPT_ALLOW_ADMIN) = EWRPT_ALLOW_ADMIN)
	End Property

	Public Property Let CanAdmin(b)
		If b Then
			CurrentUserLevel = (CurrentUserLevel Or EWRPT_ALLOW_ADMIN)
		Else
			CurrentUserLevel = (CurrentUserLevel And (Not EWRPT_ALLOW_ADMIN))
		End If
	End Property

	' Last url
	Public Property Get LastUrl()
		LastUrl = Request.Cookies(EWRPT_PROJECT_VAR)("lasturl")
	End Property

	' Save last url
	Public Sub SaveLastUrl()
		Dim s, q
		s = Request.ServerVariables("SCRIPT_NAME")
		q = Request.ServerVariables("QUERY_STRING")
		If q <> "" Then s = s & "?" & q
		If LastUrl = s Then s = ""
		Response.Cookies(EWRPT_PROJECT_VAR)("lasturl") = s
	End Sub

	' Auto login
	Public Function AutoLogin()
		Dim sUsr, sPwd
		If Request.Cookies(EWRPT_PROJECT_VAR)("autologin") = "autologin" Then
			sUsr = Request.Cookies(EWRPT_PROJECT_VAR)("username")
			sPwd = Request.Cookies(EWRPT_PROJECT_VAR)("password")
			sPwd = TEAdecrypt(ew_Decode(sPwd), EWRPT_RANDOM_KEY)
			AutoLogin = ValidateUser(sUsr, sPwd, True)
		Else
			AutoLogin = False
		End If
	End Function

	' Validate user
	Public Function ValidateUser(usr, pwd, autologin)
		Dim RsUser, sFilter, sSql
		ValidateUser = False
		If ValidateUser Then
			Session(EWRPT_SESSION_ENCRYPTED_USER) = ew_Encode(TEAencrypt(usr, EWRPT_RANDOM_KEY))
			Session(EWRPT_SESSION_ENCRYPTED_PASSWORD) = ew_Encode(TEAencrypt(pwd, EWRPT_RANDOM_KEY))
			Session(EWRPT_SESSION_STATUS) = "login"
		Else
			Session(EWRPT_SESSION_STATUS) = "" ' Clear login status
		End If
	End Function

	' No user level security
	Public Sub SetUpUserLevel()
	End Sub

	' Add user permission
	Public Sub AddUserPermission(UserLevelName, TableName, UserPermission)
		Dim UserLevelID, i

		' Get user level id from user name
		UserLevelID = ""
		If IsArray(m_ArUserLevel) Then
			For i = 0 To UBound(m_ArUserLevel, 2)
				If UserLevelName&"" = m_ArUserLevel(1, i)&"" Then
					UserLevelID = m_ArUserLevel(0, i)
					Exit For
				End If
			Next
		End If
		If IsArray(m_ArUserLevelPriv) And UserLevelID <> "" Then
			For i = 0 To UBound(m_ArUserLevelPriv, 2)
				If LCase(CStr(m_ArUserLevelPriv(0,i))) = LCase(EWRPT_TABLE_PREFIX & CStr(TableName)) And _
				   CStr(m_ArUserLevelPriv(1,i)) = CStr(UserLevelID) Then
					m_ArUserLevelPriv(2,i) = m_ArUserLevelPriv(2,i) Or UserPermission ' Add permission
					Exit For
				End If
			Next
		End If
	End Sub

	' Delete user permission
	Public Sub DeleteUserPermission(UserLevelName, TableName, UserPermission)
		Dim UserLevelID, i

		' Get user level id from user name
		UserLevelID = ""
		If IsArray(m_ArUserLevel) Then
			For i = 0 To UBound(m_ArUserLevel, 2)
				If UserLevelName&"" = m_ArUserLevel(1, i)&"" Then
					UserLevelID = m_ArUserLevel(0, i)
					Exit For
				End If
			Next
		End If
		If IsArray(m_ArUserLevelPriv) And UserLevelID <> "" Then
			For i = 0 To UBound(m_ArUserLevelPriv, 2)
				If LCase(CStr(m_ArUserLevelPriv(0,i))) = LCase(EWRPT_TABLE_PREFIX & CStr(TableName)) And _
				   CStr(m_ArUserLevelPriv(1,i)) = CStr(UserLevelID) Then
					m_ArUserLevelPriv(2,i) = m_ArUserLevelPriv(2,i) And (127-UserPermission) ' Remove permission
					Exit For
				End If
			Next
		End If
	End Sub

	' Load current user level
	Public Sub LoadCurrentUserLevel(Table)
		Call LoadUserLevel()
		SessionUserLevel = CurrentUserLevelPriv(Table)
	End Sub

	' Get current user privilege
	Private Function CurrentUserLevelPriv(TableName)
		If IsLoggedIn() Then
			CurrentUserLevelPriv = 0
			For i = 0 To UBound(m_ArUserLevelID)
				CurrentUserLevelPriv = CurrentUserLevelPriv Or GetUserLevelPrivEx(TableName, m_ArUserLevelID(i))
			Next
		Else
			CurrentUserLevelPriv = 0
		End If
	End Function

	' Get user level ID by user level name
	Public Function GetUserLevelID(UserLevelName)
		GetUserLevelID = -2
		If CStr(UserLevelName) = "Administrator" Then
			GetUserLevelID = -1
		ElseIf UserLevelName <> "" Then
			If IsArray(m_ArUserLevel) Then
				Dim i
				For i = 0 to UBound(m_ArUserLevel, 2)
					If CStr(m_ArUserLevel(1, i)) = CStr(UserLevelName) Then
						GetUserLevelID = m_ArUserLevel(0, i)
						Exit For
					End If
				Next
			End If
		End If
	End Function

	' Add user level (for use with UserLevel_Loading event)
	Sub AddUserLevel(UserLevelName)
		Dim bFound, i, UserLevelID
		If UserLevelName = "" Or IsNull(UserLevelName) Then Exit Sub
		UserLevelID = GetUserLevelID(UserLevelName)
		If Not IsNumeric(UserLevelID) Then Exit Sub
		If UserLevelID < -1 Then Exit Sub
		bFound = False
		If Not IsArray(m_ArUserLevelID) Then
			ReDim m_ArUserLevelID(0)
		Else
			For i = 0 to UBound(m_ArUserLevelID)
				If m_ArUserLevelID(i) = UserLevelID Then
					bFound = True
					Exit For
				End If
			Next
			If Not bFound Then ReDim Preserve m_ArUserLevelID(UBound(m_ArUserLevelID)+1)
		End If
		If Not bFound Then
			m_ArUserLevelID(UBound(m_ArUserLevelID)) = UserLevelID
		End If
	End Sub

	' Delete user level (for use with UserLevel_Loading event)
	Sub DeleteUserLevel(UserLevelName)
		Dim i, j, UserLevelID
		If UserLevelName = "" Or IsNull(UserLevelName) Then Exit Sub
		UserLevelID = GetUserLevelID(UserLevelName)
		If Not IsNumeric(UserLevelID) Then Exit Sub
		If UserLevelID < -1 Then Exit Sub
		If IsArray(m_ArUserLevelID) Then
			For i = 0 to UBound(m_ArUserLevelID)
				If m_ArUserLevelID(i) = UserLevelID Then
					For j = i+1 to UBound(m_ArUserLevelID)
						m_ArUserLevelID(j-1) = m_ArUserLevelID(j)
					Next
					If UBound(m_ArUserLevelID) = 0 Then
						m_ArUserLevelID = ""
					Else
						ReDim Preserve m_ArUserLevelID(UBound(m_ArUserLevelID)-1)
					End If
					Exit Sub
				End If
			Next
		End If
	End Sub

	' User level list
	Function UserLevelList()
		Dim i
		UserLevelList = ""
		If IsArray(m_ArUserLevelID) Then
			For i = 0 to UBound(m_ArUserLevelID)
				If UserLevelList <> "" Then UserLevelList = UserLevelList & ", "
				UserLevelList = UserLevelList & m_ArUserLevelID(i)
			Next
		End If
	End Function

	' User level name list
	Function UserLevelNameList()
		Dim i
		UserLevelNameList = ""
		If IsArray(m_ArUserLevelID) Then
			For i = 0 to UBound(m_ArUserLevelID)
				If UserLevelNameList <> "" Then UserLevelNameList = UserLevelNameList & ", "
				UserLevelNameList = UserLevelNameList & ewrpt_QuotedValue(GetUserLevelName(m_ArUserLevelID(i)), EWRPT_DATATYPE_STRING)
			Next
		End If
	End Function

	' Get user privilege based on table name and user level
	Public Function GetUserLevelPrivEx(TableName, UserLevelID)
		GetUserLevelPrivEx = 0
		If CStr(UserLevelID) = "-1" Then ' System Administrator
			GetUserLevelPrivEx = 31 ' Use old user level values
		ElseIf UserLevelID >= 0 Then
			If IsArray(m_ArUserLevelPriv) Then
				Dim i
				For i = 0 to UBound(m_ArUserLevelPriv, 2)
					If LCase(CStr(m_ArUserLevelPriv(0,i))) = LCase(CStr(EWRPT_TABLE_PREFIX & TableName)) And _
						CStr(m_ArUserLevelPriv(1,i)) = CStr(UserLevelID) Then
						GetUserLevelPrivEx = m_ArUserLevelPriv(2,i)
						If IsNull(GetUserLevelPrivEx) Then GetUserLevelPrivEx = 0
						If Not IsNumeric(GetUserLevelPrivEx) Then GetUserLevelPrivEx = 0
						GetUserLevelPrivEx = CLng(GetUserLevelPrivEx)
						Exit For
					End If
				Next
			End If
		End If
	End Function

	' Get current user level name
	Public Function CurrentUserLevelName()
		CurrentUserLevelName = GetUserLevelName(CurrentUserLevelID)
	End Function

	' Get user level name based on user level
	Public Function GetUserLevelName(UserLevelID)
		GetUserLevelName = ""
		If CStr(UserLevelID) = "-1" Then
			GetUserLevelName = "Administrator"
		ElseIf UserLevelID >= 0 Then
			If IsArray(m_ArUserLevel) Then
				Dim i
				For i = 0 to UBound(m_ArUserLevel, 2)
					If CStr(m_ArUserLevel(0, i)) = CStr(UserLevelID) Then
						GetUserLevelName = m_ArUserLevel(1, i)
						Exit For
					End If
				Next
			End If
		End If
	End Function

	' Sub to display all the User Level settings (for debug only)
	Public Sub ShowUserLevelInfo()
		Dim i
		If IsArray(m_ArUserLevel) Then
			Response.Write "User Levels:<br />"
			Response.Write "UserLevelId, UserLevelName<br />"
			For i = 0 To UBound(m_ArUserLevel, 2)
				Response.Write "&nbsp;&nbsp;" & m_ArUserLevel(0, i) & ", " & _
					m_ArUserLevel(1, i) & "<br />"
			Next
		Else
			Response.Write "No User Level definitions." & "<br />"
		End If
		If IsArray(m_ArUserLevelPriv) Then
			Response.Write "User Level Privs:<br />"
			Response.Write "TableName, UserLevelId, UserLevelPriv<br />"
			For i = 0 To UBound(m_ArUserLevelPriv, 2)
				Response.Write "&nbsp;&nbsp;" & m_ArUserLevelPriv(0, i) & ", " & _
					m_ArUserLevelPriv(1, i) & ", " & m_ArUserLevelPriv(2, i) & "<br />"
			Next
		Else
			Response.Write "No User Level privilege settings." & "<br />"
		End If
		Response.Write "CurrentUserLevel = " & CurrentUserLevel & "<br />"
	End Sub

	' Function to check privilege for List page (for menu items)
	Public Function AllowList(TableName)
		AllowList = CBool(CurrentUserLevelPriv(TableName) And EWRPT_ALLOW_LIST)
	End Function

	' Check if user is logged in
	Public Function IsLoggedIn()
		IsLoggedIn = (Session(EWRPT_SESSION_STATUS) = "login")
	End Function

	' Check if user is system administrator
	Public Function IsSysAdmin()
		IsSysAdmin = (Session(EWRPT_SESSION_SYSTEM_ADMIN) = 1)
	End Function

	' Check if user is administrator
	Function IsAdmin()
		IsAdmin = IsSysAdmin
	End Function

	' Save user level to session
	Public Sub SaveUserLevel()
		Session(EWRPT_SESSION_AR_USER_LEVEL) = m_ArUserLevel
		Session(EWRPT_SESSION_AR_USER_LEVEL_PRIV) = m_ArUserLevelPriv
	End Sub

	' Load user level from session
	Public Sub LoadUserLevel()
		If Not IsArray(Session(EWRPT_SESSION_AR_USER_LEVEL)) Or Not IsArray(Session(EWRPT_SESSION_AR_USER_LEVEL_PRIV)) Then
			Call SetupUserLevel()
			Call SaveUserLevel()
		Else
			m_ArUserLevel = Session(EWRPT_SESSION_AR_USER_LEVEL)
			m_ArUserLevelPriv = Session(EWRPT_SESSION_AR_USER_LEVEL_PRIV)
		End If
	End Sub

	' Function to get user info
	Public Function CurrentUserInfo(fieldname)
		If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
		CurrentUserInfo = Null
	End Function

	' UserID Loading event
	Sub UserID_Loading()

		'Response.Write "UserID Loading: " & CurrentUserID & "<br>"
	End Sub

	' UserID Loaded event
	Sub UserID_Loaded()

		'Response.Write "UserID Loaded: " & UserIDList & "<br>"
	End Sub

	' User Level Loaded event
	Sub UserLevel_Loaded()

		'AddUserPermission <UserLevelName>, <TableName>, <UserPermission>
		'DeleteUserPermission <UserLevelName>, <TableName>, <UserPermission>

	End Sub
End Class

'
'  Advanced Security class (end)
' -------------------------------
' Functions for backward compatibilty
' Get current user name
Function CurrentUserName()
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	If IsObject(Security) Then
		CurrentUserName = Security.CurrentUserName
	Else
		CurrentUserName = Session(EWRPT_SESSION_USER_NAME) & ""
	End If
End Function

' Get current user ID
Function CurrentUserID()
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	If IsObject(Security) Then
		CurrentUserID = Security.CurrentUserID
	Else
		CurrentUserID = Session(EWRPT_SESSION_USER_ID) & ""
	End If
End Function

' Get current parent user ID
Function CurrentParentUserID()
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	If IsObject(Security) Then
		CurrentParentUserID = Security.CurrentParentUserID
	Else
		CurrentParentUserID = Session(EWRPT_SESSION_PARENT_USER_ID) & ""
	End If
End Function

' Get current user level
Function CurrentUserLevel()
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	If IsObject(Security) Then
		CurrentUserLevel = Security.CurrentUserLevelID
	Else
		CurrentUserLevel = Session(EWRPT_SESSION_USER_LEVEL_ID) & ""
	End If
End Function

' Get current user level list
Function CurrentUserLevelList()
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	If IsObject(Security) Then
		CurrentUserLevelList = Security.UserLevelList
	Else
		CurrentUserLevelList = Session(EWPT_SESSION_USER_LEVEL_ID) & ""
	End If
End Function

' Is Logged In
Function IsLoggedIn()
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	If IsObject(Security) Then
		IsLoggedIn = Security.IsLoggedIn
	Else
		IsLoggedIn = (Session(EWRPT_SESSION_STATUS) = "login")
	End If
End Function

' Allow list
Function AllowList(TableName)
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	If IsObject(Security) Then
		AllowList = Security.AllowList(TableName)
	Else
		AllowList = True
	End If
End Function

' Load recordset
Function ew_LoadRecordset(SQL)
	On Error Resume Next
	Err.Clear
	Dim RsSet
	Set RsSet = Server.CreateObject("ADODB.Recordset")
	RsSet.CursorLocation = EWRPT_CURSOR_LOCATION
	RsSet.Open SQL, Conn, 1, 2
	If Err.Number <> 0 Then
		Response.Write "Load recordset error. SQL: '" & SQL & "'. Description: " & Err.Description
		Response.End
	Else
		Set ew_LoadRecordset = RsSet
	End If
End Function

' Load row
Function ew_LoadRow(SQL)
	On Error Resume Next
	Err.Clear
	Dim RsRow
	Set RsRow = Server.CreateObject("ADODB.Recordset")
	RsRow.Open SQL, Conn
	If Err.Number <> 0 Then
		Response.Write "Load row error. SQL: '" & SQL & "'. Description: " & Err.Description
		Response.End
	Else
		Set ew_LoadRow = RsRow
	End If
End Function

' Note: Object "Conn" is required
' Return sql scalar value
Function ew_ExecuteScalar(SQL)
	On Error Resume Next
	Err.Clear
	ew_ExecuteScalar = Null
	If Trim(SQL&"") = "" Then Exit Function
	Dim RsExec
	Set RsExec = Conn.Execute(SQL)
	If Err.Number <> 0 Then
		Response.Write "Execute scalar error. SQL: '" & SQL & "'. Description: " & Err.Description
		Response.End
	Else
		If Not RsExec.Eof Then ew_ExecuteScalar = RsExec(0)
	End If
	RsExec.Close
	Set RsExec = Nothing
End Function

' Check if valid operator
Function ewrpt_IsValidOpr(Opr, FldType)
	ewrpt_IsValidOpr = (Opr = "=" Or Opr = "<" Or Opr = "<=" Or _
		Opr = ">" Or Opr = ">=" Or Opr = "<>")
	If FldType = EWRPT_DATATYPE_STRING Then
		ewrpt_IsValidOpr = ewrpt_IsValidOpr Or Opr = "LIKE" Or Opr = "NOT LIKE" Or Opr = "STARTS WITH"
	End If
End Function

' Quoted name for table/field
Function ewrpt_QuotedName(Name)
	ewrpt_QuotedName = EWRPT_DB_QUOTE_START & Replace(Name, EWRPT_DB_QUOTE_END, EWRPT_DB_QUOTE_END & EWRPT_DB_QUOTE_END) & EWRPT_DB_QUOTE_END
End Function

' Quoted value for field type
Function ewrpt_QuotedValue(Value, FldType) 
	Select Case FldType
	Case EWRPT_DATATYPE_STRING
		ewrpt_QuotedValue = "'" & ewrpt_AdjustSql(Value) & "'"
	Case EWRPT_DATATYPE_GUID
		If EWRPT_IS_MSACCESS Then
			ewrpt_QuotedValue = "{guid " & ewrpt_AdjustSql(Value) & "}"
		Else
			ewrpt_QuotedValue = "'" & ewrpt_AdjustSql(Value) & "'"
		End If
	Case EWRPT_DATATYPE_DATE
		If EWRPT_IS_MSACCESS Then
			ewrpt_QuotedValue = "#" & ewrpt_AdjustSql(Value) & "#"
		Else
			ewrpt_QuotedValue = "'" & ewrpt_AdjustSql(Value) & "'"
		End If
	Case EWRPT_DATATYPE_BOOLEAN
		If EWRPT_IS_MSACCESS Then
			ewrpt_QuotedValue = Value
		Else
			ewrpt_QuotedValue = "'" & ewrpt_AdjustSql(Value) & "'"
		End If
	Case Else
		ewrpt_QuotedValue = Value
	End Select
End Function

' Get distinct values
Function ewrpt_GetDistinctValues(FldOpr, sql)
	Dim wrkrs, ar, wrkval, wrkcnt
	ewrpt_GetDistinctValues = ""
	If IsNull(sql) Or sql = "" Then Exit Function
	Set wrkrs = conn.Execute(sql)
	If Not wrkrs.Eof Then
		Redim ar(0)
		wrkcnt = 0
		ar(0) = ewrpt_ConvertValue(FldOpr, ewrpt_GetValue(wrkrs(0)))
		wrkrs.MoveNext
		Do While Not wrkrs.Eof
			wrkval = ewrpt_ConvertValue(FldOpr, ewrpt_GetValue(wrkrs(0)))
			If wrkval <> ar(wrkcnt) Then
				wrkcnt = wrkcnt + 1
				Redim Preserve ar(wrkcnt)
				ar(wrkcnt) = wrkval
			End If
			wrkrs.MoveNext
		Loop
		ewrpt_GetDistinctValues = ar
	End If
	wrkrs.Close
	Set wrkrs = Nothing
End Function

' Get value
Function ewrpt_GetValue(val)
	If IsNull(val) Then
		ewrpt_GetValue = Null
	ElseIf VarType(val) = 14 Then
		ewrpt_GetValue = CDbl(val)
	ElseIf VarType(val) = 18 Or VarType(val) = 19 Then
		ewrpt_GetValue = CLng(val)
	Else
		ewrpt_GetValue = val
	End If
End Function

' Convert different data type value
Function ewrpt_Conv(v, t)
	Select Case t

	' adBigInt/adUnsignedBigInt
	Case 20, 21
		If IsNull(v) Then
			ewrpt_Conv = Null
		Else
			ewrpt_Conv = CLng(v)
		End If

	' adSmallInt/adInteger/adTinyInt/adUnsignedTinyInt/adUnsignedSmallInt/adUnsignedInt/adBinary
	Case 2, 3, 16, 17, 18, 19, 128
		If IsNull(v) Then
			ewrpt_Conv = Null
		Else
			ewrpt_Conv = CLng(v)
		End If

	' adSingle
	Case 4
		If IsNull(v) Then
			ewrpt_Conv = Null
		Else
			ewrpt_Conv = CSng(v)
		End If

	' adDouble/adCurrency/adNumeric/adVarNumeric
	Case 5, 6, 131, 139
		If IsNull(v) Then
			ewrpt_Conv = Null
		Else
			ewrpt_Conv = CDbl(v)
		End If
	Case Else
		ewrpt_Conv = v
	End Select
End Function

' Convert value
Function ewrpt_ConvertValue(FldOpr, val)
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	If IsNull(val) Then
		ewrpt_ConvertValue = EWRPT_NULL_VALUE
		Exit Function
	ElseIf val = "" Then
		ewrpt_ConvertValue = EWRPT_EMPTY_VALUE
		Exit Function
	End If
	ewrpt_ConvertValue = val
	Select Case LCase(FldOpr)
	Case "year": ewrpt_ConvertValue = Year(val)
	Case "quarter": ewrpt_ConvertValue = Year(val) & "|" & DatePart("q", val)
	Case "month": ewrpt_ConvertValue = Year(val) & "|" & Month(val)
	Case "day": ewrpt_ConvertValue = Year(val) & "|" & Month(val) & "|" & Day(val)
	Case "date": ewrpt_ConvertValue = Year(val) & "/" & Month(val) & "/" & Day(val)
	End Select
End Function

' Dropdown display values
Function ewrpt_DropDownDisplayValue(v, t, fmt)
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	Dim ar
	If v = EWRPT_NULL_VALUE Then
		ewrpt_DropDownDisplayValue = ReportLanguage.Phrase("NullLabel")
		Exit Function
	ElseIf v = EWRPT_EMPTY_VALUE Then
		ewrpt_DropDownDisplayValue = ReportLanguage.Phrase("EmptyLabel")
		Exit Function
	ElseIf LCase(t) = "boolean" Then
		ewrpt_DropDownDisplayValue = ewrpt_BooleanName(v)
		Exit Function
	End If
	ewrpt_DropDownDisplayValue = v
	ar = Split(v&"", "|")
	Select Case LCase(t)
	Case "year"
		ewrpt_DropDownDisplayValue = v
	Case "quarter"
		If UBound(ar) >= 1 Then
			ewrpt_DropDownDisplayValue = ewrpt_QuarterName(ar(1)) & " " & ar(0)
		End If
	Case "month"
		If UBound(ar) >= 1 Then
			ewrpt_DropDownDisplayValue = ewrpt_MonthName(ar(1)) & " " & ar(0)
		End If
	Case "day"
		If UBound(ar) >= 2 Then

			'ewrpt_DropDownDisplayValue = ar(2) & " " & MonthName(ar(1)) & " " & ar(0)
			ewrpt_DropDownDisplayValue = ewrpt_FormatDateTime(CDate(ar(0) & "/" & ar(1) & "/" & ar(2)), fmt)
		End If
	Case "date"
		If IsDate(v) Then
			ewrpt_DropDownDisplayvalue = ewrpt_FormatDateTime(v, fmt)
		End If
	End Select
End Function

' Get Boolean Value
Function ewrpt_BooleanValue(v)
	If LCase(CStr(v)) = "true" Or LCase(Cstr(v)) = "yes" Or LCase(CStr(v)) = "1" Then
		ewrpt_BooleanValue = EWRPT_BOOLEAN_YES
	Else
		ewrpt_BooleanValue = EWRPT_BOOLEAN_NO
	End If
End Function

' Get Boolean Name
' - Treat "T" / "True" / "Y" / "Yes" / "1" As True
Function ewrpt_BooleanName(v)
	If IsNull(v) Then
		ewrpt_BooleanName = ReportLanguage.Phrase("NullLabel")
	ElseIf UCase(CStr(v)) = "T" Or UCase(CStr(v)) = "TRUE" Or UCase(CStr(v)) = "Y" Or UCase(CStr(v)) = "YES" Or CStr(v) = "1" Then
		ewrpt_BooleanName = ReportLanguage.Phrase("BooleanYes")
	Else
		ewrpt_BooleanName = ReportLanguage.Phrase("BooleanNo")
	End If
End Function

' Quarter name
Function ewrpt_QuarterName(q)
	Select Case q
		Case 1: ewrpt_QuarterName = ReportLanguage.Phrase("Qtr1")
		Case 2: ewrpt_QuarterName = ReportLanguage.Phrase("Qtr2")
		Case 3: ewrpt_QuarterName = ReportLanguage.Phrase("Qtr3")
		Case 4: ewrpt_QuarterName = ReportLanguage.Phrase("Qtr4")
		Case Else: ewrpt_QuarterName = q
	End Select
End Function

' Month name
Function ewrpt_MonthName(m)
	Select Case m
		Case 1: ewrpt_MonthName = ReportLanguage.Phrase("MonthJan")
		Case 2: ewrpt_MonthName = ReportLanguage.Phrase("MonthFeb")
		Case 3: ewrpt_MonthName = ReportLanguage.Phrase("MonthMar")
		Case 4: ewrpt_MonthName = ReportLanguage.Phrase("MonthApr")
		Case 5: ewrpt_MonthName = ReportLanguage.Phrase("MonthMay")
		Case 6: ewrpt_MonthName = ReportLanguage.Phrase("MonthJun")
		Case 7: ewrpt_MonthName = ReportLanguage.Phrase("MonthJul")
		Case 8: ewrpt_MonthName = ReportLanguage.Phrase("MonthAug")
		Case 9: ewrpt_MonthName = ReportLanguage.Phrase("MonthSep")
		Case 10: ewrpt_MonthName = ReportLanguage.Phrase("MonthOct")
		Case 11: ewrpt_MonthName = ReportLanguage.Phrase("MonthNov")
		Case 12: ewrpt_MonthName = ReportLanguage.Phrase("MonthDec")
		Case Else: ewrpt_MonthName = m
	End Select
End Function

' Join array
Function ewrpt_JoinArray(ar, sep, ft)
	Dim arwrk, i
	If Not IsArray(ar) Then
		ewrpt_JoinArray = ""
		Exit Function
	End If
	arwrk = ar
	For i = 0 to UBound(arwrk)
		arwrk(i) = ewrpt_QuotedValue(arwrk(i), ft)
	Next
	ewrpt_JoinArray = Join(arwrk, sep)
End Function

' Function to check date format "yyyy-MM-dd HH:mm:ss.fffffff zzz"
Function ewrpt_IsDate(ADate)
	If ADate&"" = "" Then
		ewrpt_IsDate = False
	Else
		ewrpt_IsDate = IsDate(ewrpt_GetDateTimePart(ADate))
	End If
End Function

' Function to get DateTime part (remove ".fffffff zzz" from format "yyyy-MM-dd HH:mm:ss.fffffff zzz")
Function ewrpt_GetDateTimePart(ADate)
	If IsNull(ADate) Then
		ewrpt_GetDateTimePart = ADate
	ElseIf InStrRev(ADate,".") > 0 And InStr(ADate,":") > 0 Then
		ewrpt_GetDateTimePart = Mid(ADate, 1, InStrRev(ADate,".")-1)
		If Not IsDate(ewrpt_GetDateTimePart) Or InStr(ewrpt_GetDateTimePart,":") <= 0 Then ewrpt_GetDateTimePart = ADate
	Else
		ewrpt_GetDateTimePart = ADate
	End If
End Function

'-------------------------------------------------------------------------------
' Functions for default date format
' ANamedFormat = 0-8, where 0-4 same as VBScript
' 5 = "yyyymmdd"
' 6 = "mmddyyyy"
' 7 = "ddmmyyyy"
' 8 = Short Date + Short Time
' 9 = "yyyymmdd HH:MM:SS"
' 10 = "mmddyyyy HH:MM:SS"
' 11 = "ddmmyyyy HH:MM:SS"
' 12 = "HH:MM:SS"
' 99 = "yyyy/mm/dd HH:MM:SS" - date for SQL
' Format date time based on format type
Function ewrpt_FormatDateTime(ADate, ANamedFormat)
	Dim sDate
	sDate = ewrpt_GetDateTimePart(ADate)
	If IsDate(sDate) Then
		If ANamedFormat >= 0 And ANamedFormat <= 4 Then
			ewrpt_FormatDateTime = FormatDateTime(sDate, ANamedFormat)
		ElseIf ANamedFormat = 5 Or ANamedFormat = 9 Then
			ewrpt_FormatDateTime = Year(sDate) & EWRPT_DATE_SEPARATOR & Month(sDate) & EWRPT_DATE_SEPARATOR & Day(sDate)
		ElseIf ANamedFormat = 6 Or ANamedFormat = 10 Then
			ewrpt_FormatDateTime = Month(sDate) & EWRPT_DATE_SEPARATOR & Day(sDate) & EWRPT_DATE_SEPARATOR & Year(sDate)
		ElseIf ANamedFormat = 7 Or ANamedFormat = 11 Then
			ewrpt_FormatDateTime = Day(sDate) & EWRPT_DATE_SEPARATOR & Month(sDate) & EWRPT_DATE_SEPARATOR & Year(sDate)
		ElseIf ANamedFormat = 8 Then
			ewrpt_FormatDateTime = FormatDateTime(sDate, 2)
			If Hour(sDate) <> 0 Or Minute(sDate) <> 0 Or Second(sDate) <> 0 Then
				ewrpt_FormatDateTime = ewrpt_FormatDateTime & " " & FormatDateTime(sDate, 4) & ":" & ewrpt_ZeroPad(Second(sDate), 2)
			End If
		ElseIf ANamedFormat = 12 Then
			ewrpt_FormatDateTime = ewrpt_ZeroPad(Hour(sDate), 2) & ":" & ewrpt_ZeroPad(Minute(sDate), 2) & ":" & ewrpt_ZeroPad(Second(sDate), 2)
		ElseIf ANamedFormat = 99 Then
			ewrpt_FormatDateTime = Year(ADate) & "/" & Month(ADate) & "/" & Day(ADate)
			If Hour(ADate) <> 0 Or Minute(ADate) <> 0 Or Second(ADate) <> 0 Then
				ewrpt_FormatDateTime = ewrpt_FormatDateTime & " " & ewrpt_ZeroPad(Hour(ADate), 2) & ":" & ewrpt_ZeroPad(Minute(ADate), 2) & ":" & ewrpt_ZeroPad(Second(ADate), 2)
			End If
		Else
			ewrpt_FormatDateTime = sDate
		End If
		If ANamedFormat >= 9 And ANamedFormat <= 11 Then
				ewrpt_FormatDateTime = ewrpt_FormatDateTime & " " & ewrpt_ZeroPad(Hour(sDate), 2) & ":" & ewrpt_ZeroPad(Minute(sDate), 2) & ":" & ewrpt_ZeroPad(Second(sDate), 2)
				If Len(ADate) > Len(sDate) Then ewrpt_FormatDateTime = ewrpt_FormatDateTime & Mid(ADate, Len(sDate)+1)
		End If
	Else
		ewrpt_FormatDateTime = ADate
	End If
End Function

' Unformat date time based on format type
Function ewrpt_UnFormatDateTime(ADate, ANamedFormat)
	Dim arDateTime, arDate, i
	ADate = Trim(ADate & "")
	While Instr(ADate, "  ") > 0
		ADate = Replace(ADate, "  ", " ")
	Wend
	arDateTime = Split(ADate, " ")
	If UBound(arDateTime) < 0 Then
		ewrpt_UnFormatDateTime = ADate
		Exit Function
	End If
	If ANamedFormat = 0 And IsDate(ADate) Then
		ewrpt_UnFormatDateTime = Year(arDateTime(0)) & "/" & Month(arDateTime(0)) & "/" & Day(arDateTime(0))
		If UBound(arDateTime) > 0 Then
			For i = 1 to UBound(arDateTime)
				ewrpt_UnFormatDateTime = ewrpt_UnFormatDateTime & " " & arDateTime(i)
			Next
		End If
	Else
		arDate = Split(arDateTime(0), EWRPT_DATE_SEPARATOR)
		If UBound(arDate) = 2 Then
			ewrpt_UnFormatDateTime = arDateTime(0)
			If ANamedFormat = 6 Or ANamedFormat = 10 Then ' mmddyyyy
				If Len(arDate(0)) <= 2 And Len(arDate(1)) <= 2 And Len(arDate(2)) <= 4 Then
					ewrpt_UnFormatDateTime = arDate(2) & "/" & arDate(0) & "/" & arDate(1)
				End If
			ElseIf (ANamedFormat = 7 Or ANamedFormat = 11) Then ' ddmmyyyy
				If Len(arDate(0)) <= 2 And Len(arDate(1)) <= 2 And Len(arDate(2)) <= 4 Then
					ewrpt_UnFormatDateTime = arDate(2) & "/" & arDate(1) & "/" & arDate(0)
				End If
			ElseIf ANamedFormat = 5 Or ANamedFormat = 9 Then ' yyyymmdd
				If Len(arDate(0)) <= 4 And Len(arDate(1)) <= 2 And Len(arDate(2)) <= 2 Then
					ewrpt_UnFormatDateTime = arDate(0) & "/" & arDate(1) & "/" & arDate(2)
				End If
			End If
			If UBound(arDateTime) > 0 Then
				For i = 1 to UBound(arDateTime)
					ewrpt_UnFormatDateTime = ewrpt_UnFormatDateTime & " " & arDateTime(i)
				Next
			End If
		Else
			ewrpt_UnFormatDateTime = ADate
		End If
	End If
End Function

' ViewValue
' - return &nbsp; if empty
Function ewrpt_ViewValue(value)
	If (value&"" <> "") Then
		ewrpt_ViewValue = value
	Else
		ewrpt_ViewValue = "&nbsp;"
	End If
End Function

'-------------------------------------------------------------------------------
' Function to format currency
Function ewrpt_FormatCurrency(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	If IsNumeric(Expression) Then
		ewrpt_FormatCurrency = FormatCurrency(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	Else
		ewrpt_FormatCurrency = Expression
	End If
End Function

'-------------------------------------------------------------------------------
' Function to format number
Function ewrpt_FormatNumber(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	If IsNumeric(Expression) Then
		ewrpt_FormatNumber = FormatNumber(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	Else
		ewrpt_FormatNumber = Expression
	End If
End Function

'-------------------------------------------------------------------------------
' Function to format percent
Function ewrpt_FormatPercent(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
	On Error Resume Next
	If IsNumeric(Expression) Then
		ewrpt_FormatPercent = FormatPercent(Expression, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits)
		If Err.Number <> 0 Then
			ewrpt_FormatPercent = FormatNumber(Expression*100, NumDigitsAfterDecimal, IncludeLeadingDigit, UseParensForNegativeNumbers, GroupDigits) & "%"
		End If
	Else
		ewrpt_FormatPercent = Expression
	End If
End Function

' Encode html
Function ewrpt_HtmlEncode(Expression)
	ewrpt_HtmlEncode = Server.HtmlEncode(Expression & "")
End Function

'-------------------------------------------------------------------------------
' Function to Adjust SQL
Function ewrpt_AdjustSql(str)
	Dim sWrk
	sWrk = Trim(str & "")
	sWrk = Replace(sWrk, "'", "''") ' Adjust for Single Quote
	If EWRPT_DB_START_QUOTE = "[" Then
		sWrk = Replace(sWrk, "[", "[[]") ' Adjust for Open Square Bracket
	End If
	ewrpt_AdjustSql = sWrk
End Function

'-------------------------------------------------------------------------------
' Function to Build Report SQL
Function ewrpt_BuildReportSql(sSelect, sWhere, sGroupBy, sHaving, sOrderBy, sFilter, sSort)
	Dim sSql, sDbWhere, sDbOrderBy
	sDbWhere = sWhere
	If sDbWhere <> "" Then
		sDbWhere = "(" & sDbWhere & ")"
	End If
	If sFilter <> "" Then
		If sDbWhere <> "" Then sDbWhere = sDbWhere & " AND "
		sDbWhere = sDbWhere & "(" & sFilter & ")"
	End If	
	sDbOrderBy = sOrderBy
	sDbOrderBy = ewrpt_UpdateSortFields(sOrderBy, sSort, 1)
	sSql = sSelect
	If sDbWhere <> "" Then sSql = sSql & " WHERE " & sDbWhere
	If sGroupBy <> "" Then sSql = sSql & " GROUP BY " & sGroupBy
	If sHaving <> "" Then sSql = sSql & " HAVING " & sHaving
	If sDbOrderBy <> "" Then sSql = sSql & " ORDER BY " & sDbOrderBy
	ewrpt_BuildReportSql = sSql
End Function

' Update sort fields
' opt = 1, merge all sort fields
' opt = 2, merge sOrderBy fields only
Function ewrpt_UpdateSortFields(sOrderBy, sSort, opt)
	If sOrderBy = "" Then
		If opt = 1 Then
			ewrpt_UpdateSortFields = sSort
		Else
			ewrpt_UpdateSortFields = ""
		End If
		Exit Function
	ElseIf sSort = "" Then
		ewrpt_UpdateSortFields = sOrderBy
		Exit Function
	Else

		' Merge sort field list
		Dim arorderby, arsort, i, j, sortfld, orderfld
		arorderby = ewrpt_GetSortFlds(sOrderBy)
		arsort = ewrpt_GetSortFlds(sSort)
		For i = 0 to UBound(arsort)

			' Get sort field
			sortfld = Trim(arsort(i))
			If UCase(Right(sortfld,4)) = " ASC" Then
				sortfld = Trim(Mid(sortfld,1,Len(sortfld)-4))
			ElseIf UCase(Right(sortfld,5)) = " DESC" Then
				sortfld = Trim(MId(sortfld,1,Len(sortfld)-5))
			End If
			For j = 0 to UBound(arorderby)

				' Get orderby field
				orderfld = Trim(arorderby(j))
				If UCase(Right(orderfld,4)) = " ASC" Then
					orderfld = Trim(Mid(orderfld,1,Len(orderfld)-4))
				ElseIf UCase(Right(orderfld,5)) = " DESC" Then
					orderfld = Trim(Mid(orderfld,1,Len(orderfld)-5))
				End If

				' Replace field
				If orderfld = sortfld Then
					arorderby(j) = arsort(i)
					Exit For
				End If
			Next

			' Append field
			If opt = 1 Then
				If orderfld <> sortfld Then
					ReDim Preserve arorderby(UBound(arorderby)+1)
					arorderby(UBound(arorderby)) = arsort(i)
				End If
			End If
		Next
		ewrpt_UpdateSortFields = Join(arorderby, ", ")
	End If
End Function

' Get sort fields
Function ewrpt_GetSortFlds(flds)
	Dim offset, fldpos, ar, orderfld
	fldpos = 1
	offset = InStr(1,flds,",",vbTextCompare)
	Do While (offset > 0)
		orderfld = Mid(flds,fldpos,offset-fldpos)
		If UCase(Right(orderfld,4)) = " ASC" Or UCase(Right(orderfld,5)) = " DESC" Then
			fldpos = offset+1
			If IsArray(ar) Then
				ReDim Preserve ar(UBound(ar)+1)
			Else
				ReDim ar(0)
			End If
			ar(UBound(ar)) = orderfld
		End If
		offset = InStr(offset+1,flds,",",vbTextCompare)
	Loop
	If IsArray(ar) Then
		ReDim Preserve ar(UBound(ar)+1)
	Else
		ReDim ar(0)
	End If
	ar(UBound(ar)) = Mid(flds,fldpos)
	ewrpt_GetSortFlds = ar
End Function

' Get reverse sort
Function ewrpt_ReverseSort(sorttype)
	If sorttype = "ASC" Then
		ewrpt_ReverseSort = "DESC"
	Else
		ewrpt_ReverseSort = "ASC"
	End If
End Function

' Connect to database
Sub ewrpt_Connect()

	' Open connection to the database
	Set conn = Server.CreateObject("ADODB.Connection")

	' Database loading event
	Call Database_Connecting(EWRPT_DB_CONNECTION_STRING)
	conn.Open EWRPT_DB_CONNECTION_STRING
End Sub

' Database Connecting event
Sub Database_Connecting(Connstr)

	'Response.Write "Database Connecting"
End Sub

'-------------------------------------------------------------------------------
' Function to Load Recordset based on Sql
Function ewrpt_LoadRs(sSql)
	On Error Resume Next
	Dim rs
	Err.Clear
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.CursorLocation = EWRPT_CURSOR_LOCATION
	rs.Open sSql, conn, 3, 1, 1 ' adOpenStatic, adLockReadOnly, adCmdText
	If Err.Number = 0 Then
		Set ewrpt_LoadRs = rs
		Set rs = Nothing
	Else
		Response.Write "ewrpt_LoadRs SQL Error: " & Err.Description & "<br>(Problem SQL): " & sSql & "<br>"
	End If
End Function

'-------------------------------------------------------------------------------
' Function to Load Record Count based on Sql
Function ewrpt_LoadRecordCount(sSql)
	On Error Resume Next
	Dim rs
	Err.Clear
	Set rs = conn.Execute("SELECT COUNT(*) FROM (" & sSql & ") AS EWRPT_TEMP_TABLE")
	If Err.Number = 0 Then
		ewrpt_LoadRecordCount = ewrpt_GetValue(rs(0))
		Set rs = Nothing
	Else
		Err.Clear
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.CursorLocation = EWRPT_CURSOR_LOCATION
		rs.Open sSql, conn, 3, 1, 1 ' adOpenStatic, adLockReadOnly, adCmdText
		If Err.Number = 0 Then
			ewrpt_LoadRecordCount = rs.RecordCount
			Set rs = Nothing
		Else
			Response.Write "ewrpt_LoadRecordCount SQL Error: " & Err.Description & "<br>(Problem SQL): " & sSql & "<br>"
		End If
	End If
End Function

'-------------------------------------------------------------------------------
' Function to Construct a crosstab field name
Function ewrpt_CrossTabField(smrytype, smryfld, colfld, datetype, val, qc, alias)
	Dim wrkval, wrkqc, fld
	If val = EWRPT_NULL_VALUE Then
		wrkval = "NULL": wrkqc = ""
	ElseIf val = EWRPT_EMPTY_VALUE Then
		wrkval = "": wrkqc = qc
	Else
		wrkval = val: wrkqc = qc
	End If
	Select Case smrytype
	Case "SUM"
		fld = smrytype & "(" & smryfld & "*" & _
			ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
	Case "COUNT"
		fld = "SUM(" & _
			ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
	Case "MIN","MAX"
		Dim aggwrk
		aggwrk = ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc)
		If EWRPT_IS_MSACCESS Then
			fld = smrytype & "(IIf(" & aggwrk & "=0,NULL," & smryfld & "))"
		ElseIf EWRPT_IS_MSSQL Or EWRPT_IS_ORACLE Then
			fld = smrytype & "(CASE " & aggwrk & " WHEN 0 THEN NULL ELSE " & smryfld & " END)"
		ElseIf EWRPT_IS_MYSQL Or EWRPT_IS_POSTGRESQL Then
			fld = smrytype & "(IF(" & aggwrk & "=0,NULL," & smryfld & "))"
		End If
	Case "AVG"
		Dim sumwrk, cntwrk
		sumwrk = "SUM(" & smryfld & "*" & _
			ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
		cntwrk = "SUM(" &_
			ewrpt_SQLDistinctFactor(colfld, datetype, wrkval, wrkqc) & ")"
		If alias <> "" Then

			'sumwrk = sumwrk & " AS SUM_" & alias
			'cntwrk = cntwrk & " AS CNT_" & alias

			sumwrk = sumwrk & " AS sum_" & alias
			cntwrk = cntwrk & " AS cnt_" & alias
		End If
		ewrpt_CrossTabField = sumwrk & ", " & cntwrk
		Exit Function
	End Select
	If alias <> "" Then fld = fld & " AS " & alias
	ewrpt_CrossTabField = fld
End Function

'-------------------------------------------------------------------------------
' Function to construct SQL Distinct factor
' - ACCESS
' y: IIf(Year(FieldName)=1996,1,0)
' q: IIf(DatePart(""q"",FieldName,1,0)=1,1,0))
' m: (IIf(DatePart(""m"",FieldName,1,0)=1,1,0)))
' others: (IIf(FieldName=val,1,0)))
' - MS SQL
' y: (1-ABS(SIGN(Year(FieldName)-1996)))
' q: (1-ABS(SIGN(DatePart(q,FieldName)-1)))
' m: (1-ABS(SIGN(DatePart(m,FieldName)-1)))
' d: (CASE Convert(VarChar(10),FieldName,111) WHEN '1996/1/1' THEN 1 ELSE 0 END)
' - MySQL
' y: IF(YEAR(`OrderDate`)=1996,1,0))
' q: IF(QUARTER(`OrderDate`)=1,1,0))
' m: IF(MONTH(`OrderDate`)=1,1,0))
' - Oracle
Function ewrpt_SQLDistinctFactor(sFld, dateType, val, qc)

	' ACCESS
	If EWRPT_IS_MSACCESS Then
		If dateType = "y" And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "IIf(Year(" & sFld & ")=" & val & ",1,0)"
		ElseIf (dateType = "q" Or dateType = "m") And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "IIf(DatePart(""" & dateType & """," & sFld & ")=" & val & ",1,0)"
		Else
			If val = "NULL" Then
				ewrpt_SQLDistinctFactor = "IIf(" & sFld & " IS NULL,1,0)"
			Else
				ewrpt_SQLDistinctFactor = "IIf(" & sFld & "=" & qc & ewrpt_AdjustSql(val) & qc & ",1,0)"
			End If
		End If

	' MS SQL
	ElseIf EWRPT_IS_MSSQL Then
		If dateType = "y" And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "(1-ABS(SIGN(Year(" & sFld & ")-" & val & ")))"
		ElseIf (dateType = "q" Or dateType = "m") And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "(1-ABS(SIGN(DatePart(" & dateType & "," & sFld & ")-" & val & ")))"
		ElseIf dateType = "d" Then
			ewrpt_SQLDistinctFactor = "(CASE Convert(VarChar(10)," & sFld & ",111) WHEN " & qc & ewrpt_AdjustSql(val) & qc & " THEN 1 ELSE 0 END)"
		ElseIf dateType = "dt" Then
			ewrpt_SQLDistinctFactor = "(CASE Convert(VarChar(10)," & sFld & ",120) WHEN " & qc & ewrpt_AdjustSql(val) & qc & " THEN 1 ELSE 0 END)"
		Else
			If val = "NULL" Then
				ewrpt_SQLDistinctFactor = "(CASE WHEN " & sFld & " IS NULL THEN 1 ELSE 0 END)"
			Else
				ewrpt_SQLDistinctFactor = "(CASE " & sFld & " WHEN " & qc & ewrpt_AdjustSql(val) & qc & " THEN 1 ELSE 0 END)"
			End If
		End If

	' MySQL
	ElseIf EWRPT_IS_MYSQL Then
		If dateType = "y" And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "IF(YEAR(" & sFld & ")=" & val & ",1,0)"
		ElseIf dateType = "q" And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "IF(QUARTER(" & sFld & ")=" & val & ",1,0)"
		ElseIf dateType = "m" And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "IF(MONTH(" & sFld & ")=" & val & ",1,0)"
		Else
			If val = "NULL" Then
				ewrpt_SQLDistinctFactor = "IF(" & sFld & " IS NULL,1,0)"
			Else
				ewrpt_SQLDistinctFactor = "IF(" & sFld & "=" & qc & ewrpt_AdjustSql(val) & qc & ",1,0)"
			End If
		End If

	' PostgreSql
	ElseIf EWRPT_IS_POSTGRESQL Then
		If dateType = "y" And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "CASE WHEN EXTRACT(YEAR FROM " & sFld & ")=" & val & " THEN 1 ELSE 0 END"
		ElseIf dateType = "q" And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "CASE WHEN EXTRACT(QUARTER FROM " & sFld & ")=" & val & " THEN 1 ELSE 0 END"
		ElseIf dateType = "m" And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "CASE WHEN EXTRACT(MONTH FROM " & sFld & ")=" & val & " THEN 1 ELSE 0 END"
		Else
			If val = "NULL" Then
				ewrpt_SQLDistinctFactor = "CASE WHEN " & sFld & " IS NULL THEN 1 ELSE 0 END"
			Else
				ewrpt_SQLDistinctFactor = "CASE WHEN " & sFld & "=" & qc & ewrpt_AdjustSql(val) & qc & " THEN 1 ELSE 0 END"
			End If
		End If

	' Oracle
	ElseIf EWRPT_IS_ORACLE Then
		If dateType = "y" And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "DECODE(TO_CHAR(" & sFld & ",'YYYY'),'" & val & "',1,0)"
		ElseIf dateType = "q" And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "DECODE(TO_CHAR(" & sFld & ",'Q'),'" & val & "',1,0)"
		ElseIf dateType = "m" And IsNumeric(val) Then
			ewrpt_SQLDistinctFactor = "DECODE(TO_CHAR(" & sFld & ",'MM'),LPAD('" & val & "',2,'0'),1,0)"
		ElseIf dateType = "d" Then
			ewrpt_SQLDistinctFactor = "DECODE(" & sFld & ",TO_DATE(" & qc & ewrpt_AdjustSql(val) & qc & ",'YYYY/MM/DD'),1,0)"
		ElseIf dateType = "dt" Then
			ewrpt_SQLDistinctFactor = "DECODE(" & sFld & ",TO_DATE(" & qc & ewrpt_AdjustSql(val) & qc & ",'YYYY/MM/DD HH24:MI:SS'),1,0)"
		Else
			If val = "NULL" Then
				ewrpt_SQLDistinctFactor = "(CASE WHEN " & sFld & " IS NULL THEN 1 ELSE 0 END)"
			Else
				ewrpt_SQLDistinctFactor = "DECODE(" & sFld & "," & qc & ewrpt_AdjustSql(val) & qc & ",1,0)"
			End If
		End If
	End If
End Function

'-------------------------------------------------------------------------------
' Function to evaluate summary value
'
Function ewrpt_SummaryValue(val1, val2, ityp)
	Select Case ityp
	Case "SUM", "COUNT", "AVG"
		If IsNull(val2) Or Not IsNumeric(val2) Then
			ewrpt_SummaryValue = val1
		Else
			ewrpt_SummaryValue = val1 + val2
		End if
	Case "MIN"
		If IsNull(val2) Or Not IsNumeric(val2) Then
			ewrpt_SummaryValue = val1 ' Skip null and non-numeric
		ElseIf IsNull(val1) Then
			ewrpt_SummaryValue = val2 ' Initialize for first valid value
		ElseIf val1 < val2 Then
			ewrpt_SummaryValue = val1
		Else
			ewrpt_SummaryValue = val2
		End If
	Case "MAX"
		If IsNull(val2) Or Not IsNumeric(val2) Then
			ewrpt_SummaryValue = val1 ' Skip null and non-numeric
		ElseIf IsNull(val1) Then
			ewrpt_SummaryValue = val2 ' Initialize for first valid value
		ElseIf val1 > val2 Then
			ewrpt_SummaryValue = val1
		Else
			ewrpt_SummaryValue = val2
		End If
	End Select
End Function

' Match filter value
Function ewrpt_MatchedFilterValue(ar, value)
	If Not IsArray(ar) Then
		ewrpt_MatchedFilterValue = (ar&"" = value&"")
	Else
		Dim i
		For i = 0 to UBound(ar)
			If ar(i)&"" = value&"" Then
				ewrpt_MatchedFilterValue = True
				Exit Function
			End If
		Next
		ewrpt_MatchedFilterValue = False
	End If
End Function

' Render repeat column table
' rowcnt - zero based row count
Function ewrpt_RepeatColumnTable(totcnt, rowcnt, repeatcnt, rendertype)
	Dim sWrk, i
	sWrk = ""

	' Render control start
	If rendertype = 1 Then
		If rowcnt = 0 Then sWrk = sWrk & "<table class=""" & EWRPT_ITEM_TABLE_CLASSNAME & """>"
		If (rowcnt mod repeatcnt = 0) Then sWrk = sWrk & "<tr>"
		sWrk = sWrk & "<td>"

	' Render control end
	ElseIf rendertype = 2 Then
		sWrk = sWrk & "</td>"
		If (rowcnt mod repeatcnt = repeatcnt-1) Then
			sWrk = sWrk & "</tr>"
		ElseIf rowcnt = totcnt-1 Then
			For i = ((rowcnt mod repeatcnt) + 1) to repeatcnt - 1
				sWrk = sWrk & "<td>&nbsp;</td>"
			Next
			sWrk = sWrk & "</tr>"
		End If
		If rowcnt = totcnt-1 Then sWrk = sWrk & "</table>"
	End If
	ewrpt_RepeatColumnTable = sWrk
End Function

'-------------------------------------------------------------------------------
' Function to check if the value is selected
' sName: popup name
' value: supplied value
Function ewrpt_IsSelectedValue(ar, value, ft)
	If Not IsArray(ar) Then ewrpt_IsSelectedValue = True: Exit Function
	For i = 0 To Ubound(ar)
		If Left(value,2) = "@@" Or Left(ar(i),2) = "@@" Then ' advanced filters
			If ar(i) = value Then
				ewrpt_IsSelectedValue = True
				Exit Function
			End If
		ElseIf ewrpt_CompareValue(ar(i), value, ft) Then
			ewrpt_IsSelectedValue = True
			Exit Function
		End If
	Next
	ewrpt_IsSelectedValue = False
End Function

'-------------------------------------------------------------------------------
' Function to set up distinct values
' ar: array for distinct values
' val: value
' label: display value
' dup: check duplicate
Sub ewrpt_SetupDistinctValues(ar, val, label, dup)
	Dim pos, i
	If dup Then ' check duplicate
		If IsArray(ar) Then
			For i = 0 to UBound(ar,2)
				If ar(0,i) = val Then Exit Sub
			Next
		End If
	End If
	If Not IsArray(ar) Then
		Redim ar(1,0): pos = 0
	ElseIf val = EWRPT_EMPTY_VALUE Or val = EWRPT_NULL_VALUE Then ' null/empty
		pos = 0 ' insert at top
		Redim Preserve ar(1, UBound(ar,2)+1)
		For i = UBound(ar,2) to 1 Step -1
			ar(0,i) = ar(0,i-1): ar(1,i) = ar(1,i-1)
		Next
	Else
		pos = UBound(ar,2)+1 ' default insert at end
		Redim Preserve ar(1, pos)
	End If
	ar(0,pos) = val: ar(1,pos) = label
End Sub

'-------------------------------------------------------------------------------
' Function to compare values based on field type
Function ewrpt_CompareValue(v1, v2, ft)
	On Error Resume Next
	Select Case ft

	' Case adBigInt, adInteger, adSmallInt, adTinyInt, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt
	Case 20, 3, 2, 16, 17, 18, 19, 21
		If IsNumeric(v1) And IsNumeric(v2) Then
			ewrpt_CompareValue = (CLng(v1) = CLng(v2))
			Exit Function
		End If

	' Case adSingle, adDouble, adNumeric, adCurrency
	Case 4, 5, 131, 6
		If IsNumeric(v1) And IsNumeric(v2) Then
			ewrpt_CompareValue = (CDbl(v1) = CDbl(v2))
			Exit Function
		End If

	' Case adDate, adDBDate, adDBTime, adDBTimeStamp
	Case 7, 133, 134, 135
		If IsDate(v1) And IsDate(v2) Then
			ewrpt_CompareValue = (CDate(v1) = CDate(v2))
			Exit Function
		End If

	' Case adBoolean
	'Case 11
	'	ewrpt_CompareValue = (CBool(v1) = CBool(v2))
	'	Exit Function

	End Select
	ewrpt_CompareValue = (CStr(v1&"") = CStr(v2&"")) ' treat as string
End Function

' Register custom filter
Function ewrpt_RegisterCustomFilter(fld, FilterName, DisplayName, FunctionName)
	Dim FldName, FldExpression, Idx, ar
	FldName = fld.FldName
	FldExpression = fld.FldExpression
	ar = fld.CustomFilters
	If Not IsArray(ar) Then
		Idx = 0
		ReDim ar(Idx)
	Else
		Idx = UBound(ar)+1
		ReDim Preserve ar(Idx)
	End If
	Set ar(Idx) = New crCustomFilter
	ar(Idx).Init FldName, FilterName, DisplayName, FldExpression, FunctionName
	fld.CustomFilters = ar
End Function

' Get custom filter
Function ewrpt_GetCustomFilter(fld, FldVal)
	Dim sWrk, sParm, cntf, i, sFld, sFn, ar
	sWrk = ""
	sParm = Mid(FldVal, 3)
	ar = fld.CustomFilters
	If IsArray(ar) Then
		cntf = UBound(ar)+1
		For i = 0 to cntf-1
			If ar(i).FilterName = sParm Then
				sFld = ar(i).FldExpression
				sFn = ar(i).FunctionName
				sWrk = Eval(sFn & "(""" & sFld & """)")
				Exit For
			End If
		Next
	End If
	ewrpt_GetCustomFilter = sWrk
End Function

' Return date value
Function ewrpt_DateVal(FldOpr, FldVal, ValType)
	On Error Resume Next
	Dim wrkVal, arWrk, yr, mth, dy

	' Compose date string
	Select Case LCase(FldOpr)
	Case "year"
		If ValType = 1 Then
			wrkVal = CDate(FldVal & "/1/1")
		ElseIf ValType = 2 Then
			wrkVal = CDate(FldVal & "/12/31")
		End If
	Case "quarter"
		arWrk = Split(FldVal, "|")
		wrkVal = CDate(arWrk(0) & "/" & ((arWrk(1)-1)*3+1) & "/1")
		If ValType = 2 Then
			wrkVal = DateAdd("m", 3, wrkVal) ' + three months
			wrkVal = DateAdd("d", -1, wrkVal) ' - one day
		End If
	Case "month"
		wrkVal = CDate(Replace(FldVal, "|", "/") & "/1")
		If ValType = 2 Then
			wrkVal = DateAdd("m", 1, wrkVal) ' + one month
			wrkVal = DateAdd("d", -1, wrkVal) ' - one day
		End If
	Case "day"
		wrkVal = CDate(Replace(FldVal, "|", "/"))
	End Select

	' Add time if necessary
	wrkVal = Year(wrkVal) & "/" & Month(wrkVal) & "/" & Day(wrkVal)
	If True Then ' Always return time
		If ValType = 1 Then wrkVal = wrkVal & " 00:00:00"
		If ValType = 2 Then wrkVal = wrkval & " 23:59:59"
	End If

	' Check if date
	If IsDate(wrkVal) Then
		ewrpt_DateVal = wrkVal
	Else
		ewrpt_DateVal = ""
	End If
End Function

' "Past"
Function ewrpt_IsPast()
	ewrpt_IsPast = "(@@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateTimeSql(Now), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Future"
Function ewrpt_IsFuture()
	ewrpt_IsFuture = "(@@fld@@ > " & ewrpt_QuotedValue(ewrpt_FormatDateTimeSql(Now), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Last 30 days"
Function ewrpt_IsLast30Days()
	Dim dt1, dt2
	dt1 = DateAdd("d", -29, Date)
	dt2 = DateAdd("d", 1, Date)
	ewrpt_IsLast30Days = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Last 14 days"
Function ewrpt_IsLast14Days()
	Dim dt1, dt2
	dt1 = DateAdd("d", -13, Date)
	dt2 = DateAdd("d", 1, Date)
	ewrpt_IsLast14Days = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Last 7 days"
Function ewrpt_IsLast7Days()
	Dim dt1, dt2
	dt1 = DateAdd("d", -6, Date)
	dt2 = DateAdd("d", 1, Date)
	ewrpt_IsLast7Days = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Next 30 days"
Function ewrpt_IsNext30Days()
	Dim dt1, dt2
	dt1 = Date
	dt2 = DateAdd("d", 30, Date)
	ewrpt_IsNext30Days = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Next 14 days"
Function ewrpt_IsNext14Days()
	Dim dt1, dt2
	dt1 = Date
	dt2 = DateAdd("d", 14, Date)
	ewrpt_IsNext14Days = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Next 7 days"
Function ewrpt_IsNext7Days()
	Dim dt1, dt2
	dt1 = Date
	dt2 = DateAdd("d", 7, Date)
	ewrpt_IsNext7Days = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Yesterday"
Function ewrpt_IsYesterday()
	Dim dt1, dt2
	dt1 = DateAdd("d", -1, Date)
	dt2 = Date
	ewrpt_IsYesterday = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Today"
Function ewrpt_IsToday()
	Dim dt1, dt2
	dt1 = Date
	dt2 = DateAdd("d", 1, Date)
	ewrpt_IsToday = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Tomorrow"
Function ewrpt_IsTomorrow()
	Dim dt1, dt2
	dt1 = DateAdd("d", 1, Date)
	dt2 = DateAdd("d", 2, Date)
	ewrpt_IsTomorrow = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Last month"
Function ewrpt_IsLastMonth()
	Dim dt1, dt2
	dt1 = DateAdd("m", -1, Date)
	dt1 = CDate(Year(dt1)&"/"&Month(dt1)&"/01")
	dt2 = Date
	dt2 = CDate(Year(dt2)&"/"&Month(dt2)&"/01")
	ewrpt_IsLastMonth = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "This month"
Function ewrpt_IsThisMonth()
	Dim dt1, dt2
	dt1 = Date
	dt1 = CDate(Year(dt1)&"/"&Month(dt1)&"/01")
	dt2 = DateAdd("m", 1, Date)
	dt2 = CDate(Year(dt2)&"/"&Month(dt2)&"/01")
	ewrpt_IsThisMonth = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Next month"
Function ewrpt_IsNextMonth()
	Dim dt1, dt2
	dt1 = DateAdd("m", 1, Date)
	dt1 = CDate(Year(dt1)&"/"&Month(dt1)&"/01")
	dt2 = DateAdd("m", 2, Date)
	dt2 = CDate(Year(dt2)&"/"&Month(dt2)&"/01")
	ewrpt_IsNextMonth = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Last two weeks"
Function ewrpt_IsLast2Weeks()
	Dim dt1, dt2
	dt1 = DateAdd("d", -14-Weekday(Date)+1, Date)
	dt2 = DateAdd("d", 0-Weekday(Date)+1, Date)
	ewrpt_IsLast2Weeks = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Last week"
Function ewrpt_IsLastWeek()
	Dim dt1, dt2
	dt1 = DateAdd("d", -7-Weekday(Date)+1, Date)
	dt2 = DateAdd("d", 0-Weekday(Date)+1, Date)
	ewrpt_IsLastWeek = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "This week"
Function ewrpt_IsThisWeek()
	Dim dt1, dt2
	dt1 = DateAdd("d", 0-Weekday(Date)+1, Date)
	dt2 = DateAdd("d", 7-Weekday(Date)+1, Date)
	ewrpt_IsThisWeek = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Next week"
Function ewrpt_IsNextWeek()
	Dim dt1, dt2
	dt1 = DateAdd("d", 7-Weekday(Date)+1, Date)
	dt2 = DateAdd("d", 14-Weekday(Date)+1, Date)
	ewrpt_IsNextWeek = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Next two week"
Function ewrpt_IsNext2Weeks()
	Dim dt1, dt2
	dt1 = DateAdd("d", 7-Weekday(Date)+1, Date)
	dt2 = DateAdd("d", 21-Weekday(Date)+1, Date)
	ewrpt_IsNext2Weeks = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Last year"
Function ewrpt_IsLastYear()
	Dim dt1, dt2
	dt1 = DateAdd("yyyy", -1, Date)
	dt1 = CDate(Year(dt1)&"/01/01")
	dt2 = Date
	dt2 = CDate(Year(dt2)&"/01/01")
	ewrpt_IsLastYear = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "This year"
Function ewrpt_IsThisYear()
	Dim dt1, dt2
	dt1 = Date
	dt1 = CDate(Year(dt1)&"/01/01")
	dt2 = DateAdd("yyyy", 1, Date)
	dt2 = CDate(Year(dt2)&"/01/01")
	ewrpt_IsThisYear = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' "Next year"
Function ewrpt_IsNextYear()
	Dim dt1, dt2
	dt1 = DateAdd("yyyy", 1, Date)
	dt1 = CDate(Year(dt1)&"/01/01")
	dt2 = DateAdd("yyyy", 2, Date)
	dt2 = CDate(Year(dt2)&"/01/01")
	ewrpt_IsNextYear = "(@@fld@@ >= " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt1), EWRPT_DATATYPE_DATE) & _
		" AND @@fld@@ < " & ewrpt_QuotedValue(ewrpt_FormatDateSql(dt2), EWRPT_DATATYPE_DATE) & ")"
End Function

' Days in month
Function ewrpt_DaysInMonth(y, m)
	If m = 1 Or m = 3 Or m = 5 Or m = 7 Or m = 8 Or m = 10 Or m = 12 Then
		ewrpt_DaysInMonth  = 31
	ElseIf m = 4 Or m = 6 Or m = 9 Or m = 11 Then
		ewrpt_DaysInMonth = 30
	ElseIf m = 2 Then
		ewrpt_DaysInMonth = ewrpt_IIf(y Mod 4 = 0, 29, 28)
	Else
		ewrpt_DaysInMonth  = 0
	End If
End Function

' Format date for SQL
Function ewrpt_FormatDateSql(dt)
	ewrpt_FormatDateSql = Year(dt) & "-" & ewrpt_ZeroPad(Month(dt),2) & "-" & ewrpt_ZeroPad(Day(dt),2)
End Function

' Format datetime for SQL
Function ewrpt_FormatDateTimeSql(dt)
	ewrpt_FormatDateTimeSql = Year(dt) & "-" & ewrpt_ZeroPad(Month(dt),2) & "-" & ewrpt_ZeroPad(Day(dt),2) & " " & _
		ewrpt_ZeroPad(Hour(dt),2) & ":" & ewrpt_ZeroPad(Minute(dt),2) & ":" & ewrpt_ZeroPad(Second(dt),2)
End Function

'-------------------------------------------------------------------------------
' Function to set up distinct values from advanced filter
Sub ewrpt_SetupDistinctValuesFromFilter(ar, af)
	Dim i, val, label
	If IsArray(af) Then
		For i = 0 to UBound(af,2)
			val = af(0,i)
			label = af(1,i)
			Call ewrpt_SetupDistinctValues(ar, val, label, False)
		Next
	End If
End Sub

'-------------------------------------------------------------------------------
' Function to get group value
' - Get the group value based on field type, group type and interval
' - ft: field type
' * 1: numeric, 2: date, 3: string
' - gt: group type
' * numeric: i = interval, n = normal
' * date: d = Day, w = Week, m = Month, q = Quarter, y = Year
' * string: f = first nth character, n = normal
' - intv: interval
Function ewrpt_GroupValue(fld, val)
	Dim ft, grp, intv
	Dim ww, q, wrkIntv
	ft = fld.FldType
	grp = fld.FldGroupByType
	intv = fld.FldGroupInt
	Select Case ft

	' Case adBigInt, adInteger, adSmallInt, adTinyInt, adSingle, adDouble, adNumeric, adCurrency, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt ' numeric
	Case 20, 3, 2, 16, 4, 5, 131, 6, 17, 18, 19, 21 ' numeric
		If Not IsNumeric(val) Then
			ewrpt_GroupVal = val
			Exit Function
		End If
		wrkIntv = CInt(intv)
		If wrkIntv <= 0 Then wrkIntv = 10
		Select Case grp
			Case "i": ewrpt_GroupValue = Int(val/wrkIntv)
			Case Else: ewrpt_GroupValue = val
		End Select

	' Case adDate, adDBDate, adDBTime, adDBTimeStamp ' date
	Case 7, 133, 134, 135 ' date
		If Not IsDate(val) Then
			ewrpt_GroupValue = val
			Exit Function
		End If
		Select Case grp
		Case "y": ewrpt_GroupValue = Year(val)
		Case "q": q = DatePart("q", val): ewrpt_GroupValue = Year(val)& "|" & q
		Case "m": ewrpt_GroupValue = Year(val) & "|" & ewrpt_ZeroPad(Month(val), 2)
		Case "w": ww = DatePart("ww", val): ewrpt_GroupValue = Year(val) & "|" & ewrpt_ZeroPad(ww, 2)
		Case "d": ewrpt_GroupValue = Year(val) & "|" & ewrpt_ZeroPad(Month(val), 2) & "|" & ewrpt_ZeroPad(Day(val), 2)
		Case "h": ewrpt_GroupValue = Hour(val)
		Case "min": ewrpt_GroupValue = Minute(val)
		Case Else: ewrpt_GroupValue = val
		End Select

	' Case adLongVarChar, adLongVarWChar, adChar, adWChar, adVarChar, adVarWChar ' string
	Case 201, 203, 129, 130, 200, 202 ' string
		wrkIntv = CInt(intv)
		If wrkIntv <= 0 Then wrkIntv = 1
		Select Case grp
			Case "f": ewrpt_GroupValue = Mid(val, 1, wrkIntv)
			Case Else: ewrpt_GroupValue = val
		End Select
	Case Else
		ewrpt_GroupValue = val ' ignore
	End Select
End Function

'-------------------------------------------------------------------------------
' Functions to display group value
Function ewrpt_DisplayGroupValue(fld, val)
	Dim ft, grp, intv
	Dim ar, wrkIntv
	ft = fld.FldType
	grp = fld.FldGroupByType
	intv = fld.FldGroupInt
	If IsNull(val) Then
			ewrpt_DisplayGroupValue = ReportLanguage.Phrase("NullLabel")
			Exit Function
	ElseIf val&"" = "" Then
			ewrpt_DisplayGroupValue = ReportLanguage.Phrase("EmptyLabel")
			Exit Function
	End If
	Select Case ft

	' Case adBigInt, adInteger, adSmallInt, adTinyInt, adSingle, adDouble, adNumeric, adCurrency, adUnsignedTinyInt, adUnsignedSmallInt, adUnsignedInt, adUnsignedBigInt ' numeric
	Case 20, 3, 2, 16, 4, 5, 131, 6, 17, 18, 19, 21 ' numeric
		wrkIntv = CInt(intv)
		If wrkIntv <= 0 Then wrkIntv = 10
		Select Case grp
		Case "i": ewrpt_DisplayGroupValue = CStr(val*wrkIntv) & " - " & CStr((val+1)*wrkIntv-1)
		Case Else: ewrpt_DisplayGroupValue = val
		End Select

	' Case adDate, adDBDate, adDBTime, adDBTimeStamp ' date
	Case 7, 133, 134, 135 ' date
		ar = Split(val, "|")
		Select Case grp
		Case "y": ewrpt_DisplayGroupValue = ar(0)
		Case "q": ewrpt_DisplayGroupValue = ewrpt_FormatQuarter(ar(0), ar(1))
		Case "m": ewrpt_DisplayGroupValue = ewrpt_FormatMonth(ar(0), ar(1))
		Case "w": ewrpt_DisplayGroupValue = ewrpt_FormatWeek(ar(0), ar(1))
		Case "d": ewrpt_DisplayGroupValue = ewrpt_FormatDay(ar(0), ar(1), ar(2))
		Case "h": ewrpt_DisplayGroupValue = ewrpt_FormatHour(ar(0))
		Case "min": ewrpt_DisplayGroupValue = ewrpt_FormatMinute(ar(0))
		Case Else: ewrpt_DisplayGroupValue = val
		End Select

	' Case adLongVarChar, adLongVarWChar, adChar, adWChar, adVarChar, adVarWChar ' string
	Case 201, 203, 129, 130, 200, 202 ' string
		ewrpt_DisplayGroupValue = val
	Case Else
		ewrpt_DisplayGroupValue = val ' ignore
	End Select
End Function

Function ewrpt_FormatQuarter(y, q)
	ewrpt_FormatQuarter = "Q" & q & "/" & y
End Function

Function ewrpt_FormatMonth(y, m)
	ewrpt_FormatMonth = m & "/" & y
End Function

Function ewrpt_FormatWeek(y, w)
	ewrpt_FormatWeek = "WK" & w & "/" & y
End Function

Function ewrpt_FormatDay(y, m, d)
	ewrpt_FormatDay = y & "/" & m & "/" & d
End Function

Function ewrpt_FormatHour(h)
	If CInt(h) = 0 Then
		ewrpt_FormatHour = "12 AM"
	ElseIf CInt(h) < 12 Then
		ewrpt_FormatHour = h & " AM"
	ElseIf CInt(h) = 12 Then
		ewrpt_FormatHour = "12 PM"
	Else
		ewrpt_FormatHour = (h-12) & " PM"
	End If
End Function

Function ewrpt_FormatMinute(n)
	ewrpt_FormatMinute = n & " MIN"
End Function

'-------------------------------------------------------------------------------
' Function to pad zeros before number
' - m: number
' - t: length
Function ewrpt_ZeroPad(m, t)
  ewrpt_ZeroPad = String(t - Len(m), "0") & m
End Function

' IIf function
Function ewrpt_IIf(cond, v1, v2)
	On Error Resume Next
	If CBool(cond) Then
		ewrpt_IIf = v1
	Else
		ewrpt_IIf = v2
	End If
End Function

'-------------------------------------------------------------------------------
' Function to get Js data in the form of:
' [value1, text1, selected], [value2, text2, selected], ...
' - value1: "value 1", text1: "text 1": selected: true|false
' name: popup name
' list: comma separated list
Function ewrpt_GetJsData(fld, ft)
	Dim i
	Dim value, jsselect, bSelected
	Dim jsdata: jsdata = ""
	Dim arv, ars
	arv = fld.ValueList
	ars = fld.SelectionList
	If IsArray(arv) Then
		For i = 0 to UBound(arv,2)
			value = arv(0,i)
			label = arv(1,i)
			bSelected = ewrpt_IsSelectedValue(ars, value, ft)
			If bSelected Then
				jsselect = "true"
			Else
				jsselect = "false"
			End If
			If jsdata <> "" Then jsdata = jsdata & ", "
			jsdata = jsdata & "[""" & ewrpt_EscapeJs(value) & """, """ & ewrpt_EscapeJs(label) & """, " & jsselect & "]"
		Next
	End If
	ewrpt_GetJsData = jsdata
End Function

'-------------------------------------------------------------------------------
' Function to check if selected value
Function ewrpt_SelectedValue(ar, val, ft, af)
	Dim i
	If Not IsArray(ar) Then
		ewrpt_SelectedValue = True
		Exit Function
	Else
		For i = 0 to UBound(ar)
			If ar(i) = EWRPT_EMPTY_VALUE And val = "" Then ' empty string
				ewrpt_SelectedValue = True
				Exit Function
			ElseIf ar(i) = EWRPT_NULL_VALUE And IsNull(val) Then ' null value
				ewrpt_SelectedValue = True
				Exit Function
			ElseIf Left(val,2) = "@@" Or Left(ar(i),2) = "@@" Then ' advanced filter
				If IsArray(af) Then
					ewrpt_SelectedValue = ewrpt_SelectedFilter(af, ar(i), val) ' process advanced filter
					If ewrpt_SelectedValue Then Exit Function
				End If
			ElseIf ewrpt_CompareValue(ar(i), val, ft) Then
				ewrpt_SelectedValue = True
				Exit Function
			End If
		Next
	End If
	ewrpt_SelectedValue = False
End Function

' Return detail filter SQL
Function ewrpt_DetailFilterSQL(fld, fn, val)
	Dim sqlwrk, ft, sql
	ft = fld.FldDataType
	If fld.FldGroupSql <> "" Then ft = EWRPT_DATATYPE_STRING
	sqlwrk = fn
	If IsNull(val) Or (ft = EWRPT_DATATYPE_NUMBER And Trim(val&"") = "") Then
		sqlwrk = sqlwrk & " IS NULL"
	Else
		sqlwrk = sqlwrk & " = " & ewrpt_QuotedValue(val, ft)
	End If
	ewrpt_DetailFilterSQL = sqlwrk
End Function

' Return popup filter SQL
Function ewrpt_FilterSQL(fld, fn, ft)
	Dim ar, af, gt, gi, sql
	ar = fld.SelectionList
	af = fld.AdvancedFilters
	gt = fld.FldGroupByType
	gi = fld.FldGroupInt
	sql = fld.FldGroupSql
	If Not IsArray(ar) Then
		ewrpt_FilterSQL = ""
		Exit Function
	Else
		Dim sqlwrk, i, afsql
		sqlwrk = ""
		For i = 0 to UBound(ar)
			If ar(i) = EWRPT_EMPTY_VALUE Then ' Empty string
				sqlwrk = sqlwrk & fn & " = '' OR "
			ElseIf ar(i) = EWRPT_NULL_VALUE Then ' Null value
				sqlwrk = sqlwrk & fn & " IS NULL OR "
			ElseIf Left(ar(i), 2) = "@@" Then ' Advanced filter
				If IsArray(af) Then
					afsql = ewrpt_AdvancedFilterSQL(af, ar(i)) ' Process popup filter
					If Not IsNull(afsql) Then
						sqlwrk = sqlwrk & Replace(afsql, "@@fld@@", fn) & " OR "
					End If
				End If
			ElseIf sql <> "" Then
				sqlwrk = sqlwrk & Replace(sql, "%s", fn) & " = '" & ar(i) & "' OR "
			Else
				Dim arwrk, j

				' Copy to new array
				ReDim arwrk(UBound(ar)-i)
				For j = i to UBound(ar)
					arwrk(j-i) = ar(j)
				Next
				sqlwrk = sqlwrk & fn & " IN (" & ewrpt_JoinArray(arwrk, ", ", ft) & ") OR "
				Exit For
			End If
		Next
	End If
	If sqlwrk <> "" Then
		sqlwrk = "(" & Mid(sqlwrk, 1, Len(sqlwrk)-4) & ")"
	End If
	ewrpt_FilterSQL = sqlwrk
End Function

' Return Advanced Filter SQL
Function ewrpt_AdvancedFilterSQL(ar, val)
	If Not IsArray(ar) Then
		ewrpt_AdvancedFilterSQL = Null
		Exit Function
	ElseIf IsNull(val) Then
		ewrpt_AdvancedFilterSQL = Null
		Exit Function
	Else
		Dim i
		For i = 0 to UBound(ar,2)
			If ar(0,i)&"" = val&"" Then
				ewrpt_AdvancedFilterSQL = ar(2,i)
				Exit Function
			End If
		Next
		ewrpt_AdvancedFilterSQL = Null
	End If
End Function

'-------------------------------------------------------------------------------
' Function to check for advanced filter
Function ewrpt_SelectedFilter(ar, sel, val)
	On Error Resume Next
	Dim i, sEvalStr
	If Not IsArray(ar) Then
		ewrpt_SelectedFilter = True
	ElseIf IsNull(val) Then
		ewrpt_SelectedFilter = False
	Else
		For i = 0 to UBound(ar,1)
			If CStr(sel) = CStr(ar(i,0)) Then
				sEvalStr = Replace(ar(i,2), "@@Date", val)
				ewrpt_SelectedFilter = Eval(sEvalStr)
				If Err Then

' Response.Write "sEvalStr: " & sEvalStr & ", Err: " & Err.Descrption & "<br>"
					Err.Clear
					ewrpt_SelectedFilter = True ' assume True for this filter
				Else
					Exit Function
				End If
			End If
		Next
		ewrpt_SelectedFilter = True
	End If
End Function

'-------------------------------------------------------------------------------
' Function to truncate Memo Field based on specified length, string truncated to nearest space or CrLf
Function ewrpt_TruncateMemo(str, ln)
	Dim i, j, k
	If Len(str) > 0 And Len(str) > ln Then
		k = 1
		Do While k > 0 And k < Len(str)
			i = InStr(k, str, " ", 1)
			j = InStr(k, str, vbCrLf, 1)
			If i < 0 And j < 0 Then ' Not able to truncate
				ewrpt_TruncateMemo = str
				Exit Function
			Else

				' Get nearest space or CrLf
				If i > 0 And j > 0 Then
					If i < j Then
						k = i
					Else
						k = j
					End If
				ElseIf i > 0 Then
					k = i
				ElseIf j > 0 Then
					k = j
				End If

				' Get truncated text
				If k >= ln Then
					ewrpt_TruncateMemo = Mid(str, 1, k-1) & "..."
					Exit Function
				Else
					k = k + 1
				End If
			End If
		Loop
	Else
		ewrpt_TruncateMemo = str
	End If
End Function

'-------------------------------------------------------------------------------
' Function to escape Js
Function ewrpt_EscapeJs(str)
	ewrpt_EscapeJs = Replace(str & "", "\", "\\")
	ewrpt_EscapeJs = Replace(ewrpt_EscapeJs, """", "\""")
	ewrpt_EscapeJs = Replace(ewrpt_EscapeJs, vbCr, "\r")
	ewrpt_EscapeJs = Replace(ewrpt_EscapeJs, vbLf, "\n")
End Function

' Load Chart Series
Function ewrpt_LoadChartSeries(sSql, cht)
	Dim rscht, sdt, Idx, ar
	Set rscht = conn.Execute(sSql)
	sdt = cht.SeriesDateType
	ar = cht.Series
	Do While Not rscht.Eof
		If Not IsArray(ar) Then
			Idx = 0
			ReDim ar(Idx)
		Else
			Idx = UBound(ar)+1
			ReDim Preserve ar(Idx)
		End If
		ar(Idx) = ewrpt_ChartSeriesValue(ewrpt_GetValue(rscht(0)), sdt) ' Series value
		rscht.MoveNext
	Loop
	rscht.Close
	Set rscht = Nothing
	cht.Series = ar
End Function

' Load Chart Data
Function ewrpt_LoadChartData(sSql, cht)
	Dim rscht, fldcnt, temp, i, sdt, xdt, ndt, Idx, ar
	Set rscht = conn.Execute(sSql)
	fldcnt = rscht.Fields.Count
	ReDim temp(fldcnt-1)
	sdt = cht.SeriesDateType
	xdt = cht.XAxisDateFormat
	ndt = ewrpt_IIf(cht.ChartType = 20, cht.NameDateFormat, "")
	If sdt <> "" Then xdt = sdt
	ar = cht.Data
	Do While Not rscht.Eof
		temp(0) = ewrpt_ChartXValue(ewrpt_GetValue(rscht(0)), xdt) ' X value

'Response.Write "0: " & rscht(0) & "<br>"
		temp(1) = ewrpt_ChartSeriesValue(ewrpt_GetValue(rscht(1)), sdt) ' Series value
		temp(2) = ewrpt_GetValue(rscht(2)) ' Y value

'Response.Write "1: " & rscht(1) & "<br>"
		For i = 2 to fldcnt-1
			If (ndt <> "" And i = fldcnt-1) Then
				temp(i) = ewrpt_ChartXValue(rscht(i), ndt) ' Name value
			Else
				temp(i) = rscht(i) ' Y values
			End If
		Next
		If Not IsArray(ar) Then
			Idx = 0
			ReDim ar(fldcnt-1,Idx)
		Else
			Idx = UBound(ar,2)+1
			ReDim Preserve ar(fldcnt-1,Idx)
		End If
		For i = 0 to fldcnt-1
			ar(i,UBound(ar,2)) = temp(i)
		Next
		rscht.MoveNext
	Loop
	rscht.Close
	Set rscht = Nothing
	cht.Data = ar
End Function

' Get Chart X value
Function ewrpt_ChartXValue(val, dt)
	Dim ar, sWrk
	If IsNull(val) Then
		sWrk = ReportLanguage.Phrase("NullLabel")
	ElseIf val = "" Then
		sWrk = ReportLanguage.Phrase("EmptyLabel")
	ElseIf IsNumeric(dt) Then
		sWrk = ewrpt_FormatDateTime(val, dt)
	ElseIf dt = "xyq" Then
		ar = Split(val, "|")
		If UBound(ar) >= 1 Then
			sWrk = ar(0) & " " & ewrpt_QuarterName(ar(1))
		Else
			sWrk = val
		End If
	ElseIf dt = "xym" Then
		ar = Split(val, "|")
		If UBound(ar) >= 1 Then
			sWrk = ar(0) & " " & ewrpt_MonthName(ar(1))
		Else
			sWrk = val
		End If
	ElseIf dt = "xq" Then
		sWrk = ewrpt_QuarterName(val)
	ElseIf dt = "xm" Then
		sWrk = ewrpt_MonthName(val)
	Else
		sWrk = Trim(val)
	End If
	ewrpt_ChartXValue = sWrk
End Function

' Get Chart Series value
Function ewrpt_ChartSeriesValue(val, dt)
	Dim ar, sWrk
	If dt = "syq" Then
		ar = Split(val, "|")
		If UBound(ar) >= 1 Then
			sWrk = ar(0) & " " & ewrpt_QuarterName(ar(1))
		Else
			sWrk = val
		End If
	ElseIf dt = "sym" Then
		ar = Split(val, "|")
		If UBound(ar) >= 1 Then
			sWrk = ar(0) & " " & ewrpt_MonthName(ar(1))
		Else
			sWrk = val
		End If
	ElseIf dt = "sq" Then
		sWrk = ewrpt_QuarterName(val)
	ElseIf dt = "sm" Then
		sWrk = ewrpt_MonthName(val)
	Else
		sWrk = Trim(val)
	End If
	ewrpt_ChartSeriesValue = sWrk
End Function

'-------------------------------------------------------------------------------
' Function to sort chart data
Sub ewrpt_SortChartData(chart, opt, seq)
	Dim i, j, k, bSwap, temp, ar

'	If opt < 1 Or opt > 4 Then Exit Sub
	If ((opt < 3 Or opt > 4) And seq = "") Or ((opt < 1 Or opt > 4) And seq <> "") Then Exit Sub
	ar = chart.Data
	If IsArray(ar) Then
		ReDim temp(UBound(ar,1))
		For i = 0 to UBound(ar,2) - 1
			For j = i+1 to UBound(ar,2)
				Select Case opt
				Case 1 ' X values ascending
					bSwap = ewrpt_CompareValueCustom(ar(0,i), ar(0,j), seq)
				Case 2 ' X values descending
					bSwap = ewrpt_CompareValueCustom(ar(0,j), ar(0,i), seq)
				Case 3 ' Y values ascending
					bSwap = ewrpt_CompareValueCustom(ar(2,i), ar(2,j), seq)
				Case 4 ' Y values descending
					bSwap = ewrpt_CompareValueCustom(ar(2,j), ar(2,i), seq)
				End Select
				If bSwap Then
					For k = 0 to UBound(temp)
						temp(k) = ar(k,i)
						ar(k,i) = ar(k,j)
						ar(k,j) = temp(k)
					Next
				End If
			Next
		Next
	End If
	chart.Data = ar
End Sub

'-------------------------------------------------------------------------------
' Function to sort chart multi series data
Sub ewrpt_SortMultiChartData(chart, opt, seq)
	Dim i, j, bSwap, temp, ar
	Dim k, tmpY1, tmpY2

'	If Not IsArray(ar) Or opt < 1 Or opt > 4 Then Exit Sub
	ar = chart.Data
	If Not IsArray(ar) Or ((opt < 3 Or opt > 4) And seq = "") Or ((opt < 1 Or opt > 4) And seq <> "") Then Exit Sub

	' Set up array for sort Y
	Dim ysums, pos
	If opt = 3 Or opt = 4 Then
		For i = 0 to UBound(ar,2)
			pos = ewrpt_GetArPos(ysums, ar(0,i))
			If IsEmpty(ysums(0,pos)) Then
				ysums(0,pos) = ar(0,i)
				ysums(1,pos) = ar(2,i)
			Else
				ysums(1,pos) = ysums(1,pos) + ar(2,i)
			End If
		Next
	End If

	' Sort array
	ReDim temp(UBound(ar,1))
	For i = 0 to UBound(ar,2) - 1
		For j = i+1 to UBound(ar,2)
			Select Case opt
			Case 1 ' X values ascending
				bSwap = ewrpt_CompareValueCustom(ar(0,i), ar(0,j), seq)
			Case 2 ' X values descending
				bSwap = ewrpt_CompareValueCustom(ar(0,j), ar(0,i), seq)
			Case 3 ' Y values ascending
				tmpY1 = ewrpt_GetArVal(ysums,ar(0,i))
				tmpY2 = ewrpt_GetArVal(ysums,ar(0,j))
				bSwap = ewrpt_CompareValueCustom(tmpY1, tmpY2, seq)
			Case 4 ' Y values descending
				tmpY1 = ewrpt_GetArVal(ysums,ar(0,i))
				tmpY2 = ewrpt_GetArVal(ysums,ar(0,j))
				bSwap = ewrpt_CompareValueCustom(tmpY2, tmpY1, seq)
			End Select
			If bSwap Then
				For k = 0 to UBound(temp)
					temp(k) = ar(k,i)
					ar(k,i) = ar(k,j)
					ar(k,j) = temp(k)
				Next
			End If
		Next
	Next
	chart.Data = ar
End Sub

' Get array value
Function ewrpt_GetArVal(ar, key)
	Dim i
	If IsArray(ar) Then
		For i = 0 to UBound(ar,2)
			If ar(0,i) = key Then
				ewrpt_GetArVal = ar(1,i)
				Exit Function
			End If
		Next
	End If
	ewrpt_GetArVal = ""
End Function

' Compare values by custom sequence
Function ewrpt_CompareValueCustom(v1, v2, seq)
	Dim ar
	If seq = "_number" Then ' Number
		If IsNumeric(v1) And IsNumeric(v2) Then
			ewrpt_CompareValueCustom = (CDbl(v1) > CDbl(v2))
			Exit Function
		End If
	ElseIf seq = "_date" Then ' Date
		If IsDate(v1) And IsDate(v2) Then
			ewrpt_CompareValueCustom = (CDate(v1) > CDate(v2))
			Exit Function
		End If
	ElseIf seq <> "" Then ' Custom sequence
		ar = Split(seq,"|")
		ewrpt_CompareValueCustom = (ewrpt_ArrayPos(ar,v1) > ewrpt_ArrayPos(ar,v2))
	End If
	ewrpt_CompareValueCustom = (v1 > v2)
End Function

Function ewrpt_ArrayPos(ar,v)
	Dim i
	ewrpt_ArrayPos = -1
	For i = 0 to UBound(ar)
		If CStr(ar(i)) = CStr(v) Then
			ewrpt_ArrayPos = i
			Exit For
		End If
	Next
End Function

'-------------------------------------------------------------------------------
' Function to Resize Array
Sub ewrpt_ResizeAr(ar, nx, ny)
	Dim ywrk
	If Not IsArray(ar) Then
		Redim ar(nx, ny-1)
	Else
		If UBound(ar, 1) = nx Then
			ywrk = UBound(ar, 2) + ny
			Redim Preserve ar(nx, ywrk)
		End If
	End If
End Sub

'-------------------------------------------------------------------------------
' Function to Load array from sql
Sub ewrpt_LoadArrayFromSql(sql, ar)
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	Dim rswrk, v
	If IsNull(sql) Or sql = "" Then Exit Sub
	Set rswrk = conn.Execute(sql)
	Do While Not rswrk.Eof
		v = ewrpt_GetValue(rswrk(0))
		If IsNull(v) Then
			v = EWRPT_NULL_VALUE
		ElseIf v = "" Then
			v = EWRPT_EMPTY_VALUE
		End If
		If Not IsArray(ar) Then
			Redim ar(0)
			ar(0) = v
		Else
			Redim Preserve ar(UBound(ar)+1)
			ar(UBound(ar)) = v
		End If
		rswrk.MoveNext
	Loop
	rswrk.Close
	Set rswrk = Nothing
End Sub

'-------------------------------------------------------------------------------
' Function to Match array
Function ewrpt_MatchedArray(ar1, ar2)
	ewrpt_MatchedArray = False
	If Not IsArray(ar1) And Not IsArray(ar2) Then
		ewrpt_MatchedArray = True
	ElseIf IsArray(ar1) And IsArray(ar2) Then
		ewrpt_MatchedArray = (Join(ar1, ",") = Join(ar2, ","))
	End If
End Function

'-------------------------------------------------------------------------------
' Function to Sort array
Sub ewrpt_SortArray(ar)
	Dim i, j, temp
	If IsArray(ar) Then
		For i = 0 to UBound(ar)-1
			For j = i+1 to UBound(ar)
				If ar(i) > ar(j) Then
					temp = ar(i)
					ar(i) = ar(j)
					ar(j) = temp
				End if
			Next
		Next
	End If
End Sub

' add db group field
Function ewrpt_AddDbGrpFld(dict, fldval, grpval)
	If Not IsObject(dict) Then Set dict = Server.CreateObject("Scripting.Dictionary")
	dict.Add fldval, grpval
End Function

' display elapsed time (in seconds)
Function ewrpt_CalcElapsedTime(tm)
	Dim endtime
	endtime = Timer
	ewrpt_CalcElapsedTime = "page processing time: " & FormatNumber((endtime - tm),2) & " seconds"
End Function

'-------------------------------------------------------------------------------
' Function to encode chart value
Function ewrpt_Encode(val)
	ewrpt_Encode = Replace(val, ",", "%2C") ' encode comma
End Function

'-------------------------------------------------------------------------------
' Function for debug
Sub ewrpt_Trace(aMsg)
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	Dim fso, ts
	Set fso = Server.Createobject("Scripting.FileSystemObject")
	Set ts = fso.OpenTextFile(Server.MapPath("debug.txt"), 8, True)
	ts.writeline(aMsg)
	ts.Close
	Set ts = Nothing
	Set fso = Nothing
End Sub

' ---------------------
'  Email class (begin)
'
Class crEmail

	' Class properties
	Dim Sender ' Sender
	Dim Recipient ' Recipient
	Dim Cc ' Cc
	Dim Bcc ' Bcc
	Dim Subject ' Subject
	Dim Format ' Format
	Dim Content ' Content
	Dim AttachmentFileName  ' Attachment file name
	Dim Charset ' Charset
	Dim SendErrNumber ' Send error number
	Dim SendErrDescription ' Send error description

	' Method to load email from template
	Public Sub Load(fn)
		Dim sWrk, sHeader, arrHeader
		Dim sName, sValue
		Dim i, j
		sWrk = ewrpt_LoadTxt(fn) ' Load text file content
		sWrk = Replace(sWrk, vbCrLf, vbLf) ' Convert to Lf
		sWrk = Replace(sWrk, vbCr, vbLf) ' Convert to Lf
		If sWrk <> "" Then

			' Locate Header & Mail Content
			i = InStr(sWrk, vbLf&vbLf)
			If i > 0 Then
				sHeader = Mid(sWrk, 1, i)
				Content = Mid(sWrk, i+2)
				arrHeader = Split(sHeader, vbLf)
				For j = 0 to UBound(arrHeader)
					i = InStr(arrHeader(j), ":")
					If i > 0 Then
						sName = Trim(Mid(arrHeader(j), 1, i-1))
						sValue = Trim(Mid(arrHeader(j), i+1))
						Select Case LCase(sName)
							Case "subject"
								Subject = sValue
							Case "from"
								Sender = sValue
							Case "to"
								Recipient = sValue
							Case "cc"
								Cc = sValue
							Case "bcc"
								Bcc = sValue
							Case "format"
								Format = sValue
						End Select
					End If
				Next
			End If
		End If
	End Sub

	' Method to replace sender
	Public Sub ReplaceSender(ASender)
		Sender = Replace(Sender, "<!--$From-->", ASender)
	End Sub

	' Method to replace recipient
	Public Sub ReplaceRecipient(ARecipient)
		Recipient = Replace(Recipient, "<!--$To-->", ARecipient)
	End Sub

	' Method to add Cc email
	Public Sub AddCc(ACc)
		If ACc <> "" Then
			If Cc <> "" Then Cc = Cc & ";"
			Cc = Cc & ACc
		End If
	End Sub

	' Method to add Bcc email
	Public Sub AddBcc(ABcc)
		If ABcc <> "" Then
			If Bcc <> "" Then Bcc = Bcc & ";"
			Bcc = Bcc & ABcc
		End If
	End Sub

	' Method to replace subject
	Public Sub ReplaceSubject(ASubject)
		Subject = Replace(Subject, "<!--$Subject-->", ASubject)
	End Sub

	' Method to replace content
	Public Sub ReplaceContent(Find, ReplaceWith)
		Content = Replace(Content, Find, ReplaceWith)
	End Sub

	' Method to send email
	Public Function Send
		Send = ewrpt_SendEmail(Sender, Recipient, Cc, Bcc, Subject, Content, AttachmentFileName, Format, Charset)
		If Not Send Then
			SendErrNumber = Hex(gsEmailErrNo) ' Send error number
			SendErrDescription = gsEmailErrDesc ' Send error description
		Else
			SendErrNumber = 0
			SendErrDescription = ""
		End If
	End Function

	' Show object as string
	Public Function AsString()
		AsString = "{" & _
			"Sender: " & Sender & ", " & _
			"Recipient: " & Recipient & ", " & _
			"Cc: " & Cc & ", " & _
			"Bcc: " & Bcc & ", " & _
			"Subject: " & Subject & ", " & _
			"Format: " & Format & ", " & _
			"Content: " & Content & ", " & _
			"AttachmentFileName: " & AttachmentFileName & ", " & _
			"Charset: " & Charset & _
			"}"
	End Function
End Class

'
'  Email class (end)
' -------------------
' Function to Send out Email
' Supports CDO, w3JMail and ASPEmail
Function ewrpt_SendEmail(sFrEmail, sToEmail, sCcEmail, sBccEmail, sSubject, sMail, sAttachmentFileName, sFormat, sCharset)
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	Dim i, objMail, sServerVersion, sIISVer, EmailComponent, arrEmail, sEmail
	Dim arCDO, arASPEmail, arw3JMail, arEmailComponent
	sServerVersion = Request.ServerVariables("SERVER_SOFTWARE")
	If InStr(sServerVersion, "Microsoft-IIS") > 0 Then
		i = InStr(sServerVersion, "/")
		If i > 0 Then
			sIISVer = Trim(Mid(sServerVersion, i+1))
		End If
	End If
	arw3JMail = Array("w3JMail", "JMail.Message")
	arASPEmail = Array("ASPEmail", "Persits.MailSender")
	If sIISVer < "5.0" Then ' NT using CDONTS
		arCDO = Array("CDO", "CDONTS.NewMail")
	Else ' 2000 / XP / 2003 using CDO
		arCDO = Array("CDO", "CDO.Message")
	End If

	' Change your precedence here
	arEmailComponent = Array(arCDO, arw3JMail, arASPEmail) ' Use CDO as default
	EmailComponent = ""
	For i = 0 to UBound(arEmailComponent)
		Err.Clear
		Set objMail = Server.CreateObject(arEmailComponent(i)(1))
		If Err.Number = 0 Then
			EmailComponent = arEmailComponent(i)(0)
			Exit For
		End If
	Next
	If EmailComponent = "" Then
		ewrpt_SendEmail = False
		Call ewrpt_Trace("email_err", "Unable to create email component. Error Number: " & Hex(Err.Number))
		Exit Function
	End If
	If EmailComponent = "w3JMail" Then

		' Set objMail = Server.CreateObject("JMail.Message")
		If sCharset <> "" Then objMail.Charset = sCharset
		objMail.Logging = True
		objMail.Silent = True
		objMail.From = sFrEmail
		arrEmail = Split(Replace(sToEmail, ",", ";"), ";")
		For i = 0 to UBound(arrEmail)
			sEmail = Trim(arrEmail(i))
			If sEmail <> "" Then
				objMail.AddRecipient sEmail
			End If
		Next
		arrEmail = Split(Replace(sCcEmail, ",", ";"), ";")
		For i = 0 to UBound(arrEmail)
			sEmail = Trim(arrEmail(i))
			If sEmail <> "" Then
				objMail.AddRecipientCC sEmail
			End If
		Next
		arrEmail = Split(Replace(sBccEmail, ",", ";"), ";")
		For i = 0 to UBound(arrEmail)
			sEmail = Trim(arrEmail(i))
			If sEmail <> "" Then
				objMail.AddRecipientBCC sEmail
			End If
		Next
		objMail.Subject = sSubject
		If LCase(sFormat) = "html" Then
			objMail.HTMLBody = sMail
		Else
			objMail.Body = sMail
		End If
		If sAttachmentFileName <> "" Then
			objMail.AddAttachment sAttachmentFileName
		End If
		If EWRPT_SMTP_SERVER_USERNAME <> "" And EWRPT_SMTP_SERVER_PASSWORD <> "" Then
			objMail.MailServerUserName = EWRPT_SMTP_SERVER_USERNAME
			objMail.MailServerPassword = EWRPT_SMTP_SERVER_PASSWORD
		End If
		ewrpt_SendEmail = objMail.Send(EWRPT_SMTP_SERVER)
		If Not ewrpt_SendEmail Then
			Err.Raise vbObjectError + 1, EmailComponent, objMail.Log
		End If
		Set objMail = nothing
	ElseIf EmailComponent = "ASPEmail" Then

		' Set objMail = Server.CreateObject("Persits.MailSender")
		If sCharset <> "" Then objMail.CharSet = sCharset
		objMail.From = sFrEmail
		arrEmail = Split(Replace(sToEmail, ",", ";"), ";")
		For i = 0 to UBound(arrEmail)
			sEmail = Trim(arrEmail(i))
			If sEmail <> "" Then
				objMail.AddAddress sEmail
			End If
		Next
		arrEmail = split(Replace(sCcEmail, ",", ";"), ";")
		For i = 0 to UBound(arrEmail)
			sEmail = Trim(arrEmail(i))
			If sEmail <> "" Then
				objMail.AddCC sEmail
			End If
		Next
		arrEmail = split(Replace(sBccEmail, ",", ";"), ";")
		For i = 0 to UBound(arrEmail)
			sEmail = Trim(arrEmail(i))
			If sEmail <> "" Then
				objMail.AddBcc sEmail
			End If
		Next
		If LCase(sFormat) = "html" Then
			objMail.IsHTML = True ' html
		Else
			objMail.IsHTML = False ' text
		End If
		objMail.Subject = sSubject
		objMail.Body = sMail
		objMail.Host = EWRPT_SMTP_SERVER
		If EWRPT_SMTP_SERVER_USERNAME <> "" And EWRPT_SMTP_SERVER_PASSWORD <> "" Then
			objMail.Username = EWRPT_SMTP_SERVER_USERNAME
			objMail.Password = EWRPT_SMTP_SERVER_PASSWORD
		End If
		If sAttachmentFileName <> "" Then
			objMail.AddAttachment sAttachmentFileName
		End If
		ewrpt_SendEmail = objMail.Send
		Set objMail = Nothing
	ElseIf EmailComponent = "CDO" Then
		Dim objConfig, sSmtpServer, iSmtpServerPort
		If sIISVer < "5.0" Then ' NT using CDONTS

			' Set objMail = Server.CreateObject("CDONTS.NewMail")
			'***If sCharset <> "" Then objMail.BodyPart.Charset = sCharset ' Do not support charset, ignore

			objMail.From = sFrEmail
			objMail.To = Replace(sToEmail, ",", ";")
			If sCcEmail <> "" Then
				objMail.Cc = Replace(sCcEmail, ",", ";")
			End If
			If sBccEmail <> "" Then
				objMail.Bcc = Replace(sBccEmail, ",", ";")
			End If
			If LCase(sFormat) = "html" Then
				objMail.BodyFormat = 0 ' 0 means HTML format, 1 means text
				objMail.MailFormat = 0 ' 0 means MIME, 1 means text
			End If
			objMail.Subject = sSubject
			objMail.Body = sMail
			If sAttachmentFileName <> "" Then
				objMail.AttachFile sAttachmentFileName
			End If
			objMail.Send
			Set objMail = Nothing
		Else ' 2000 / XP / 2003 using CDO

			' Set up Configuration
			Set objConfig = Server.CreateObject("CDO.Configuration")
			objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = EWRPT_SMTP_SERVER ' cdoSMTPServer
			objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = EWRPT_SMTP_SERVER_PORT ' cdoSMTPServerPort
			objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
			If EWRPT_SMTP_SERVER_USERNAME <> "" And EWRPT_SMTP_SERVER_PASSWORD <> "" Then
				objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'cdoBasic (clear text)
				objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = EWRPT_SMTP_SERVER_USERNAME
				objConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = EWRPT_SMTP_SERVER_PASSWORD
			End If
			objConfig.Fields.Update

			' Set up Mail
			'Set objMail = Server.CreateObject("CDO.Message")

			objMail.From = sFrEmail
			objMail.To = Replace(sToEmail, ",", ";")
			If sCcEmail <> "" Then
				objMail.Cc = Replace(sCcEmail, ",", ";")
			End If
			If sBccEmail <> "" Then
				objMail.Bcc = Replace(sBccEmail, ",", ";")
			End If
			If sCharset <> "" Then objMail.BodyPart.Charset = sCharset
			If LCase(sFormat) = "html" Then
				objMail.HtmlBody = sMail
				If sCharset <> "" Then objMail.HtmlBodyPart.Charset = sCharset
			Else
				objMail.TextBody = sMail
				If sCharset <> "" Then objMail.TextBodyPart.Charset = sCharset
			End If
			objMail.Subject = sSubject
			If sAttachmentFileName <> "" Then
				objMail.AddAttachment sAttachmentFileName
			End If
			If EWRPT_SMTP_SERVER <> "" And LCase(EWRPT_SMTP_SERVER) <> "localhost" Then
				Set objMail.Configuration = objConfig ' Use Configuration
				objMail.Send
			Else
				objMail.Send ' Send without Configuration
				If Err.Number <> 0 Then
					If Hex(Err.Number) = "80040220" Then ' Requires Configuration
						Set objMail.Configuration = objConfig
						Err.Clear
						objMail.Send
					End If
				End If
			End If
			Set objMail = Nothing
			Set objConfig = Nothing
		End If
		ewrpt_SendEmail = (Err.Number = 0)
	End If

	' Send email failed, write error to log
	If Not ewrpt_SendEmail Then
		gsEmailErrNo = Err.Number
		gsEmailErrDesc = Err.Description
		Call ewrpt_Trace("email_err", "***Send email failed***")
		Call ewrpt_Trace("email_err", "Email component: " & EmailComponent)
		Call ewrpt_Trace("email_err", "Error Number: " & Hex(gsEmailErrNo))
		Call ewrpt_Trace("email_err", "Error Description: " & gsEmailErrDesc)
		Call ewrpt_Trace("email_err", "From: " & sFrEmail)
		Call ewrpt_Trace("email_err", "To: " & sToEmail)
		Call ewrpt_Trace("email_err", "Cc: " & sCcEmail)
		Call ewrpt_Trace("email_err", "Bcc: " & sToEmail)
		Call ewrpt_Trace("email_err", "Subject: " & sSubject)
	End If
End Function

' Function to create numeric pager
Function ewrpt_NewNumericPager(FromIndex, PageSize, RecordCount, Range)
	Set ewrpt_NewNumericPager = New crNumericPager
	ewrpt_NewNumericPager.FromIndex = CLng(FromIndex)
	ewrpt_NewNumericPager.PageSize = CLng(PageSize)
	ewrpt_NewNumericPager.RecordCount = CLng(RecordCount)
	ewrpt_NewNumericPager.Range = CLng(Range)
	ewrpt_NewNumericPager.Init
End Function

' Function to create next prev pager
Function ewrpt_NewPrevNextPager(FromIndex, PageSize, RecordCount)
	Set ewrpt_NewPrevNextPager = New crPrevNextPager
	ewrpt_NewPrevNextPager.FromIndex = CLng(FromIndex)
	ewrpt_NewPrevNextPager.PageSize = CLng(PageSize)
	ewrpt_NewPrevNextPager.RecordCount = CLng(RecordCount)
	ewrpt_NewPrevNextPager.Init
End Function

' Class for Pager item
Class crPagerItem
	Dim Start, Text, Enabled
End Class

' Class for Numeric pager
Class crNumericPager
	Dim Items()
	Dim Count, FromIndex, ToIndex, RecordCount, PageSize, Range
	Dim FirstButton, PrevButton, NextButton, LastButton, ButtonCount
	Dim Visible

	' Class Initialize
	Private Sub Class_Initialize()
		Set FirstButton = New crPagerItem
		Set PrevButton = New crPagerItem
		Set NextButton = New crPagerItem
		Set LastButton = New crPagerItem
		Visible = True
	End Sub

	' Method to init pager
	Public Sub Init()
		If FromIndex > RecordCount Then FromIndex = RecordCount
		ToIndex = FromIndex + PageSize - 1
		If ToIndex > RecordCount Then ToIndex = RecordCount
		Count = -1
		ReDim Items(0)
		SetupNumericPager()
		Redim Preserve Items(Count)

		' Update button count
		ButtonCount = Count + 1
		If FirstButton.Enabled Then ButtonCount = ButtonCount + 1
		If PrevButton.Enabled Then ButtonCount = ButtonCount + 1
		If NextButton.Enabled Then ButtonCount = ButtonCount + 1
		If LastButton.Enabled Then ButtonCount = ButtonCount + 1
	End Sub

	' Add pager item
	Private Sub AddPagerItem(StartIndex, Text, Enabled)
		Count = Count + 1
		If Count > UBound(Items) Then
			Redim Preserve Items(UBound(Items)+10)
		End If
		Dim Item
		Set Item = New crPagerItem
		Item.Start = StartIndex
		Item.Text = Text
		Item.Enabled = Enabled
		Set Items(Count) = Item
	End Sub

	' Setup pager items
	Private Sub SetupNumericPager()
		Dim Eof, x, y, dx1, dx2, dy1, dy2, ny, HasPrev, TempIndex
		If RecordCount > PageSize Then
			Eof = (RecordCount < (FromIndex + PageSize))
			HasPrev = (FromIndex > 1)

			' First Button
			TempIndex = 1
			FirstButton.Start = TempIndex
			FirstButton.Enabled = (FromIndex > TempIndex)

			' Prev Button
			TempIndex = FromIndex - PageSize
			If TempIndex < 1 Then TempIndex = 1
			PrevButton.Start = TempIndex
			PrevButton.Enabled = HasPrev

			' Page links
			If HasPrev Or Not Eof Then
				x = 1
				y = 1
				dx1 = ((FromIndex-1)\(PageSize*Range))*PageSize*Range + 1
				dy1 = ((FromIndex-1)\(PageSize*Range))*Range + 1
				If (dx1+PageSize*Range-1) > RecordCount Then
					dx2 = (RecordCount\PageSize)*PageSize + 1
					dy2 = (RecordCount\PageSize) + 1
				Else
					dx2 = dx1 + PageSize*Range - 1
					dy2 = dy1 + Range - 1
				End If
				While x <= RecordCount
					If x >= dx1 And x <= dx2 Then
						Call AddPagerItem(x, y, FromIndex<>x)
						x = x + PageSize
						y = y + 1
					ElseIf x >= (dx1-PageSize*Range) And x <= (dx2+PageSize*Range) Then
						If x+Range*PageSize < RecordCount Then
							Call AddPagerItem(x, y & "-" & (y+Range-1), True)
						Else
							ny = (RecordCount-1)\PageSize + 1
							If ny = y Then
								Call AddPagerItem(x, y, True)
							Else
								Call AddPagerItem(x, y & "-" & ny, True)
							End If
						End If
						x = x + Range*PageSize
						y = y + Range
					Else
						x = x + Range*PageSize
						y = y + Range
					End If
				Wend
			End If

			' Next Button
			NextButton.Start = FromIndex + PageSize
			TempIndex = FromIndex + PageSize
			NextButton.Start = TempIndex
			NextButton.Enabled = Not Eof

			' Last Button
			TempIndex = ((RecordCount-1)\PageSize)*PageSize + 1
			LastButton.Start = TempIndex
			LastButton.Enabled = (FromIndex < TempIndex)
		End If
	End Sub

    ' Terminate
	Private Sub Class_Terminate()
		Set FirstButton = Nothing
		Set PrevButton = Nothing
		Set NextButton = Nothing
		Set LastButton = Nothing
		For Each Item In Items
			Set Item = Nothing
		Next
		Erase Items
	End Sub
End Class

' Class for PrevNext pager
Class crPrevNextPager
	Dim FirstButton, PrevButton, NextButton, LastButton
	Dim CurrentPage, PageSize, PageCount, FromIndex, ToIndex, RecordCount
	Dim Visible

	' Class Initialize
	Private Sub Class_Initialize()
		Set FirstButton = New crPagerItem
		Set PrevButton = New crPagerItem
		Set NextButton = New crPagerItem
		Set LastButton = New crPagerItem
		Visible = True
	End Sub

	' Method to init pager
	Public Sub Init()
		Dim TempIndex
		If PageSize > 0 Then
			CurrentPage = (FromIndex-1)\PageSize + 1
			PageCount = (RecordCount-1)\PageSize + 1
			If FromIndex > RecordCount Then FromIndex = RecordCount
			ToIndex = FromIndex + PageSize - 1
			If ToIndex > RecordCount Then ToIndex = RecordCount

			' First Button
			TempIndex = 1
			FirstButton.Start = TempIndex
			FirstButton.Enabled = (TempIndex <> FromIndex)

			' Prev Button
			TempIndex = FromIndex - PageSize
			If TempIndex < 1 Then TempIndex = 1
			PrevButton.Start = TempIndex
			PrevButton.Enabled = (TempIndex <> FromIndex)

			' Next Button
			TempIndex = FromIndex + PageSize
			If TempIndex > RecordCount Then TempIndex = FromIndex
			NextButton.Start = TempIndex
			NextButton.Enabled = (TempIndex <> FromIndex)

			' Last Button
			TempIndex = ((RecordCount-1)\PageSize)*PageSize + 1
			LastButton.Start = TempIndex
			LastButton.Enabled = (TempIndex <> FromIndex)
		End If
	End Sub

	' Terminate
	Private Sub Class_Terminate()
		Set FirstButton = Nothing
		Set PrevButton = Nothing
		Set NextButton = Nothing
		Set LastButton = Nothing
	End Sub
End Class

'
' Menu class
'
Class crMenu

	Public Id

	Public IsRoot

	Public NoItem

	Public ItemData

	' Init
	Private Sub Class_Initialize
		IsRoot = False
		NoItem = Null
		Set ItemData = Server.CreateObject("Scripting.Dictionary") ' Data type: array of cMenuItem
	End Sub

	' Terminate
	Private Sub Class_Terminate
		Set ItemData = Nothing
	End Sub

	' Create a menu item
	Function NewMenuItem(id, text, url, parentid, src, target, allowed)
		Set NewMenuItem = New crMenuItem
		NewMenuItem.Id = id
		NewMenuItem.Text = text
		NewMenuItem.Url = url
		NewMenuItem.ParentId = parentid
		NewMenuItem.Source = src
		NewMenuItem.Target = target
		NewMenuItem.Allowed = allowed
	End Function

	' Add a menu item
	Sub AddMenuItem(id, text, url, parentid, src, target, allowed)
		Dim item, oParentMenu
		Set item = NewMenuItem(id, text, url, parentid, src, target, allowed)
		If Not MenuItem_Adding(item) Then Exit Sub
		If item.ParentId < 0 Then
			AddItem(item)
		Else
			If FindItem(item.parentid, oParentMenu) Then
				oParentMenu.AddItem(item)
			End If
		End If
	End Sub

	' Add item to internal dictionary
	Sub AddItem(item)
		ItemData.Add ItemData.Count, item
	End Sub

	' Find item
	Function FindItem(id, out)
		Dim i, item
		FindItem = False
		For i = 0 To ItemData.Count - 1
			If ItemData.Item(i).Id = id Then
				Set out = ItemData.Item(i)
				FindItem = True
				Exit Function
			ElseIf Not IsNull(ItemData.Item(i).SubMenu) Then
				FindItem = ItemData.Item(i).SubMenu.FindItem(id, out)
			End If
		Next
	End Function

	' Check if a menu item should be shown
	Function RenderItem(item)
		Dim i, subitem
		If Not IsNull(item.SubMenu) Then
			For i = 0 To item.SubMenu.ItemData.Count - 1
				If item.SubMenu.RenderItem(item.SubMenu.ItemData.Item(i)) Then
					RenderItem = True
					Exit Function
				End If
			Next
		End If
		RenderItem = (item.Allowed And item.Url <> "")
	End Function

	' Check if this menu should be rendered
	Function RenderMenu()
		Dim i
		For i = 0 To ItemData.Count - 1
			If RenderItem(ItemData.Item(i)) Then
				RenderMenu = True
				Exit Function
			End If
		Next
		RenderMenu = False
	End Function

	' Render the menu
	Sub Render
		Dim i, item, itemcnt
		If Not RenderMenu() Then Exit Sub
		itemcnt = ItemData.Count
		Response.Write "<ul"
		If Id <> "" Then
			If IsNumeric(Id) Then
				Response.Write " id=""menu_" & Id & """"
			Else
				Response.Write " id=""" & Id & """"
			End If
		End If
		If IsRoot Then
			Response.Write " class=""" & EWRPT_MENUBAR_CLASSNAME & """"
		End If
		Response.Write ">" & vbCrLf
		For i = 0 to itemcnt - 1
			If RenderItem(ItemData.Item(i)) Then
				Response.Write "<li><a"
				If Not IsNull(ItemData.Item(i).SubMenu) Then
					Response.Write " class=""" & EWRPT_MENUBAR_SUBMENU_CLASSNAME & """"
				End If
				If ItemData.Item(i).Url <> "" Then
					Response.Write " href=""" & Server.HTMLEncode(ItemData.Item(i).Url) & """"
				End If
				If ItemData(i).Target <> "" Then
					Response.Write " target=""" & ItemData(i).Target & """"
				End If
				Response.Write ">" & ItemData.Item(i).Text & "</a>" & vbCrLf
				If Not IsNull(ItemData.Item(i).SubMenu) Then
					ItemData.Item(i).SubMenu.Render
				End If
				Response.Write "</li>" & vbCrLf
			End If
		Next
		Response.Write "</ul>" & vbCrLf
	End Sub
End Class

'
' Menu item class
'
Class crMenuItem

	Public Id

	Public Text

	Public Url

	Public ParentId

	Public Source

	Public Allowed

	Public Target

	Public SubMenu ' Data type = cMenu

	Private Sub Class_Initialize
		Url = ""
		SubMenu = Null
	End Sub

	Sub AddItem(item) ' Add submenu item
		If IsNull(SubMenu) Then
			Set SubMenu = New crMenu
			SubMenu.Id = Id
		End If
		SubMenu.AddItem(item)
	End Sub

	Function AsString
		AsString = "{ Id: " & Id & ", Text: " & Text & ", Url: " & Url & ", ParentId: " & ParentId & ", Source: " & Source & ", Allowed: " & Allowed
		If IsNull(SubMenu) Then
			AsString = AsString & ", SubMenu: (Null)"
		Else
			AsString = AsString & ", SubMenu: (Object)"
		End If
		AsString = AsString & " }" & "<br />"
	End Function
End Class

' Report MenuItem Adding event
Function MenuItem_Adding(Item)

	'Response.Write Item.AsString
	' Return False if menu item not allowed

	MenuItem_Adding = True
End Function

' Load email count
Function ewrpt_LoadEmailCount()

	' Read from log
	If EWRPT_EMAIL_WRITE_LOG Then
		Dim ip
		ip = Request.ServerVariables("REMOTE_ADDR")

		' Load from database
		If EWRPT_EMAIL_WRITE_LOG_TO_DATABASE Then
			Dim dt1, dt2, sEmailSql, rscnt
			dt1 = DateAdd("n", EWRPT_MAX_EMAIL_SENT_PERIOD*-1, Now)
			dt1 = ewrpt_FormatDateTimeSql(dt1)
			dt2 = ewrpt_FormatDateTimeSql(Now)
			sEmailSql = "SELECT COUNT(*) FROM " & ewrpt_QuotedName(EWRPT_EMAIL_LOG_TABLE_NAME) & _
				" WHERE " & ewrpt_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_DATETIME) & _
				" BETWEEN " & ewrpt_QuotedValue(dt1, EWRPT_DATATYPE_DATE) & " AND " & ewrpt_QuotedValue(dt2, EWRPT_DATATYPE_DATE) & _
				" AND " & ewrpt_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_IP) & _
				" = " & ewrpt_QuotedValue(ip, EWRPT_DATATYPE_STRING)
			Set rscnt = conn.Execute(sEmailSql)
			If Not rscnt.Eof Then
				Session(EWRPT_EXPORT_EMAIL_COUNTER) = rscnt(0)
			Else
				Session(EWRPT_EXPORT_EMAIL_COUNTER) = 0
			End If
			rscnt.Close
			Set rscnt = Nothing

		' Load from log file
		Else
			Dim fso, pfx, sTab, sFolder, key, randomkey, sFn, filename
			Dim filedata, arLines, line, cnt, i, arFlds
			pfx = "email"
			sTab = vbTab
			sFolder = EWRPT_UPLOAD_DEST_PATH
			key = Replace(ewrpt_FormatDateSql(Date), "-", "")
			randomkey = ewrpt_StrToHex(TEAencrypt(key, EWRPT_RANDOM_KEY))
			sFn = pfx & "_" & key & "_" & randomkey & ".txt"
			filename = ewrpt_UploadPathEx(True, sFolder) & sFn
			Set fso = Server.Createobject("Scripting.FileSystemObject")
			If fso.FileExists(filename) Then
				filedata = ewrpt_LoadFile(filename)
				arLines = Split(filedata, vbCrLf)
				cnt = 0
				For i = 0 to UBound(arLines)
					line = arLines(i)
					If line <> "" Then
						Dim dtwrk, ipwrk, senderwrk, recipientwrk, subjectwrk, messagewrk, timediff
						arFlds = Split(line, sTab)
						If UBound(arFlds) >= 5 Then
							dtwrk = arFlds(0)
							ipwrk = arFlds(1)
							senderwrk = arFlds(2)
							recipientwrk = arFlds(3)
							subjectwrk = arFlds(4)
							messagewrk = arFlds(5)
							If IsDate(dtwrk) Then
								timediff = DateDiff("n", CDate(dtwrk), Now)
								If ipwrk = ip And timediff < EWRPT_MAX_EMAIL_SENT_PERIOD Then cnt = cnt + 1
							End If
						End If
					End If
				Next
				Session(EWRPT_EXPORT_EMAIL_COUNTER) = cnt
			Else
				Session(EWRPT_EXPORT_EMAIL_COUNTER) = 0
			End If
			Set fso = Nothing
		End If
	End If
	If IsEmpty(Session(EWRPT_EXPORT_EMAIL_COUNTER)) Then
		Session(EWRPT_EXPORT_EMAIL_COUNTER) = 0
	End If
	ewrpt_LoadEmailCount = CLng(Session(EWRPT_EXPORT_EMAIL_COUNTER))
End Function

' Add email log
Sub ewrpt_AddEmailLog(sender, recipient, subject, message)
	Session(EWRPT_EXPORT_EMAIL_COUNTER) = Session(EWRPT_EXPORT_EMAIL_COUNTER) + 1

	' Save to email log
	If EWRPT_EMAIL_WRITE_LOG Then
		Dim dt, ip
		dt = ewrpt_FormatDateTimeSql(Now)
		ip = Request.ServerVariables("REMOTE_ADDR")
		senderwrk = ewrpt_TruncateText(sender)
		recipientwrk = ewrpt_TruncateText(recipient)
		subjectwrk = ewrpt_TruncateText(subject)
		messagewrk = ewrpt_TruncateText(message)

		' Save to database
		If EWRPT_EMAIL_WRITE_LOG_TO_DATABASE Then
			Dim sEmailSql
			sEmailSql = "INSERT INTO " & ewrpt_QuotedName(EWRPT_EMAIL_LOG_TABLE_NAME) & _
				" (" & ewrpt_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_DATETIME) & ", " & _
				ewrpt_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_IP) & ", " & _
				ewrpt_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_SENDER) & ", " & _
				ewrpt_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_RECIPIENT) & ", " & _
				ewrpt_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_SUBJECT) & ", " & _
				ewrpt_QuotedName(EWRPT_EMAIL_LOG_FIELD_NAME_MESSAGE) & ") VALUES (" & _
				ewrpt_QuotedValue(dt, EWRPT_DATATYPE_DATE) & ", " & _
				ewrpt_QuotedValue(ip, EWRPT_DATATYPE_STRING) & ", " & _
				ewrpt_QuotedValue(senderwrk, EWRPT_DATATYPE_STRING) & ", " & _
				ewrpt_QuotedValue(recipientwrk, EWRPT_DATATYPE_STRING) & ", " & _
				ewrpt_QuotedValue(subjectwrk, EWRPT_DATATYPE_STRING) & ", " & _
				ewrpt_QuotedValue(messagewrk, EWRPT_DATATYPE_STRING) & ")"
			conn.Execute(sEmailSql)

		' Save to log file
		Else
			Dim pfx, sTab, sHeader, sMsg, sFolder, key, randomkey, sFn, filename
			Dim fso, bWriteHeader, ts
			pfx = "email"
			sTab = vbTab
			sHeader = "date/time" & sTab & "ip" & sTab & "sender" & sTab & "recipient" & sTab & "subject" & sTab & "message"
			sMsg = dt & sTab & ip & sTab & senderwrk & sTab & recipientwrk & sTab & subjectwrk & sTab & messagewrk
			sFolder = EWRPT_UPLOAD_DEST_PATH
			key = Replace(ewrpt_FormatDateSql(Date), "-", "")
			randomkey = ewrpt_StrToHex(TEAencrypt(key, EWRPT_RANDOM_KEY))
			sFn = pfx & "_" & key & "_" & randomkey & ".txt"
			filename = ewrpt_UploadPathEx(True, sFolder) & sFn
			Set fso = Server.Createobject("Scripting.FileSystemObject")
			bWriteHeader = Not fso.FileExists(filename)
			Set ts = fso.OpenTextFile(filename, 8, True)
			If bWriteHeader Then
				ts.writeline(sHeader)
			End If
			ts.writeline(sMsg)
			ts.Close
			Set ts = Nothing
			Set fso = Nothing
		End If
	End If
End Sub

' Load file content (both ASCII and UTF-8)
Function ewrpt_LoadFile(FilePath)
	On Error Resume Next
	Dim fso
	ewrpt_LoadFile = ""
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	If fso.FileExists(FilePath) Then
		If ewrpt_GetFileCharset(FilePath) = "UTF-8" Then
			ewrpt_LoadFile = ewrpt_LoadUTF8File(FilePath)
		Else
			Dim iFile, iData
			Set iFile = fso.GetFile(FilePath)
			Set iData = iFile.OpenAsTextStream
			ewrpt_LoadFile = iData.ReadAll
			iData.Close
			Set iData = Nothing
			Set iFile = Nothing
		End If
	End If
	Set fso = Nothing
End Function

' Open UTF8 file
Function ewrpt_LoadUTF8File(FilePath)
	On Error Resume Next
	Dim objStream
	Set objStream = Server.CreateObject("ADODB.Stream")
	With objStream
		.Type = 2
		.Mode = 3
		.Open
		.CharSet = "UTF-8"
		.LoadFromFile FilePath
		ewrpt_LoadUTF8File = .ReadText
		.Close
	End With
End Function

' Get file charset (UTF-8 and UNICODE)
Function ewrpt_GetFileCharset(FilePath)
	On Error Resume Next
	Dim objStream, LoadBytes
	Set objStream = Server.CreateObject("ADODB.Stream")
	With objStream
		.Type = 1
		.Mode = 3
		.Open
		.LoadFromFile FilePath
		LoadBytes = .Read(3) ' Get first 3 bytes as BOM
		.Close
	End With
	Set objStream = Nothing
	Dim FileCharset, strFileHead

	' Get hex values
	strFileHead = ewrpt_BinToHex(LoadBytes)

	' UTF-8
	If strFileHead = "EFBBBF" Then
		ewrpt_GetFileCharset = "UTF-8" ' UTF-8
	Else
		ewrpt_GetFileCharset = "" ' Non UTF-8
	End If
End Function

' Get hex values
Function ewrpt_BinToHex(vStream)
	Dim reVal, i
	reVal = 0
	For i = 1 To LenB(vStream)
		reVal = reVal * 256 + AscB(MidB(vStream, i, 1))
	Next
	ewrpt_BinToHex = Hex(reVal)
End Function

' Get hex values
Function ewrpt_StrToHex(str)
	Dim wrk, i
	wrk = ""
	For i = 1 To Len(str)
		wrk = wrk & Hex(Asc(Mid(str, i, 1)))
	Next
	ewrpt_StrToHex = wrk
End Function

Function ewrpt_TruncateText(v)
	Dim maxlen, wrk
	maxlen = EWRPT_EMAIL_LOG_SIZE_LIMIT
	wrk = Replace(v, vbCrLf, " ")
	wrk = Replace(wrk, vbTab, " ")
	If Len(wrk) > maxlen Then
		wrk = Mid(wrk, 1, maxlen-3) & "..."
	End If
	ewrpt_TruncateText = v
End Function

' Read global debug message
Function ewrpt_DebugMsg()
	ewrpt_DebugMsg = ewrpt_IIf(gsDebugMsg <> "", "<p>" & gsDebugMsg & "</p>", "")
End Function

' Write global debug message
Sub ewrpt_SetDebugMsg(v)
	If Not EWRPT_DEBUG_ENABLED Then Exit Sub
	If gsDebugMsg <> "" Then
		gsDebugMsg = gsDebugMsg & "<br />"
	End If
	gsDebugMsg =  gsDebugMsg & v
End Sub

' Encode value for single-quoted JavaScript string
Function ewrpt_JsEncode(val)
	val = Replace(val & "", "\", "\\")
	val = Replace(val, "'", "\'")
	val = Replace(val, vbCrLf, "<br>")
	val = Replace(val, vbCr, "<br>")
	val = Replace(val, vbLf, "<br>")
	ewrpt_JsEncode = val
End Function

' Encode value for double-quoted Javascript string
Function ewrpt_JsEncode2(val)
	val = Replace(val & "", "\", "\\")
	val = Replace(val, """", "\""")
	val = Replace(val, vbCrLf, "<br>")
	val = Replace(val, vbCr, "<br>")
	val = Replace(val, vbLf, "<br>")
	ewrpt_JsEncode2 = val
End Function

' Get current page name
Function ewrpt_CurrentPage()
	ewrpt_CurrentPage = ewrpt_GetPageName(Request.ServerVariables("SCRIPT_NAME"))
End Function

' Get page name
Function ewrpt_GetPageName(url)
	If url <> "" Then
		ewrpt_GetPageName = url
		If InStr(ewrpt_GetPageName, "?") > 0 Then
			ewrpt_GetPageName = Mid(ewrpt_GetPageName, 1, InStr(ewrpt_GetPageName, "?")-1) ' Remove querystring first
		End If
		ewrpt_GetPageName = Mid(ewrpt_GetPageName, InStrRev(ewrpt_GetPageName, "/")+1) ' Remove path
	Else
		ewrpt_GetPageName = ""
	End If
End Function

' Adjust text for caption
Function ewrpt_BtnCaption(Caption)
	Dim Min, Pad
	Min = 10
	ewrpt_BtnCaption = Caption
	If Len(Caption) < Min Then
		Pad = Abs(Int((Min - Len(Caption))/2*-1))
		ewrpt_BtnCaption = String(Pad, " ") & Caption & String(Pad, " ")
	End If
End Function

' Create XML Dom object
Function ewrpt_CreateXmlDom()
	On Error Resume Next
	Dim ProgId
	ProgId = Array("MSXML2.DOMDocument", "Microsoft.XMLDOM") ' Add other ProgID here
	Dim i
	For i = 0 To UBound(ProgId)
		Set ewrpt_CreateXmlDom = Server.CreateObject(ProgId(i))
		If Err.Number = 0 Then Exit For
	Next
End Function

' Get full url
Function ewrpt_FullUrl()
	ewrpt_FullUrl = ewrpt_DomainUrl() & Request.ServerVariables("SCRIPT_NAME")
End Function

' Get domain url
Function ewrpt_DomainUrl()
	Dim sUrl, bSSL, sPort, defPort
	sUrl = "http"
	bSSL = LCase(Request.ServerVariables("HTTPS")) <> "off"
	sPort = Request.ServerVariables("SERVER_PORT")
	If bSSL Then defPort = "443" Else defPort = "80"
	If sPort = defPort Then sPort = "" Else sPort = ":" & sPort
	If bSSL Then sUrl = sUrl & "s"
	sUrl = sUrl & "://"
	sUrl = sUrl & Request.ServerVariables("SERVER_NAME") & sPort
	ewrpt_DomainUrl = sUrl
End Function 

' Get current url
Function ewrpt_CurrentUrl()
	Dim s, q
	s = Request.ServerVariables("SCRIPT_NAME")
	q = Request.ServerVariables("QUERY_STRING")
	If q <> "" Then s = s & "?" & q
	ewrpt_CurrentUrl = s
End Function

' Convert to full url
Function ewrpt_ConvertFullUrl(url)
	Dim sUrl
	If url = "" Then
		ewrpt_ConvertFullUrl = ""
	ElseIf Instr(url, "://") > 0 Then
		ewrpt_ConvertFullUrl = url
	Else
		sUrl = ewrpt_FullUrl
		ewrpt_ConvertFullUrl = Mid(sUrl, 1, InStrRev(sUrl, "/")) & url
	End If
End Function

' Load content at url using xmlhttp
Function ewrpt_LoadContentFromUrl(url)

	'On Error Resume Next
	Dim http
	Set http = Server.CreateObject("MSXML2.ServerXMLHTTP")
	http.setTimeouts 20000,20000,20000,30000
	http.Open "GET", url, False
	http.send
	ewrpt_LoadContentFromUrl = http.responseText
End Function

' Remove XSS
Function ewrpt_RemoveXSS(val)
	Dim regEx, search, ra, i, j, Found, val_before, pattern, replacement

	' Handle null value
	If IsNull(val) Then
		ewrpt_RemoveXSS = val
		Exit Function
	End If

	' Remove all non-printable characters. CR(0a) and LF(0b) and TAB(9) are allowed 
	' This prevents some character re-spacing such as <java\0script> 
	' Note that you have to handle splits with \n, \r, and \t later since they *are* allowed in some inputs

	Set regEx = New RegExp ' Create regular expression.
	regEx.IgnoreCase = True
	regEx.Global = True
	regEx.Pattern = "([\x00-\x08][\x0b-\x0c][\x0e-\x20])"
	val = regEx.Replace(val & "", "")

	' Straight replacements, the user should never need these since they're normal characters 
	' This prevents like <IMG SRC=&#X40&#X61&#X76&#X61&#X73&#X63&#X72&#X69&#X70&#X74&#X3A&#X61&#X6C&#X65&#X72&#X74&#X28&#X27&#X58&#X53&#X53&#X27&#X29> 

	search = "abcdefghijklmnopqrstuvwxyz"
	search = search & "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 
	search = search & "1234567890!@#$%^&*()" 
	search = search & "~`"";:?+/={}[]-_|'\"
	For i = 1 To Len(search)

		' ;? matches the ;, which is optional 
		' 0{0,7} matches any padded zeros, which are optional and go up to 8 chars 
		' &#x0040 @ search for the hex values

		regEx.Pattern = "(&#[x|X]0{0,8}" & Hex(Asc(Mid(search, i, 1))) & ";?)" ' With a ;
		val = regEx.Replace(val, Mid(search, i, 1))

		' &#00064 @ 0{0,7} matches '0' zero to seven times
		regEx.Pattern = "(&#0{0,8}" & Asc(Mid(search, i, 1)) & ";?)" ' With a ;
		val = regEx.Replace(val, Mid(search, i, 1))
	Next

	' Now the only remaining whitespace attacks are \t, \n, and \r 
	ra = EWRPT_XSS_ARRAY
	Found = True ' Keep replacing as long as the previous round replaced something 
	Do While Found
		val_before = val
		For i = 0 To UBound(ra)
			pattern = ""
			For j = 1 To Len(ra(i))
				If j > 1 Then
					pattern = pattern & "("
					pattern = pattern & "(&#[x|X]0{0,8}([9][a][b]);?)?"
					pattern = pattern & "|(&#0{0,8}([9][10][13]);?)?"
					pattern = pattern & ")?"
				End If
				pattern = pattern & Mid(ra(i), j, 1)
			Next
			replacement = Mid(ra(i), 1, 2) & "<x>" & Mid(ra(i), 3) ' Add in <> to nerf the tag
			regEx.Pattern = pattern
			val = regEx.Replace(val, replacement) ' Filter out the hex tags
			If val_before = val Then

				' No replacements were made, so exit the loop
				Found = False
			End If
		Next
	Loop
	ewrpt_RemoveXSS = val
End Function

' Return path of the uploaded file
'	Parameter: If PhyPath is true(1), return physical path on the server;
'	           If PhyPath is false(0), return relative URL
Function ewrpt_UploadPathEx(PhyPath, DestPath)
	Dim Pos
	If PhyPath Then
		ewrpt_UploadPathEx = Request.ServerVariables("APPL_PHYSICAL_PATH")
		ewrpt_UploadPathEx = ewrpt_IncludeTrailingDelimiter(ewrpt_UploadPathEx, PhyPath)
		ewrpt_UploadPathEx = ewrpt_PathCombine(ewrpt_UploadPathEx, Replace(DestPath, "/", "\"), PhyPath)
	Else
		ewrpt_UploadPathEx = Request.ServerVariables("APPL_MD_PATH")
		Pos = InStr(1, ewrpt_UploadPathEx, "Root", 1)
		If Pos > 0 Then	ewrpt_UploadPathEx = Mid(ewrpt_UploadPathEx, Pos+4)
		ewrpt_UploadPathEx = ewrpt_IncludeTrailingDelimiter(ewrpt_UploadPathEx, PhyPath)
		ewrpt_UploadPathEx = ewrpt_PathCombine(ewrpt_UploadPathEx, DestPath, PhyPath)
	End If
	ewrpt_UploadPathEx = ewrpt_IncludeTrailingDelimiter(ewrpt_UploadPathEx, PhyPath)
End Function

' Get path relative to application root
Function ewrpt_ServerMapPath(Path)
	ewrpt_ServerMapPath = ewrpt_PathCombine(Request.ServerVariables("APPL_PHYSICAL_PATH"), Path, True)
End Function

' Get path relative to a base path
Function ewrpt_PathCombine(ByVal BasePath, ByVal RelPath, ByVal PhyPath)
	Dim Path, Path2, p1, p2, Delimiter
	BasePath = ewrpt_RemoveTrailingDelimiter(BasePath, PhyPath)
	If PhyPath Then
		Delimiter = "\"
		RelPath = Replace(RelPath, "/", "\")
	Else
		Delimiter = "/"
		RelPath = Replace(RelPath, "\", "/")
	End If
	If RelPath = "." Or RelPath = ".." Then RelPath = RelPath & Delimiter
	p1 = InStr(RelPath, Delimiter)
	Path2 = ""
	While p1 > 0
		Path = Left(RelPath, p1)
		If Path = Delimiter Or Path = "." & Delimiter Then

			' Skip
		ElseIf Path = ".." & Delimiter Then
			p2 = InStrRev(BasePath, Delimiter)
			If p2 > 0 Then BasePath = Left(BasePath, p2-1)
		Else
			Path2 = Path2 & Path
		End If
		RelPath = Mid(RelPath, p1+1)
		p1 = InStr(RelPath, Delimiter)
	Wend
	ewrpt_PathCombine = ewrpt_IncludeTrailingDelimiter(BasePath, PhyPath) & Path2 & RelPath
End Function

' Remove the last delimiter for a path
Function ewrpt_RemoveTrailingDelimiter(ByVal Path, ByVal PhyPath)
	Dim Delimiter
	If PhyPath Then Delimiter = "\" Else Delimiter = "/"
	While Right(Path, 1) = Delimiter
		Path = Left(Path, Len(Path)-1)
	Wend
	ewrpt_RemoveTrailingDelimiter = Path
End Function

' Include the last delimiter for a path
Function ewrpt_IncludeTrailingDelimiter(ByVal Path, ByVal PhyPath)
	Dim Delimiter
	Path = ewrpt_RemoveTrailingDelimiter(Path, PhyPath)
	If PhyPath Then Delimiter = "\" Else Delimiter = "/"
	ewrpt_IncludeTrailingDelimiter = Path & Delimiter
End Function

' Create folder
Function ewrpt_CreateFolder(Folder)
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	ewrpt_CreateFolder = False
	Dim fso
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	If Not fso.FolderExists(Folder) Then
		If ewrpt_CreateFolder(fso.GetParentFolderName(Folder)) Then
			fso.CreateFolder(Folder)
			If Err.Number = 0 Then ewrpt_CreateFolder = True
		End If
	Else
		ewrpt_CreateFolder = True
	End If
	Set fso = Nothing
End Function

' Save data to file
Function ewrpt_SaveFile(folder, fn, filedata)
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	Dim oStream
	ewrpt_SaveFile = False
	If ewrpt_CreateFolder(folder) Then
		Set oStream = Server.CreateObject("ADODB.Stream")
		oStream.Type = 2 ' 2=adTypeText
		oStream.Open
		oStream.Charset = "UTF-8"
		oStream.WriteText = filedata
		oStream.SaveToFile folder & fn, 2 ' 2=adSaveCreateOverwrite
		oStream.Close
		Set oStream = Nothing
		If Err.Number = 0 Then ewrpt_SaveFile = True
	End If
End Function

' Set attribute
Sub ewrpt_SetAttr(Dict, AKey, AValue)
	If AValue = "" And Dict.Exists(AKey) Then
		Dict.Remove AKey
	ElseIf Dict.Exists(AKey) Then
		Dict.Item(AKey) = Trim(AValue & " " & Dict.Item(AKey))
	Else
		Dict.Add AKey, AValue
	End If
End Sub

' Get array position
Function ewrpt_GetArPos(Ar, Name)
	Dim i
	If IsArray(Ar) Then
		For i = 0 to UBound(Ar,2)
			If Ar(0,i) = Name Then
				ewrpt_GetArPos = i
				Exit Function
			End If
		Next
		i = UBound(Ar,2)+1
		ReDim Preserve Ar(1,i)
	Else
		i = 0
		ReDim Ar(1,i)
	End If
	ewrpt_GetArPos = i
End Function

' Set array value
Sub ewrpt_SetArVal(Ar, Name, Val)
	Dim idx, wrkname
	idx = ewrpt_GetArPos(Ar, Name)
	wrkname = Name
	If wrkname = "" Then wrkname = idx
	Ar(0,idx) = wrkname
	Ar(1,idx) = Val
End Sub

' Set array object
Sub ewrpt_SetArObj(Ar, Name, Obj)
	Dim idx, wrkname
	idx = ewrpt_GetArPos(Ar, Name)
	wrkname = Name
	If wrkname = "" Then wrkname = idx
	Ar(0,idx) = wrkname
	Set Ar(1,idx) = Obj
End Sub

' Generate random number
Function ewrpt_Random()
	Randomize()
	ewrpt_Random = ewrpt_ZeroPad(CLng(1000000 * Rnd()),6)
End Function
%>
<%

' Resize binary to thumbnail
Function ewrpt_ResizeBinary(filedata, width, height, interpolation)
	ewrpt_ResizeBinary = False ' No resize
End Function

' Resize file to thumbnail file
Function ewrpt_ResizeFile(fn, tn, width, height, interpolation)
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	Dim fso

	' Just copy across
	Set fso = Server.Createobject("Scripting.FileSystemObject")
	If fso.FileExists(fn) Then
		fso.CopyFile fn, tn, True
	End If
	Set fso = Nothing
	ewrpt_ResizeFile = True
End Function

' Resize file to binary
Function ewrpt_ResizeFileToBinary(fn, width, height, interpolation)
	If Not EWRPT_DEBUG_ENABLED Then On Error Resume Next
	Dim oStream, fso
	ewrpt_ResizeFileToBinary = Null

	' Return file content in binary
	Set fso = Server.Createobject("Scripting.FileSystemObject")
	If fso.FileExists(fn) Then
		Set oStream = Server.CreateObject("ADODB.Stream")
		oStream.Type = 1 ' 1=adTypeBinary
		oStream.Open
		oStream.LoadFromFile fn
		ewrpt_ResizeFileToBinary = oStream.Read
		oStream.Close
		Set oStream = Nothing
	End If
	Set fso = Nothing
End Function

' Save file by component
Function ewrpt_SaveFileByComponent(folder, fn, filedata)
	ewrpt_SaveFileByComponent = False
End Function
%>
<script language="JScript" runat="server">
// Server-side JScript functions for ASP Report Maker 3+ (Requires script engine 5.5.+)
EWRPT_RANDOM_KEY = 'Pb2K5CP9zynD150p';
function ew_Encode(str) {	
	return encodeURIComponent(str);
}
function ew_Decode(str) {	
	return decodeURIComponent(str);	
}
// JavaScript implementation of Block TEA by Chris Veness
// http://www.movable-type.co.uk/scripts/TEAblock.html
//
// TEAencrypt: Use Corrected Block TEA to encrypt plaintext using password
//            (note plaintext & password must be strings not string objects)
//
// Return encrypted text as string
//
function TEAencrypt(plaintext, password)
{
    if (plaintext.length == 0) return('');  // nothing to encrypt
    // 'escape' plaintext so chars outside ISO-8859-1 work in single-byte packing, but  
    // keep spaces as spaces (not '%20') so encrypted text doesn't grow too long, and 
    // convert result to longs
    var v = strToLongs(escape(plaintext).replace(/%20/g,' '));
    if (v.length == 1) v[1] = 0;  // algorithm doesn't work for n<2 so fudge by adding nulls
    var k = strToLongs(password.slice(0,16));  // simply convert first 16 chars of password as key
    var n = v.length;
    var z = v[n-1], y = v[0], delta = 0x9E3779B9;
    var mx, e, q = Math.floor(6 + 52/n), sum = 0;
    while (q-- > 0) {  // 6 + 52/n operations gives between 6 & 32 mixes on each word
        sum += delta;
        e = sum>>>2 & 3;
        for (var p = 0; p < n-1; p++) {
            y = v[p+1];
            mx = (z>>>5 ^ y<<2) + (y>>>3 ^ z<<4) ^ (sum^y) + (k[p&3 ^ e] ^ z)
            z = v[p] += mx;
        }
        y = v[0];
        mx = (z>>>5 ^ y<<2) + (y>>>3 ^ z<<4) ^ (sum^y) + (k[p&3 ^ e] ^ z)
        z = v[n-1] += mx;
    }
    // note use of >>> in place of >> due to lack of 'unsigned' type in JavaScript 
    return escCtrlCh(longsToStr(v));
}
//
// TEAdecrypt: Use Corrected Block TEA to decrypt ciphertext using password
//
function TEAdecrypt(ciphertext, password)
{
    if (ciphertext.length == 0) return('');
    var v = strToLongs(unescCtrlCh(ciphertext));
    var k = strToLongs(password.slice(0,16)); 
    var n = v.length;
    var z = v[n-1], y = v[0], delta = 0x9E3779B9;
    var mx, e, q = Math.floor(6 + 52/n), sum = q*delta;
    while (sum != 0) {
        e = sum>>>2 & 3;
        for (var p = n-1; p > 0; p--) {
            z = v[p-1];
            mx = (z>>>5 ^ y<<2) + (y>>>3 ^ z<<4) ^ (sum^y) + (k[p&3 ^ e] ^ z)
            y = v[p] -= mx;
        }
        z = v[n-1];
        mx = (z>>>5 ^ y<<2) + (y>>>3 ^ z<<4) ^ (sum^y) + (k[p&3 ^ e] ^ z)
        y = v[0] -= mx;
        sum -= delta;
    }
    var plaintext = longsToStr(v);
    // strip trailing null chars resulting from filling 4-char blocks:
    if (plaintext.search(/\0/) != -1) plaintext = plaintext.slice(0, plaintext.search(/\0/));
    return unescape(plaintext);
}
// supporting functions
function strToLongs(s) {  // convert string to array of longs, each containing 4 chars
    // note chars must be within ISO-8859-1 (with Unicode code-point < 256) to fit 4/long
    var l = new Array(Math.ceil(s.length/4))
    for (var i=0; i<l.length; i++) {
        // note little-endian encoding - endianness is irrelevant as long as 
        // it is the same in longsToStr() 
        l[i] = s.charCodeAt(i*4) + (s.charCodeAt(i*4+1)<<8) + 
               (s.charCodeAt(i*4+2)<<16) + (s.charCodeAt(i*4+3)<<24);
    }
    return l;  // note running off the end of the string generates nulls since 
}              // bitwise operators treat NaN as 0
function longsToStr(l) {  // convert array of longs back to string
    var a = new Array(l.length);
    for (var i=0; i<l.length; i++) {
        a[i] = String.fromCharCode(l[i] & 0xFF, l[i]>>>8 & 0xFF, 
                                   l[i]>>>16 & 0xFF, l[i]>>>24 & 0xFF);
    }
    return a.join('');  // use Array.join() rather than repeated string appends for efficiency
}
function escCtrlCh(str) {  // escape control chars which might cause problems with encrypted texts
    return str.replace(/[\0\n\v\f\r!]/g, function(c) { return '!' + c.charCodeAt(0) + '!'; });
}
function unescCtrlCh(str) {  // unescape potentially problematic nulls and control characters
    return str.replace(/!\d\d?!/g, function(c) { return String.fromCharCode(c.slice(1,-1)); });
}
</script>
<script language="JScript" src="ewvalidator.js" runat="server"></script>
