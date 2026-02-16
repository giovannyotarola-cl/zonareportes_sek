@If ReportLanguage Is Nothing Then
	ewr_End()
End If
<div class="bd">
<form action="@ewr_CurrentPage()" method="post">
<input type="hidden" name="export" id="export" value="email" />
<table class="ewFormTable">
	<tr>
		<td><span class="aspnetreportmaker">@Html.Raw(ReportLanguage.Phrase("EmailFormSender"))</span></td>
		<td><span class="aspnetreportmaker"><input type="text" name="sender" id="sender" size="30" /></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker">@Html.Raw(ReportLanguage.Phrase("EmailFormRecipient"))</span></td>
		<td><span class="aspnetreportmaker"><input type="text" name="recipient" id="recipient" size="30" /></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker">@Html.Raw(ReportLanguage.Phrase("EmailFormCc"))</span></td>
		<td><span class="aspnetreportmaker"><input type="text" name="cc" id="cc" size="30" /></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker">@Html.Raw(ReportLanguage.Phrase("EmailFormBcc"))</span></td>
		<td><span class="aspnetreportmaker"><input type="text" name="bcc" id="bcc" size="30" /></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker">@Html.Raw(ReportLanguage.Phrase("EmailFormSubject"))</span></td>
		<td><span class="aspnetreportmaker"><input type="text" name="subject" id="subject" size="50" /></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker">@Html.Raw(ReportLanguage.Phrase("EmailFormMessage"))</span></td>
		<td><span class="aspnetreportmaker"><textarea cols="50" rows="8" name="message" id="message"></textarea></span></td>
	</tr>
	<tr>
		<td><span class="aspnetreportmaker">@Html.Raw(ReportLanguage.Phrase("EmailFormContentType"))</span></td>
		<td><span class="aspnetreportmaker">
		<label><input type="radio" name="contenttype" id="contenttype" value="html" checked="checked" />@Html.Raw(ReportLanguage.Phrase("EmailFormContentTypeHtml"))</label>
		<label><input type="radio" name="contenttype" id="contenttype" value="url" />@Html.Raw(ReportLanguage.Phrase("EmailFormContentTypeUrl"))</label>
		</span></td>
	</tr>
</table>
</form>
</div>
