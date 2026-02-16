<%@ Control ClassName="ewremail" Language="VB" %>
<script runat="server">

	Public ParentPage As AspNetReportMaker4_encuesta_docente_satisfaccion 

	'
	' User control Page_Load event
	'

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) 
		If TypeOf Page Is AspNetReportMaker4_encuesta_docente_satisfaccion Then
			ParentPage = CType(Page, AspNetReportMaker4_encuesta_docente_satisfaccion)
			If ParentPage.ReportLanguage Is Nothing Then
				ParentPage.ReportLanguage = New AspNetReportMaker4_encuesta_docente_satisfaccion.crLanguage(New AspNetReportMaker4_encuesta_docente_satisfaccion.AspNetReportMakerPage())
			End If
		End If
	End Sub
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
