@If ReportLanguage Is Nothing Then
	ewr_End()
End If
<form action="@ewr_CurrentPage()" name="ewpagerform" id="ewpagerform" class="ewForm">
<table class="ewPager"><tr><td>
@If CurrentPage.Pager Is Nothing Then
	CurrentPage.Pager = New crPrevNextPager(CurrentPage.StartGrp, CurrentPage.DisplayGrps, CurrentPage.TotalGrps)
End If
@If CurrentPage.Pager.RecordCount > 0 Then
	@<table cellspacing="0" class="ewStdTable"><tbody><tr><td><span class="aspnetreportmaker">@Html.Raw(ReportLanguage.Phrase("Page"))&nbsp;</span></td>
<!--first page button-->
	@If CurrentPage.Pager.FirstButton.Enabled Then
		@<td><a href="@ewr_CurrentPage()?start=@CurrentPage.Pager.FirstButton.Start"><img src="aspxrptimages/first.gif" width="16" height="16" alt="@Html.Raw(ReportLanguage.Phrase("PagerFirst"))" style="border: 0;" /></a></td>
	Else
		@<td><img src="aspxrptimages/firstdisab.gif" width="16" height="16" alt="@Html.Raw(ReportLanguage.Phrase("PagerFirst"))" style="border: 0;" /></td>
	End If
<!--previous page button-->
	@If CurrentPage.Pager.PrevButton.Enabled Then
		@<td><a href="@ewr_CurrentPage()?start=@CurrentPage.Pager.PrevButton.Start"><img src="aspxrptimages/prev.gif" width="16" height="16" alt="@Html.Raw(ReportLanguage.Phrase("PagerPrevious"))" style="border: 0;" /></a></td>
	Else
		@<td><img src="aspxrptimages/prevdisab.gif" width="16" height="16" alt="@Html.Raw(ReportLanguage.Phrase("PagerPrevious"))" style="border: 0;" /></td>
	End If
<!--current page number-->
	<td><input type="text" name="pageno" id="pageno" value="@CurrentPage.Pager.CurrentPage" size="4"></td>
<!--next page button-->
	@If CurrentPage.Pager.NextButton.Enabled Then
		@<td><a href="@ewr_CurrentPage()?start=@CurrentPage.Pager.NextButton.Start"><img src="aspxrptimages/next.gif" width="16" height="16" alt="@Html.Raw(ReportLanguage.Phrase("PagerNext"))" style="border: 0;" /></a></td>	
	Else
		@<td><img src="aspxrptimages/nextdisab.gif" width="16" height="16" alt="@Html.Raw(ReportLanguage.Phrase("PagerNext"))" style="border: 0;" /></td>
	End If
<!--last page button-->
	@If CurrentPage.Pager.LastButton.Enabled Then
		@<td><a href="@ewr_CurrentPage()?start=@CurrentPage.Pager.LastButton.Start"><img src="aspxrptimages/last.gif" width="16" height="16" alt="@Html.Raw(ReportLanguage.Phrase("PagerLast"))" style="border: 0;" /></a></td>	
	Else
		@<td><img src="aspxrptimages/lastdisab.gif" width="16" height="16" alt="@Html.Raw(ReportLanguage.Phrase("PagerLast"))" style="border: 0;" /></td>
	End If
	<td><span class="aspnetreportmaker">&nbsp;@Html.Raw(ReportLanguage.Phrase("of")) @CurrentPage.Pager.PageCount</span></td>
	</tr></tbody></table>
	@:</td>	
	@<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	@:<td>
	@<span class="aspnetreportmaker">@Html.Raw(ReportLanguage.Phrase("Record"))&nbsp;@(CurrentPage.Pager.FromIndex)&nbsp;@Html.Raw(ReportLanguage.Phrase("To"))&nbsp;@(CurrentPage.Pager.ToIndex)&nbsp;@Html.Raw(ReportLanguage.Phrase("Of"))&nbsp;@(CurrentPage.Pager.RecordCount)</span>
Else
		If CurrentPage.Filter = "0=101" Then
			@<span class="aspnetreportmaker">@Html.Raw(ReportLanguage.Phrase("EnterSearchCriteria"))</span>
		Else
			@<span class="aspnetreportmaker">@Html.Raw(ReportLanguage.Phrase("NoRecord"))</span>
		End If
End If
	</td>
@If CurrentPage.TotalGrps > 0 Then
	@<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	@<td><table cellspacing="0" class="ewStdTable"><tbody><tr><td>@Html.Raw(ReportLanguage.Phrase("GroupsPerPage"))&nbsp;
<select name="@EWR_TABLE_GROUP_PER_PAGE" onchange="this.form.submit();">
<option value="10" @Html.Raw(If(CurrentPage.DisplayGrps = 10, " selected=""selected""", ""))>10</option>
<option value="15" @Html.Raw(If(CurrentPage.DisplayGrps = 15, " selected=""selected""", ""))>15</option>
<option value="20" @Html.Raw(If(CurrentPage.DisplayGrps = 20, " selected=""selected""", ""))>20</option>
<option value="50" @Html.Raw(If(CurrentPage.DisplayGrps = 50, " selected=""selected""", ""))>50</option>
</select></td></tr></tbody></table>
	</td>
End If
</tr></table>
</form>
