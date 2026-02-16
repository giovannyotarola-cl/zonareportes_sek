<%

' Menu
Const EWRPT_MENUBAR_CLASSNAME = "ewMenuBarVertical"
Const EWRPT_MENUBAR_SUBMENU_CLASSNAME = ""
%>
<!-- Begin Main Menu -->
<div class="aspreportmaker">
<%

' Generate all menu items
Dim RootMenu
Set RootMenu = new crMenu
RootMenu.Id = "RootMenu"
RootMenu.IsRoot = True
RootMenu.AddMenuItem 5, ReportLanguage.Phrase("SimpleReportMenuItemPrefix") & ReportLanguage.MenuPhrase("5", "MenuText") & ReportLanguage.Phrase("SimpleReportMenuItemSuffix"), "cambioCarrerarpt.asp", -1, "", "", True
RootMenu.Render
Set RootMenu = Nothing
%>
</div>
<!-- End Main Menu -->
