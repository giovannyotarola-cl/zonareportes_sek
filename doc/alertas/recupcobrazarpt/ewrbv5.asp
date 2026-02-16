<!--#include file="rptinc/ewrcfg5.asp"-->
<!--#include file="rptinc/ewrfn5.asp"-->
<%
Dim resize, width, height, interpolation
Response.Expires = 0
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "pragma", "no-cache"
Response.AddHeader "cache-control", "private, no-cache, no-store, must-revalidate"

' Get resize parameters
resize = Request.QueryString("resize").Count > 0
If Request.QueryString("width").Count > 0 Then
	width = Request.QueryString("width")
End If
If Request.QueryString("height").Count > 0 Then
	height = Request.QueryString("height")
End If
If Request.QueryString("width").Count <= 0 And Request.QueryString("height").Count <= 0 Then
	width = EWRPT_THUMBNAIL_DEFAULT_WIDTH
	height = EWRPT_THUMBNAIL_DEFAULT_HEIGHT
End If
If Request.QueryString("interpolation").Count > 0 Then
	interpolation = Request.QueryString("interpolation")
Else
	interpolation = EWRPT_THUMBNAIL_DEFAULT_INTERPOLATION
End If

' Resize image from physical file
If Request.QueryString("fn").Count > 0 Then
	Dim fso, fn
	fn = Request.QueryString("fn")
	fn = Server.MapPath(fn)
	Set fso = Server.Createobject("Scripting.FileSystemObject")
	If fso.FileExists(fn) Then
		Response.BinaryWrite ewrpt_ResizeFileToBinary(fn, width, height, interpolation)
	End If
	Set fso = Nothing
	Response.End
End If
%>
