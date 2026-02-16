<%@ CodePage=65001 %>
<% Option Explicit %>
<%
'Const EW_REPORT_HIDE_EMPTY_SERIES = False ' Changed to True to hide empty series for series chart
Const EW_REPORT_CHART_SHOW_BLANK_SERIES = True ' Changed to False to hide empty series for series chart

Dim Xml
Xml = (Request.QueryString("text") = "")

' default use utf-8
Response.CharSet = "utf-8"
If Xml Then
	Response.ContentType = "text/xml"
Else
	Response.ContentType = "text/plain"
End If

' No cache
Response.Expires = 0
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "pragma", "no-cache"
Response.AddHeader "cache-control", "private, no-cache, no-store, must-revalidate"

Dim cht_id, cht_type, cht_series
Dim cht_alpha, cht_colorpalette
Dim cht_yaxisminvalue, cht_yaxismaxvalue
Dim cht_decimalprecision
Dim cht_shownames
Dim cht_showvalues
Dim cht_showhovercap

' Get chart id
cht_id = Request.QueryString("id")

' Get chart configuration from Session
Dim cht_parms
cht_parms = Session(cht_id & "_parms")
Dim cht_trends
cht_trends = Session(cht_id & "_trends")

' Initialize default values

' Chart caption
Call SetupChartParm("caption", "Chart")

' Show names/values/hover
Call SetupChartParm("shownames", "1") ' Default show names
Call SetupChartParm("showvalues", "1") ' Default show values
Call SetupChartParm("showhover", "1") ' Default show hover

' Get chart type
cht_type = LoadParm("type")
If CLng(cht_type) >= 9 Then cht_series = 1 ' Multi series charts

' Get shownames/showvalues/showhovercap
cht_shownames = LoadParm("shownames")
cht_showvalues = LoadParm("showvalues")
cht_showhovercap = LoadParm("showhovercap")

' Format percent for Pie charts
Dim cht_showPercentageValues, cht_showPercentageInLabel
cht_showPercentageValues = LoadParm("showPercentageValues")
cht_showPercentageInLabel = LoadParm("showPercentageInLabel")
If cht_type = 2 Or cht_type = 6 Or cht_type = 8 Then
	If (cht_showhovercap = "1" And cht_showPercentageValues = "1") Or _
	(cht_showvalues = "1" And cht_showPercentageInLabel = "1") Then
		Call SetupChartParm("formatNumber", "1")
		Call SaveParm("formatNumber", "1")
	End If
End If

' Get chart alpha & color pallette
cht_alpha = LoadParm("alpha")
cht_colorpalette = LoadParm("colorpalette")

' Get decimal precision
cht_decimalprecision = LoadParm("decimalPrecision")

Dim sChartContent
sChartContent = ChartXml(cht_id)

' Write BOM
Response.BinaryWrite ChrB(239) & ChrB(187) & ChrB(191)

' Write utf-8 encoding
If Xml Then Response.Write "<?xml version=""1.0"" encoding=""utf-8"" ?>"

' Write content
Response.Write sChartContent

' Set up default chart parm
Sub SetupChartParm(key, value)
	Dim parm
	If IsArray(cht_parms) Then
		parm = LoadParm(key)
		If IsNull(parm) Then
			Dim nParms
			nParms = UBound(cht_parms,2)
			nParms = nParms + 1
			Redim Preserve cht_parms(2,nParms)
			cht_parms(0,nParms) = key
			cht_parms(1,nParms) = value
			cht_parms(2,nParms) = True
		ElseIf parm = "" Then
			Call SaveParm(key, value)
		End If
	End If
End Sub

' Load chart parm
Function LoadParm(key)
	Dim i, arVal
	If IsArray(cht_parms) Then
		For i = 0 to UBound(cht_parms,2)
			If LCase(cht_parms(0,i)) = LCase(key) Then
				LoadParm = cht_parms(1,i)
				Exit Function
			End If
		Next
	End If
	LoadParm = Null
End Function

' Save chart parm
Sub SaveParm(key, value)
	Dim i, arVal
	If IsArray(cht_parms) Then
		For i = 0 to UBound(cht_parms,2)
			If LCase(cht_parms(0,i)) = LCase(key) Then
				cht_parms(1,i) = value
				Exit Sub
			End If
		Next
	End If
End Sub

Function ChartXml(id)
	Dim wrk, chartseries, chartcats, chartdata, i, j, k, maxval
	Dim name, val, color, alpha, link

	chartseries = Session(id & "_series") ' Load chart series from Session
	chartdata = Session(id & "_data") ' Load chart data from Session

	If IsArray(chartdata) Then
		If UBound(chartdata,1) = 2 Then
			wrk = ChartHeader(1) ' Get chart header

			If cht_series = 1 Then ' Multi series

				' Get series names
				Dim nCat, nSeries
				If IsArray(chartseries) Then
					nSeries = UBound(chartseries)+1
				Else
					nSeries = 0
				End If

				' Write cat
				wrk = wrk & ChartCatHeader(1)
				Dim lastname
				ReDim chartcats(0)
				lastname = chartdata(0,0) ' Get first entry
				chartcats(0) = lastname
				wrk = wrk & ChartCatContent(lastname)
				For i = 0 to UBound(chartdata,2)
					name = chartdata(0,i)
					If (name <> lastname) Then
						wrk = wrk & ChartCatContent(name)
						ReDim Preserve chartcats(UBound(chartcats)+1)
						chartcats(UBound(chartcats)) = name
						lastname = name
					End If
				Next
				wrk = wrk & ChartCatHeader(2)
				nCat = UBound(chartcats)+1

				' Write series
				For i = 0 to nSeries-1
					name = chartseries(i)
					If IsNull(name) Then
						name = "(Null)"
					ElseIf name = "" Then
						name = "(Empty)"
					End If
					color = GetPaletteColor(i)

					Dim bShowSeries, serieswrk
					bShowSeries = EW_REPORT_CHART_SHOW_BLANK_SERIES
					serieswrk = ChartSeriesHeader(1, name, color, cht_alpha)
					For j = 0 to nCat-1
						val = 0
						For k = 0 to UBound(chartdata,2)
							If chartdata(0,k) = chartcats(j) And chartdata(1,k) = chartseries(i) Then
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
					serieswrk = serieswrk & ChartSeriesHeader(2, name, color, cht_alpha)
					If bShowSeries Then
						wrk = wrk & serieswrk
					End If

				Next

			Else ' Single series

				For i = 0 to UBound(chartdata,2)
					name = chartdata(0,i)
					If IsNull(name) Then
						name = "(Null)"
					ElseIf name = "" Then
						name = "(Empty)"
					End If
					color = GetPaletteColor(i)
					If chartdata(1,i) <> "" Then name = name & ", " & chartdata(1,i)
					val = chartdata(2,i)
					If IsNull(val) Then
						val = 0
					Else
						val = CDbl(val)
					End If
					wrk = wrk & ChartContent(name, val, color, cht_alpha, link) ' Get chart content
				Next

			End If

			' Get trend lines
			wrk = wrk & ChartTrendLines

			' Get chart footer
			wrk = wrk & ChartHeader(2)

		End If
	End If

	ChartXml = wrk
' Call Trace(ChartXml)

End Function

Function GetPaletteColor(i)
	Dim arColor
	arColor = Split(cht_colorpalette, "|")
	GetPaletteColor = arColor(i Mod (UBound(arColor)+1))
End Function

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

Function ChartHeader(typ)
	Dim wrk, i, arVal, key, value
	If typ = 1 Then
		wrk = "<graph"
		If IsArray(cht_parms) Then
			For i = 0 to UBound(cht_parms,2)
				If cht_parms(2,i) Then
					Call WriteAtt(wrk, cht_parms(0,i), Decode(cht_parms(1,i)))
				End If
			Next
		End If
		wrk = wrk & ">"
	Else
		wrk = "</graph>"
	End If
	ChartHeader = wrk
End Function

' Get TrendLine XML
' <trendlines>
'    <line startvalue='0.8' displayValue='Good' color='FF0000' thickness='1' isTrendZone='0'/>
'    <line startvalue='-0.4' displayValue='Bad' color='009999' thickness='1' isTrendZone='0'/>
' </trendlines>
Function ChartTrendLines()
	Dim wrk, i
	wrk = ""
	If IsArray(cht_trends) Then
		For i = 1 to UBound(cht_trends,2)
			wrk = wrk & "<trendlines>"

			' Get all trend lines
			wrk = wrk & ChartTrendLine(cht_trends(0,i), cht_trends(1,i), cht_trends(2,i), cht_trends(3,i), _
				cht_trends(4,i), cht_trends(5,i), cht_trends(6,i), cht_trends(7,i))

			wrk = wrk & "</trendlines>"
		Next
	End If
	ChartTrendLines = wrk
End Function

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
	wrk = wrk & " " & "/>"
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
	wrk = wrk & " " & "/>"
	ChartCatContent = wrk
End Function

' Series header/footer XML (multi series)
Function ChartSeriesHeader(typ, name, color, alpha)
	Dim wrk
	If typ = 1 Then
		wrk = "<dataset"
		Call WriteAtt(wrk, "seriesname", name)
		Call WriteAtt(wrk, "color", ColorCode(color))
		Call WriteAtt(wrk, "alpha", alpha)
		wrk = wrk & " " & ">"
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
	wrk = wrk & " " & "/>"
	ChartSeriesContent = wrk
End Function

' Chart content XML
Function ChartContent(name, val, color, alpha, lnk)
	Dim wrk
	wrk = "<set"
	Call WriteAtt(wrk, "name", name)
	Call WriteAtt(wrk, "value", ChartFormatNumber(val))
	Call WriteAtt(wrk, "color", ColorCode(color))
	Call WriteAtt(wrk, "hoverText", name)
	Call WriteAtt(wrk, "alpha", alpha)
	Call WriteAtt(wrk, "link", lnk)
	If cht_shownames = "1" Then
		Call WriteAtt(wrk, "showName", "1")
	End If
	wrk = wrk & " " & "/>"
	ChartContent = wrk
End Function

' Format number for chart
Function ChartFormatNumber(v)
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

' Decode the original value
Function Decode(src)
	Decode = Replace(src, "%2C", ",")
End Function

' Function for debug
Sub Trace(aMsg)
	On Error Resume Next
	Dim fso, ts
	Set fso = Server.Createobject("Scripting.FileSystemObject")
	Set ts = fso.OpenTextFile(Server.MapPath("debug.txt"), 8, True)
	ts.writeline(aMsg)
	ts.Close
	Set ts = Nothing
	Set fso = Nothing
End Sub
%>