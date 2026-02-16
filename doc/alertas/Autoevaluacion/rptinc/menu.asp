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
RootMenu.AddMenuItem 4, "Reporte Global Alumnos", "Reporte_Globalctb.asp", -1, "", "", True
RootMenu.AddMenuItem 8, "Reporte Situaciones", "Crosstab2ctb.asp", -1, "", "", True
RootMenu.AddMenuItem 12, "Reporte Biblioteca", "http://bibliouisekchile.sek.net/biblioteca/", -1, "", "", True
RootMenu.Render
Set RootMenu = Nothing
%>
</div>
<!-- End Main Menu -->
