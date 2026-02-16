<%@ Control ClassName="ewremail" Language="C#" %>
<script runat="server">

	public AspNetReportMaker4_project1 ParentPage; 

	//
	// User control Page_Load event
	//

	protected void Page_Load(object sender, System.EventArgs e) {
		if (Page is AspNetReportMaker4_project1) {
			ParentPage = (AspNetReportMaker4_project1)Page;			
			if (ParentPage.ReportLanguage == null)
				ParentPage.ReportLanguage = new AspNetReportMaker4_project1.crLanguage(new AspNetReportMaker4_project1.AspNetReportMakerPage());
		}
	}
</script>
<div class="bd">
<form name="ewremail" id="ewremail">
<input type="hidden" name="export" id="export" value="email" />
<table border="0" cellspacing="0" cellpadding="4">
	<tr>
		<td><span class="aspnetreportmaker"><%= ParentPage.ReportLanguage.Phrase("EmailFormSender") %></span></td>
		<td><span class="aspnetreportmaker"><input type="text" name="sender" id="sender" size="30" /></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= ParentPage.ReportLanguage.Phrase("EmailFormRecipient") %></span></td>
		<td><span class="aspnetreportmaker"><input type="text" name="recipient" id="recipient" size="30" /></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= ParentPage.ReportLanguage.Phrase("EmailFormCc") %></span></td>
		<td><span class="aspnetreportmaker"><input type="text" name="cc" id="cc" size="30" /></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= ParentPage.ReportLanguage.Phrase("EmailFormBcc") %></span></td>
		<td><span class="aspnetreportmaker"><input type="text" name="bcc" id="bcc" size="30" /></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= ParentPage.ReportLanguage.Phrase("EmailFormSubject") %></span></td>
		<td><span class="aspnetreportmaker"><input type="text" name="subject" id="subject" size="50" /></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= ParentPage.ReportLanguage.Phrase("EmailFormMessage") %></span></td>
		<td><span class="aspnetreportmaker"><textarea cols="50" rows="8" name="message" id="message"></textarea></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker"><%= ParentPage.ReportLanguage.Phrase("EmailFormContentType") %></span></td>
		<td><span class="aspnetreportmaker">
		<label><input type="radio" name="contenttype" id="contenttype" value="html" checked="checked" /><%= ParentPage.ReportLanguage.Phrase("EmailFormContentTypeHtml") %></label>
		<label><input type="radio" name="contenttype" id="contenttype" value="url" /><%= ParentPage.ReportLanguage.Phrase("EmailFormContentTypeUrl") %></label>
		</span></td>
	</tr>
</table>
</form>
</div>
