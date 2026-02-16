<%@ Page ClassName="EstadoAcademicosmry" Language="C#" MasterPageFile="rmasterpage.master" Inherits="AspNetReportMaker4_project1" %>
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
	public crEstadoAcademico EstadoAcademico = null;

	//
	// Table class (for EstadoAcademico)
	//
	public class crEstadoAcademico : AspNetReportMakerBase {

		public bool ShowCurrentFilter = EWRPT_SHOW_CURRENT_FILTER;

		public int FilterPanelOption = EWRPT_FILTER_PANEL_OPTION;

		public string CurrentOrder = ""; // Current order

		public string CurrentOrderType = ""; // Current order type

		// Define table level constants
		public bool UseTokenInUrl = EWRPT_USE_TOKEN_IN_URL;

		// Table variable
		public string TableVar {
			get { return "EstadoAcademico"; }
		}

		// Table name
		public string TableName {
			get { return "EstadoAcademico"; }
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

		public crField RUT;

		public crField PATERNO;

		public crField MATERNO;

		public crField NOMBRE;

		public crField NOMBRE_C;

		public crField JORNADA;

		public crField CODCARR;

		public crField ESTACAD;

		public crField INGRESO;

		public crField DIRECCION;

		public crField COMUNA;

		public crField CIUDAD;

		public crField FONO;

		public crField MAIL;

		public crField SEXO;

		public crField NACIONALIDAD;

		public crField FACULTAD;

		public crField codigo;

		public crField ANO_MAT;

		public crField PERIODO_MAT;

		public crField TIPOSITU;

		public crField DESCRIPCION;

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
		public crEstadoAcademico(AspNetReportMakerPage APage) {
			m_Page = APage;
			m_ParentPage = APage.ParentPage;

			// RUT
			RUT = new crField("EstadoAcademico", "EstadoAcademico", "x_RUT", "RUT", "[RUT]", 200, EWRPT_DATATYPE_STRING, -1);
			RUT.Page = APage;
			RUT.ParentPage = APage.ParentPage;
			Fields.Add("RUT", RUT);
			RUT.DateFilter = "";
			RUT.SqlSelect = "";
			RUT.SqlOrderBy = "";

			// PATERNO
			PATERNO = new crField("EstadoAcademico", "EstadoAcademico", "x_PATERNO", "PATERNO", "[PATERNO]", 200, EWRPT_DATATYPE_STRING, -1);
			PATERNO.Page = APage;
			PATERNO.ParentPage = APage.ParentPage;
			Fields.Add("PATERNO", PATERNO);
			PATERNO.DateFilter = "";
			PATERNO.SqlSelect = "";
			PATERNO.SqlOrderBy = "";

			// MATERNO
			MATERNO = new crField("EstadoAcademico", "EstadoAcademico", "x_MATERNO", "MATERNO", "[MATERNO]", 200, EWRPT_DATATYPE_STRING, -1);
			MATERNO.Page = APage;
			MATERNO.ParentPage = APage.ParentPage;
			Fields.Add("MATERNO", MATERNO);
			MATERNO.DateFilter = "";
			MATERNO.SqlSelect = "";
			MATERNO.SqlOrderBy = "";

			// NOMBRE
			NOMBRE = new crField("EstadoAcademico", "EstadoAcademico", "x_NOMBRE", "NOMBRE", "[NOMBRE]", 200, EWRPT_DATATYPE_STRING, -1);
			NOMBRE.Page = APage;
			NOMBRE.ParentPage = APage.ParentPage;
			Fields.Add("NOMBRE", NOMBRE);
			NOMBRE.DateFilter = "";
			NOMBRE.SqlSelect = "";
			NOMBRE.SqlOrderBy = "";

			// NOMBRE_C
			NOMBRE_C = new crField("EstadoAcademico", "EstadoAcademico", "x_NOMBRE_C", "NOMBRE_C", "[NOMBRE_C]", 200, EWRPT_DATATYPE_STRING, -1);
			NOMBRE_C.Page = APage;
			NOMBRE_C.ParentPage = APage.ParentPage;
			Fields.Add("NOMBRE_C", NOMBRE_C);
			NOMBRE_C.DateFilter = "";
			NOMBRE_C.SqlSelect = "";
			NOMBRE_C.SqlOrderBy = "";

			// JORNADA
			JORNADA = new crField("EstadoAcademico", "EstadoAcademico", "x_JORNADA", "JORNADA", "[JORNADA]", 200, EWRPT_DATATYPE_STRING, -1);
			JORNADA.Page = APage;
			JORNADA.ParentPage = APage.ParentPage;
			Fields.Add("JORNADA", JORNADA);
			JORNADA.DateFilter = "";
			JORNADA.SqlSelect = "";
			JORNADA.SqlOrderBy = "";

			// CODCARR
			CODCARR = new crField("EstadoAcademico", "EstadoAcademico", "x_CODCARR", "CODCARR", "[CODCARR]", 200, EWRPT_DATATYPE_STRING, -1);
			CODCARR.Page = APage;
			CODCARR.ParentPage = APage.ParentPage;
			Fields.Add("CODCARR", CODCARR);
			CODCARR.DateFilter = "";
			CODCARR.SqlSelect = "";
			CODCARR.SqlOrderBy = "";

			// ESTACAD
			ESTACAD = new crField("EstadoAcademico", "EstadoAcademico", "x_ESTACAD", "ESTACAD", "[ESTACAD]", 200, EWRPT_DATATYPE_STRING, -1);
			ESTACAD.Page = APage;
			ESTACAD.ParentPage = APage.ParentPage;
			Fields.Add("ESTACAD", ESTACAD);
			ESTACAD.DateFilter = "";
			ESTACAD.SqlSelect = "";
			ESTACAD.SqlOrderBy = "";

			// INGRESO
			INGRESO = new crField("EstadoAcademico", "EstadoAcademico", "x_INGRESO", "INGRESO", "[INGRESO]", 131, EWRPT_DATATYPE_NUMBER, -1);
			INGRESO.Page = APage;
			INGRESO.ParentPage = APage.ParentPage;
			INGRESO.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat");
			Fields.Add("INGRESO", INGRESO);
			INGRESO.DateFilter = "";
			INGRESO.SqlSelect = "";
			INGRESO.SqlOrderBy = "";

			// DIRECCION
			DIRECCION = new crField("EstadoAcademico", "EstadoAcademico", "x_DIRECCION", "DIRECCION", "[DIRECCION]", 200, EWRPT_DATATYPE_STRING, -1);
			DIRECCION.Page = APage;
			DIRECCION.ParentPage = APage.ParentPage;
			Fields.Add("DIRECCION", DIRECCION);
			DIRECCION.DateFilter = "";
			DIRECCION.SqlSelect = "";
			DIRECCION.SqlOrderBy = "";

			// COMUNA
			COMUNA = new crField("EstadoAcademico", "EstadoAcademico", "x_COMUNA", "COMUNA", "[COMUNA]", 200, EWRPT_DATATYPE_STRING, -1);
			COMUNA.Page = APage;
			COMUNA.ParentPage = APage.ParentPage;
			Fields.Add("COMUNA", COMUNA);
			COMUNA.DateFilter = "";
			COMUNA.SqlSelect = "";
			COMUNA.SqlOrderBy = "";

			// CIUDAD
			CIUDAD = new crField("EstadoAcademico", "EstadoAcademico", "x_CIUDAD", "CIUDAD", "[CIUDAD]", 200, EWRPT_DATATYPE_STRING, -1);
			CIUDAD.Page = APage;
			CIUDAD.ParentPage = APage.ParentPage;
			Fields.Add("CIUDAD", CIUDAD);
			CIUDAD.DateFilter = "";
			CIUDAD.SqlSelect = "";
			CIUDAD.SqlOrderBy = "";

			// FONO
			FONO = new crField("EstadoAcademico", "EstadoAcademico", "x_FONO", "FONO", "[FONO]", 200, EWRPT_DATATYPE_STRING, -1);
			FONO.Page = APage;
			FONO.ParentPage = APage.ParentPage;
			Fields.Add("FONO", FONO);
			FONO.DateFilter = "";
			FONO.SqlSelect = "";
			FONO.SqlOrderBy = "";

			// MAIL
			MAIL = new crField("EstadoAcademico", "EstadoAcademico", "x_MAIL", "MAIL", "[MAIL]", 200, EWRPT_DATATYPE_STRING, -1);
			MAIL.Page = APage;
			MAIL.ParentPage = APage.ParentPage;
			Fields.Add("MAIL", MAIL);
			MAIL.DateFilter = "";
			MAIL.SqlSelect = "";
			MAIL.SqlOrderBy = "";

			// SEXO
			SEXO = new crField("EstadoAcademico", "EstadoAcademico", "x_SEXO", "SEXO", "[SEXO]", 200, EWRPT_DATATYPE_STRING, -1);
			SEXO.Page = APage;
			SEXO.ParentPage = APage.ParentPage;
			Fields.Add("SEXO", SEXO);
			SEXO.DateFilter = "";
			SEXO.SqlSelect = "";
			SEXO.SqlOrderBy = "";

			// NACIONALIDAD
			NACIONALIDAD = new crField("EstadoAcademico", "EstadoAcademico", "x_NACIONALIDAD", "NACIONALIDAD", "[NACIONALIDAD]", 200, EWRPT_DATATYPE_STRING, -1);
			NACIONALIDAD.Page = APage;
			NACIONALIDAD.ParentPage = APage.ParentPage;
			Fields.Add("NACIONALIDAD", NACIONALIDAD);
			NACIONALIDAD.DateFilter = "";
			NACIONALIDAD.SqlSelect = "";
			NACIONALIDAD.SqlOrderBy = "";

			// FACULTAD
			FACULTAD = new crField("EstadoAcademico", "EstadoAcademico", "x_FACULTAD", "FACULTAD", "[FACULTAD]", 200, EWRPT_DATATYPE_STRING, -1);
			FACULTAD.Page = APage;
			FACULTAD.ParentPage = APage.ParentPage;
			Fields.Add("FACULTAD", FACULTAD);
			FACULTAD.DateFilter = "";
			FACULTAD.SqlSelect = "";
			FACULTAD.SqlOrderBy = "";

			// codigo
			codigo = new crField("EstadoAcademico", "EstadoAcademico", "x_codigo", "codigo", "[codigo]", 200, EWRPT_DATATYPE_STRING, -1);
			codigo.Page = APage;
			codigo.ParentPage = APage.ParentPage;
			Fields.Add("codigo", codigo);
			codigo.DateFilter = "";
			codigo.SqlSelect = "";
			codigo.SqlOrderBy = "";

			// ANO_MAT
			ANO_MAT = new crField("EstadoAcademico", "EstadoAcademico", "x_ANO_MAT", "ANO_MAT", "[ANO_MAT]", 131, EWRPT_DATATYPE_NUMBER, -1);
			ANO_MAT.Page = APage;
			ANO_MAT.ParentPage = APage.ParentPage;
			ANO_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat");
			Fields.Add("ANO_MAT", ANO_MAT);
			ANO_MAT.DateFilter = "";
			ANO_MAT.SqlSelect = "";
			ANO_MAT.SqlOrderBy = "";

			// PERIODO_MAT
			PERIODO_MAT = new crField("EstadoAcademico", "EstadoAcademico", "x_PERIODO_MAT", "PERIODO_MAT", "[PERIODO_MAT]", 131, EWRPT_DATATYPE_NUMBER, -1);
			PERIODO_MAT.Page = APage;
			PERIODO_MAT.ParentPage = APage.ParentPage;
			PERIODO_MAT.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat");
			Fields.Add("PERIODO_MAT", PERIODO_MAT);
			PERIODO_MAT.DateFilter = "";
			PERIODO_MAT.SqlSelect = "";
			PERIODO_MAT.SqlOrderBy = "";

			// TIPOSITU
			TIPOSITU = new crField("EstadoAcademico", "EstadoAcademico", "x_TIPOSITU", "TIPOSITU", "[TIPOSITU]", 131, EWRPT_DATATYPE_NUMBER, -1);
			TIPOSITU.Page = APage;
			TIPOSITU.ParentPage = APage.ParentPage;
			TIPOSITU.FldDefaultErrMsg = ReportLanguage.Phrase("IncorrectFloat");
			Fields.Add("TIPOSITU", TIPOSITU);
			TIPOSITU.DateFilter = "";
			TIPOSITU.SqlSelect = "";
			TIPOSITU.SqlOrderBy = "";

			// DESCRIPCION
			DESCRIPCION = new crField("EstadoAcademico", "EstadoAcademico", "x_DESCRIPCION", "DESCRIPCION", "[DESCRIPCION]", 200, EWRPT_DATATYPE_STRING, -1);
			DESCRIPCION.Page = APage;
			DESCRIPCION.ParentPage = APage.ParentPage;
			Fields.Add("DESCRIPCION", DESCRIPCION);
			DESCRIPCION.DateFilter = "";
			DESCRIPCION.SqlSelect = "";
			DESCRIPCION.SqlOrderBy = "";
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
			get {return "[SEK_Estado_Academico]";}
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
	public crEstadoAcademico_summary EstadoAcademico_summary;

	//
	// Page class
	//
	public class crEstadoAcademico_summary: AspNetReportMakerPage, IDisposable {

		// Page URL
		public string PageUrl() {
			string sUrl = ew_CurrentPage() + "?";
			if (EstadoAcademico.UseTokenInUrl)
				sUrl += "t=" + EstadoAcademico.TableVar + "&"; // Add page token
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
			if (EstadoAcademico.UseTokenInUrl) {
				if (HttpContext.Current.Request.RequestType == "POST")
					return (ew_SameStr(EstadoAcademico.TableVar, ew_Post("t")));
				if (ew_NotEmpty(ew_Get("t")))
					return (ew_SameStr(EstadoAcademico.TableVar, ew_Get("t")));
			}		
			return true;
		}

		// ASP.NET page object
		public EstadoAcademicosmry AspNetPage { 
			get { return (EstadoAcademicosmry)m_ParentPage; }
		}

		// Table object (EstadoAcademico)
		public crEstadoAcademico EstadoAcademico { 
			get {				
				return AspNetPage.EstadoAcademico; // Unlike ASP.NET Maker, the table object is not in the base class.
			}
			set {
				AspNetPage.EstadoAcademico = value;	
			}	
		}

		//
		// Page class constructor
		//
		public crEstadoAcademico_summary(AspNetReportMaker4_project1 APage) {		
			m_ParentPage = APage;
			m_Page = this;
			m_PageID = "summary";
			m_PageObjName = "EstadoAcademico_summary";
			m_PageObjTypeName = "crEstadoAcademico_summary";

			// Table name
			m_TableName = "EstadoAcademico";

			// Language object
			ReportLanguage = new crLanguage(this);

			// Table object (EstadoAcademico)
			EstadoAcademico = new crEstadoAcademico(this);			

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
				EstadoAcademico.Export = ew_Get("export");
			gsExport = EstadoAcademico.Export; // Get export parameter, used in header
			gsExportFile = EstadoAcademico.TableVar; // Get export file, used in header
			if (EstadoAcademico.Export == "excel") {
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

		public object[] Val = new object[23];

		public int[][] Cnt = new int[1][];

		public object[][] Smry = new object[1][];

		public object[][] Mn = new object[1][];

		public object[][] Mx = new object[1][];

		public object[] GrandSmry = new object[23];

		public object[] GrandMn = new object[23];

		public object[] GrandMx = new object[23];

		// Set up if accumulation required
		public bool[] Col = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};

		public int TotCount;

		//
		// Page main
		//
		public void Page_Main() {

			// Aggregate variables		
			int nDtls = 23; // No. of fields
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
			EstadoAcademico.CustomFilters_Load();

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
			string sSql = ewrpt_BuildReportSql(EstadoAcademico.SqlSelect, EstadoAcademico.SqlWhere, EstadoAcademico.SqlGroupBy, EstadoAcademico.SqlHaving, EstadoAcademico.SqlOrderBy, Filter, Sort);
			TotalGrps = GetCnt(sSql);
			if (DisplayGrps <= 0) // Display all groups
				DisplayGrps = TotalGrps;
			StartGrp = 1;

			// Show header
			ShowFirstHeader = (TotalGrps > 0);

			//ShowFirstHeader = TRUE; // Uncomment to always show header
			// Set up start position if not export all

			if (EstadoAcademico.ExportAll && ew_NotEmpty(EstadoAcademico.Export))
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
				EstadoAcademico.RUT.DbValue = Row["RUT"];
				EstadoAcademico.PATERNO.DbValue = Row["PATERNO"];
				EstadoAcademico.MATERNO.DbValue = Row["MATERNO"];
				EstadoAcademico.NOMBRE.DbValue = Row["NOMBRE"];
				EstadoAcademico.NOMBRE_C.DbValue = Row["NOMBRE_C"];
				EstadoAcademico.JORNADA.DbValue = Row["JORNADA"];
				EstadoAcademico.CODCARR.DbValue = Row["CODCARR"];
				EstadoAcademico.ESTACAD.DbValue = Row["ESTACAD"];
				EstadoAcademico.INGRESO.DbValue = Row["INGRESO"];
				EstadoAcademico.DIRECCION.DbValue = Row["DIRECCION"];
				EstadoAcademico.COMUNA.DbValue = Row["COMUNA"];
				EstadoAcademico.CIUDAD.DbValue = Row["CIUDAD"];
				EstadoAcademico.FONO.DbValue = Row["FONO"];
				EstadoAcademico.MAIL.DbValue = Row["MAIL"];
				EstadoAcademico.SEXO.DbValue = Row["SEXO"];
				EstadoAcademico.NACIONALIDAD.DbValue = Row["NACIONALIDAD"];
				EstadoAcademico.FACULTAD.DbValue = Row["FACULTAD"];
				EstadoAcademico.codigo.DbValue = Row["codigo"];
				EstadoAcademico.ANO_MAT.DbValue = Row["ANO_MAT"];
				EstadoAcademico.PERIODO_MAT.DbValue = Row["PERIODO_MAT"];
				EstadoAcademico.TIPOSITU.DbValue = Row["TIPOSITU"];
				EstadoAcademico.DESCRIPCION.DbValue = Row["DESCRIPCION"];
				Val[1] = EstadoAcademico.RUT.CurrentValue;
				Val[2] = EstadoAcademico.PATERNO.CurrentValue;
				Val[3] = EstadoAcademico.MATERNO.CurrentValue;
				Val[4] = EstadoAcademico.NOMBRE.CurrentValue;
				Val[5] = EstadoAcademico.NOMBRE_C.CurrentValue;
				Val[6] = EstadoAcademico.JORNADA.CurrentValue;
				Val[7] = EstadoAcademico.CODCARR.CurrentValue;
				Val[8] = EstadoAcademico.ESTACAD.CurrentValue;
				Val[9] = EstadoAcademico.INGRESO.CurrentValue;
				Val[10] = EstadoAcademico.DIRECCION.CurrentValue;
				Val[11] = EstadoAcademico.COMUNA.CurrentValue;
				Val[12] = EstadoAcademico.CIUDAD.CurrentValue;
				Val[13] = EstadoAcademico.FONO.CurrentValue;
				Val[14] = EstadoAcademico.MAIL.CurrentValue;
				Val[15] = EstadoAcademico.SEXO.CurrentValue;
				Val[16] = EstadoAcademico.NACIONALIDAD.CurrentValue;
				Val[17] = EstadoAcademico.FACULTAD.CurrentValue;
				Val[18] = EstadoAcademico.codigo.CurrentValue;
				Val[19] = EstadoAcademico.ANO_MAT.CurrentValue;
				Val[20] = EstadoAcademico.PERIODO_MAT.CurrentValue;
				Val[21] = EstadoAcademico.TIPOSITU.CurrentValue;
				Val[22] = EstadoAcademico.DESCRIPCION.CurrentValue;
			} else {
				EstadoAcademico.RUT.DbValue = "";
				EstadoAcademico.PATERNO.DbValue = "";
				EstadoAcademico.MATERNO.DbValue = "";
				EstadoAcademico.NOMBRE.DbValue = "";
				EstadoAcademico.NOMBRE_C.DbValue = "";
				EstadoAcademico.JORNADA.DbValue = "";
				EstadoAcademico.CODCARR.DbValue = "";
				EstadoAcademico.ESTACAD.DbValue = "";
				EstadoAcademico.INGRESO.DbValue = "";
				EstadoAcademico.DIRECCION.DbValue = "";
				EstadoAcademico.COMUNA.DbValue = "";
				EstadoAcademico.CIUDAD.DbValue = "";
				EstadoAcademico.FONO.DbValue = "";
				EstadoAcademico.MAIL.DbValue = "";
				EstadoAcademico.SEXO.DbValue = "";
				EstadoAcademico.NACIONALIDAD.DbValue = "";
				EstadoAcademico.FACULTAD.DbValue = "";
				EstadoAcademico.codigo.DbValue = "";
				EstadoAcademico.ANO_MAT.DbValue = "";
				EstadoAcademico.PERIODO_MAT.DbValue = "";
				EstadoAcademico.TIPOSITU.DbValue = "";
				EstadoAcademico.DESCRIPCION.DbValue = "";
			}
		}

		// Get row values from data reader // ASPXRPT
		public bool GetRow() {
			HasRow = (dr != null && dr.Read()); 
			if (HasRow) {
				GrpIndex++;			
				EstadoAcademico.RUT.DbValue = dr["RUT"];
				EstadoAcademico.PATERNO.DbValue = dr["PATERNO"];
				EstadoAcademico.MATERNO.DbValue = dr["MATERNO"];
				EstadoAcademico.NOMBRE.DbValue = dr["NOMBRE"];
				EstadoAcademico.NOMBRE_C.DbValue = dr["NOMBRE_C"];
				EstadoAcademico.JORNADA.DbValue = dr["JORNADA"];
				EstadoAcademico.CODCARR.DbValue = dr["CODCARR"];
				EstadoAcademico.ESTACAD.DbValue = dr["ESTACAD"];
				EstadoAcademico.INGRESO.DbValue = dr["INGRESO"];
				EstadoAcademico.DIRECCION.DbValue = dr["DIRECCION"];
				EstadoAcademico.COMUNA.DbValue = dr["COMUNA"];
				EstadoAcademico.CIUDAD.DbValue = dr["CIUDAD"];
				EstadoAcademico.FONO.DbValue = dr["FONO"];
				EstadoAcademico.MAIL.DbValue = dr["MAIL"];
				EstadoAcademico.SEXO.DbValue = dr["SEXO"];
				EstadoAcademico.NACIONALIDAD.DbValue = dr["NACIONALIDAD"];
				EstadoAcademico.FACULTAD.DbValue = dr["FACULTAD"];
				EstadoAcademico.codigo.DbValue = dr["codigo"];
				EstadoAcademico.ANO_MAT.DbValue = dr["ANO_MAT"];
				EstadoAcademico.PERIODO_MAT.DbValue = dr["PERIODO_MAT"];
				EstadoAcademico.TIPOSITU.DbValue = dr["TIPOSITU"];
				EstadoAcademico.DESCRIPCION.DbValue = dr["DESCRIPCION"];
				Val[1] = EstadoAcademico.RUT.CurrentValue;
				Val[2] = EstadoAcademico.PATERNO.CurrentValue;
				Val[3] = EstadoAcademico.MATERNO.CurrentValue;
				Val[4] = EstadoAcademico.NOMBRE.CurrentValue;
				Val[5] = EstadoAcademico.NOMBRE_C.CurrentValue;
				Val[6] = EstadoAcademico.JORNADA.CurrentValue;
				Val[7] = EstadoAcademico.CODCARR.CurrentValue;
				Val[8] = EstadoAcademico.ESTACAD.CurrentValue;
				Val[9] = EstadoAcademico.INGRESO.CurrentValue;
				Val[10] = EstadoAcademico.DIRECCION.CurrentValue;
				Val[11] = EstadoAcademico.COMUNA.CurrentValue;
				Val[12] = EstadoAcademico.CIUDAD.CurrentValue;
				Val[13] = EstadoAcademico.FONO.CurrentValue;
				Val[14] = EstadoAcademico.MAIL.CurrentValue;
				Val[15] = EstadoAcademico.SEXO.CurrentValue;
				Val[16] = EstadoAcademico.NACIONALIDAD.CurrentValue;
				Val[17] = EstadoAcademico.FACULTAD.CurrentValue;
				Val[18] = EstadoAcademico.codigo.CurrentValue;
				Val[19] = EstadoAcademico.ANO_MAT.CurrentValue;
				Val[20] = EstadoAcademico.PERIODO_MAT.CurrentValue;
				Val[21] = EstadoAcademico.TIPOSITU.CurrentValue;
				Val[22] = EstadoAcademico.DESCRIPCION.CurrentValue;
			} else {				
				EstadoAcademico.RUT.DbValue = "";
				EstadoAcademico.PATERNO.DbValue = "";
				EstadoAcademico.MATERNO.DbValue = "";
				EstadoAcademico.NOMBRE.DbValue = "";
				EstadoAcademico.NOMBRE_C.DbValue = "";
				EstadoAcademico.JORNADA.DbValue = "";
				EstadoAcademico.CODCARR.DbValue = "";
				EstadoAcademico.ESTACAD.DbValue = "";
				EstadoAcademico.INGRESO.DbValue = "";
				EstadoAcademico.DIRECCION.DbValue = "";
				EstadoAcademico.COMUNA.DbValue = "";
				EstadoAcademico.CIUDAD.DbValue = "";
				EstadoAcademico.FONO.DbValue = "";
				EstadoAcademico.MAIL.DbValue = "";
				EstadoAcademico.SEXO.DbValue = "";
				EstadoAcademico.NACIONALIDAD.DbValue = "";
				EstadoAcademico.FACULTAD.DbValue = "";
				EstadoAcademico.codigo.DbValue = "";
				EstadoAcademico.ANO_MAT.DbValue = "";
				EstadoAcademico.PERIODO_MAT.DbValue = "";
				EstadoAcademico.TIPOSITU.DbValue = "";
				EstadoAcademico.DESCRIPCION.DbValue = "";
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
				EstadoAcademico.StartGroup = StartGrp; 
			} else if (ew_NotEmpty(ew_Get("pageno"))) {		
				if (ewrpt_IsNumeric(ew_Get("pageno"))) {
					int nPageNo = ew_ConvertToInt(ew_Get("pageno"));  
					StartGrp = (nPageNo - 1) * DisplayGrps + 1; 
					if (StartGrp <= 0) { 
						StartGrp = 1; 
					} else if (StartGrp >= ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1) { 
						StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1; 
					} 
					EstadoAcademico.StartGroup = StartGrp; 
				} else { 
					StartGrp = EstadoAcademico.StartGroup;
				} 
			} else { 
				StartGrp = EstadoAcademico.StartGroup;
			} 

			// Check if correct start group counter 
			if (StartGrp <= 0) { // Avoid invalid start group counter 
				StartGrp = 1; // Reset start group counter 
				EstadoAcademico.StartGroup = StartGrp; 
			} else if (StartGrp > TotalGrps) { // Avoid starting group > total groups 
				StartGrp = ((TotalGrps - 1) / DisplayGrps) * DisplayGrps + 1; // Point to last page first group 
				EstadoAcademico.StartGroup = StartGrp; 
			} else if ((StartGrp - 1) % DisplayGrps != 0) { 
				StartGrp = ((StartGrp - 1) / DisplayGrps) * DisplayGrps + 1; // Point to page boundary 
				EstadoAcademico.StartGroup = StartGrp; 
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
			EstadoAcademico.StartGroup = StartGrp;
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
				EstadoAcademico.GroupPerPage = DisplayGrps; // Save to session
				StartGrp = 1; // Reset start position (reset command)				
				EstadoAcademico.StartGroup = StartGrp; 
			} else {				
				if (EstadoAcademico.GroupPerPage != 0) { 
					DisplayGrps = ew_ConvertToInt(EstadoAcademico.GroupPerPage); // Restore from Session 
				} else { 
					DisplayGrps = 15; // Load default 
				} 
			} 
		} 

		public void RenderRow() {
			if (EstadoAcademico.RowTotalType == EWRPT_ROWTOTAL_GRAND) { // Grand total

				// Get total count from SQL directly
				string sSql = ewrpt_BuildReportSql(EstadoAcademico.SqlSelectCount, EstadoAcademico.SqlWhere, EstadoAcademico.SqlGroupBy, EstadoAcademico.SqlHaving, "", Filter, "");
				TotCount = ew_ConvertToInt(ew_ExecuteScalar(sSql));				
			}

			// Call Row_Rendering event
			EstadoAcademico.Row_Rendering();

			//
			// Render view codes
			//

			if (EstadoAcademico.RowType == EWRPT_ROWTYPE_TOTAL) { // Summary row

				// RUT
				EstadoAcademico.RUT.ViewValue = Convert.ToString(EstadoAcademico.RUT.Summary);

				// PATERNO
				EstadoAcademico.PATERNO.ViewValue = Convert.ToString(EstadoAcademico.PATERNO.Summary);

				// MATERNO
				EstadoAcademico.MATERNO.ViewValue = Convert.ToString(EstadoAcademico.MATERNO.Summary);

				// NOMBRE
				EstadoAcademico.NOMBRE.ViewValue = Convert.ToString(EstadoAcademico.NOMBRE.Summary);

				// NOMBRE_C
				EstadoAcademico.NOMBRE_C.ViewValue = Convert.ToString(EstadoAcademico.NOMBRE_C.Summary);

				// JORNADA
				EstadoAcademico.JORNADA.ViewValue = Convert.ToString(EstadoAcademico.JORNADA.Summary);

				// CODCARR
				EstadoAcademico.CODCARR.ViewValue = Convert.ToString(EstadoAcademico.CODCARR.Summary);

				// ESTACAD
				EstadoAcademico.ESTACAD.ViewValue = Convert.ToString(EstadoAcademico.ESTACAD.Summary);

				// INGRESO
				EstadoAcademico.INGRESO.ViewValue = Convert.ToString(EstadoAcademico.INGRESO.Summary);

				// DIRECCION
				EstadoAcademico.DIRECCION.ViewValue = Convert.ToString(EstadoAcademico.DIRECCION.Summary);

				// COMUNA
				EstadoAcademico.COMUNA.ViewValue = Convert.ToString(EstadoAcademico.COMUNA.Summary);

				// CIUDAD
				EstadoAcademico.CIUDAD.ViewValue = Convert.ToString(EstadoAcademico.CIUDAD.Summary);

				// FONO
				EstadoAcademico.FONO.ViewValue = Convert.ToString(EstadoAcademico.FONO.Summary);

				// MAIL
				EstadoAcademico.MAIL.ViewValue = Convert.ToString(EstadoAcademico.MAIL.Summary);

				// SEXO
				EstadoAcademico.SEXO.ViewValue = Convert.ToString(EstadoAcademico.SEXO.Summary);

				// NACIONALIDAD
				EstadoAcademico.NACIONALIDAD.ViewValue = Convert.ToString(EstadoAcademico.NACIONALIDAD.Summary);

				// FACULTAD
				EstadoAcademico.FACULTAD.ViewValue = Convert.ToString(EstadoAcademico.FACULTAD.Summary);

				// codigo
				EstadoAcademico.codigo.ViewValue = Convert.ToString(EstadoAcademico.codigo.Summary);

				// ANO_MAT
				EstadoAcademico.ANO_MAT.ViewValue = Convert.ToString(EstadoAcademico.ANO_MAT.Summary);

				// PERIODO_MAT
				EstadoAcademico.PERIODO_MAT.ViewValue = Convert.ToString(EstadoAcademico.PERIODO_MAT.Summary);

				// TIPOSITU
				EstadoAcademico.TIPOSITU.ViewValue = Convert.ToString(EstadoAcademico.TIPOSITU.Summary);

				// DESCRIPCION
				EstadoAcademico.DESCRIPCION.ViewValue = Convert.ToString(EstadoAcademico.DESCRIPCION.Summary);
			} else {

				// RUT
				EstadoAcademico.RUT.ViewValue = Convert.ToString(EstadoAcademico.RUT.CurrentValue);
				EstadoAcademico.RUT.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// PATERNO
				EstadoAcademico.PATERNO.ViewValue = Convert.ToString(EstadoAcademico.PATERNO.CurrentValue);
				EstadoAcademico.PATERNO.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// MATERNO
				EstadoAcademico.MATERNO.ViewValue = Convert.ToString(EstadoAcademico.MATERNO.CurrentValue);
				EstadoAcademico.MATERNO.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// NOMBRE
				EstadoAcademico.NOMBRE.ViewValue = Convert.ToString(EstadoAcademico.NOMBRE.CurrentValue);
				EstadoAcademico.NOMBRE.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// NOMBRE_C
				EstadoAcademico.NOMBRE_C.ViewValue = Convert.ToString(EstadoAcademico.NOMBRE_C.CurrentValue);
				EstadoAcademico.NOMBRE_C.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// JORNADA
				EstadoAcademico.JORNADA.ViewValue = Convert.ToString(EstadoAcademico.JORNADA.CurrentValue);
				EstadoAcademico.JORNADA.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// CODCARR
				EstadoAcademico.CODCARR.ViewValue = Convert.ToString(EstadoAcademico.CODCARR.CurrentValue);
				EstadoAcademico.CODCARR.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// ESTACAD
				EstadoAcademico.ESTACAD.ViewValue = Convert.ToString(EstadoAcademico.ESTACAD.CurrentValue);
				EstadoAcademico.ESTACAD.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// INGRESO
				EstadoAcademico.INGRESO.ViewValue = Convert.ToString(EstadoAcademico.INGRESO.CurrentValue);
				EstadoAcademico.INGRESO.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// DIRECCION
				EstadoAcademico.DIRECCION.ViewValue = Convert.ToString(EstadoAcademico.DIRECCION.CurrentValue);
				EstadoAcademico.DIRECCION.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// COMUNA
				EstadoAcademico.COMUNA.ViewValue = Convert.ToString(EstadoAcademico.COMUNA.CurrentValue);
				EstadoAcademico.COMUNA.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// CIUDAD
				EstadoAcademico.CIUDAD.ViewValue = Convert.ToString(EstadoAcademico.CIUDAD.CurrentValue);
				EstadoAcademico.CIUDAD.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// FONO
				EstadoAcademico.FONO.ViewValue = Convert.ToString(EstadoAcademico.FONO.CurrentValue);
				EstadoAcademico.FONO.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// MAIL
				EstadoAcademico.MAIL.ViewValue = Convert.ToString(EstadoAcademico.MAIL.CurrentValue);
				EstadoAcademico.MAIL.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// SEXO
				EstadoAcademico.SEXO.ViewValue = Convert.ToString(EstadoAcademico.SEXO.CurrentValue);
				EstadoAcademico.SEXO.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// NACIONALIDAD
				EstadoAcademico.NACIONALIDAD.ViewValue = Convert.ToString(EstadoAcademico.NACIONALIDAD.CurrentValue);
				EstadoAcademico.NACIONALIDAD.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// FACULTAD
				EstadoAcademico.FACULTAD.ViewValue = Convert.ToString(EstadoAcademico.FACULTAD.CurrentValue);
				EstadoAcademico.FACULTAD.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// codigo
				EstadoAcademico.codigo.ViewValue = Convert.ToString(EstadoAcademico.codigo.CurrentValue);
				EstadoAcademico.codigo.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// ANO_MAT
				EstadoAcademico.ANO_MAT.ViewValue = Convert.ToString(EstadoAcademico.ANO_MAT.CurrentValue);
				EstadoAcademico.ANO_MAT.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// PERIODO_MAT
				EstadoAcademico.PERIODO_MAT.ViewValue = Convert.ToString(EstadoAcademico.PERIODO_MAT.CurrentValue);
				EstadoAcademico.PERIODO_MAT.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// TIPOSITU
				EstadoAcademico.TIPOSITU.ViewValue = Convert.ToString(EstadoAcademico.TIPOSITU.CurrentValue);
				EstadoAcademico.TIPOSITU.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";

				// DESCRIPCION
				EstadoAcademico.DESCRIPCION.ViewValue = Convert.ToString(EstadoAcademico.DESCRIPCION.CurrentValue);
				EstadoAcademico.DESCRIPCION.CellAttrs["class"] = (RecCount % 2 != 1) ? "ewTableAltRow" : "ewTableRow";
			}

			// RUT
			EstadoAcademico.RUT.HrefValue = "";

			// PATERNO
			EstadoAcademico.PATERNO.HrefValue = "";

			// MATERNO
			EstadoAcademico.MATERNO.HrefValue = "";

			// NOMBRE
			EstadoAcademico.NOMBRE.HrefValue = "";

			// NOMBRE_C
			EstadoAcademico.NOMBRE_C.HrefValue = "";

			// JORNADA
			EstadoAcademico.JORNADA.HrefValue = "";

			// CODCARR
			EstadoAcademico.CODCARR.HrefValue = "";

			// ESTACAD
			EstadoAcademico.ESTACAD.HrefValue = "";

			// INGRESO
			EstadoAcademico.INGRESO.HrefValue = "";

			// DIRECCION
			EstadoAcademico.DIRECCION.HrefValue = "";

			// COMUNA
			EstadoAcademico.COMUNA.HrefValue = "";

			// CIUDAD
			EstadoAcademico.CIUDAD.HrefValue = "";

			// FONO
			EstadoAcademico.FONO.HrefValue = "";

			// MAIL
			EstadoAcademico.MAIL.HrefValue = "";

			// SEXO
			EstadoAcademico.SEXO.HrefValue = "";

			// NACIONALIDAD
			EstadoAcademico.NACIONALIDAD.HrefValue = "";

			// FACULTAD
			EstadoAcademico.FACULTAD.HrefValue = "";

			// codigo
			EstadoAcademico.codigo.HrefValue = "";

			// ANO_MAT
			EstadoAcademico.ANO_MAT.HrefValue = "";

			// PERIODO_MAT
			EstadoAcademico.PERIODO_MAT.HrefValue = "";

			// TIPOSITU
			EstadoAcademico.TIPOSITU.HrefValue = "";

			// DESCRIPCION
			EstadoAcademico.DESCRIPCION.HrefValue = "";

			// Call Row_Rendered event
			EstadoAcademico.Row_Rendered();
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
			sSelect = "SELECT DISTINCT [NOMBRE_C] FROM " + EstadoAcademico.SqlFrom;
			sOrderBy = "[NOMBRE_C] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, EstadoAcademico.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			EstadoAcademico.NOMBRE_C.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);

			// Field ESTACAD
			sSelect = "SELECT DISTINCT [ESTACAD] FROM " + EstadoAcademico.SqlFrom;
			sOrderBy = "[ESTACAD] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, EstadoAcademico.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			EstadoAcademico.ESTACAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);

			// Field FACULTAD
			sSelect = "SELECT DISTINCT [FACULTAD] FROM " + EstadoAcademico.SqlFrom;
			sOrderBy = "[FACULTAD] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, EstadoAcademico.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			EstadoAcademico.FACULTAD.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);

			// Field ANO_MAT
			sSelect = "SELECT DISTINCT [ANO_MAT] FROM " + EstadoAcademico.SqlFrom;
			sOrderBy = "[ANO_MAT] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, EstadoAcademico.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			EstadoAcademico.ANO_MAT.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);

			// Field PERIODO_MAT
			sSelect = "SELECT DISTINCT [PERIODO_MAT] FROM " + EstadoAcademico.SqlFrom;
			sOrderBy = "[PERIODO_MAT] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, EstadoAcademico.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			EstadoAcademico.PERIODO_MAT.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);

			// Field TIPOSITU
			sSelect = "SELECT DISTINCT [TIPOSITU] FROM " + EstadoAcademico.SqlFrom;
			sOrderBy = "[TIPOSITU] ASC";
			wrkSql = ewrpt_BuildReportSql(sSelect, EstadoAcademico.SqlWhere, "", "", sOrderBy, UserIDFilter, "");
			EstadoAcademico.TIPOSITU.DropDownList = ParentPage.ewrpt_GetDistinctValues("", wrkSql);
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

				// Field RUT
				SetSessionFilterValues(ref EstadoAcademico.RUT);

				// Field PATERNO
				SetSessionFilterValues(ref EstadoAcademico.PATERNO);

				// Field MATERNO
				SetSessionFilterValues(ref EstadoAcademico.MATERNO);

				// Field NOMBRE_C
				SetSessionDropDownValue(EstadoAcademico.NOMBRE_C.DropDownValue, ref EstadoAcademico.NOMBRE_C);

				// Field ESTACAD
				SetSessionDropDownValue(EstadoAcademico.ESTACAD.DropDownValue, ref EstadoAcademico.ESTACAD);

				// Field FACULTAD
				SetSessionDropDownValue(EstadoAcademico.FACULTAD.DropDownValue, ref EstadoAcademico.FACULTAD);

				// Field ANO_MAT
				SetSessionDropDownValue(EstadoAcademico.ANO_MAT.DropDownValue, ref EstadoAcademico.ANO_MAT);

				// Field PERIODO_MAT
				SetSessionDropDownValue(EstadoAcademico.PERIODO_MAT.DropDownValue, ref EstadoAcademico.PERIODO_MAT);

				// Field TIPOSITU
				SetSessionDropDownValue(EstadoAcademico.TIPOSITU.DropDownValue, ref EstadoAcademico.TIPOSITU);
				bSetupFilter = true; // Set up filter required
			} else {

				// Field RUT
				if (GetFilterValues(ref EstadoAcademico.RUT)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				}

				// Field PATERNO
				if (GetFilterValues(ref EstadoAcademico.PATERNO)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				}

				// Field MATERNO
				if (GetFilterValues(ref EstadoAcademico.MATERNO)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				}

				// Field NOMBRE_C
				if (GetDropDownValue(ref EstadoAcademico.NOMBRE_C)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(EstadoAcademico.NOMBRE_C.DropDownValue)) {
					if (!ew_SameStr(EstadoAcademico.NOMBRE_C.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_EstadoAcademico_NOMBRE_C"] == null)
						bSetupFilter = true; // Set up filter required
				}

				// Field ESTACAD
				if (GetDropDownValue(ref EstadoAcademico.ESTACAD)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(EstadoAcademico.ESTACAD.DropDownValue)) {
					if (!ew_SameStr(EstadoAcademico.ESTACAD.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_EstadoAcademico_ESTACAD"] == null)
						bSetupFilter = true; // Set up filter required
				}

				// Field FACULTAD
				if (GetDropDownValue(ref EstadoAcademico.FACULTAD)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(EstadoAcademico.FACULTAD.DropDownValue)) {
					if (!ew_SameStr(EstadoAcademico.FACULTAD.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_EstadoAcademico_FACULTAD"] == null)
						bSetupFilter = true; // Set up filter required
				}

				// Field ANO_MAT
				if (GetDropDownValue(ref EstadoAcademico.ANO_MAT)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(EstadoAcademico.ANO_MAT.DropDownValue)) {
					if (!ew_SameStr(EstadoAcademico.ANO_MAT.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_EstadoAcademico_ANO_MAT"] == null)
						bSetupFilter = true; // Set up filter required
				}

				// Field PERIODO_MAT
				if (GetDropDownValue(ref EstadoAcademico.PERIODO_MAT)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(EstadoAcademico.PERIODO_MAT.DropDownValue)) {
					if (!ew_SameStr(EstadoAcademico.PERIODO_MAT.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_EstadoAcademico_PERIODO_MAT"] == null)
						bSetupFilter = true; // Set up filter required
				}

				// Field TIPOSITU
				if (GetDropDownValue(ref EstadoAcademico.TIPOSITU)) {
					bSetupFilter = true; // Set up filter required
					bRestoreSession = false; // Do not restore from session
				} else if (!ew_IsArrayList(EstadoAcademico.TIPOSITU.DropDownValue)) {
					if (!ew_SameStr(EstadoAcademico.TIPOSITU.DropDownValue, EWRPT_INIT_VALUE) && ew_Session["sv_EstadoAcademico_TIPOSITU"] == null)
						bSetupFilter = true; // Set up filter required
				}
				if (!ValidateForm()) {
					Message = gsFormError;
					return sFilter;
				}
			}

			// Restore session
			if (bRestoreSession) {

				// Field RUT
				GetSessionFilterValues(ref EstadoAcademico.RUT);

				// Field PATERNO
				GetSessionFilterValues(ref EstadoAcademico.PATERNO);

				// Field MATERNO
				GetSessionFilterValues(ref EstadoAcademico.MATERNO);

				// Field NOMBRE_C
				GetSessionDropDownValue(ref EstadoAcademico.NOMBRE_C);

				// Field ESTACAD
				GetSessionDropDownValue(ref EstadoAcademico.ESTACAD);

				// Field FACULTAD
				GetSessionDropDownValue(ref EstadoAcademico.FACULTAD);

				// Field ANO_MAT
				GetSessionDropDownValue(ref EstadoAcademico.ANO_MAT);

				// Field PERIODO_MAT
				GetSessionDropDownValue(ref EstadoAcademico.PERIODO_MAT);

				// Field TIPOSITU
				GetSessionDropDownValue(ref EstadoAcademico.TIPOSITU);
			}

			// Call page filter validated event
			EstadoAcademico.Page_FilterValidated();

			// Build SQL
			// Field RUT

			BuildExtendedFilter(ref EstadoAcademico.RUT, ref sFilter);

			// Field PATERNO
			BuildExtendedFilter(ref EstadoAcademico.PATERNO, ref sFilter);

			// Field MATERNO
			BuildExtendedFilter(ref EstadoAcademico.MATERNO, ref sFilter);

			// Field NOMBRE_C
			BuildDropDownFilter(ref EstadoAcademico.NOMBRE_C, ref sFilter, "");

			// Field ESTACAD
			BuildDropDownFilter(ref EstadoAcademico.ESTACAD, ref sFilter, "");

			// Field FACULTAD
			BuildDropDownFilter(ref EstadoAcademico.FACULTAD, ref sFilter, "");

			// Field ANO_MAT
			BuildDropDownFilter(ref EstadoAcademico.ANO_MAT, ref sFilter, "");

			// Field PERIODO_MAT
			BuildDropDownFilter(ref EstadoAcademico.PERIODO_MAT, ref sFilter, "");

			// Field TIPOSITU
			BuildDropDownFilter(ref EstadoAcademico.TIPOSITU, ref sFilter, "");

			// Save parms to Session
			// Field RUT

			SetSessionFilterValues(ref EstadoAcademico.RUT);

			// Field PATERNO
			SetSessionFilterValues(ref EstadoAcademico.PATERNO);

			// Field MATERNO
			SetSessionFilterValues(ref EstadoAcademico.MATERNO);

			// Field NOMBRE_C
			SetSessionDropDownValue(EstadoAcademico.NOMBRE_C.DropDownValue, ref EstadoAcademico.NOMBRE_C);

			// Field ESTACAD
			SetSessionDropDownValue(EstadoAcademico.ESTACAD.DropDownValue, ref EstadoAcademico.ESTACAD);

			// Field FACULTAD
			SetSessionDropDownValue(EstadoAcademico.FACULTAD.DropDownValue, ref EstadoAcademico.FACULTAD);

			// Field ANO_MAT
			SetSessionDropDownValue(EstadoAcademico.ANO_MAT.DropDownValue, ref EstadoAcademico.ANO_MAT);

			// Field PERIODO_MAT
			SetSessionDropDownValue(EstadoAcademico.PERIODO_MAT.DropDownValue, ref EstadoAcademico.PERIODO_MAT);

			// Field TIPOSITU
			SetSessionDropDownValue(EstadoAcademico.TIPOSITU.DropDownValue, ref EstadoAcademico.TIPOSITU);

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
			if (ew_Session["sv_EstadoAcademico_" + parm] != null)  
				fld.DropDownValue = ew_Session["sv_EstadoAcademico_" + parm];
		}

		// Set dropdown value to Session 
		public void SetSessionDropDownValue(object sv, ref crField fld) {
			string parm = fld.FldVar.Substring(2); 
			ew_Session["sv_EstadoAcademico_" + parm] = sv; 
		} 

		// Get filter values from Session 
		public void GetSessionFilterValues(ref crField fld) {
			string parm = fld.FldVar.Substring(2);  
			if (ew_Session["sv1_EstadoAcademico_" + parm] != null)
				fld.SearchValue = ew_Session["sv1_EstadoAcademico_" + parm];
			if (ew_Session["so1_EstadoAcademico_" + parm] != null)
				fld.SearchOperator = Convert.ToString(ew_Session["so1_EstadoAcademico_" + parm]);
			if (ew_Session["sc_EstadoAcademico_" + parm] != null)		
				fld.SearchCondition = Convert.ToString(ew_Session["sc_EstadoAcademico_" + parm]);
			if (ew_Session["sv2_EstadoAcademico_" + parm] != null)
				fld.SearchValue2 = ew_Session["sv2_EstadoAcademico_" + parm];
			if (ew_Session["so2_EstadoAcademico_" + parm] != null)
				fld.SearchOperator2 = Convert.ToString(ew_Session["so2_EstadoAcademico_" + parm]); 
		}

		// Set filter values to Session		
		public void SetSessionFilterValues(ref crField fld) {
			string parm = fld.FldVar.Substring(2);
			ew_Session["sv1_EstadoAcademico_" + parm] = fld.SearchValue; 
			ew_Session["so1_EstadoAcademico_" + parm] = fld.SearchOperator; 
			ew_Session["sc_EstadoAcademico_" + parm] = fld.SearchCondition; 
			ew_Session["sv2_EstadoAcademico_" + parm] = fld.SearchValue2; 
			ew_Session["so2_EstadoAcademico_" + parm] = fld.SearchOperator2;
		}

		// Clear filter values from Session // ASPXRPT		
		public void ClearSessionFilterValues(ref crField fld) {
			string parm = fld.FldVar.Substring(2);
			ew_Session["sv1_EstadoAcademico_" + parm] = ""; 
			ew_Session["so1_EstadoAcademico_" + parm] = "="; 
			ew_Session["sc_EstadoAcademico_" + parm] = "AND"; 
			ew_Session["sv2_EstadoAcademico_" + parm] = ""; 
			ew_Session["so2_EstadoAcademico_" + parm] = "=";
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
			ew_Session["sel_EstadoAcademico_" + parm] = "";
			ew_Session["rf_EstadoAcademico_" + parm] = "";
			ew_Session["rt_EstadoAcademico_" + parm] = "";
		}

		// Load selection from session
		public void LoadSelectionFromSession(string parm) {
			crField fld = EstadoAcademico.Fields[parm];
			fld.SelectionList = (string[])ew_Session["sel_EstadoAcademico_" + parm];
			fld.RangeFrom = Convert.ToString(ew_Session["rf_EstadoAcademico_" + parm]);
			fld.RangeTo = Convert.ToString(ew_Session["rt_EstadoAcademico_" + parm]);
		}		

		// Load default value for filters
		public void LoadDefaultFilters() {	
			string sWrk;
		  string sSql; 

			// Set up default values for dropdown filters
			//
			// Field NOMBRE_C

			EstadoAcademico.NOMBRE_C.DefaultDropDownValue = EWRPT_INIT_VALUE;
			EstadoAcademico.NOMBRE_C.DropDownValue = EstadoAcademico.NOMBRE_C.DefaultDropDownValue;

			// Field ESTACAD
			EstadoAcademico.ESTACAD.DefaultDropDownValue = EWRPT_INIT_VALUE;
			EstadoAcademico.ESTACAD.DropDownValue = EstadoAcademico.ESTACAD.DefaultDropDownValue;

			// Field FACULTAD
			EstadoAcademico.FACULTAD.DefaultDropDownValue = EWRPT_INIT_VALUE;
			EstadoAcademico.FACULTAD.DropDownValue = EstadoAcademico.FACULTAD.DefaultDropDownValue;

			// Field ANO_MAT
			EstadoAcademico.ANO_MAT.DefaultDropDownValue = EWRPT_INIT_VALUE;
			EstadoAcademico.ANO_MAT.DropDownValue = EstadoAcademico.ANO_MAT.DefaultDropDownValue;

			// Field PERIODO_MAT
			EstadoAcademico.PERIODO_MAT.DefaultDropDownValue = EWRPT_INIT_VALUE;
			EstadoAcademico.PERIODO_MAT.DropDownValue = EstadoAcademico.PERIODO_MAT.DefaultDropDownValue;

			// Field TIPOSITU
			EstadoAcademico.TIPOSITU.DefaultDropDownValue = EWRPT_INIT_VALUE;
			EstadoAcademico.TIPOSITU.DropDownValue = EstadoAcademico.TIPOSITU.DefaultDropDownValue;

			// Set up default values for extended filters
			// Field RUT

			SetDefaultExtFilter(ref EstadoAcademico.RUT, "LIKE", null, "AND", "=", null);
			ApplyDefaultExtFilter(ref EstadoAcademico.RUT);		

			// Field PATERNO
			SetDefaultExtFilter(ref EstadoAcademico.PATERNO, "LIKE", null, "AND", "=", null);
			ApplyDefaultExtFilter(ref EstadoAcademico.PATERNO);		

			// Field MATERNO
			SetDefaultExtFilter(ref EstadoAcademico.MATERNO, "LIKE", null, "AND", "=", null);
			ApplyDefaultExtFilter(ref EstadoAcademico.MATERNO);		

			// Set up default values for popup filters
			// - NOTE: if extended filter is enabled, use default values in extended filter instead

		}

		// Check if filter applied
		public bool CheckFilter() {
		  bool bFilterExist = false;

			// Check RUT extended filter
			if (TextFilterApplied(ref EstadoAcademico.RUT))
				bFilterExist = true;

			// Check PATERNO extended filter
			if (TextFilterApplied(ref EstadoAcademico.PATERNO))
				bFilterExist = true;

			// Check MATERNO extended filter
			if (TextFilterApplied(ref EstadoAcademico.MATERNO))
				bFilterExist = true;

			// Check NOMBRE_C dropdown filter
			if (NonTextFilterApplied(ref EstadoAcademico.NOMBRE_C))
				bFilterExist = true;

			// Check ESTACAD dropdown filter
			if (NonTextFilterApplied(ref EstadoAcademico.ESTACAD))
				bFilterExist = true;

			// Check FACULTAD dropdown filter
			if (NonTextFilterApplied(ref EstadoAcademico.FACULTAD))
				bFilterExist = true;

			// Check ANO_MAT dropdown filter
			if (NonTextFilterApplied(ref EstadoAcademico.ANO_MAT))
				bFilterExist = true;

			// Check PERIODO_MAT dropdown filter
			if (NonTextFilterApplied(ref EstadoAcademico.PERIODO_MAT))
				bFilterExist = true;

			// Check TIPOSITU dropdown filter
			if (NonTextFilterApplied(ref EstadoAcademico.TIPOSITU))
				bFilterExist = true;
			return bFilterExist;
		}		

		// Show list of filters
		public void ShowFilterList() {
			string sFilterList = "";
		  string sExtWrk; 
		  string sWrk;

			// Field RUT
			sExtWrk = "";
			sWrk = "";
			BuildExtendedFilter(ref EstadoAcademico.RUT, ref sExtWrk);
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += EstadoAcademico.RUT.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field PATERNO
			sExtWrk = "";
			sWrk = "";
			BuildExtendedFilter(ref EstadoAcademico.PATERNO, ref sExtWrk);
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += EstadoAcademico.PATERNO.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field MATERNO
			sExtWrk = "";
			sWrk = "";
			BuildExtendedFilter(ref EstadoAcademico.MATERNO, ref sExtWrk);
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += EstadoAcademico.MATERNO.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field NOMBRE_C
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref EstadoAcademico.NOMBRE_C, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += EstadoAcademico.NOMBRE_C.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field ESTACAD
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref EstadoAcademico.ESTACAD, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += EstadoAcademico.ESTACAD.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field FACULTAD
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref EstadoAcademico.FACULTAD, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += EstadoAcademico.FACULTAD.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field ANO_MAT
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref EstadoAcademico.ANO_MAT, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += EstadoAcademico.ANO_MAT.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field PERIODO_MAT
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref EstadoAcademico.PERIODO_MAT, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += EstadoAcademico.PERIODO_MAT.FldCaption() + "<br>";
			if (ew_NotEmpty(sExtWrk)) sFilterList += "&nbsp;&nbsp;" + sExtWrk + "<br>";
			if (ew_NotEmpty(sWrk)) sFilterList += "&nbsp;&nbsp;" + sWrk + "<br>";

			// Field TIPOSITU
			sExtWrk = "";
			sWrk = "";
			BuildDropDownFilter(ref EstadoAcademico.TIPOSITU, ref sExtWrk, "");
			if (ew_NotEmpty(sExtWrk) || ew_NotEmpty(sWrk)) sFilterList += EstadoAcademico.TIPOSITU.FldCaption() + "<br>";
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
					EstadoAcademico.OrderBy = "";
					EstadoAcademico.StartGroup = 1;
					EstadoAcademico.RUT.Sort = "";
					EstadoAcademico.PATERNO.Sort = "";
					EstadoAcademico.MATERNO.Sort = "";
					EstadoAcademico.NOMBRE.Sort = "";
					EstadoAcademico.NOMBRE_C.Sort = "";
					EstadoAcademico.JORNADA.Sort = "";
					EstadoAcademico.CODCARR.Sort = "";
					EstadoAcademico.ESTACAD.Sort = "";
					EstadoAcademico.INGRESO.Sort = "";
					EstadoAcademico.DIRECCION.Sort = "";
					EstadoAcademico.COMUNA.Sort = "";
					EstadoAcademico.CIUDAD.Sort = "";
					EstadoAcademico.FONO.Sort = "";
					EstadoAcademico.MAIL.Sort = "";
					EstadoAcademico.SEXO.Sort = "";
					EstadoAcademico.NACIONALIDAD.Sort = "";
					EstadoAcademico.FACULTAD.Sort = "";
					EstadoAcademico.codigo.Sort = "";
					EstadoAcademico.ANO_MAT.Sort = "";
					EstadoAcademico.PERIODO_MAT.Sort = "";
					EstadoAcademico.TIPOSITU.Sort = "";
					EstadoAcademico.DESCRIPCION.Sort = "";
				}

			// Check for an Order parameter
			} else if (ew_NotEmpty(ew_Get("order"))) {
				EstadoAcademico.CurrentOrder = ew_Get("order");
				EstadoAcademico.CurrentOrderType = ew_Get("ordertype");
				sSortSql = EstadoAcademico.SortSql();
				EstadoAcademico.OrderBy = sSortSql;
				EstadoAcademico.StartGroup = 1;
			}

			// Set up default sort
			if (ew_Empty(EstadoAcademico.OrderBy)) {
				EstadoAcademico.OrderBy = "[PATERNO] ASC, [NOMBRE] ASC";
				EstadoAcademico.PATERNO.Sort = "ASC";
				EstadoAcademico.NOMBRE.Sort = "ASC";
			}
			return EstadoAcademico.OrderBy;
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
		EstadoAcademico_summary = new crEstadoAcademico_summary(this);
		EstadoAcademico_summary.Page_Init();

		// Set buffer/cache option
		Response.Buffer = EWRPT_RESPONSE_BUFFER;
		Response.Cache.SetCacheability(HttpCacheability.NoCache);

		// Page main processing
		EstadoAcademico_summary.Page_Main();
	}

	//
	// ASP.NET Page_Unload event
	//

	protected void Page_Unload(object sender, System.EventArgs e) {

		// Dispose page object
		if (EstadoAcademico_summary != null) EstadoAcademico_summary.Dispose();
	}
</script>
<asp:Content ID="Content" ContentPlaceHolderID="ReportContent" runat="server">
<% if (EstadoAcademico.Export == "") { %>
<script type="text/javascript">
var EWRPT_DATE_SEPARATOR = "/";
if (EWRPT_DATE_SEPARATOR == "") EWRPT_DATE_SEPARATOR = "/"; // Default date separator
</script>
<script type="text/javascript" src="aspxrptjs/ewrpt.js"></script>
<script type="text/javascript">

// Create page object
var EstadoAcademico_summary = new ewrpt_Page("EstadoAcademico_summary");

// page properties
EstadoAcademico_summary.PageID = "summary"; // page ID
EstadoAcademico_summary.FormID = "fEstadoAcademicosummaryfilter"; // form ID
var EWRPT_PAGE_ID = EstadoAcademico_summary.PageID;

// extend page with ValidateForm function
EstadoAcademico_summary.ValidateForm = function(fobj) {
	if (!this.ValidateRequired)
		return true; // ignore validation

	// Call Form Custom Validate event
	if (!this.Form_CustomValidate(fobj)) return false;
	return true;
}

// extend page with Form_CustomValidate function
EstadoAcademico_summary.Form_CustomValidate =  
 function(fobj) { // DO NOT CHANGE THIS LINE!

 	// Your custom validation code here, return false if invalid. 
 	return true;
 }
<% if (EWRPT_CLIENT_VALIDATE) { %>
EstadoAcademico_summary.ValidateRequired = true; // uses JavaScript validation
<% } else { %>
EstadoAcademico_summary.ValidateRequired = false; // no JavaScript validation
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
<% EstadoAcademico_summary.ShowPageHeader(); %>
<script src="FusionChartsFree/JSClass/FusionCharts.js" type="text/javascript"></script>
<% if (EstadoAcademico.Export == "") { %>
<script src="aspxrptjs/popup.js" type="text/javascript"></script>
<script src="aspxrptjs/ewrptpop.js" type="text/javascript"></script>
<script type="text/javascript">

// popup fields
</script>
<% } %>
<% if (EstadoAcademico.Export == "") { %>
<!-- Table Container (Begin) -->
<table id="ewContainer" cellspacing="0" cellpadding="0" border="0">
<!-- Top Container (Begin) -->
<tr><td colspan="3"><div id="ewTop" class="aspnetreportmaker">
<!-- top slot -->
<a name="top"></a>
<% } %>
<div class="ewTitle"><h1><%= EstadoAcademico.TableCaption() %></h1>
<% if (EstadoAcademico.Export == "") { %>
&nbsp;&nbsp;<a href="<%= EstadoAcademico_summary.ExportExcelUrl %>"><img alt="" src="images/excel.png" /></a>
<% if (EstadoAcademico_summary.FilterApplied) { %>
&nbsp;&nbsp;<a href="EstadoAcademicosmry.aspx?cmd=reset"><%= ReportLanguage.Phrase("ResetAllFilter") %></a>
<% } %>
<% } %>
</div><br><br>
<% EstadoAcademico_summary.ShowMessage(); %>
<% if (EstadoAcademico.Export == "") { %>
</div></td></tr>
<!-- Top Container (End) -->
<tr>
	<!-- Left Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewLeft" class="aspnetreportmaker">
	<!-- Left slot -->
<% } %>
<% if (EstadoAcademico.Export == "") { %>
	</div></td>
	<!-- Left Container (End) -->
	<!-- Center Container - Report (Begin) -->
	<td style="vertical-align: top;" class="ewPadding"><div id="ewCenter" class="aspnetreportmaker">
	<!-- center slot -->
<% } %>
<!-- summary report starts -->
<div id="report_summary">
<% if (EstadoAcademico.Export == "") { %>
<%
string sButtonImage, sDivDisplay;
if (EstadoAcademico.FilterPanelOption == 2 || (EstadoAcademico.FilterPanelOption == 3 && EstadoAcademico_summary.FilterApplied) || EstadoAcademico_summary.Filter == "0=101") {
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
<form name="fEstadoAcademicosummaryfilter" id="fEstadoAcademicosummaryfilter" action="EstadoAcademicosmry.aspx" class="ewForm" onsubmit="return EstadoAcademico_summary.ValidateForm(this);">
<table id="ewRptExtFilterTable" class="ewRptExtFilter">
<%

// Popup Filter
int cntf = EstadoAcademico.MATERNO.CustomFilters.Count;
int totcnt;
int wrkcnt;
%>
	<tr>
		<td><span class="aspnetreportmaker"><%= EstadoAcademico.RUT.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_RUT" id="so1_RUT" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_RUT" id="sv1_RUT" size="30" maxlength="32" value="<%= ew_HtmlEncode(EstadoAcademico.RUT.SearchValue) %>"<%= (EstadoAcademico_summary.ClearExtFilter == "EstadoAcademico_RUT") ? " class=\"ewInputCleared\"" : "" %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EstadoAcademico.PATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_PATERNO" id="so1_PATERNO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_PATERNO" id="sv1_PATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(EstadoAcademico.PATERNO.SearchValue) %>"<%= (EstadoAcademico_summary.ClearExtFilter == "EstadoAcademico_PATERNO") ? " class=\"ewInputCleared\"" : "" %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EstadoAcademico.MATERNO.FldCaption() %></span></td>
		<td><span class="ewRptSearchOpr"><%= ReportLanguage.Phrase("LIKE") %><input type="hidden" name="so1_MATERNO" id="so1_MATERNO" value="LIKE"></span></td>
		<td>
			<table cellspacing="0" class="ewItemTable"><tr>
				<td><span class="aspnetreportmaker">
<input type="text" name="sv1_MATERNO" id="sv1_MATERNO" size="30" maxlength="30" value="<%= ew_HtmlEncode(EstadoAcademico.MATERNO.SearchValue) %>"<%= (EstadoAcademico_summary.ClearExtFilter == "EstadoAcademico_MATERNO") ? " class=\"ewInputCleared\"" : "" %>>
</span></td>
				<td></td>
			</tr></table>			
		</td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EstadoAcademico.NOMBRE_C.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_NOMBRE_C" id="sv_NOMBRE_C"<%= (EstadoAcademico_summary.ClearExtFilter == "EstadoAcademico_NOMBRE_C") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.NOMBRE_C.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = EstadoAcademico.NOMBRE_C.CustomFilters.Count + EstadoAcademico.NOMBRE_C.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in EstadoAcademico.NOMBRE_C.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "NOMBRE_C")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.NOMBRE_C.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in EstadoAcademico.NOMBRE_C.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.NOMBRE_C.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt++;
}
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EstadoAcademico.ESTACAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ESTACAD" id="sv_ESTACAD"<%= (EstadoAcademico_summary.ClearExtFilter == "EstadoAcademico_ESTACAD") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.ESTACAD.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = EstadoAcademico.ESTACAD.CustomFilters.Count + EstadoAcademico.ESTACAD.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in EstadoAcademico.ESTACAD.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "ESTACAD")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.ESTACAD.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in EstadoAcademico.ESTACAD.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.ESTACAD.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt++;
}
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EstadoAcademico.FACULTAD.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_FACULTAD" id="sv_FACULTAD"<%= (EstadoAcademico_summary.ClearExtFilter == "EstadoAcademico_FACULTAD") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.FACULTAD.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = EstadoAcademico.FACULTAD.CustomFilters.Count + EstadoAcademico.FACULTAD.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in EstadoAcademico.FACULTAD.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "FACULTAD")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.FACULTAD.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in EstadoAcademico.FACULTAD.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.FACULTAD.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt++;
}
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EstadoAcademico.ANO_MAT.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_ANO_MAT" id="sv_ANO_MAT"<%= (EstadoAcademico_summary.ClearExtFilter == "EstadoAcademico_ANO_MAT") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.ANO_MAT.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = EstadoAcademico.ANO_MAT.CustomFilters.Count + EstadoAcademico.ANO_MAT.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in EstadoAcademico.ANO_MAT.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "ANO_MAT")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.ANO_MAT.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in EstadoAcademico.ANO_MAT.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.ANO_MAT.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt++;
}
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EstadoAcademico.PERIODO_MAT.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_PERIODO_MAT" id="sv_PERIODO_MAT"<%= (EstadoAcademico_summary.ClearExtFilter == "EstadoAcademico_PERIODO_MAT") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.PERIODO_MAT.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = EstadoAcademico.PERIODO_MAT.CustomFilters.Count + EstadoAcademico.PERIODO_MAT.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in EstadoAcademico.PERIODO_MAT.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "PERIODO_MAT")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.PERIODO_MAT.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in EstadoAcademico.PERIODO_MAT.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.PERIODO_MAT.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
<%
		wrkcnt++;
}
%>
		</select>
		</span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= EstadoAcademico.TIPOSITU.FldCaption() %></span></td>
		<td></td>
		<td colspan="4"><span class="ewRptSearchOpr">
		<select name="sv_TIPOSITU" id="sv_TIPOSITU"<%= (EstadoAcademico_summary.ClearExtFilter == "EstadoAcademico_TIPOSITU") ? " class=\"ewInputCleared\"" : "" %>>
		<option value="<%= EWRPT_ALL_VALUE %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.TIPOSITU.DropDownValue, EWRPT_ALL_VALUE)) Response.Write(" selected=\"selected\""); %>><%= ReportLanguage.Phrase("PleaseSelect") %></option>
<%

// Extended Filters
totcnt = EstadoAcademico.TIPOSITU.CustomFilters.Count + EstadoAcademico.TIPOSITU.DropDownList.Count;
wrkcnt = 0;

// Custom filters
foreach (crCustomFilter CustomFilter in EstadoAcademico.TIPOSITU.CustomFilters) {
	if (ew_SameStr(CustomFilter.FldName, "TIPOSITU")) {		
%>
		<option value="<%= "@@" + CustomFilter.FilterName %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.TIPOSITU.DropDownValue, "@@" + CustomFilter.FilterName)) Response.Write(" selected=\"selected\""); %>><%= CustomFilter.DisplayName %></option>
<%
		wrkcnt++;
	}
}
foreach (object value in EstadoAcademico.TIPOSITU.DropDownList) {		
%>
		<option value="<%= value %>"<% if (ewrpt_MatchedFilterValue(EstadoAcademico.TIPOSITU.DropDownValue, value)) Response.Write(" selected=\"selected\""); %>><%= ewrpt_DropDownDisplayValue(value, "", 0) %></option>
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
<% if (EstadoAcademico.ShowCurrentFilter) { %>
<div id="ewrptFilterList">
<% EstadoAcademico_summary.ShowFilterList(); %>
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
if (EstadoAcademico.ExportAll && ew_NotEmpty(EstadoAcademico.Export)) {
	EstadoAcademico_summary.StopGrp = EstadoAcademico_summary.TotalGrps;
} else {
	EstadoAcademico_summary.StopGrp = EstadoAcademico_summary.StartGrp + EstadoAcademico_summary.DisplayGrps - 1;
}

// Stop group <= total number of groups
if (EstadoAcademico_summary.StopGrp > EstadoAcademico_summary.TotalGrps)
	EstadoAcademico_summary.StopGrp = EstadoAcademico_summary.TotalGrps;
EstadoAcademico_summary.RecCount = 0;

// Get first row
if (EstadoAcademico_summary.TotalGrps > 0) {
	EstadoAcademico_summary.GetRow(); // ASPXRPT
	EstadoAcademico_summary.GrpCount = 1;
}
while ((EstadoAcademico_summary.HasRow && EstadoAcademico_summary.GrpIndex < EstadoAcademico_summary.StopGrp) || EstadoAcademico_summary.ShowFirstHeader) {

	// Show header
	if (EstadoAcademico_summary.ShowFirstHeader) {
%>
	<thead>
	<tr>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.RUT.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.RUT))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.RUT.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.RUT) %>',0);"><%= EstadoAcademico.RUT.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.RUT.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.RUT.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.PATERNO.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.PATERNO))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.PATERNO.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.PATERNO) %>',0);"><%= EstadoAcademico.PATERNO.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.PATERNO.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.PATERNO.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.MATERNO.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.MATERNO))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.MATERNO.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.MATERNO) %>',0);"><%= EstadoAcademico.MATERNO.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.MATERNO.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.MATERNO.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.NOMBRE.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.NOMBRE))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.NOMBRE.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.NOMBRE) %>',0);"><%= EstadoAcademico.NOMBRE.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.NOMBRE.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.NOMBRE.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.NOMBRE_C.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.NOMBRE_C))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.NOMBRE_C.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.NOMBRE_C) %>',0);"><%= EstadoAcademico.NOMBRE_C.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.NOMBRE_C.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.NOMBRE_C.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.JORNADA.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.JORNADA))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.JORNADA.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.JORNADA) %>',0);"><%= EstadoAcademico.JORNADA.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.JORNADA.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.JORNADA.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.CODCARR.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.CODCARR))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.CODCARR.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.CODCARR) %>',0);"><%= EstadoAcademico.CODCARR.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.CODCARR.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.CODCARR.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.ESTACAD.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.ESTACAD))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.ESTACAD.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.ESTACAD) %>',0);"><%= EstadoAcademico.ESTACAD.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.ESTACAD.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.ESTACAD.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.INGRESO.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.INGRESO))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.INGRESO.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.INGRESO) %>',0);"><%= EstadoAcademico.INGRESO.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.INGRESO.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.INGRESO.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.DIRECCION.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.DIRECCION))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.DIRECCION.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.DIRECCION) %>',0);"><%= EstadoAcademico.DIRECCION.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.DIRECCION.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.DIRECCION.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.COMUNA.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.COMUNA))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.COMUNA.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.COMUNA) %>',0);"><%= EstadoAcademico.COMUNA.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.COMUNA.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.COMUNA.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.CIUDAD.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.CIUDAD))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.CIUDAD.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.CIUDAD) %>',0);"><%= EstadoAcademico.CIUDAD.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.CIUDAD.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.CIUDAD.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.FONO.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.FONO))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.FONO.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.FONO) %>',0);"><%= EstadoAcademico.FONO.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.FONO.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.FONO.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.MAIL.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.MAIL))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.MAIL.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.MAIL) %>',0);"><%= EstadoAcademico.MAIL.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.MAIL.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.MAIL.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.SEXO.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.SEXO))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.SEXO.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.SEXO) %>',0);"><%= EstadoAcademico.SEXO.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.SEXO.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.SEXO.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.NACIONALIDAD.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.NACIONALIDAD))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.NACIONALIDAD.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.NACIONALIDAD) %>',0);"><%= EstadoAcademico.NACIONALIDAD.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.NACIONALIDAD.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.NACIONALIDAD.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.FACULTAD.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.FACULTAD))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.FACULTAD.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.FACULTAD) %>',0);"><%= EstadoAcademico.FACULTAD.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.FACULTAD.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.FACULTAD.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.codigo.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.codigo))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.codigo.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.codigo) %>',0);"><%= EstadoAcademico.codigo.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.codigo.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.codigo.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.ANO_MAT.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.ANO_MAT))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.ANO_MAT.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.ANO_MAT) %>',0);"><%= EstadoAcademico.ANO_MAT.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.ANO_MAT.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.ANO_MAT.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.PERIODO_MAT.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.PERIODO_MAT))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.PERIODO_MAT.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.PERIODO_MAT) %>',0);"><%= EstadoAcademico.PERIODO_MAT.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.PERIODO_MAT.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.PERIODO_MAT.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.TIPOSITU.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.TIPOSITU))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.TIPOSITU.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.TIPOSITU) %>',0);"><%= EstadoAcademico.TIPOSITU.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.TIPOSITU.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.TIPOSITU.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
<td class="ewTableHeader">
<% if (ew_NotEmpty(EstadoAcademico.Export)) { %>
<%= EstadoAcademico.DESCRIPCION.FldCaption() %>
<% } else { %>
	<table cellspacing="0" class="ewTableHeaderBtn"><tr>
<% if (ew_Empty(EstadoAcademico.SortUrl(EstadoAcademico.DESCRIPCION))) { %>
		<td style="vertical-align: bottom;"><%= EstadoAcademico.DESCRIPCION.FldCaption() %></td>
<% } else { %>
		<td class="ewPointer" onmousedown="ewrpt_Sort(event,'<%= EstadoAcademico.SortUrl(EstadoAcademico.DESCRIPCION) %>',0);"><%= EstadoAcademico.DESCRIPCION.FldCaption() %></td><td style="width: 10px;">
		<% if (EstadoAcademico.DESCRIPCION.Sort == "ASC") { %><img src="aspxrptimages/sortup.gif" width="10" height="9" border="0"><% } else if (EstadoAcademico.DESCRIPCION.Sort == "DESC") { %><img src="aspxrptimages/sortdown.gif" width="10" height="9" border="0"><% } %></td>
<% } %>
	</tr></table>
<% } %>
</td>
	</tr>
	</thead>
	<tbody>
<%
		EstadoAcademico_summary.ShowFirstHeader = false;
	}
	EstadoAcademico_summary.RecCount++;

		// Render detail row
		EstadoAcademico.ResetCSS();
		EstadoAcademico.RowType = EWRPT_ROWTYPE_DETAIL;
		EstadoAcademico_summary.RenderRow();
%>
	<tr<%= EstadoAcademico.RowAttributes() %>>
		<td<%= EstadoAcademico.RUT.CellAttributes %>>
<div<%= EstadoAcademico.RUT.ViewAttributes%>><%= EstadoAcademico.RUT.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.PATERNO.CellAttributes %>>
<div<%= EstadoAcademico.PATERNO.ViewAttributes%>><%= EstadoAcademico.PATERNO.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.MATERNO.CellAttributes %>>
<div<%= EstadoAcademico.MATERNO.ViewAttributes%>><%= EstadoAcademico.MATERNO.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.NOMBRE.CellAttributes %>>
<div<%= EstadoAcademico.NOMBRE.ViewAttributes%>><%= EstadoAcademico.NOMBRE.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.NOMBRE_C.CellAttributes %>>
<div<%= EstadoAcademico.NOMBRE_C.ViewAttributes%>><%= EstadoAcademico.NOMBRE_C.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.JORNADA.CellAttributes %>>
<div<%= EstadoAcademico.JORNADA.ViewAttributes%>><%= EstadoAcademico.JORNADA.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.CODCARR.CellAttributes %>>
<div<%= EstadoAcademico.CODCARR.ViewAttributes%>><%= EstadoAcademico.CODCARR.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.ESTACAD.CellAttributes %>>
<div<%= EstadoAcademico.ESTACAD.ViewAttributes%>><%= EstadoAcademico.ESTACAD.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.INGRESO.CellAttributes %>>
<div<%= EstadoAcademico.INGRESO.ViewAttributes%>><%= EstadoAcademico.INGRESO.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.DIRECCION.CellAttributes %>>
<div<%= EstadoAcademico.DIRECCION.ViewAttributes%>><%= EstadoAcademico.DIRECCION.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.COMUNA.CellAttributes %>>
<div<%= EstadoAcademico.COMUNA.ViewAttributes%>><%= EstadoAcademico.COMUNA.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.CIUDAD.CellAttributes %>>
<div<%= EstadoAcademico.CIUDAD.ViewAttributes%>><%= EstadoAcademico.CIUDAD.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.FONO.CellAttributes %>>
<div<%= EstadoAcademico.FONO.ViewAttributes%>><%= EstadoAcademico.FONO.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.MAIL.CellAttributes %>>
<div<%= EstadoAcademico.MAIL.ViewAttributes%>><%= EstadoAcademico.MAIL.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.SEXO.CellAttributes %>>
<div<%= EstadoAcademico.SEXO.ViewAttributes%>><%= EstadoAcademico.SEXO.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.NACIONALIDAD.CellAttributes %>>
<div<%= EstadoAcademico.NACIONALIDAD.ViewAttributes%>><%= EstadoAcademico.NACIONALIDAD.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.FACULTAD.CellAttributes %>>
<div<%= EstadoAcademico.FACULTAD.ViewAttributes%>><%= EstadoAcademico.FACULTAD.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.codigo.CellAttributes %>>
<div<%= EstadoAcademico.codigo.ViewAttributes%>><%= EstadoAcademico.codigo.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.ANO_MAT.CellAttributes %>>
<div<%= EstadoAcademico.ANO_MAT.ViewAttributes%>><%= EstadoAcademico.ANO_MAT.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.PERIODO_MAT.CellAttributes %>>
<div<%= EstadoAcademico.PERIODO_MAT.ViewAttributes%>><%= EstadoAcademico.PERIODO_MAT.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.TIPOSITU.CellAttributes %>>
<div<%= EstadoAcademico.TIPOSITU.ViewAttributes%>><%= EstadoAcademico.TIPOSITU.ListViewValue%></div>
</td>
		<td<%= EstadoAcademico.DESCRIPCION.CellAttributes %>>
<div<%= EstadoAcademico.DESCRIPCION.ViewAttributes%>><%= EstadoAcademico.DESCRIPCION.ListViewValue%></div>
</td>
	</tr>
<%

		// Accumulate page summary
		EstadoAcademico_summary.AccumulateSummary();		

	// Get next record
		EstadoAcademico_summary.GetRow(); // ASPXRPT
		EstadoAcademico_summary.GrpCount++;
} // End while
%>
	</tbody>
	<tfoot>
<%
if (EstadoAcademico_summary.TotalGrps > 0) {
	EstadoAcademico.ResetCSS();
	EstadoAcademico.RowType = EWRPT_ROWTYPE_TOTAL;
	EstadoAcademico.RowTotalType = EWRPT_ROWTOTAL_GRAND;
	EstadoAcademico.RowTotalSubType = EWRPT_ROWTOTAL_FOOTER;
	EstadoAcademico.RowAttrs["class"] = "ewRptGrandSummary";
	EstadoAcademico_summary.RenderRow();
%>
	<!-- tr><td colspan="22"><span class="aspnetreportmaker">&nbsp;<br></span></td></tr -->
	<tr<%= EstadoAcademico.RowAttributes() %>><td colspan="22"><%= ReportLanguage.Phrase("RptGrandTotal") %> (<%= ewrpt_FormatNumber(EstadoAcademico_summary.TotCount,0) %> <%= ReportLanguage.Phrase("RptDtlRec") %>)</td></tr>
<% } %>
	</tfoot>
</table>
</div>
<% if (EstadoAcademico.Export == "") { %>
<div class="ewGridLowerPanel">
<form name="ewpagerform" id="ewpagerform" class="ewForm">
<table id="ewRptPagerTable" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td style="white-space: nowrap;">
<% if (EstadoAcademico_summary.Pager == null) EstadoAcademico_summary.Pager = new cPrevNextPager(EstadoAcademico_summary.StartGrp, EstadoAcademico_summary.DisplayGrps, EstadoAcademico_summary.TotalGrps); %>
<% if (EstadoAcademico_summary.Pager.RecordCount > 0) { %>
	<table border="0" cellspacing="0" cellpadding="0"><tr><td><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Page") %>&nbsp;</span></td>
<!--first page button-->
	<% if (EstadoAcademico_summary.Pager.FirstButton.Enabled) { %>
	<td><a href="EstadoAcademicosmry.aspx?start=<%= EstadoAcademico_summary.Pager.FirstButton.Start %>"><img src="aspxrptimages/first.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></a></td>
	<% } else { %>
	<td><img src="aspxrptimages/firstdisab.gif" alt="<%= ReportLanguage.Phrase("PagerFirst") %>" width="16" height="16" border="0"></td>
	<% } %>
<!--previous page button-->
	<% if (EstadoAcademico_summary.Pager.PrevButton.Enabled) { %>
	<td><a href="EstadoAcademicosmry.aspx?start=<%= EstadoAcademico_summary.Pager.PrevButton.Start %>"><img src="aspxrptimages/prev.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></a></td>
	<% } else { %>
	<td><img src="aspxrptimages/prevdisab.gif" alt="<%= ReportLanguage.Phrase("PagerPrevious") %>" width="16" height="16" border="0"></td>
	<% } %>
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="<%= EstadoAcademico_summary.Pager.CurrentPage %>" size="4" /></td>
<!--next page button-->
	<% if (EstadoAcademico_summary.Pager.NextButton.Enabled) { %>
	<td><a href="EstadoAcademicosmry.aspx?start=<%= EstadoAcademico_summary.Pager.NextButton.Start %>"><img src="aspxrptimages/next.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></a></td>
	<% } else { %>
	<td><img src="aspxrptimages/nextdisab.gif" alt="<%= ReportLanguage.Phrase("PagerNext") %>" width="16" height="16" border="0"></td>
	<% } %>
<!--last page button-->
	<% if (EstadoAcademico_summary.Pager.LastButton.Enabled) { %>
	<td><a href="EstadoAcademicosmry.aspx?start=<%= EstadoAcademico_summary.Pager.LastButton.Start %>"><img src="aspxrptimages/last.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></a></td>	
	<% } else { %>
	<td><img src="aspxrptimages/lastdisab.gif" alt="<%= ReportLanguage.Phrase("PagerLast") %>" width="16" height="16" border="0"></td>
	<% } %>
	<td><span class="aspnetreportmaker">&nbsp;<%= ReportLanguage.Phrase("of") %> <%= EstadoAcademico_summary.Pager.PageCount %></span></td>
	</tr></table>
	</td>	
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("Record") %> <%= EstadoAcademico_summary.Pager.FromIndex %> <%= ReportLanguage.Phrase("To") %> <%= EstadoAcademico_summary.Pager.ToIndex %> <%= ReportLanguage.Phrase("Of") %> <%= EstadoAcademico_summary.Pager.RecordCount %></span>	
<% } else { %>
	<% if (EstadoAcademico_summary.Filter == "0=101") { %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("EnterSearchCriteria") %></span>
	<% } else { %>
	<span class="aspnetreportmaker"><%= ReportLanguage.Phrase("NoRecord") %></span>
	<% } %>
<% } %>
		</td>
<% if (EstadoAcademico_summary.TotalGrps > 0) { %>
		<td style="white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td align="right" style="vertical-align: top; white-space: nowrap;"><span class="aspnetreportmaker"><%= ReportLanguage.Phrase("GroupsPerPage") %>&nbsp;
<select id="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" name="<%= EWRPT_TABLE_GROUP_PER_PAGE %>" class="aspnetreportmaker" onchange="this.form.submit();">
<option value="10"<% if (EstadoAcademico_summary.DisplayGrps == 10) Response.Write(" selected=\"selected\""); %>>10</option>
<option value="15"<% if (EstadoAcademico_summary.DisplayGrps == 15) Response.Write(" selected=\"selected\""); %>>15</option>
<option value="20"<% if (EstadoAcademico_summary.DisplayGrps == 20) Response.Write(" selected=\"selected\""); %>>20</option>
<option value="50"<% if (EstadoAcademico_summary.DisplayGrps == 50) Response.Write(" selected=\"selected\""); %>>50</option>
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
<% if (EstadoAcademico.Export == "") { %>
	</div><br></td>
	<!-- Center Container - Report (End) -->
	<!-- Right Container (Begin) -->
	<td style="vertical-align: top;"><div id="ewRight" class="aspnetreportmaker">
	<!-- Right slot -->
<% } %>
<% if (EstadoAcademico.Export == "") { %>
	</div></td>
	<!-- Right Container (End) -->
</tr>
<!-- Bottom Container (Begin) -->
<tr><td colspan="3"><div id="ewBottom" class="aspnetreportmaker">
	<!-- Bottom slot -->
<% } %>
<% if (EstadoAcademico.Export == "") { %>
	</div><br></td></tr>
<!-- Bottom Container (End) -->
</table>
<!-- Table Container (End) -->
<% } %>
<% EstadoAcademico_summary.ShowPageFooter(); %>
<% if (EWRPT_DEBUG_ENABLED) ew_Write(ew_DebugMsg()); %>
<% if (EstadoAcademico.Export == "") { %>
<script language="JavaScript" type="text/javascript">
<!--

// Write your table-specific startup script here
// document.write("page loaded");
//-->

</script>
<% } %>
</asp:Content>
