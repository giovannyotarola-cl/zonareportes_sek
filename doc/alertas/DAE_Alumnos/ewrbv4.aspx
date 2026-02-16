<%@ Page ClassName="ewrbv4" Language="VB" Inherits="AspNetReportMaker4_DAE_Alumnos" %>
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

	'
	' ASP.NET Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		Response.Cache.SetCacheability(HttpCacheability.NoCache)

		' Get resize parameters
		Dim width As Integer = 0
		Dim height As Integer = 0
		Dim interpolation As Integer
		Dim resize As Boolean = (ew_Get("resize") <> "")
		If ew_Get("width") <> "" Then
			width = ew_ConvertToInt(ew_Get("width"))
		End If
		If ew_Get("height") <> "" Then
			height = ew_ConvertToInt(ew_Get("height"))
		End If
		If width <= 0 AndAlso height <= 0 Then
			width = EWRPT_THUMBNAIL_DEFAULT_WIDTH
			height = EWRPT_THUMBNAIL_DEFAULT_HEIGHT
		End If
		If ew_Get("interpolation") <> "" Then
			interpolation = ew_ConvertToInt(ew_Get("interpolation"))
		Else
			interpolation = EWRPT_THUMBNAIL_DEFAULT_INTERPOLATION
		End If

		' Resize image from physical file
		If ew_NotEmpty(ew_Get("fn")) Then
			Dim fn As String = ew_Get("fn")
			fn = Server.MapPath(fn)
			If File.Exists(fn) Then
				Response.BinaryWrite(ewrpt_ResizeFileToBinary(fn, width, height, interpolation))
			End If
			Response.End()
		End If
	End Sub
</script>
