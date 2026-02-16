<%@ Page ClassName="ewrbv4" Language="C#" Inherits="AspNetReportMaker4_project1" %>
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

	//
	// ASP.NET Page_Load event
	//

	protected void Page_Load(object sender, System.EventArgs e)
	{
		Response.Cache.SetCacheability(HttpCacheability.NoCache);

		// Get resize parameters
		int width = 0;
		int height = 0;
		int interpolation;
		bool resize = (ew_Get("resize") != "");
		if (ew_Get("width") != "")
			width = ew_ConvertToInt(ew_Get("width"));
		if (ew_Get("height") != "")
			height = ew_ConvertToInt(ew_Get("height"));
		if (width <= 0 && height <= 0)	{
			width = EWRPT_THUMBNAIL_DEFAULT_WIDTH;
			height = EWRPT_THUMBNAIL_DEFAULT_HEIGHT;
		}
		if (ew_Get("interpolation") != "") {
			interpolation = ew_ConvertToInt(ew_Get("interpolation"));
		}	else {
			interpolation = EWRPT_THUMBNAIL_DEFAULT_INTERPOLATION;
		}

		// Resize image from physical file
		if (ew_NotEmpty(ew_Get("fn"))) {
			string fn = ew_Get("fn");
			fn = Server.MapPath(fn);
			if (File.Exists(fn))
				Response.BinaryWrite(ewrpt_ResizeFileToBinary(fn, ref width, ref height, interpolation));
			Response.End();
		}
	}
</script>
