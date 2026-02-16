<%@ Page ClassName="Alumnos_Tituladossmry" Language="C#" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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

	// Table object
	public crAlumnos_Titulados Alumnos_Titulados = null;

	//
	// Table class (for Alumnos Titulados)
	//
	public class crAlumnos_Titulados : AspNetReportMakerBase {

		public bool ShowCurrentFilter = EWRPT_SHOW_CURRENT_FILTER;

		public int FilterPanelOption = EWRPT_FILTER_PANEL_OPTION;

		public string CurrentOrder = ""; // Current order

		public string CurrentOrderType = ""; // Current order type

		// Define table level constants
		public bool UseTokenInUrl = EWRPT_USE_TOKEN_IN_URL;

		// Table variable
		public string TableVar {
			get { return "Alumnos_Titulados"; }
		}

		// Table name
		public string TableName {
			get { return "Alumnos Titulados"; }
		}

		// Table type
		public string TableType {
			get {	return "REPORT"; }
		}

		// Table caption
		public string TableCaption() {
			return ReportLanguage.TablePhrase(TableVar, "TblCaption");
		}

		// Session Group Per Page
		public int GroupPerPage {
			get {
				return ew_ConvertToInt(ew_Session[EWRPT_PROJECT_NAME + "_" + TableVar + "_grpperpage"]);
			}
			set {
				ew_Session[EWRPT_PROJECT_NAME + "_" + TableVar + "_grpperpage"] = value;
			}
		}

		// Session Start Group
		public int StartGroup {
			get {
				return ew_ConvertToInt(ew_Session[EWRPT_PROJECT_NAME + "_" + TableVar + "_start"]);
			}
			set {
				ew_Session[EWRPT_PROJECT_NAME + "_" + TableVar + "_start"] = value;
			}
		}

		// Session Order By
		public string OrderBy {
			get {
				return Convert.ToString(ew_Session[EWRPT_PROJECT_NAME + "_" + TableVar + "_orderby"]);
			}
			set {
				ew_Session[EWRPT_PROJECT_NAME + "_" + TableVar + "_orderby"] = value;
			}
		}

		public Dictionary<string, crField> Fields = new Dictionary<string, crField>();

		public crField CODCLI;

		public crField DIG;

		public crField PATERNO;

		public crField MATERNO;

		public crField NOMBRE;

		public crField SEXO;

		public crField FECNAC;

		public crField NACIONALIDAD;

		public crField NOMBRE_C;

		public crField JORNADA;

		public crField FECHASITU;

		public crField ANO;

		public crField PERIODO;

		public crField ANOEGRE;

		public crField PERIODOEGRE;

		public string Export = ""; // Export

		public bool ExportAll = true;

		public int RowType; // Row type

		public int RowTotalType; // Row total type

		public int RowTotalSubType; // Row total subtype

		public int RowGroupLevel; // Row group level

		public Hashtable RowAttrs = new Hashtable(); // Row attributes

		// Reset CSS styles for table object
		public void ResetCSS() {
	    RowAttrs["style"] = "";
			RowAttrs["class"] = "";
			foreach (KeyValuePair<string, crField> fld in Fields)
				fld.Value.ResetCSS();
		}

		//
		// Table class constructor
		//		
		public crAlumnos_Titulados(AspNetReportMakerPage APage) {
			m_Page = APage;
			m_ParentPage = APage.ParentPage;

			// CODCLI
			CODCLI = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_CODCLI", "CODCLI", "[CODCLI]", 200, EWRPT_DATATYPE_STRING, -1);
			CODCLI.Page = APage;
			CODCLI.ParentPage = APage.ParentPage;
			Fields.Add("CODCLI", CODCLI);
			CODCLI.DateFilter = "";
			CODCLI.SqlSelect = "";
			CODCLI.SqlOrderBy = "";

			// DIG
			DIG = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_DIG", "DIG", "[DIG]", 200, EWRPT_DATATYPE_STRING, -1);
			DIG.Page = APage;
			DIG.ParentPage = APage.ParentPage;
			Fields.Add("DIG", DIG);
			DIG.DateFilter = "";
			DIG.SqlSelect = "";
			DIG.SqlOrderBy = "";

			// PATERNO
			PATERNO = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1);
			PATERNO.Page = APage;
			PATERNO.ParentPage = APage.ParentPage;
			Fields.Add("PATERNO", PATERNO);
			PATERNO.DateFilter = "";
			PATERNO.SqlSelect = "";
			PATERNO.SqlOrderBy = "";

			// MATERNO
			MATERNO = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1);
			MATERNO.Page = APage;
			MATERNO.ParentPage = APage.ParentPage;
			Fields.Add("MATERNO", MATERNO);
			MATERNO.DateFilter = "";
			MATERNO.SqlSelect = "";
			MATERNO.SqlOrderBy = "";

			// NOMBRE
			NOMBRE = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1);
			NOMBRE.Page = APage;
			NOMBRE.ParentPage = APage.ParentPage;
			Fields.Add("NOMBRE", NOMBRE);
			NOMBRE.DateFilter = "";
			NOMBRE.SqlSelect = "";
			NOMBRE.SqlOrderBy = "";

			// SEXO
			SEXO = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_SEXO", "SEXO", "[SEXO]", 200, EWRPT_DATATYPE_STRING, -1);
			SEXO.Page = APage;
			SEXO.ParentPage = APage.ParentPage;
			Fields.Add("SEXO", SEXO);
			SEXO.DateFilter = "";
			SEXO.SqlSelect = "";
			SEXO.SqlOrderBy = "";

			// FECNAC
			FECNAC = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_FECNAC", "FECNAC", "[FECNAC]", 135, EWRPT_DATATYPE_DATE, 7);
			FECNAC.Page = APage;
			FECNAC.ParentPage = APage.ParentPage;
			FECNAC.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/");
			Fields.Add("FECNAC", FECNAC);
			FECNAC.DateFilter = "";
			FECNAC.SqlSelect = "";
			FECNAC.SqlOrderBy = "";

			// NACIONALIDAD
			NACIONALIDAD = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_NACIONALIDAD", "NACIONALIDAD", "[NACIONALIDAD]", 200, EWRPT_DATATYPE_STRING, -1);
			NACIONALIDAD.Page = APage;
			NACIONALIDAD.ParentPage = APage.ParentPage;
			Fields.Add("NACIONALIDAD", NACIONALIDAD);
			NACIONALIDAD.DateFilter = "";
			NACIONALIDAD.SqlSelect = "";
			NACIONALIDAD.SqlOrderBy = "";

			// NOMBRE_C
			NOMBRE_C = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1);
			NOMBRE_C.Page = APage;
			NOMBRE_C.ParentPage = APage.ParentPage;
			Fields.Add("NOMBRE_C", NOMBRE_C);
			NOMBRE_C.DateFilter = "";
			NOMBRE_C.SqlSelect = "";
			NOMBRE_C.SqlOrderBy = "";

			// JORNADA
			JORNADA = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1);
			JORNADA.Page = APage;
			JORNADA.ParentPage = APage.ParentPage;
			Fields.Add("JORNADA", JORNADA);
			JORNADA.DateFilter = "";
			JORNADA.SqlSelect = "";
			JORNADA.SqlOrderBy = "";

			// FECHASITU
			FECHASITU = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_FECHASITU", "FECHASITU", "[FECHASITU]", 135, EWRPT_DATATYPE_DATE, 7);
			FECHASITU.Page = APage;
			FECHASITU.ParentPage = APage.ParentPage;
			FECHASITU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectDateDMY").Replace("%s", "/");
			Fields.Add("FECHASITU", FECHASITU);
			FECHASITU.DateFilter = "";
			FECHASITU.SqlSelect = "";
			FECHASITU.SqlOrderBy = "";

			// ANO
			ANO = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_ANO", "ANO", "[ANO]", 131, EWRPT_DATATYPE_NUMBER, -1);
			ANO.Page = APage;
			ANO.ParentPage = APage.ParentPage;
			ANO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat");
			Fields.Add("ANO", ANO);
			ANO.DateFilter = "";
			ANO.SqlSelect = "";
			ANO.SqlOrderBy = "";

			// PERIODO
			PERIODO = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_PERIODO", "PERIODO", "[PERIODO]", 200, EWRPT_DATATYPE_STRING, -1);
			PERIODO.Page = APage;
			PERIODO.ParentPage = APage.ParentPage;
			Fields.Add("PERIODO", PERIODO);
			PERIODO.DateFilter = "";
			PERIODO.SqlSelect = "";
			PERIODO.SqlOrderBy = "";

			// ANOEGRE
			ANOEGRE = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_ANOEGRE", "ANOEGRE", "[ANOEGRE]", 3, EWRPT_DATATYPE_NUMBER, -1);
			ANOEGRE.Page = APage;
			ANOEGRE.ParentPage = APage.ParentPage;
			ANOEGRE.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger");
			Fields.Add("ANOEGRE", ANOEGRE);
			ANOEGRE.DateFilter = "";
			ANOEGRE.SqlSelect = "";
			ANOEGRE.SqlOrderBy = "";

			// PERIODOEGRE
			PERIODOEGRE = new crField("Alumnos_Titulados", "Alumnos Titulados", "x_PERIODOEGRE", "PERIODOEGRE", "[PERIODOEGRE]", 3, EWRPT_DATATYPE_NUMBER, -1);
			PERIODOEGRE.Page = APage;
			PERIODOEGRE.ParentPage = APage.ParentPage;
			PERIODOEGRE.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectInteger");
			Fields.Add("PERIODOEGRE", PERIODOEGRE);
			PERIODOEGRE.DateFilter = "";
			PERIODOEGRE.SqlSelect = "";
			PERIODOEGRE.SqlOrderBy = "";
		}

		// Single column sort
		public void UpdateSort(crField ofld) {
			if (CurrentOrder == ofld.FldName) {
				string sLastSort = ofld.Sort;
				string sThisSort;
				if (CurrentOrderType == "ASC" || CurrentOrderType == "DESC") {
					sThisSort = CurrentOrderType;
				} else {
					sThisSort = (sLastSort == "ASC") ? "DESC" : "ASC";
				}
				ofld.Sort = sThisSort;
			} else {
				if (ofld.GroupingFieldId == 0) ofld.Sort = "";
			}
		}

		// Get Sort SQL
		public string SortSql() {
			string sDtlSortSql = "";
			List<string> argrps = new List<string>();
			foreach (KeyValuePair<string, crField> field in Fields) {
				crField fld = field.Value;
				if (ew_NotEmpty(fld.Sort)) {
					if (fld.GroupingFieldId > 0) {
						if (ew_NotEmpty(fld.FldGroupSql))
							argrps.Add(fld.FldGroupSql.Replace("%s", fld.FldExpression) + " " + fld.Sort);
						else
							argrps.Add(fld.FldExpression + " " + fld.Sort);
					} else {
						if (ew_NotEmpty(sDtlSortSql)) sDtlSortSql += ", ";
						sDtlSortSql += fld.FldExpression + " " + fld.Sort;
					}
				}
			}
			string sSortSql = "";
			foreach (string grp in argrps) {
				if (ew_NotEmpty(sSortSql)) sSortSql += ", ";
				sSortSql += grp;
			}
			if (ew_NotEmpty(sDtlSortSql)) {
				if (ew_NotEmpty(sSortSql)) sSortSql += ", ";
				sSortSql += sDtlSortSql;
			}
			return sSortSql;
		}

		// Table level SQL
		public string SqlFrom { // From
			get {return "[SEK_V_Titulados_SIES]";}
		}

		public string SqlSelect { // Select
			get {return "SELECT * FROM " + SqlFrom;}
		}

		public string SqlWhere { // Where
			get {return "";}
		}

		public string SqlGroupBy { // Group By
			get {return "";}
		}

		public string SqlHaving { // Having
			get {return "";}
		}

		public string SqlOrderBy { // Order By
			get {return "";}
		}

		// Table Level Group SQL
		public string SqlFirstGroupField {
			get {return "";}
		}

		public string SqlSelectGroup {
			get {return "SELECT DISTINCT " + SqlFirstGroupField + " FROM " + SqlFrom;}
		}

		public string SqlOrderByGroup {
			get {return "";}
		}

		public string SqlSelectAgg {
			get {return "SELECT * FROM " + SqlFrom;}
		}

		public string SqlAggPfx {
			get {return "";}
		}

		public string SqlAggSfx {
			get {return "";}
		}

		public string SqlSelectCount {
			get {return "SELECT COUNT(*) FROM " + SqlFrom;}
		}

		// Sort URL
		public string SortUrl(crField fld) {
			return "";
		}

		// Row attributes
		public string RowAttributes() {
			string sAtt = "";
			foreach (DictionaryEntry Attr in RowAttrs) {
				if (ew_NotEmpty(Attr.Value))
					sAtt += " " + Attr.Key + "=\"" + Convert.ToString(Attr.Value).Trim() + "\"";
			}
			return sAtt;
		}

		// Table level events
		// Row Rendering event
		public void Row_Rendering() {

			// Enter your code here	
		}

		// Row Rendered event
		public void Row_Rendered() {

			// To view properties of field class, use:
			//var_dump(<FieldName>); 

		}

		// Load Custom Filters event
		public void CustomFilters_Load() {

			// Enter your code here	
			// ewrpt_RegisterCustomFilter(<Field>, "LastMonth", "Last Month", "GetLastMonthFilter"); // Date example
			// ewrpt_RegisterCustomFilter(<Field>, "StartsWithA", "Starts With A", "GetStartsWithAFilter"); // String example

		}

		// Page Filter Validated event
		public void Page_FilterValidated() {

			// Example:
			//MyField1.SearchValue = "your search criteria"; // Search value

		}

		// Chart Rendering event
		public void Chart_Rendering(ref object chart) {

			//crChart cht = (crChart)chart; //  Convert to crChart type or
			//crGantt cht = (crGantt)chart; //  Convert to crGantt type
			// Enter your code here

		}

		// Chart Rendered event
		public void Chart_Rendered(object chart, ref string chartxml) {

			//crChart cht = (crChart)chart; //  Convert to crChart type or
			//crGantt cht = (crGantt)chart; //  Convert to crGantt type
			//Enter your code here

		}

		// Email Sending event
		public bool Email_Sending(ref crEmail Email, ref Hashtable Args) {
			return true;
		}
	}

	// Page object
	public crAlumnos_Titulados_summary Alumnos_Titulados_summary;

	//
	// Page class
	//
	public class crAlumnos_Titulados_summary: AspNetReportMakerPage, IDisposable {

		// Page URL
		public string PageUrl() {
			string sUrl = ew_CurrentPage() + "?";
			if (Alumnos_Titulados.UseTokenInUrl)
				sUrl += "t=" + Alumnos_Titulados.TableVar + "&"; // Add page token
			return sUrl;
		}

		// Export URLs
		public string ExportPrintUrl = "";

		public string ExportExcelUrl = "";

		public string ExportWordUrl = "";

		// Message
		public string Message {
			get {
				return Convert.ToString(ew_Session[EWRPT_SESSION_MESSAGE]);
			}	
			set {
				if (ew_NotEmpty(ew_Session[EWRPT_SESSION_MESSAGE])) { // Append
					ew_Session[EWRPT_SESSION_MESSAGE] += "<br>" + value;
				} else {
					ew_Session[EWRPT_SESSION_MESSAGE] = value;
				}
			}
		}

		// Show message
		public void ShowMessage() {
			string sMessage = Message;
			Message_Showing(ref sMessage);
			if (ew_NotEmpty(sMessage)) { // Message in Session, display
				ew_Write("<div class=\"ewMessage\">" + sMessage + "</div><br><br>");
				ew_Session[EWRPT_SESSION_MESSAGE] = ""; // Clear message in Session
			}
		}

		public string PageHeader = "";

		public string PageFooter = "";

		// Show Page Header
		public void ShowPageHeader() {
			string sHeader = PageHeader;
			Page_DataRendering(ref sHeader);
			if (ew_NotEmpty(sHeader)) { // Header exists, display
				ew_Write("<p><span class=\"aspnetreportmaker\">" + sHeader + "</span></p>");
			}
		}

		// Show Page Footer
		public void ShowPageFooter() {
			string sFooter = PageFooter;
			Page_DataRendered(ref sFooter);
			if (ew_NotEmpty(sFooter)) { // Footer exists, display
				ew_Write("<p><span class=\"aspnetreportmaker\">" + sFooter + "</span></p>");
			}
		}

		// Validate page request
		public bool IsPageRequest() {
			if (Alumnos_Titulados.UseTokenInUrl) {
				if (HttpContext.Current.Request.RequestType == "POST")
					return (ew_SameStr(Alumnos_Titulados.TableVar, ew_Post("t")));
				if (ew_NotEmpty(ew_Get("t")))
					return (ew_SameStr(Alumnos_Titulados.TableVar, ew_Get("t")));
			}		
			return true;
		}

		// ASP.NET page object
		public Alumnos_Tituladossmry AspNetPage { 
			get { return (Alumnos_Tituladossmry)m_ParentPage; }
		}

		// Table object (Alumnos_Titulados)
		public crAlumnos_Titulados Alumnos_Titulados { 
			get {				
				return AspNetPage.Alumnos_Titulados; // Unlike ASP.NET Maker, the table object is not in the base class.
			}
			set {
				AspNetPage.Alumnos_Titulados = value;	
			}	
		}

		//
		// Page class constructor
		//
		public crAlumnos_Titulados_summary(AspNetReportMaker4_project1 APage) {		
			m_ParentPage = APage;
			m_Page = this;
			m_PageID = "summary";
			m_PageObjName = "Alumnos_Titulados_summary";
			m_PageObjTypeName = "crAlumnos_Titulados_summary";

			// Table name
			m_TableName = "Alumnos Titulados";

			// Language object
			ReportLanguage = new crLanguage(this);

			// Table object (Alumnos_Titulados)
			Alumnos_Titulados = new crAlumnos_Titulados(this);			

			// Initialize URLs
			ExportPrintUrl = PageUrl() + "export=print";
			ExportExcelUrl = PageUrl() + "export=excel";
			ExportWordUrl = PageUrl() + "export=word";

			// Open connection
			Conn = new cConnection();
		}

		// 
		//  Page_Init
		//
		public void Page_Init() {

			// Get export parameters
			if (ew_NotEmpty(ew_Get("export")))
				Alumnos_Titulados.Export = ew_Get("export");
			gsExport = Alumnos_Titulados.Export; // Get export parameter, used in header
			gsExportFile = Alumnos_Titulados.TableVar; // Get export file, used in header
			if (Alumnos_Titulados.Export == "excel") {
				HttpContext.Current.Response.ContentType = "application/vnd.ms-excel;charset=utf-8";
				HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + gsExportFile + ".xls");		
			}

			// Global Page Loading event (in userfn*.aspx)
			ParentPage.Page_Loading();

			// Page Load event
			Page_Load();
		}

		//
		//  Class terminate
		//  - clean up page object
		//
		public void Dispose()	{
			Page_Terminate("");
		}

		//
		// Page_Terminate
		//
		public void Page_Terminate(string url) {

			// Page Unload event
			Page_Unload();

			// Global Page Unloaded event (in userfn*.aspx)
			ParentPage.Page_Unloaded();

			 // Close connection
			Conn.Dispose();

			// Go to URL if specified
			if (ew_NotEmpty(url)) {
				HttpContext.Current.Response.Clear();
				HttpContext.Current.Response.Redirect(url);
			}			
		}

		// Temp variables
		public SqlDataReader dr; // DataReader

		public ArrayList rs = new ArrayList();	

		public ArrayList rsgrp = new ArrayList();

		public bool HasRow;

		public int GrpIndex = 0;

		public int RowIndex = 0;

		// Page variables
		public int RecCount = 0; // Record count

		public int StartGrp = 0; // Start group

		public int StopGrp = 0; // Stop group

		public int TotalGrps = 0; // Total groups

		public int GrpCount = 0; // Group count

		public int DisplayGrps = 15; // Groups per page

		public int GrpRange = 10;

		public string Sort = "";

		public string Filter = "";

		public string UserIDFilter = "";		

		// Clear field for ext filter
		public string ClearExtFilter = "";

		public bool FilterApplied;

		public bool ShowFirstHeader;

		public object[] Val = new object[16];

		public int[][] Cnt = new int[1][];

		public object[][] Smry = new object[1][];

		public object[][] Mn = new object[1][];

		public object[][] Mx = new object[1][];

		public object[] GrandSmry = new object[16];

		public object[] GrandMn = new object[16];

		public object[] GrandMx = new object[16];

		// Set up if accumulation required
		public bool[] Col = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};

		public int TotCount;

		//
		// Page main
		//
		public void Page_Main() {

			// Aggregate variables		
			int nDtls = 16; // No. of fields
			int nGrps = 1; // No. of groups (level 0 used for grand total)
			for (int i = 0; i < nGrps; i++) {
				Cnt[i] = new int[nDtls];
				Smry[i] = new object[nDtls];
				Mn[i] = new object[nDtls];
				Mx[i] = new object[nDtls]; 
			}

			// Set up groups per page dynamically
			SetUpDisplayGrps();

			// Load default filter values
			LoadDefaultFilters();

			// Set up popup filter
			SetupPopup();

			// Extended filter
			string sExtendedFilter = "";

			// Get dropdown values
			GetExtendedFilterValues();

			// Load custom filters
			Alumnos_Titulados.CustomFilters_Load();

			// Build extended filter
			sExtendedFilter = GetExtendedFilter();
			if (ew_NotEmpty(sExtendedFilter)) {
				if (ew_NotEmpty(Filter))
	  			Filter = "(" + Filter + ") AND (" + sExtendedFilter + ")";
				else
					Filter = sExtendedFilter;
			}

			// Build popup filter
			string sPopupFilter = GetPopupFilter();

			//ew_SetDebugMsg("popup filter: " + sPopupFilter);
			if (ew_NotEmpty(sPopupFilter)) {
				if (ew_NotEmpty(Filter))
					Filter = "(" + Filter + ") AND (" + sPopupFilter + ")";
				else
					Filter = sPopupFilter;
			}

			// Check if filter applied
			FilterApplied = CheckFilter();

			// Get sort
			Sort = GetSort();

			// Get total count
			string sSql = ewrpt_BuildReportSql(Alumnos_Titulados.SqlSelect, Alumnos_Titulados.SqlWhere, Alumnos_Titulados.SqlGroupBy, Alumnos_Titulados.SqlHaving, Alumnos_Titulados.SqlOrderBy, Filter, Sort);
			TotalGrps = GetCnt(sSql);
			if (DisplayGrps <= 0) // Display all groups
				DisplayGrps = TotalGrps;
			StartGrp = 1;

			// Show header
			ShowFirstHeader = (TotalGrps > 0);

			//ShowFirstHeader = TRUE; // Uncomment to always show header
			// Set up start position if not export all

			if (Alumnos_Titulados.ExportAll && ew_NotEmpty(Alumnos_Titulados.Export))
				DisplayGrps = TotalGrps;
			else
				SetUpStartGroup(); 

			// Get current page records
			dr = GetRs(sSql, StartGrp, DisplayGrps);
		}		

		// Accummulate summary
		public void AccumulateSummary() {
			int cntx = Smry.Length;
			for (int ix = 0; ix < cntx; ix++) {
				int cnty = Smry[ix].Length;
				for (int iy = 1; iy < cnty; iy++) {
					Cnt[ix][iy]++;
					if (Col[iy]) {
						object valwrk = Val[iy];
						if (Convert.IsDBNull(valwrk) || !ewrpt_IsNumeric(valwrk)) {

							// skip
						} else {
							Smry[ix][iy] = Convert.ToDouble(Smry[ix][iy]) + Convert.ToDouble(valwrk);
							if (Mn[ix][iy] == null) {
								Mn[ix][iy] = valwrk;
								Mx[ix][iy] = valwrk;
							} else {
								if (Convert.ToDouble(Mn[ix][iy]) > Convert.ToDouble(valwrk)) Mn[ix][iy] = valwrk;
								if (Convert.ToDouble(Mx[ix][iy]) < Convert.ToDouble(valwrk)) Mx[ix][iy] = valwrk;
							}
						}
					}
				}
			}
			cntx = Smry.Length;
			for (int ix = 1; ix < cntx; ix++)
				Cnt[ix][0]++;
		}

		// Reset level summary
		public void ResetLevelSummary(int lvl) {
			int cntx = Smry.Length;
			for (int ix = lvl; ix < cntx; ix++) {
				int cnty = Smry[ix].Length;
				for (int iy = 1; iy < cnty; iy++) {
					Cnt[ix][iy] = 0;
					if (Col[iy]) {
						Smry[ix][iy] = 0;
						Mn[ix][iy] = null;
						Mx[ix][iy] = null;
					}
				}
			}
			cntx = Smry.Length;
			for (int ix = lvl; ix < cntx; ix++)
				Cnt[ix][0] = 0;

			// Reset record count
			RecCount = 0;
		}

		// Accummulate grand summary
		public void AccumulateGrandSummary() { 
			Cnt[0][0]++;
			int cntgs = GrandSmry.Length;
			for (int iy = 1; iy < cntgs; iy++) {
				if (Col[iy]) {
					object valwrk = Val[iy];
					if (Convert.IsDBNull(valwrk) || !ewrpt_IsNumeric(valwrk)) {

						// skip
					} else {
						GrandSmry[iy] = Convert.ToDouble(GrandSmry[iy]) + Convert.ToDouble(valwrk);
						if (ew_Empty(GrandMn[iy])) {
							GrandMn[iy] = valwrk;
							GrandMx[iy] = valwrk;
						} else {
							if (Convert.ToDouble(GrandMn[iy]) > Convert.ToDouble(valwrk)) GrandMn[iy] = valwrk;
							if (Convert.ToDouble(GrandMx[iy]) < Convert.ToDouble(valwrk)) GrandMx[iy] = valwrk;
						}
					}
				}
			}
		}

		// Get count
		public int GetCnt(string sql) {		
			try {
				object cnt = ew_ExecuteScalar("SELECT COUNT(*) FROM (" + sql + ") AS EWRPT_TEMP_TABLE");
				if (cnt != null) {
					return ew_ConvertToInt(cnt);
				} else {
					throw new Exception("Failed to get record count");
				}	
			} catch {
				SqlDataReader dr = Conn.GetTempDataReader(sql);
				int rscnt = 0;
				if (dr != null && dr.HasRows) {
					while (dr.Read())
						rscnt++;
				}
				Conn.CloseTempDataReader();
				return rscnt;
			}
		}

		// Get rs
		public SqlDataReader GetRs(string sql, int start, int grps) {			
			GrpIndex = -1;
			SqlDataReader dr = Conn.GetDataReader(sql);		
			for (int i = 1; i < start; i++) {
				HasRow = dr.Read();
				GrpIndex++;
				if (!HasRow)
					break;
			}				
			return dr;			
		}	

		// Get row values
		public void GetRow(int opt) {
			OrderedDictionary Row;
			if (RowIndex >= rs.Count)
				return;
			RowIndex = (opt == 1) ? 0 : RowIndex + 1;
			if (RowIndex < rs.Count) {
				Row = (OrderedDictionary)rs[RowIndex];		
				Alumnos_Titulados.CODCLI.DbValue = Row["CODCLI"];
				Alumnos_Titulados.DIG.DbValue = Row["DIG"];
				Alumnos_Titulados.PATERNO.DbValue = Row["PATERNO"];
				Alumnos_Titulados.MATERNO.DbValue = Row["MATERNO"];
				Alumnos_Titulados.NOMBRE.DbValue = Row["NOMBRE"];
				Alumnos_Titulados.SEXO.DbValue = Row["SEXO"];
				Alumnos_Titulados.FECNAC.DbValue = Row["FECNAC"];
				Alumnos_Titulados.NACIONALIDAD.DbValue = Row["NACIONALIDAD"];
				Alumnos_Titulados.NOMBRE_C.DbValue = Row["NOMBRE_C"];
				Alumnos_Titulados.JORNADA.DbValue = Row["JORNADA"];
				Alumnos_Titulados.FECHASITU.DbValue = Row["FECHASITU"];
				Alumnos_Titulados.ANO.DbValue = Row["ANO"];
				Alumnos_Titulados.PERIODO.DbValue = Row["PERIODO"];
				Alumnos_Titulados.ANOEGRE.DbValue = Row["ANOEGRE"];
				Alumnos_Titulados.PERIODOEGRE.DbValue = Row["PERIODOEGRE"];
				Val[1] = Alumnos_Titulados.CODCLI.CurrentValue;
				Val[2] = Alumnos_Titulados.DIG.CurrentValue;
				Val[3] = Alumnos_Titulados.PATERNO.CurrentValue;
				Val[4] = Alumnos_Titulados.MATERNO.CurrentValue;
				Val[5] = Alumnos_Titulados.NOMBRE.CurrentValue;
				Val[6] = Alumnos_Titulados.SEXO.CurrentValue;
				Val[7] = Alumnos_Titulados.FECNAC.CurrentValue;
				Val[8] = Alumnos_Titulados.NACIONALIDAD.CurrentValue;
				Val[9] = Alumnos_Titulados.NOMBRE_C.CurrentValue;
				Val[10] = Alumnos_Titulados.JORNADA.CurrentValue;
				Val[11] = Alumnos_Titulados.FECHASITU.CurrentValue;
				Val[12] = Alumnos_Titulados.ANO.CurrentValue;
				Val[13] = Alumnos_Titulados.PERIODO.CurrentValue;
				Val[14] = Alumnos_Titulados.ANOEGRE.CurrentValue;
				Val[15] = Alumnos_Titulados.PERIODOEGRE.CurrentValue;
			} else {
				Alumnos_Titulados.CODCLI.DbValue = "";
				Alumnos_Titulados.DIG.DbValue = "";
				Alumnos_Titulados.PATERNO.DbValue = "";
				Alumnos_Titulados.MATERNO.DbValue = "";
				Alumnos_Titulados.NOMBRE.DbValue = "";
				Alumnos_Titulados.SEXO.DbValue = "";
				Alumnos_Titulados.FECNAC.DbValue = "";
				Alumnos_Titulados.NACIONALIDAD.DbValue = "";
				Alumnos_Titulados.NOMBRE_C.DbValue = "";
				Alumnos_Titulados.JORNADA.DbValue = "";
				Alumnos_Titulados.FECHASITU.DbValue = "";
				Alumnos_Titulados.ANO.DbValue = "";
				Alumnos_Titulados.PERIODO.DbValue = "";
				Alumnos_Titulados.ANOEGRE.DbValue = "";
				Alumnos_Titulados.PERIODOEGRE.DbValue = "";
			}
		}

		// Get row values from data reader // ASPXRPT
		public bool GetRow() {
			HasRow = (dr != null && dr.Read()); 
			if (HasRow) {
				GrpIndex++;			
				Alumnos_Titulados.CODCLI.DbValue = dr["CODCLI"];
				Alumnos_Titulados.DIG.DbValue = dr["DIG"];
				Alumnos_Titulados.PATERNO.DbValue = dr["PATERNO"];
				Alumnos_Titulados.MATERNO.DbValue = dr["MATERNO"];
				Alumnos_Titulados.NOMBRE.DbValue = dr["NOMBRE"];
				Alumnos_Titulados.SEXO.DbValue = dr["SEXO"];
				Alumnos_Titulados.FECNAC.DbValue = dr["FECNAC"];
				Alumnos_Titulados.NACIONALIDAD.DbValue = dr["NACIONALIDAD"];
				Alumnos_Titulados.NOMBRE_C.DbValue = dr["NOMBRE_C"];
				Alumnos_Titulados.JORNADA.DbValue = dr["JORNADA"];
				Alumnos_Titulados.FECHASITU.DbValue = dr["FECHASITU"];
				Alumnos_Titulados.ANO.DbValue = dr["ANO"];
				Alumnos_Titulados.PERIODO.DbValue = dr["PERIODO"];
				Alumnos_Titulados.ANOEGRE.DbValue = dr["ANOEGRE"];
				Alumnos_Titulados.PERIODOEGRE.DbValue = dr["PERIODOEGRE"];
				Val[1] = Alumnos_Titulados.CODCLI.CurrentValue;
				Val[2] = Alumnos_Titulados.DIG.CurrentValue;
				Val[3] = Alumnos_Titulados.PATERNO.CurrentValue;
				Val[4] = Alumnos_Titulados.MATERNO.CurrentValue;
				Val[5] = Alumnos_Titulados.NOMBRE.CurrentValue;
				Val[6] = Alumnos_Titulados.SEXO.CurrentValue;
				Val[7] = Alumnos_Titulados.FECNAC.CurrentValue;
				Val[8] = Alumnos_Titulados.NACIONALIDAD.CurrentValue;
				Val[9] = Alumnos_Titulados.NOMBRE_C.CurrentValue;
				Val[10] = Alumnos_Titulados.JORNADA.CurrentValue;
				Val[11] = Alumnos_Titulados.FECHASITU.CurrentValue;
				Val[12] = Alumnos_Titulados.ANO.CurrentValue;
				Val[13] = Alumnos_Titulados.PERIODO.CurrentValue;
				Val[14] = Alumnos_Titulados.ANOEGRE.CurrentValue;
				Val[15] = Alumnos_Titulados.PERIODOEGRE.CurrentValue;
			} else {				
				Alumnos_Titulados.CODCLI.DbValue = "";
				Alumnos_Titulados.DIG.DbValue = "";
				Alumnos_Titulados.PATERNO.DbValue = "";
				Alumnos_Titulados.MATERNO.DbValue = "";
				Alumnos_Titulados.NOMBRE.DbValue = "";
				Alumnos_Titulados.SEXO.DbValue = "";
				Alumnos_Titulados.FECNAC.DbValue = "";
				Alumnos_Titulados.NACIONALIDAD.DbValue = "";
				Alumnos_Titulados.NOMBRE_C.DbValue = "";
				Alumnos_Titulados.JORNADA.DbValue = "";
				Alumnos_Titulados.FECHASITU.DbValue = "";
				Alumnos_Titulados.ANO.DbValue = "";
				Alumnos_Titulados.PERIODO.DbValue = "";
				Alumnos_Titulados.ANOEGRE.DbValue = "";
				Alumnos_Titulados.PERIODOEGRE.DbValue = "";
			}
			return HasRow;		
		}

		//  Set up starting group
		public void SetUpStartGroup() { 

			// Exit if no groups
			if (DisplayGrps == 0) 
				return;

			// Check for a "start" parameter 
			if (ew_NotEmpty(ew_Get(EWRPT_TABLE_START_GROUP)) &&
				ewrpt_IsNumeric(ew_Get(EWRPT_TABLE_START_GROUP))) { 
				StartGrp = ew_ConvertToInt(ew_Get(EWRPT_TABLE_START_GROUP)); 
				Alumnos_Titulados.StartGroup = StartGrp; 
			} else if (ew_NotEmpty(ew_Get("pageno"))) {		
				if (ewrpt_IsNumeric(ew_Get("pageno"))) {
					int nPageNo = ew_ConvertToInt(ew_Get("pageno"));  
					StartGrp = (nPageNo - 1) * DisplayGrps + 1; 
					if (StartGrp <= 0) { 
						StartGrp = 1; 
					} else if (StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1) { 
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1; 
					} 
					Alumnos_Titulados.StartGroup = StartGrp; 
				} else { 
					StartGrp = Alumnos_Titulados.StartGroup;
				} 
			} else { 
				StartGrp = Alumnos_Titulados.StartGroup;
			} 

			// Check if correct start group counter 
			if (StartGrp <= 0) { // Avoid invalid start group counter 
				StartGrp = 1; // Reset start group counter 
				Alumnos_Titulados.StartGroup = StartGrp; 
			} else if (StartGrp > TotalGrps) { // Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1; // Point to last page first group 
				Alumnos_Titulados.StartGroup = StartGrp; 
			} else if ((StartGrp - 1) % DisplayGrps != 0) { 
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1; // Point to page boundary 
				Alumnos_Titulados.StartGroup = StartGrp; 
			} 
		} 

		// Set up popup
		public void SetupPopup() {	
		  string sSql = "";
		  SqlDataReader rswrk; 
		  bool bNullValue;
		  bool bEmptyValue;
			object grpval; 

			// Initialize popup
			// Process post back form

			if (HttpContext.Current.Request.Form.Count > 0) {
				string sName = ew_Post("popup"); // Get popup form name
				if (ew_NotEmpty(sName)) {
					object arValues = HttpContext.Current.Request.Form.GetValues("sel_" + sName);
					int cntValues = ((string[])arValues).Length;
					if (cntValues > 0) {
						if (ew_Empty(((string[])arValues)[0])) // Select all
							arValues = EWRPT_INIT_VALUE;
						if (!ewrpt_MatchedArray(arValues, ew_Session["sel_" + sName])) {
							if (HasSessionFilterValues(sName))
								ClearExtFilter = sName; // Clear extended filter for this field
						}
						ew_Session["sel_" + sName] = arValues;
						ew_Session["rf_" + sName] = ew_Post("rf_" + sName);
						ew_Session["rt_" + sName] = ew_Post("rt_" + sName);
						ResetPager();
					}
				}

			// Get 'reset' command
			} else if (ew_NotEmpty(ew_Get("cmd"))) { // Get reset cmd
				string sCmd = ew_Get("cmd");
				if (ew_SameText(sCmd, "reset")) {
					ResetPager();
				}
			}

			// Load selection criteria to array
		}

		// Reset pager to starting position
		public void ResetPager() {
			StartGrp = 1;
			Alumnos_Titulados.StartGroup = StartGrp;
		}

		public cPrevNextPager Pager;

		// Set up number of groups displayed per page based on form element GrpPerPage 
		public void SetUpDisplayGrps() { 
			string sWrk = ew_Get(EWRPT_TABLE_GROUP_PER_PAGE); 
			if (ew_NotEmpty(sWrk)) { 
				if (ewrpt_IsNumeric(sWrk)) { 
					DisplayGrps = ew_ConvertToInt(sWrk); 
				} else { 
					if (ew_SameText(sWrk, "ALL")) { // Display all records 
						DisplayGrps = -1; 
					} else { 
						DisplayGrps = 15; // Non-numeric, load default 
					} 
				}				
				Alumnos_Titulados.GroupPerPage = DisplayGrps; // Save to session
				StartGrp = 1; // Reset start position (reset command)				
				Alumnos_Titulados.StartGroup = StartGrp; 
			} else {				
				if (Alumnos_Titulados.GroupPerPage != 0) { 
					DisplayGrps = ew_ConvertToInt(Alumnos_Titulados.GroupPerPage); // Restore from Session 
				} else { 
					DisplayGrps = 15; // Load default 
				} 
			} 
		} 

		public void RenderRow() {
			if (Alumnos_Titulados.RowTotalType == EWRPT_ROWTOTAL_GRAND) { // Grand total

				// Get total count from SQL directly
				string sSql = ewrpt_BuildReportSql(Alumnos_Titulados.SqlSelectCount, Alumnos_Titulados.SqlWhere, Alumnos_Titulados.SqlGroupBy, Alumnos_Titulados.SqlHaving, "", Filter, "");
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql));				
			}

			// Call Row_Rendering event
			Alumnos_Titulados.Row_Rendering();

			//
			// Render view codes
			//

			if (Alumnos_Titulados.RowType == EWRPT_ROWTYPE_TOTAL) { // Summary row

				// CODCLI
				Alumnos_Titulados.CODCLI.ViewValue = Convert.ToString(Alumnos_Titulados.CODCLI.Summary);

				// DIG
				Alumnos_Titulados.DIG.ViewValue = Convert.ToString(Alumnos_Titulados.DIG.Summary);

				// PATERNO
				Alumnos_Titulados.PATERNO.ViewValue = Convert.ToString(Alumnos_Titulados.PATERNO.Summary);

				// MATERNO
				Alumnos_Titulados.MATERNO.ViewValue = Convert.ToString(Alumnos_Titulados.MATERNO.Summary);

				// NOMBRE
				Alumnos_Titulados.NOMBRE.ViewValue = Convert.ToString(Alumnos_Titulados.NOMBRE.Summary);

				// SEXO
				Alumnos_Titulados.SEXO.ViewValue = Convert.ToString(Alumnos_Titulados.SEXO.Summary);

				// FECNAC
				Alumnos_Titulados.FECNAC.ViewValue = Convert.ToString(Alumnos_Titulados.FECNAC.Summary);
				Alumnos_Titulados.FECNAC.ViewValue = ew_FormatDateTime(Alumnos_Titulados.FECNAC.ViewValue, 7);

				// NACIONALIDAD
				Alumnos_Titulados.NACIONALIDAD.ViewValue = Convert.ToString(Alumnos_Titulados.NACIONALIDAD.Summary);

				// NOMBRE_C
				Alumnos_Titulados.NOMBRE_C.ViewValue = Convert.ToString(Alumnos_Titulados.NOMBRE_C.Summary);

				// JORNADA
				Alumnos_Titulados.JORNADA.ViewValue = Convert.ToString(Alumnos_Titulados.JORNADA.Summary);

				// FECHASITU
				Alumnos_Titulados.FECHASITU.ViewValue = Convert.ToString(Alumnos_Titulados.FECHASITU.Summary);
				Alumnos_Titulados.FECHASITU.ViewValue = ew_FormatDateTime(Alumnos_Titulados.FECHASITU.ViewValue, 7);

				// ANO
				Alumnos_Titulados.ANO.ViewValue = Convert.ToString(Alumnos_Titulados.ANO.Summary);

				// PERIODO
				Alumnos_Titulados.PERIODO.ViewValue = Convert.ToString(Alumnos_Titulados.PERIODO.Summary);

				// ANOEGRE
				Alumnos_Titulados.ANOEGRE.ViewValue = Convert.ToString(Alumnos_Titulados.ANOEGRE.Summary);

				// PERIODOEGRE
				Alumnos_Titulados.PERIODOEGRE.ViewValue = Convert.ToString(Alumnos_Titulados.PERIODOEGRE.Summary);
			} else {

				// CODCLI
				Alumnos_Titulados.CODCLI.ViewValue = Convert.ToString(Alumnos_Titulados.CODCLI.CurrentValue);
				Alumnos_Titulados.CODCLI.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// DIG
				Alumnos_Titulados.DIG.ViewValue = Convert.ToString(Alumnos_Titulados.DIG.CurrentValue);
				Alumnos_Titulados.DIG.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// PATERNO
				Alumnos_Titulados.PATERNO.ViewValue = Convert.ToString(Alumnos_Titulados.PATERNO.CurrentValue);
				Alumnos_Titulados.PATERNO.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// MATERNO
				Alumnos_Titulados.MATERNO.ViewValue = Convert.ToString(Alumnos_Titulados.MATERNO.CurrentValue);
				Alumnos_Titulados.MATERNO.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// NOMBRE
				Alumnos_Titulados.NOMBRE.ViewValue = Convert.ToString(Alumnos_Titulados.NOMBRE.CurrentValue);
				Alumnos_Titulados.NOMBRE.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// SEXO
				Alumnos_Titulados.SEXO.ViewValue = Convert.ToString(Alumnos_Titulados.SEXO.CurrentValue);
				Alumnos_Titulados.SEXO.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// FECNAC
				Alumnos_Titulados.FECNAC.ViewValue = Convert.ToString(Alumnos_Titulados.FECNAC.CurrentValue);
				Alumnos_Titulados.FECNAC.ViewValue = ew_FormatDateTime(Alumnos_Titulados.FECNAC.ViewValue, 7);
				Alumnos_Titulados.FECNAC.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// NACIONALIDAD
				Alumnos_Titulados.NACIONALIDAD.ViewValue = Convert.ToString(Alumnos_Titulados.NACIONALIDAD.CurrentValue);
				Alumnos_Titulados.NACIONALIDAD.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// NOMBRE_C
				Alumnos_Titulados.NOMBRE_C.ViewValue = Convert.ToString(Alumnos_Titulados.NOMBRE_C.CurrentValue);
				Alumnos_Titulados.NOMBRE_C.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// JORNADA
				Alumnos_Titulados.JORNADA.ViewValue = Convert.ToString(Alumnos_Titulados.JORNADA.CurrentValue);
				Alumnos_Titulados.JORNADA.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// FECHASITU
				Alumnos_Titulados.FECHASITU.ViewValue = Convert.ToString(Alumnos_Titulados.FECHASITU.CurrentValue);
				Alumnos_Titulados.FECHASITU.ViewValue = ew_FormatDateTime(Alumnos_Titulados.FECHASITU.ViewValue, 7);
				Alumnos_Titulados.FECHASITU.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// ANO
				Alumnos_Titulados.ANO.ViewValue = Convert.ToString(Alumnos_Titulados.ANO.CurrentValue);
				Alumnos_Titulados.ANO.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// PERIODO
				Alumnos_Titulados.PERIODO.ViewValue = Convert.ToString(Alumnos_Titulados.PERIODO.CurrentValue);
				Alumnos_Titulados.PERIODO.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// ANOEGRE
				Alumnos_Titulados.ANOEGRE.ViewValue = Convert.ToString(Alumnos_Titulados.ANOEGRE.CurrentValue);
				Alumnos_Titulados.ANOEGRE.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// PERIODOEGRE
				Alumnos_Titulados.PERIODOEGRE.ViewValue = Convert.ToString(Alumnos_Titulados.PERIODOEGRE.CurrentValue);
				Alumnos_Titulados.PERIODOEGRE.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";
			}

			// CODCLI
			Alumnos_Titulados.CODCLI.HrefValue = "";

			// DIG
			Alumnos_Titulados.DIG.HrefValue = "";

			// PATERNO
			Alumnos_Titulados.PATERNO.HrefValue = "";

			// MATERNO
			Alumnos_Titulados.MATERNO.HrefValue = "";

			// NOMBRE
			Alumnos_Titulados.NOMBRE.HrefValue = "";

			// SEXO
			Alumnos_Titulados.SEXO.HrefValue = "";

			// FECNAC
			Alumnos_Titulados.FECNAC.HrefValue = "";

			// NACIONALIDAD
			Alumnos_Titulados.NACIONALIDAD.HrefValue = "";

			// NOMBRE_C
			Alumnos_Titulados.NOMBRE_C.HrefValue = "";

			// JORNADA
			Alumnos_Titulados.JORNADA.HrefValue = "";

			// FECHASITU
			Alumnos_Titulados.FECHASITU.HrefValue = "";

			// ANO
			Alumnos_Titulados.ANO.HrefValue = "";

			// PERIODO
			Alumnos_Titulados.PERIODO.HrefValue = "";

			// ANOEGRE
			Alumnos_Titulados.ANOEGRE.HrefValue = "";

			// PERIODOEGRE
			Alumnos_Titulados.PERIODOEGRE.HrefValue = "";

			// Call Row_Rendered event
			Alumnos_Titulados.Row_Rendered();
		}

		//
		// Extended filter
		//
		// Get extended filter values
		public void GetExtendedFilterValues() {
			string sSelect = "";
			string sWhere = "";
			string sOrderBy = "";
			string wrkSql = "";	

			// Field NOMBRE_C
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + Alumnos_Titulados.SqlFrom;
			sOrderBy = "[NOMBRE_C] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Titulados.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			Alumnos_Titulados.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);

			// Field JORNADA
			sSelect = "SELECT DISTINCT [JORNADA] FROM " + Alumnos_Titulados.SqlFrom;
			sOrderBy = "[JORNADA] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Titulados.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			Alumnos_Titulados.JORNADA.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);

			// Field ANO
			sSelect = "SELECT DISTINCT [ANO] FROM " + Alumnos_Titulados.SqlFrom;
			sOrderBy = "[ANO] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Titulados.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			Alumnos_Titulados.ANO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);

			// Field PERIODO
			sSelect = "SELECT DISTINCT [PERIODO] FROM " + Alumnos_Titulados.SqlFrom;
			sOrderBy = "[PERIODO] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Titulados.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			Alumnos_Titulados.PERIODO.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);

			// Field ANOEGRE
			sSelect = "SELECT DISTINCT [ANOEGRE] FROM " + Alumnos_Titulados.SqlFrom;
			sOrderBy = "[ANOEGRE] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Titulados.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			Alumnos_Titulados.ANOEGRE.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);

			// Field PERIODOEGRE
			sSelect = "SELECT DISTINCT [PERIODOEGRE] FROM " + Alumnos_Titulados.SqlFrom;
			sOrderBy = "[PERIODOEGRE] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, Alumnos_Titulados.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			Alumnos_Titulados.PERIODOEGRE.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);
		}

		// Return extended filter
		public string GetExtendedFilter() {
			string sFilter = "";
		  string sWrk; 
		  bool bPostBack = (HttpContext.Current.Request.Form.Count > 0);
		  bool bRestoreSession = true;
		  bool bSetupFilter = false;	
			if (bPostBack) { // Reset extended filter if filter changed
			} else if (ew_SameText(ew_Get("cmd"), "reset")) { // Reset search command

				// Field CODCLI
				SetSessionFilterValues(ref Alumnos_Titulados.CODCLI);

				// Field PATERNO
				SetSessionFilterValues(ref Alumnos_Titulados.PATERNO);

				// Field MATERNO
				SetSessionFilterValues(ref Alumnos_Titulados.MATERNO);

				// Field NOMBRE_C
				SetSessionDropDownValue(Alumnos_Titulados.NOMBRE_C.DropDownValue, ref Alumnos_Titulados.NOMBRE_C);

				// Field JORNADA
				SetSessionDropDownValue(Alumnos_Titulados.JORNADA.DropDownValue, ref Alumnos_Titulados.JORNADA);

				// Field ANO
				SetSessionDropDownValue(Alumnos_Titulados.ANO.DropDownValue, ref Alumnos_Titulados.ANO);

				// Field PERIODO
				SetSessionDropDownValue(Alumnos_Titulados.PERIODO.DropDownValue, ref Alumnos_Titulados.PERIODO);

				// Field ANOEGRE
				SetSessionDropDownValue(Alumnos_Titulados.ANOEGRE.DropDownValue, ref Alumnos_Titulados.ANOEGRE);

				// Field PERIODOEGRE
				SetSessionDropDownValue(Alumnos_Titulados.PERIODOEGRE.DropDownValue, ref Alumnos_Titulados.PERIODOEGRE);
				bSetupFilter = true; // Set up filter required
			} else {

				// Field CODCLI
				if (GetFilterValues(ref Alumnos_Titulados.CODCLI)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				}

				// Field PATERNO
				if (GetFilterValues(ref Alumnos_Titulados.PATERNO)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				}

				// Field MATERNO
				if (GetFilterValues(ref Alumnos_Titulados.MATERNO)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				}

				// Field NOMBRE_C
				if (GetDropDownValue(ref Alumnos_Titulados.NOMBRE_C)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(Alumnos_Titulados.NOMBRE_C.DropDownValue)) {
					if (!ew_SameStr(Alumnos_Titulados.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_Alumnos_Titulados_NOMBRE_C"] == null)
						bSetupFilter = true; // Set up filter required
				}

				// Field JORNADA
				if (GetDropDownValue(ref Alumnos_Titulados.JORNADA)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(Alumnos_Titulados.JORNADA.DropDownValue)) {
					if (!ew_SameStr(Alumnos_Titulados.JORNADA.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_Alumnos_Titulados_JORNADA"] == null)
						bSetupFilter = true; // Set up filter required
				}

				// Field ANO
				if (GetDropDownValue(ref Alumnos_Titulados.ANO)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(Alumnos_Titulados.ANO.DropDownValue)) {
					if (!ew_SameStr(Alumnos_Titulados.ANO.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_Alumnos_Titulados_ANO"] == null)
						bSetupFilter = true; // Set up filter required
				}

				// Field PERIODO
				if (GetDropDownValue(ref Alumnos_Titulados.PERIODO)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(Alumnos_Titulados.PERIODO.DropDownValue)) {
					if (!ew_SameStr(Alumnos_Titulados.PERIODO.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_Alumnos_Titulados_PERIODO"] == null)
						bSetupFilter = true; // Set up filter required
				}

				// Field ANOEGRE
				if (GetDropDownValue(ref Alumnos_Titulados.ANOEGRE)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(Alumnos_Titulados.ANOEGRE.DropDownValue)) {
					if (!ew_SameStr(Alumnos_Titulados.ANOEGRE.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_Alumnos_Titulados_ANOEGRE"] == null)
						bSetupFilter = true; // Set up filter required
				}

				// Field PERIODOEGRE
				if (GetDropDownValue(ref Alumnos_Titulados.PERIODOEGRE)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(Alumnos_Titulados.PERIODOEGRE.DropDownValue)) {
					if (!ew_SameStr(Alumnos_Titulados.PERIODOEGRE.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_Alumnos_Titulados_PERIODOEGRE"] == null)
						bSetupFilter = true; // Set up filter required
				}
				if (!ValidateForm()) {
					Message = gsFormError;
					return sFilter;
				}
			}

			// Restore session
			if (bRestoreSession) {

				// Field CODCLI
				GetSessionFilterValues(ref Alumnos_Titulados.CODCLI);

				// Field PATERNO
				GetSessionFilterValues(ref Alumnos_Titulados.PATERNO);

				// Field MATERNO
				GetSessionFilterValues(ref Alumnos_Titulados.MATERNO);

				// Field NOMBRE_C
				GetSessionDropDownValue(ref Alumnos_Titulados.NOMBRE_C);

				// Field JORNADA
				GetSessionDropDownValue(ref Alumnos_Titulados.JORNADA);

				// Field ANO
				GetSessionDropDownValue(ref Alumnos_Titulados.ANO);

				// Field PERIODO
				GetSessionDropDownValue(ref Alumnos_Titulados.PERIODO);

				// Field ANOEGRE
				GetSessionDropDownValue(ref Alumnos_Titulados.ANOEGRE);

				// Field PERIODOEGRE
				GetSessionDropDownValue(ref Alumnos_Titulados.PERIODOEGRE);
			}

			// Call page filter validated event
			Alumnos_Titulados.Page_FilterValidated();

			// Build SQL
			// Field CODCLI

			BuildExtendedFilter(ref Alumnos_Titulados.CODCLI, ref sFilter);

			// Field PATERNO
			BuildExtendedFilter(ref Alumnos_Titulados.PATERNO, ref sFilter);

			// Field MATERNO
			BuildExtendedFilter(ref Alumnos_Titulados.MATERNO, ref sFilter);

			// Field NOMBRE_C
			BuildDropDownFilter(ref Alumnos_Titulados.NOMBRE_C, ref sFilter, "");

			// Field JORNADA
			BuildDropDownFilter(ref Alumnos_Titulados.JORNADA, ref sFilter, "");

			// Field ANO
			BuildDropDownFilter(ref Alumnos_Titulados.ANO, ref sFilter, "");

			// Field PERIODO
			BuildDropDownFilter(ref Alumnos_Titulados.PERIODO, ref sFilter, "");

			// Field ANOEGRE
			BuildDropDownFilter(ref Alumnos_Titulados.ANOEGRE, ref sFilter, "");

			// Field PERIODOEGRE
			BuildDropDownFilter(ref Alumnos_Titulados.PERIODOEGRE, ref sFilter, "");

			// Save parms to Session
			// Field CODCLI

			SetSessionFilterValues(ref Alumnos_Titulados.CODCLI);

			// Field PATERNO
			SetSessionFilterValues(ref Alumnos_Titulados.PATERNO);

			// Field MATERNO
			SetSessionFilterValues(ref Alumnos_Titulados.MATERNO);

			// Field NOMBRE_C
			SetSessionDropDownValue(Alumnos_Titulados.NOMBRE_C.DropDownValue, ref Alumnos_Titulados.NOMBRE_C);

			// Field JORNADA
			SetSessionDropDownValue(Alumnos_Titulados.JORNADA.DropDownValue, ref Alumnos_Titulados.JORNADA);

			// Field ANO
			SetSessionDropDownValue(Alumnos_Titulados.ANO.DropDownValue, ref Alumnos_Titulados.ANO);

			// Field PERIODO
			SetSessionDropDownValue(Alumnos_Titulados.PERIODO.DropDownValue, ref Alumnos_Titulados.PERIODO);

			// Field ANOEGRE
			SetSessionDropDownValue(Alumnos_Titulados.ANOEGRE.DropDownValue, ref Alumnos_Titulados.ANOEGRE);

			// Field PERIODOEGRE
			SetSessionDropDownValue(Alumnos_Titulados.PERIODOEGRE.DropDownValue, ref Alumnos_Titulados.PERIODOEGRE);

			// Setup filter
			if (bSetupFilter) {
				string sSql;
			}
			return sFilter;
		}		

		// Get drop down value from querystring 
		public bool GetDropDownValue(ref crField fld) { 
			if (HttpContext.Current.Request.Form.Count > 0) 
				return false;	// Skip post back
			string parm = fld.FldVar.Substring(2); 
			if (ew_NotEmpty(ew_Get("sv_" + parm))) { 
				object sv = HttpContext.Current.Request.QueryString.GetValues("sv_" + parm);
				if (((string[])sv).Length == 1)
					sv = ew_Get("sv_" + parm);
				fld.DropDownValue = sv;
				return true; 
			} 
			return false; 
		} 

		// Get filter values from querystring 
		public bool GetFilterValues(ref crField fld) {
			string parm = fld.FldVar.Substring(2); 
			bool ReturnValue = false; 

			// Skip post back 
			if (HttpContext.Current.Request.Form.Count > 0) 
				return ReturnValue;
			if (HttpContext.Current.Request.QueryString["sv1_" + parm] != null) { 
				fld.SearchValue = ew_Get("sv1_" + parm); 
				ReturnValue = true; 
			} 
			if (HttpContext.Current.Request.QueryString["so1_" + parm] != null) { 
				fld.SearchOperator = ew_Get("so1_" + parm); 
				ReturnValue = true;		
			} 
			if (HttpContext.Current.Request.QueryString["sc_" + parm] != null) {  
				fld.SearchCondition = ew_Get("sc_" + parm); 
				ReturnValue = true;		
			} 
			if (HttpContext.Current.Request.QueryString["sv2_" + parm] != null) {  
				fld.SearchValue2 = ew_Get("sv2_" + parm); 
				ReturnValue = true; 
			} 
			if (HttpContext.Current.Request.QueryString["so2_" + parm] != null) {  
				fld.SearchOperator2 = ew_Get("so2_" + parm); 
				ReturnValue = true;		
			} 
			return ReturnValue; 
		}

		// Set default ext filter
		public void SetDefaultExtFilter(ref crField fld, string so1, string sv1, string sc, string so2, string sv2) {
			fld.DefaultSearchValue = sv1; // Default ext filter value 1
			fld.DefaultSearchOperator = so1; // Default search operator 1
			fld.DefaultSearchCondition = sc; // Default search condition (if operator 2 is enabled)
			fld.DefaultSearchValue2 = sv2; // Default ext filter value 2 (if operator 2 is enabled)
			fld.DefaultSearchOperator2 = so2; // Default search operator 2 (if operator 2 is enabled)
		}

		// Apply default ext filter
		public void ApplyDefaultExtFilter(ref crField fld) {
			fld.SearchValue = fld.DefaultSearchValue;
			fld.SearchOperator = fld.DefaultSearchOperator;
			fld.SearchCondition = fld.DefaultSearchCondition;
			fld.SearchValue2 = fld.DefaultSearchValue2;
			fld.SearchOperator2 = fld.DefaultSearchOperator2;
		}

		// Check if Text Filter applied
		public bool TextFilterApplied(ref crField fld) {
			return (!ew_SameStr(fld.SearchValue, fld.DefaultSearchValue) ||
				!ew_SameStr(fld.SearchValue2, fld.DefaultSearchValue2) ||
				(ew_NotEmpty(fld.SearchValue) && !ew_SameStr(fld.SearchOperator, fld.DefaultSearchOperator)) ||
				(ew_NotEmpty(fld.SearchValue2) && !ew_SameStr(fld.SearchOperator2, fld.DefaultSearchOperator2)) ||
				!ew_SameStr(fld.SearchCondition, fld.DefaultSearchCondition));
		}

		// Check if Non-Text Filter applied
		public bool NonTextFilterApplied(ref crField fld) {
			if (ewrpt_IsArray(fld.DefaultDropDownValue) && ewrpt_IsArray(fld.DropDownValue)) {
				string[] ar1 = (string[])fld.DropDownValue;
				string[] ar2 = (string[])fld.DefaultDropDownValue;
				if (ar1.Length != ar2.Length) {
					return true;
				} else {
					Array.Sort(ar1);
					Array.Sort(ar2);
					return !ewrpt_MatchedArray(ar1, ar2);
				}
			} else if (ewrpt_IsArray(fld.DefaultDropDownValue) || ewrpt_IsArray(fld.DropDownValue)) {
				return true;
			} else {
				string v1 = Convert.ToString(fld.DefaultDropDownValue);
				if (v1 == EWRPT_INIT_VALUE)
					v1 = "";
				string v2 = Convert.ToString(fld.DropDownValue);
				if (v2 == EWRPT_INIT_VALUE || v2 == EWRPT_ALL_VALUE)
					v2 = "";
				return (!ew_SameStr(v1, v2));
			}
		}

		// Load selection from a filter clause
		public void LoadSelectionFromFilter(ref crField fld, string filter, ref ArrayList sel) {
			sel.Clear();
			if (ew_NotEmpty(filter)) {
				string sSql = ewrpt_BuildReportSql(fld.SqlSelect, "", "", "", fld.SqlOrderBy, filter, "");
				ParentPage.ewrpt_LoadArrayListFromSql(sSql, ref sel);
			}
		}

		// Load selection from a filter clause
		public void LoadSelectionFromFilter(ref crField fld, string filter, ref string[] sel) {
			sel = new string[0];
			if (ew_NotEmpty(filter)) {
				string sSql = ewrpt_BuildReportSql(fld.SqlSelect, "", "", "", fld.SqlOrderBy, filter, "");
				ParentPage.ewrpt_LoadArrayFromSql(sSql, ref sel);
			}
		}

		// Get dropdown value from Session 
		public void GetSessionDropDownValue(ref crField fld) {
			string parm = fld.FldVar.Substring(2);
			if (ew_Session["sv_Alumnos_Titulados_" + parm] != null)  
				fld.DropDownValue = ew_Session["sv_Alumnos_Titulados_" + parm];
		}

		// Set dropdown value to Session 
		public void SetSessionDropDownValue(object sv, ref crField fld) {
			string parm = fld.FldVar.Substring(2); 
			ew_Session["sv_Alumnos_Titulados_" + parm] = sv; 
		} 

		// Get filter values from Session 
		public void GetSessionFilterValues(ref crField fld) {
			string parm = fld.FldVar.Substring(2);  
			if (ew_Session["sv1_Alumnos_Titulados_" + parm] != null)
				fld.SearchValue = ew_Session["sv1_Alumnos_Titulados_" + parm];
			if (ew_Session["so1_Alumnos_Titulados_" + parm] != null)
				fld.SearchOperator = Convert.ToString(ew_Session["so1_Alumnos_Titulados_" + parm]);
			if (ew_Session["sc_Alumnos_Titulados_" + parm] != null)		
				fld.SearchCondition = Convert.ToString(ew_Session["sc_Alumnos_Titulados_" + parm]);
			if (ew_Session["sv2_Alumnos_Titulados_" + parm] != null)
				fld.SearchValue2 = ew_Session["sv2_Alumnos_Titulados_" + parm];
			if (ew_Session["so2_Alumnos_Titulados_" + parm] != null)
				fld.SearchOperator2 = Convert.ToString(ew_Session["so2_Alumnos_Titulados_" + parm]); 
		}

		// Set filter values to Session		
		public void SetSessionFilterValues(ref crField fld) {
			string parm = fld.FldVar.Substring(2);
			ew_Session["sv1_Alumnos_Titulados_" + parm] = fld.SearchValue; 
			ew_Session["so1_Alumnos_Titulados_" + parm] = fld.SearchOperator; 
			ew_Session["sc_Alumnos_Titulados_" + parm] = fld.SearchCondition; 
			ew_Session["sv2_Alumnos_Titulados_" + parm] = fld.SearchValue2; 
			ew_Session["so2_Alumnos_Titulados_" + parm] = fld.SearchOperator2;
		}

		// Clear filter values from Session // ASPXRPT		
		public void ClearSessionFilterValues(ref crField fld) {
			string parm = fld.FldVar.Substring(2);
			ew_Session["sv1_Alumnos_Titulados_" + parm] = ""; 
			ew_Session["so1_Alumnos_Titulados_" + parm] = "="; 
			ew_Session["sc_Alumnos_Titulados_" + parm] = "AND"; 
			ew_Session["sv2_Alumnos_Titulados_" + parm] = ""; 
			ew_Session["so2_Alumnos_Titulados_" + parm] = "=";
		} 

		// Check if has Session filter values 
		public bool HasSessionFilterValues(string parm) { 
			return (ew_NotEmpty(ew_Session["sv_" + parm]) && !ew_SameStr(ew_Session["sv_" + parm], EWRPT_INIT_VALUE)) ||
				(ew_NotEmpty(ew_Session["sv1_" + parm]) && !ew_SameStr(ew_Session["sv1_" + parm], EWRPT_INIT_VALUE)) ||
				(ew_NotEmpty(ew_Session["sv2_" + parm]) && !ew_SameStr(ew_Session["sv2_" + parm], EWRPT_INIT_VALUE)); 
		}

		// Check if dropdown filter
		public bool DropDownFilterExist(ref crField fld, string FldOpr) {
			string sWrk = "";
			BuildDropDownFilter(ref fld, ref sWrk, FldOpr);
			return ew_NotEmpty(sWrk);
		}

		// Build dropdown filter
		public void BuildDropDownFilter(ref crField fld, ref string FilterClause, string FldOpr) {
			object FldVal = fld.DropDownValue;
			string sSql = "";		
			if (ewrpt_IsArray(FldVal)) {
				string[] arwrk = (string[])FldVal;
				string sWrk;
				foreach (string val in arwrk) {
					sWrk = GetDropDownFilter(ref fld, val, FldOpr);
					if (ew_NotEmpty(sWrk))
						sSql = (ew_NotEmpty(sSql)) ? sSql + " OR " + sWrk : sWrk;				
				}
			} else {
				sSql = GetDropDownFilter(ref fld, Convert.ToString(FldVal), FldOpr);
			}
			if (ew_NotEmpty(sSql)) {
				if (ew_NotEmpty(FilterClause)) FilterClause = "(" + FilterClause + ") AND ";
				FilterClause += "(" + sSql + ")";
			}
		}

		// Get dropdown filter 
		public string GetDropDownFilter(ref crField fld, string FldVal, string FldOpr) {
			string FldName = fld.FldName;
			string FldExpression = fld.FldExpression;
			int FldDataType = fld.FldDataType;
			string sWrk = ""; 
			if (FldVal == EWRPT_NULL_VALUE) { 
				sWrk = FldExpression + " IS NULL"; 
			} else if (FldVal == EWRPT_EMPTY_VALUE) { 
				sWrk = FldExpression + " = ''"; 
			} else { 
				if (FldVal.StartsWith("@@")) { 
					sWrk = ParentPage.ewrpt_GetCustomFilter(ref fld, FldVal); 
				} else {
					if (ew_NotEmpty(FldVal) && !ew_SameStr(FldVal, EWRPT_INIT_VALUE) && !ew_SameStr(FldVal, EWRPT_ALL_VALUE)) { 
						if (FldDataType == EWRPT_DATATYPE_DATE && FldOpr != "") { 
							sWrk = DateFilterString(FldOpr, FldVal, FldDataType); 
						} else { 
							sWrk = FilterString("=", FldVal, FldDataType); 
						} 
					} 
					if (ew_NotEmpty(sWrk)) 
						sWrk = FldExpression + sWrk; 
				} 
			} 
			return sWrk;
		}		

		// Check if extended filter
		public bool ExtendedFilterExist(ref crField fld)	{
			string sExtWrk = "";
			BuildExtendedFilter(ref fld, ref sExtWrk);
			return ew_NotEmpty(sExtWrk);
		}

		// Build extended filter 
		public void BuildExtendedFilter(ref crField fld, ref string FilterClause)	{
			bool IsValidValue; 
			string sWrk = ""; 
			string wrkFldVal1; 
			string wrkFldVal2;			
			string FldName = fld.FldName;
			string FldExpression = fld.FldExpression;
			int FldDataType = fld.FldDataType;
			int FldDateTimeFormat = fld.FldDateTimeFormat;			
			string FldVal1 = Convert.ToString(fld.SearchValue);
			string FldOpr1 = fld.SearchOperator;
			string FldCond = fld.SearchCondition;
			string FldVal2 = Convert.ToString(fld.SearchValue2);
			string FldOpr2 = fld.SearchOperator2;
			FldOpr1 = (FldOpr1 != null) ? FldOpr1.Trim().ToUpper() : ""; 
			if (ew_Empty(FldOpr1)) 
				FldOpr1 = "="; 
			FldOpr2 = (FldOpr2 != null) ? FldOpr2.Trim().ToUpper() : ""; 
			if (ew_Empty(FldOpr2)) 
				FldOpr2 = "="; 
			wrkFldVal1 = FldVal1; 
			wrkFldVal2 = FldVal2; 
			if (FldDataType == EWRPT_DATATYPE_BOOLEAN) { 
				if (wrkFldVal1 != "") 
					wrkFldVal1 = (wrkFldVal1 == "1" ? "True" : "False"); 
				if (wrkFldVal2 != "") 
					wrkFldVal2 = (wrkFldVal2 == "1" ? "True" : "False"); 
			} else if (FldDataType == EWRPT_DATATYPE_DATE) { 
				if (wrkFldVal1 != "") 
					wrkFldVal1 = ew_UnFormatDateTime(wrkFldVal1, FldDateTimeFormat); 
				if (wrkFldVal2 != "") 
					wrkFldVal2 = ew_UnFormatDateTime(wrkFldVal2, FldDateTimeFormat); 
			} 
			if (FldOpr1 == "BETWEEN") { 
				IsValidValue = (FldDataType != EWRPT_DATATYPE_NUMBER) || (FldDataType == EWRPT_DATATYPE_NUMBER && ewrpt_IsNumeric(wrkFldVal1) && ewrpt_IsNumeric(wrkFldVal2)); 
				if (wrkFldVal1 != "" && wrkFldVal2 != "" && IsValidValue) 
					sWrk = FldExpression + " BETWEEN " + ew_QuotedValue(wrkFldVal1, FldDataType) + " AND " + ew_QuotedValue(wrkFldVal2, FldDataType); 
			} else if (FldOpr1 == "IS NULL" || FldOpr1 == "IS NOT NULL") { 
				sWrk = FldExpression + " " + wrkFldVal1; 
			} 
			else { 
				IsValidValue = (FldDataType != EWRPT_DATATYPE_NUMBER) || (FldDataType == EWRPT_DATATYPE_NUMBER && ewrpt_IsNumeric(wrkFldVal1)); 
				if (wrkFldVal1 != "" && IsValidValue && ew_IsValidOpr(FldOpr1, FldDataType))
					sWrk = FldExpression + FilterString(FldOpr1, wrkFldVal1, FldDataType); 
				IsValidValue = (FldDataType != EWRPT_DATATYPE_NUMBER) || (FldDataType == EWRPT_DATATYPE_NUMBER && ewrpt_IsNumeric(wrkFldVal2)); 
				if (wrkFldVal2 != "" && IsValidValue && ew_IsValidOpr(FldOpr2, FldDataType)) { 
					if (sWrk != "")
						sWrk += " " + (FldCond == "OR" ? "OR" : "AND") + " "; 
					sWrk += FldExpression + FilterString(FldOpr2, wrkFldVal2, FldDataType); 
				} 
			} 
			if (sWrk != "") { 
				if (FilterClause != "") 
					FilterClause += " AND "; 
				FilterClause += "(" + sWrk + ")"; 
			} 
		}

		// Validate form
		public bool ValidateForm() {

			// Initialize form error message
			gsFormError = "";

			// Check if validation required
			if (!EWRPT_SERVER_VALIDATE)
				return ew_Empty(gsFormError);

			// Return validate result
			bool valid = ew_Empty(gsFormError);

			// Call Form_CustomValidate event
			string sFormCustomError = "";
			valid = valid && Form_CustomValidate(ref sFormCustomError);
			if (ew_NotEmpty(sFormCustomError)) {
				gsFormError += (ew_NotEmpty(gsFormError)) ? "<br>" : "";
				gsFormError += sFormCustomError;
			}
			return valid;
		}

		// Return filter string 
		public string FilterString(string FldOpr, object FldVal, int FldType) 
		{ 
			if (ew_Empty(FldVal))
				return "";
			if (FldOpr == "LIKE" || FldOpr == "NOT LIKE") {
				return " " + FldOpr + " " + ew_QuotedValue("%" + FldVal + "%", FldType); 
			} else if (FldOpr == "STARTS WITH") { 
				return " LIKE " + ew_QuotedValue(FldVal + "%", FldType); 
			} else { 
				return " " + FldOpr + " " + ew_QuotedValue(FldVal, FldType); 
			}	
		} 

		// Return date search string 
		public string DateFilterString(string FldOpr, string FldVal, int FldType) 
		{ 
			object wrkVal1 = ewrpt_DateVal(FldOpr, FldVal, 1);
			object wrkVal2 = ewrpt_DateVal(FldOpr, FldVal, 2);
			if (ew_NotEmpty(wrkVal1) && ew_NotEmpty(wrkVal2)) { 
				return " BETWEEN " + ew_QuotedValue(wrkVal1, FldType) + " AND " + ew_QuotedValue(wrkVal2, FldType); 
			} else { 
				return ""; 
			} 
		}	

		// Clear selection stored in session
		public void ClearSessionSelection(string parm) {
			ew_Session["sel_Alumnos_Titulados_" + parm] = "";
			ew_Session["rf_Alumnos_Titulados_" + parm] = "";
			ew_Session["rt_Alumnos_Titulados_" + parm] = "";
		}

		// Load selection from session
		public void LoadSelectionFromSession(string parm) {
			crField fld = Alumnos_Titulados.Fields[parm];
			fld.SelectionList = (string[])ew_Session["sel_Alumnos_Titulados_" + parm];
			fld.RangeFrom = Convert.ToString(ew_Session["rf_Alumnos_Titulados_" + parm]);
			fld.RangeTo = Convert.ToString(ew_Session["rt_Alumnos_Titulados_" + parm]);
		}		

		// Load default value for filters
		public void LoadDefaultFilters() {	
			string sWrk;
		  string sSql; 

			// Set up default values for dropdown filters
			//
			// Field NOMBRE_C

			Alumnos_Titulados.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE;
			Alumnos_Titulados.NOMBRE_C.DropDownValue = Alumnos_Titulados.NOMBRE_C.DefaultDropDownValue;

			// Field JORNADA
			Alumnos_Titulados.JORNADA.DefaultDropDownValue = EWRPT_INIT_VALUE;
			Alumnos_Titulados.JORNADA.DropDownValue = Alumnos_Titulados.JORNADA.DefaultDropDownValue;

			// Field ANO
			Alumnos_Titulados.ANO.DefaultDropDownValue = EWRPT_INIT_VALUE;
			Alumnos_Titulados.ANO.DropDownValue = Alumnos_Titulados.ANO.DefaultDropDownValue;

			// Field PERIODO
			Alumnos_Titulados.PERIODO.DefaultDropDownValue = EWRPT_INIT_VALUE;
			Alumnos_Titulados.PERIODO.DropDownValue = Alumnos_Titulados.PERIODO.DefaultDropDownValue;

			// Field ANOEGRE
			Alumnos_Titulados.ANOEGRE.DefaultDropDownValue = EWRPT_INIT_VALUE;
			Alumnos_Titulados.ANOEGRE.DropDownValue = Alumnos_Titulados.ANOEGRE.DefaultDropDownValue;

			// Field PERIODOEGRE
			Alumnos_Titulados.PERIODOEGRE.DefaultDropDownValue = EWRPT_INIT_VALUE;
			Alumnos_Titulados.PERIODOEGRE.DropDownValue = Alumnos_Titulados.PERIODOEGRE.DefaultDropDownValue;

			// Set up default values for extended filters
			// Field CODCLI

			SetDefaultExtFilter(ref Alumnos_Titulados.CODCLI, "LIKE", null, "AND", "=", null);
			ApplyDefaultExtFilter(ref Alumnos_Titulados.CODCLI);		

			// Field PATERNO
			SetDefaultExtFilter(ref Alumnos_Titulados.PATERNO, "LIKE", null, "AND", "=", null);
			ApplyDefaultExtFilter(ref Alumnos_Titulados.PATERNO);		

			// Field MATERNO
			SetDefaultExtFilter(ref Alumnos_Titulados.MATERNO, "LIKE", null, "AND", "=", null);
			ApplyDefaultExtFilter(ref Alumnos_Titulados.MATERNO);		

			// Set up default values for popup filters
			// - NOTE: if extended filter is enabled, use default values in extended filter instead

		}

		// Check if filter applied
		public bool CheckFilter() {
		  bool bFilterExist = false;

			// Check CODCLI extended filter
			if (TextFilterApplied(ref Alumnos_Titulados.CODCLI))
				bFilterExist = true;

			// Check PATERNO extended filter
			if (TextFilterApplied(ref Alumnos_Titulados.PATERNO))
				bFilterExist = true;

			// Check MATERNO extended filter
			if (TextFilterApplied(ref Alumnos_Titulados.MATERNO))
				bFilterExist = true;

			// Check NOMBRE_C dropdown filter
			if (NonTextFilterApplied(ref Alumnos_Titulados.NOMBRE_C))
				bFilterExist = true;

			// Check JORNADA dropdown filter
			if (NonTextFilterApplied(ref Alumnos_Titulados.JORNADA))
				bFilterExist = true;

			// Check ANO dropdown filter
			if (NonTextFilterApplied(ref Alumnos_Titulados.ANO))
				bFilterExist = true;

			// Check PERIODO dropdown filter
			if (NonTextFilterApplied(ref Alumnos_Titulados.PERIODO))
				bFilterExist = true;

			// Check ANOEGRE dropdown filter
			if (NonTextFilterApplied(ref Alumnos_Titulados.ANOEGRE))
				bFilterExist = true;

			// Check PERIODOEGRE dropdown filter
			if (NonTextFilterApplied(ref Alumnos_Titulados.PERIODOEGRE))
				bFilterExist = true;
			return bFilterExist;
		}		

		// Show list of filters
		public void ShowFilterList() {
			string sFilterList = "";
		  string sExtWrk; 
		  string sWrk;

			// Field CODCLI
			sExtWrk = "";
			sWrk = "";
			BuildExtendedFilter(ref Alumnos_Titulados.CODCLI, ref sExtWrk);
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += Alumnos_Titulados.CODCLI.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field PATERNO
			sExtWrk = "";
			sWrk = "";
			BuildExtendedFilter(ref Alumnos_Titulados.PATERNO, ref sExtWrk);
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += Alumnos_Titulados.PATERNO.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field MATERNO
			sExtWrk = "";
			sWrk = "";
			BuildExtendedFilter(ref Alumnos_Titulados.MATERNO, ref sExtWrk);
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += Alumnos_Titulados.MATERNO.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field NOMBRE_C
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref Alumnos_Titulados.NOMBRE_C, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += Alumnos_Titulados.NOMBRE_C.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field JORNADA
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref Alumnos_Titulados.JORNADA, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += Alumnos_Titulados.JORNADA.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field ANO
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref Alumnos_Titulados.ANO, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += Alumnos_Titulados.ANO.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field PERIODO
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref Alumnos_Titulados.PERIODO, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += Alumnos_Titulados.PERIODO.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field ANOEGRE
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref Alumnos_Titulados.ANOEGRE, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += Alumnos_Titulados.ANOEGRE.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field PERIODOEGRE
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref Alumnos_Titulados.PERIODOEGRE, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += Alumnos_Titulados.PERIODOEGRE.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Show Filters
			if (ew_NotEmpty(sFilterList)) {
				ew_Write("CURRENT FILTERS:<br>");
				ew_Write(sFilterList);
			}
		}

		// Return popup filter
		public string GetPopupFilter() {
			string sWrk = "";
			return sWrk;
		}

		// Return Sort parameters based on Sort links clicked	
		public string GetSort() {
			bool bCtrl = false;
			string sOrder, sOrderType, sOrderBy;
			string sSortField, sLastSort, sThisSort = "", sSortSql = "";

			// Check for a resetsort command
			if (ew_NotEmpty(ew_Get("cmd"))) {
				string sCmd = ew_Get("cmd");
				if (ew_SameText(sCmd, "resetsort")) {
					Alumnos_Titulados.OrderBy = "";
					Alumnos_Titulados.StartGroup = 1;
					Alumnos_Titulados.CODCLI.Sort = "";
					Alumnos_Titulados.DIG.Sort = "";
					Alumnos_Titulados.PATERNO.Sort = "";
					Alumnos_Titulados.MATERNO.Sort = "";
					Alumnos_Titulados.NOMBRE.Sort = "";
					Alumnos_Titulados.SEXO.Sort = "";
					Alumnos_Titulados.FECNAC.Sort = "";
					Alumnos_Titulados.NACIONALIDAD.Sort = "";
					Alumnos_Titulados.NOMBRE_C.Sort = "";
					Alumnos_Titulados.JORNADA.Sort = "";
					Alumnos_Titulados.FECHASITU.Sort = "";
					Alumnos_Titulados.ANO.Sort = "";
					Alumnos_Titulados.PERIODO.Sort = "";
					Alumnos_Titulados.ANOEGRE.Sort = "";
					Alumnos_Titulados.PERIODOEGRE.Sort = "";
				}

			// Check for an Order parameter
			} else if (ew_NotEmpty(ew_Get("order"))) {
				Alumnos_Titulados.CurrentOrder = ew_Get("order");
				Alumnos_Titulados.CurrentOrderType = ew_Get("ordertype");
				sSortSql = Alumnos_Titulados.SortSql();
				Alumnos_Titulados.OrderBy = sSortSql;
				Alumnos_Titulados.StartGroup = 1;
			}

			// Set up default sort
			if (ew_Empty(Alumnos_Titulados.OrderBy)) {
				Alumnos_Titulados.OrderBy = "[FECHASITU] DESC";
				Alumnos_Titulados.FECHASITU.Sort = "DESC";
			}
			return Alumnos_Titulados.OrderBy;
		}

		// Page Load event
		public void Page_Load() {

			//ew_Write("Page Load");
		}

		// Page Unload event
		public void Page_Unload() {

			//ew_Write("Page Unload");
		}

		// Message Showing event
		public void Message_Showing(ref string msg) {

			// Example:
			//msg = "your new message";

		}

		// Page Data Rendering event
		public void Page_DataRendering(ref string header) {

			// Example:
			//header = "your header";

		}

		// Page Data Rendered event
		public void Page_DataRendered(ref string footer) {

			// Example:
			//footer = "your footer";

		}

		// Form Custom Validate event
		public bool Form_CustomValidate(ref string CustomError) {

			// Return error message in CustomError
			return true;
		}
	}

	//
	// ASP.NET Page_Load event
	//

	protected void Page_Load(object sender, System.EventArgs e) {
		gsDebugMsg = "";

		// Page init
		Alumnos_Titulados_summary = new crAlumnos_Titulados_summary(this);
		Alumnos_Titulados_summary.Page_Init();

		// Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER;
		Response.Cache.SetCacheability(HttpCacheability.NoCache);

		// Page main processing
		Alumnos_Titulados_summary.Page_Main();
	}

	//
	// ASP.NET Page_Unload event
	//

	protected void Page_Unload(object sender, System.EventArgs e) {

		// Dispose page object
		if (Alumnos_Titulados_summary != null) Alumnos_Titulados_summary.Dispose();
	}
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% if (Alumnos_Titulados.Export == "") { %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">

// Create page object
var Alumnos_Titulados_summary = new ewrpt_Page("Alumnos_Titulados_summary");

// page properties
Alumnos_Titulados_summary.PageID = "summary"; // page ID
Alumnos_Titulados_summary.FormID = "fAlumnos_Tituladossummaryfilter"; // form ID
var EWRPT_PAGE_ID = Alumnos_Titulados_summary.PageID;

// extend page with ValidateForm function
Alumnos_Titulados_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation

	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}

// extend page with Form_CustomValidate function
Alumnos_Titulados_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!

 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% if (EWRPT_CLIENT_VALIDATE) { %>
Alumnos_Titulados_summary.ValidateRequired = true; // uses JavaScript validation
<% } else { %>
Alumnos_Titulados_summary.ValidateRequired = false; // no JavaScript validation
<% } %>
</script>
<script language="JavaScript" type="text/javascript">
<!--

// Write your client script here, no need to add script tags.
// To include another .js script, use:
// ew_ClientScriptInclude("my_javascript.js"); 
//-->

</script>
<% } %>
<% Alumnos_Titulados_summary.ShowPageHeader(); %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% if (Alumnos_Titulados.Export == "") { %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">

// popup fields
</script>
<% } %>
<% if (Alumnos_Titulados.Export == "") { %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% } %>
<div class="ewTitle"><h1><%= Alumnos_Titulados.TableCaption() %></h1>
<% if (Alumnos_Titulados.Export == "") { %>
&nbsp;&nbsp;<a href="<%= Alumnos_Titulados_summary.ExportExcelUrl %>"><img src="images/excel.png" /></a>
<% if (Alumnos_Titulados_summary.FilterApplied) { %>
&nbsp;&nbsp;<a href="Alumnos_Tituladossmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% } %>
<% } %>
</div><br><br>
<% Alumnos_Titulados_summary.ShowMessage(); %>
<% if (Alumnos_Titulados.Export == "") { %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% } %>
<% if (Alumnos_Titulados.Export == "") { %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% } %>
<!-- summary report starts -->
<div id="report_summary">
<% if (Alumnos_Titulados.Export == "") { %>
<%
string sButtonImage, sDivDisplay;
if (Alumnos_Titulados.FilterPanelOption == 2 || (Alumnos_Titulados.FilterPanelOption == 3 && Alumnos_Titulados_summary.FilterApplied) || Alumnos_Titulados_summary.Filter == "0=101") {
	sButtonImage = "aspxrptimages/collapse.gif"; 
	sDivDisplay = ""; 
} else { 
	sButtonImage = "aspxrptimages/expand.gif"; 
	sDivDisplay = " style=\"display: none;\""; 
} 
%>
<a href="javascript:ewrpt_ToggleFilterPanel();" style="text-decoration: none;"><img id="ewrptToggleFilterImg" src="<%= sButtonImage %>" alt="" width="9" height="9" border="0"></a><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("Filters") %></span><br><br>
<div id="ewrptExtFilterPanel"<%= sDivDisplay %>>
<!-- Search form (begin) -->
<form name="fAlumnos_Tituladossummaryfilter" id="fAlumnos_Tituladossummaryfilter" action="Alumnos_Tituladossmry.aspx" class="ewForm" onsubmit="return Alumnos_Titulados_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

// Popup Filter
int cntf = Alumnos_Titulados.MATERNO.CustomFilters.Count;
int totcnt;
int wrkcnt;
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Titulados.CODCLI.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_CODCLI" id="so1_CODCLI" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_CODCLI" id="sv1_CODCLI" size="30" maxlength="30" value="<%= ew_HtmlEncode(Alumnos_Titulados.CODCLI.SearchValue) %>"<%= (Alumnos_Titulados_summary.ClearExtFilter == "Alumnos_Titulados_CODCLI") ? " class=\"ewInputCleared\"" : "" %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Titulados.PATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_PATERNO" id="so1_PATERNO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Alumnos_Titulados.PATERNO.SearchValue) %>"<%= (Alumnos_Titulados_summary.ClearExtFilter == "Alumnos_Titulados_PATERNO") ? " class=\"ewInputCleared\"" : "" %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Titulados.MATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_MATERNO" id="so1_MATERNO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(Alumnos_Titulados.MATERNO.SearchValue) %>"<%= (Alumnos_Titulados_summary.ClearExtFilter == "Alumnos_Titulados_MATERNO") ? " class=\"ewInputCleared\"" : "" %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Titulados.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= (Alumnos_Titulados_summary.ClearExtFilter == "Alumnos_Titulados_NOMBRE_C") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = Alumnos_Titulados.NOMBRE_C.CustomFilters.Count + Alumnos_Titulados.NOMBRE_C.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in Alumnos_Titulados.NOMBRE_C.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.NOMBRE_C.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in Alumnos_Titulados.NOMBRE_C.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.NOMBRE_C.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt++;
}
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Titulados.JORNADA.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_JORNADA" id="sv_JORNADA"<%= (Alumnos_Titulados_summary.ClearExtFilter == "Alumnos_Titulados_JORNADA") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.JORNADA.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = Alumnos_Titulados.JORNADA.CustomFilters.Count + Alumnos_Titulados.JORNADA.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in Alumnos_Titulados.JORNADA.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "JORNADA")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.JORNADA.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in Alumnos_Titulados.JORNADA.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.JORNADA.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt++;
}
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Titulados.ANO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO" id="sv_ANO"<%= (Alumnos_Titulados_summary.ClearExtFilter == "Alumnos_Titulados_ANO") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.ANO.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = Alumnos_Titulados.ANO.CustomFilters.Count + Alumnos_Titulados.ANO.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in Alumnos_Titulados.ANO.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "ANO")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.ANO.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in Alumnos_Titulados.ANO.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.ANO.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt++;
}
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Titulados.PERIODO.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODO" id="sv_PERIODO"<%= (Alumnos_Titulados_summary.ClearExtFilter == "Alumnos_Titulados_PERIODO") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.PERIODO.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = Alumnos_Titulados.PERIODO.CustomFilters.Count + Alumnos_Titulados.PERIODO.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in Alumnos_Titulados.PERIODO.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "PERIODO")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.PERIODO.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in Alumnos_Titulados.PERIODO.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.PERIODO.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt++;
}
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Titulados.ANOEGRE.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANOEGRE" id="sv_ANOEGRE"<%= (Alumnos_Titulados_summary.ClearExtFilter == "Alumnos_Titulados_ANOEGRE") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.ANOEGRE.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = Alumnos_Titulados.ANOEGRE.CustomFilters.Count + Alumnos_Titulados.ANOEGRE.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in Alumnos_Titulados.ANOEGRE.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "ANOEGRE")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.ANOEGRE.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in Alumnos_Titulados.ANOEGRE.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.ANOEGRE.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt++;
}
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= Alumnos_Titulados.PERIODOEGRE.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODOEGRE" id="sv_PERIODOEGRE"<%= (Alumnos_Titulados_summary.ClearExtFilter == "Alumnos_Titulados_PERIODOEGRE") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.PERIODOEGRE.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = Alumnos_Titulados.PERIODOEGRE.CustomFilters.Count + Alumnos_Titulados.PERIODOEGRE.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in Alumnos_Titulados.PERIODOEGRE.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "PERIODOEGRE")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.PERIODOEGRE.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in Alumnos_Titulados.PERIODOEGRE.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(Alumnos_Titulados.PERIODOEGRE.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt++;
}
%>
		</select>
		</span></td>
	</tr>
</table>
<table class="ewRptExtFilter">
	<tr>
		<td><span class="aspnetreportmaker">
			<input type="submit" name="Submit" id="Submit" value="<%= ReportLanguage.Phrase("Search") %>">			
		</span></td>
	</tr>
</table>
</form>
<!-- Search form (end) -->
</div>
<br>
<% } %>
<% if (Alumnos_Titulados.ShowCurrentFilter) { %>
<div id="ewrptFilterList">
<% Alumnos_Titulados_summary.ShowFilterList(); %>
</div>
<br>
<% } %>
<table class="ewGrid" cellspacing="0"><tr>
	<td class="ewGridContent">
<!-- Report Grid (Begin) -->
<div class="ewGridMiddlePanel">
<table class="ewTable ewTableSeparate" cellspacing="0">
<%

// Set the last group to display if not export all
if (Alumnos_Titulados.ExportAll && ew_NotEmpty(Alumnos_Titulados.Export)) {
	Alumnos_Titulados_summary.StopGrp = Alumnos_Titulados_summary.TotalGrps;
} else {
	Alumnos_Titulados_summary.StopGrp = Alumnos_Titulados_summary.StartGrp + Alumnos_Titulados_summary.DisplayGrps - 1;
}

// Stop group <= total number of groups
if (Alumnos_Titulados_summary.StopGrp > Alumnos_Titulados_summary.TotalGrps)
	Alumnos_Titulados_summary.StopGrp = Alumnos_Titulados_summary.TotalGrps;
Alumnos_Titulados_summary.RecCount = 0;

// Get first row
if (Alumnos_Titulados_summary.TotalGrps > 0) {
	Alumnos_Titulados_summary.GetRow(); // ASPXRPT
	Alumnos_Titulados_summary.GrpCount = 1;
}
while ((Alumnos_Titulados_summary.HasRow && Alumnos_Titulados_summary.GrpIndex < Alumnos_Titulados_summary.StopGrp) || Alumnos_Titulados_summary.ShowFirstHeader) {

	// Show header
	if (Alumnos_Titulados_summary.ShowFirstHeader) {
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.CODCLI.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.CODCLI))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.CODCLI.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.CODCLI) %>',0);"><%= Alumnos_Titulados.CODCLI.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.CODCLI.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.CODCLI.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.DIG.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.DIG))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.DIG.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.DIG) %>',0);"><%= Alumnos_Titulados.DIG.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.DIG.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.DIG.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.PATERNO.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.PATERNO))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.PATERNO.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.PATERNO) %>',0);"><%= Alumnos_Titulados.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.PATERNO.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.PATERNO.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.MATERNO.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.MATERNO))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.MATERNO.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.MATERNO) %>',0);"><%= Alumnos_Titulados.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.MATERNO.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.MATERNO.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.NOMBRE.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.NOMBRE))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.NOMBRE.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.NOMBRE) %>',0);"><%= Alumnos_Titulados.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.NOMBRE.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.NOMBRE.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.SEXO.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.SEXO))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.SEXO.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.SEXO) %>',0);"><%= Alumnos_Titulados.SEXO.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.SEXO.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.SEXO.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.FECNAC.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.FECNAC))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.FECNAC.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.FECNAC) %>',0);"><%= Alumnos_Titulados.FECNAC.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.FECNAC.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.FECNAC.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.NACIONALIDAD.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.NACIONALIDAD))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.NACIONALIDAD.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.NACIONALIDAD) %>',0);"><%= Alumnos_Titulados.NACIONALIDAD.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.NACIONALIDAD.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.NACIONALIDAD.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.NOMBRE_C.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.NOMBRE_C))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.NOMBRE_C.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.NOMBRE_C) %>',0);"><%= Alumnos_Titulados.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.NOMBRE_C.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.NOMBRE_C.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.JORNADA.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.JORNADA))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.JORNADA.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.JORNADA) %>',0);"><%= Alumnos_Titulados.JORNADA.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.JORNADA.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.JORNADA.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.FECHASITU.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.FECHASITU))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.FECHASITU.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.FECHASITU) %>',0);"><%= Alumnos_Titulados.FECHASITU.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.FECHASITU.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.FECHASITU.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.ANO.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.ANO))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.ANO.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.ANO) %>',0);"><%= Alumnos_Titulados.ANO.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.ANO.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.ANO.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.PERIODO.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.PERIODO))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.PERIODO.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.PERIODO) %>',0);"><%= Alumnos_Titulados.PERIODO.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.PERIODO.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.PERIODO.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.ANOEGRE.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.ANOEGRE))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.ANOEGRE.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.ANOEGRE) %>',0);"><%= Alumnos_Titulados.ANOEGRE.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.ANOEGRE.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.ANOEGRE.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(Alumnos_Titulados.Export)) { %>
<%= Alumnos_Titulados.PERIODOEGRE.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(Alumnos_Titulados.SortUrl(Alumnos_Titulados.PERIODOEGRE))) { %>
		<td style="vertical-align: bottom;"><%= Alumnos_Titulados.PERIODOEGRE.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= Alumnos_Titulados.SortUrl(Alumnos_Titulados.PERIODOEGRE) %>',0);"><%= Alumnos_Titulados.PERIODOEGRE.FldCaption() %></td><td style="width: 10px;">
		<% if (Alumnos_Titulados.PERIODOEGRE.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (Alumnos_Titulados.PERIODOEGRE.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		Alumnos_Titulados_summary.ShowFirstHeader = false;
	}
	Alumnos_Titulados_summary.RecCount++;

		// Render detail row
		Alumnos_Titulados.ResetCSS();
		Alumnos_Titulados.RowType = EWRPT_ROWTYPE_DETAIL;
		Alumnos_Titulados_summary.RenderRow();
%>
	<tr<%= Alumnos_Titulados.RowAttributes() %>>
		<td<%= Alumnos_Titulados.CODCLI.CellAttributes %>>
<div<%= Alumnos_Titulados.CODCLI.ViewAttributes%>><%= Alumnos_Titulados.CODCLI.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.DIG.CellAttributes %>>
<div<%= Alumnos_Titulados.DIG.ViewAttributes%>><%= Alumnos_Titulados.DIG.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.PATERNO.CellAttributes %>>
<div<%= Alumnos_Titulados.PATERNO.ViewAttributes%>><%= Alumnos_Titulados.PATERNO.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.MATERNO.CellAttributes %>>
<div<%= Alumnos_Titulados.MATERNO.ViewAttributes%>><%= Alumnos_Titulados.MATERNO.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.NOMBRE.CellAttributes %>>
<div<%= Alumnos_Titulados.NOMBRE.ViewAttributes%>><%= Alumnos_Titulados.NOMBRE.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.SEXO.CellAttributes %>>
<div<%= Alumnos_Titulados.SEXO.ViewAttributes%>><%= Alumnos_Titulados.SEXO.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.FECNAC.CellAttributes %>>
<div<%= Alumnos_Titulados.FECNAC.ViewAttributes%>><%= Alumnos_Titulados.FECNAC.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.NACIONALIDAD.CellAttributes %>>
<div<%= Alumnos_Titulados.NACIONALIDAD.ViewAttributes%>><%= Alumnos_Titulados.NACIONALIDAD.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.NOMBRE_C.CellAttributes %>>
<div<%= Alumnos_Titulados.NOMBRE_C.ViewAttributes%>><%= Alumnos_Titulados.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.JORNADA.CellAttributes %>>
<div<%= Alumnos_Titulados.JORNADA.ViewAttributes%>><%= Alumnos_Titulados.JORNADA.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.FECHASITU.CellAttributes %>>
<div<%= Alumnos_Titulados.FECHASITU.ViewAttributes%>><%= Alumnos_Titulados.FECHASITU.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.ANO.CellAttributes %>>
<div<%= Alumnos_Titulados.ANO.ViewAttributes%>><%= Alumnos_Titulados.ANO.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.PERIODO.CellAttributes %>>
<div<%= Alumnos_Titulados.PERIODO.ViewAttributes%>><%= Alumnos_Titulados.PERIODO.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.ANOEGRE.CellAttributes %>>
<div<%= Alumnos_Titulados.ANOEGRE.ViewAttributes%>><%= Alumnos_Titulados.ANOEGRE.ListViewValue%></div>
</td>
		<td<%= Alumnos_Titulados.PERIODOEGRE.CellAttributes %>>
<div<%= Alumnos_Titulados.PERIODOEGRE.ViewAttributes%>><%= Alumnos_Titulados.PERIODOEGRE.ListViewValue%></div>
</td>
	</tr>
<%

		// Accumulate page summary
		Alumnos_Titulados_summary.AccumulateSummary();		

	// Get next record
		Alumnos_Titulados_summary.GetRow(); // ASPXRPT
		Alumnos_Titulados_summary.GrpCount++;
} // End while
%>
	</tbody>
	<tfoot>
<%
if (Alumnos_Titulados_summary.TotalGrps > 0) {
	Alumnos_Titulados.ResetCSS();
	Alumnos_Titulados.RowType = EWRPT_ROWTYPE_TOTAL;
	Alumnos_Titulados.RowTotalType = EWRPT_ROWTOTAL_GRAND;
	Alumnos_Titulados.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER;
	Alumnos_Titulados.RowAttrs["class"] = "ewRptGrandSummary";
	Alumnos_Titulados_summary.RenderRow();
%>
	<!-- tr><td colspan="15"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= Alumnos_Titulados.RowAttributes() %>><td colspan="15"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(Alumnos_Titulados_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% } %>
	</tfoot>
</table>
</div>
<% if (Alumnos_Titulados.Export == "") { %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% if (Alumnos_Titulados_summary.Pager == null) Alumnos_Titulados_summary.Pager = new cPrevNextPager(Alumnos_Titulados_summary.StartGrp, Alumnos_Titulados_summary.DisplayGrps, Alumnos_Titulados_summary.TotalGrps); %>
<% if (Alumnos_Titulados_summary.Pager.RecordCount > 0) { %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% if (Alumnos_Titulados_summary.Pager.FirstButton.Enabled) { %>
	<td><a href="Alumnos_Tituladossmry.aspx?start=<%= Alumnos_Titulados_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% } else { %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% } %>
<!--previous page button-->
	<% if (Alumnos_Titulados_summary.Pager.PrevButton.Enabled) { %>
	<td><a href="Alumnos_Tituladossmry.aspx?start=<%= Alumnos_Titulados_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% } else { %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% } %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= Alumnos_Titulados_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% if (Alumnos_Titulados_summary.Pager.NextButton.Enabled) { %>
	<td><a href="Alumnos_Tituladossmry.aspx?start=<%= Alumnos_Titulados_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% } else { %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% } %>
<!--last page button-->
	<% if (Alumnos_Titulados_summary.Pager.LastButton.Enabled) { %>
	<td><a href="Alumnos_Tituladossmry.aspx?start=<%= Alumnos_Titulados_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% } else { %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% } %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= Alumnos_Titulados_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= Alumnos_Titulados_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= Alumnos_Titulados_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= Alumnos_Titulados_summary.Pager.RecordCount %></span>	
<% } else { %>
	<% if (Alumnos_Titulados_summary.Filter == "0=101") { %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% } else { %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% } %>
<% } %>
		</td>
<% if (Alumnos_Titulados_summary.TotalGrps > 0) { %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% if (Alumnos_Titulados_summary.DisplayGrps == 10) Response.Write(" selected=\"selected\""); %>>10</option>
<option value="15"<% if (Alumnos_Titulados_summary.DisplayGrps == 15) Response.Write(" selected=\"selected\""); %>>15</option>
<option value="20"<% if (Alumnos_Titulados_summary.DisplayGrps == 20) Response.Write(" selected=\"selected\""); %>>20</option>
<option value="50"<% if (Alumnos_Titulados_summary.DisplayGrps == 50) Response.Write(" selected=\"selected\""); %>>50</option>
</select>
		</span></td>
<% } %>
	</tr>
</table>
</form>
</div>
<% } %>
</td></tr></table>
</div>
<!-- Summary Report Ends -->
<% if (Alumnos_Titulados.Export == "") { %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% } %>
<% if (Alumnos_Titulados.Export == "") { %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% } %>
<% if (Alumnos_Titulados.Export == "") { %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% } %>
<% Alumnos_Titulados_summary.ShowPageFooter(); %>
<% if (EWRPT_DEBUG_ENABLED) ew_Write(ew_DebugMsg()); %>
<% if (Alumnos_Titulados.Export == "") { %>
<script language="JavaScript" type="text/javascript">
<!--

// Write your table-specific startup script here
// document.write("page loaded");
//-->

</script>
<% } %>
</asp:Content>
