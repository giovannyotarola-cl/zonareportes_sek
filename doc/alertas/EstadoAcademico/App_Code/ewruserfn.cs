using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.Common;
using System.Xml;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Reflection;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Globalization;
using Microsoft.VisualBasic;
using System.Data.SqlClient;

//
// ASP.NET Report Maker 4 - User Functions
// (C) 2010 e.World Technology Ltd.
//
public partial class AspNetReportMaker4_project1: System.Web.UI.Page
{

	// Global user functions
	// Filter for 'Last Month' (example)
	public string GetLastMonthFilter(string FldExpression) {
		DateTime lastmonth = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
		string sVal = lastmonth.ToString("yyyy|MM");
		string sWrk = FldExpression + " BETWEEN " +
			ew_QuotedValue(ewrpt_DateVal("month", sVal, 1), EWRPT_DATATYPE_DATE) +
			" AND " +
			ew_QuotedValue(ewrpt_DateVal("month", sVal, 2), EWRPT_DATATYPE_DATE);
		return sWrk;
	}

	// Filter for 'Starts With A' (example)
	public string GetStartsWithAFilter(string FldExpression) {
		return FldExpression + " LIKE 'A%'";
	}
}
