<%

' Menu
Const EWRPT_MENUBAR_CLASSNAME = "ewMenuBarVertical"
Const EWRPT_MENUBAR_ITEM_CLASSNAME = ""
Const EWRPT_MENUBAR_ITEM_LABEL_CLASSNAME = ""
Const EWRPT_MENU_CLASSNAME = "ewMenuBarVertical"
Const EWRPT_MENU_ITEM_CLASSNAME = ""
Const EWRPT_MENU_ITEM_LABEL_CLASSNAME = ""
%>
<!-- Begin Main Menu -->
<div class="aspreportmaker">
<%

' Generate all menu items
Dim RootMenu
Set RootMenu = new crMenu
RootMenu.Id = "RootMenu"
RootMenu.IsRoot = True
RootMenu.AddMenuItem 11, ReportLanguage.Phrase("DetailSummaryReportMenuItemPrefix") & ReportLanguage.MenuPhrase("11", "MenuText") & ReportLanguage.Phrase("DetailSummaryReportMenuItemSuffix"), "Report1smry.asp", -1, "", "", True, False
RootMenu.Render(False)
Set RootMenu = Nothing
%>
</div>
<!-- End Main Menu -->
