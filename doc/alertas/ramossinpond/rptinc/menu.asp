<!--#include file="ewrcfg3.asp"-->
<!--#include file="ewrfn3.asp"-->
<%

'
' Menu class
'
Class cMenu

	Public Id

	Public IsRoot

	Public ItemData

	' Init
	Private Sub Class_Initialize
		IsRoot = False
		Set ItemData = Server.CreateObject("Scripting.Dictionary") ' Data type: array of cMenuItem
	End Sub

	' Terminate
	Private Sub Class_Terminate
		Set ItemData = Nothing
	End Sub

	' Create a menu item
	Function NewMenuItem(id, text, url, parentid, allowed)
		Set NewMenuItem = New cMenuItem
		NewMenuItem.Id = id
		NewMenuItem.Text = text
		NewMenuItem.Url = url
		NewMenuItem.ParentId = parentid
		NewMenuItem.Allowed = allowed
	End Function

	' Add a menu item
	Sub AddMenuItem(id, text, url, parentid, allowed)
		Dim item, oParentMenu
		Set item = NewMenuItem(id, text, url, parentid, allowed)
		If Not MenuItem_Adding(item) Then Exit Sub
		If item.ParentId < 0 Then
			AddItem(item)
		Else
			If FindItem(item.parentid, oParentMenu) Then
				oParentMenu.AddItem(item)
			End If
		End If
	End Sub

	' Add item to internal dictionary
	Sub AddItem(item)
		ItemData.Add ItemData.Count, item
	End Sub

	' Find item
	Function FindItem(id, out)
		Dim i, item
		FindItem = False
		For i = 0 To ItemData.Count - 1
			If ItemData.Item(i).Id = id Then
				Set out = ItemData.Item(i)
				FindItem = True
				Exit Function
			ElseIf Not IsNull(ItemData.Item(i).SubMenu) Then
				FindItem = ItemData.Item(i).SubMenu.FindItem(id, out)
			End If
		Next
	End Function

	' Check if a menu item should be shown
	Function RenderItem(item)
		Dim i, subitem
		If Not IsNull(item.SubMenu) Then
			For i = 0 To item.SubMenu.ItemData.Count - 1
				If item.SubMenu.RenderItem(item.SubMenu.ItemData.Item(i)) Then
					RenderItem = True
					Exit Function
				End If
			Next
		End If
		RenderItem = (item.Allowed And item.Url <> "")
	End Function

	' Check if this menu should be rendered
	Function RenderMenu()
		Dim i
		For i = 0 To ItemData.Count - 1
			If RenderItem(ItemData.Item(i)) Then
				RenderMenu = True
				Exit Function
			End If
		Next
		RenderMenu = False
	End Function

	' Render the menu
	Sub Render
		Dim i, item, itemcnt
		If Not RenderMenu() Then Exit Sub
		itemcnt = ItemData.Count
		Response.Write "<ul"
		If Id <> "" Then
			If IsNumeric(Id) Then
				Response.Write " id=""menu_" & Id & """"
			Else
				Response.Write " id=""" & Id & """"
			End If
		End If
		If IsRoot Then
			Response.Write " class=""" & EW_REPORT_MENUBAR_VERTICAL_CLASSNAME & """"
		End If
		Response.Write ">" & vbCrLf
		For i = 0 to itemcnt - 1
			If RenderItem(ItemData.Item(i)) Then
				Response.Write "<li><a"
				If Not IsNull(ItemData.Item(i).SubMenu) Then
					Response.Write " class=""" & EW_MENUBAR_SUBMENU_CLASSNAME & """"
				End If
				If ItemData.Item(i).Url <> "" Then
					Response.Write " href=""" & Server.HTMLEncode(ItemData.Item(i).Url) & """"
				End If
				Response.Write ">" & ItemData.Item(i).Text & "</a>" & vbCrLf
				If Not IsNull(ItemData.Item(i).SubMenu) Then
					ItemData.Item(i).SubMenu.Render
				End If
				Response.Write "</li>" & vbCrLf
			End If
		Next
		Response.Write "</ul>" & vbCrLf
	End Sub
End Class

'
' Menu item class
'
Class cMenuItem

	Public Id

	Public Text

	Public Url

	Public ParentId

	Public Allowed

	Public SubMenu ' Data type = cMenu

	Private Sub Class_Initialize
		Url = ""
		SubMenu = Null
	End Sub

	Sub AddItem(item) ' Add submenu item
		If IsNull(SubMenu) Then
			Set SubMenu = New cMenu
			SubMenu.Id = Id
		End If
		SubMenu.AddItem(item)
	End Sub

	Function AsString
		AsString = "{ Id: " & Id & ", Text: " & Text & ", Url: " & Url & ", ParentId: " & ParentId & ", Allowed: " & Allowed
		If IsNull(SubMenu) Then
			AsString = AsString & ", SubMenu: (Null)"
		Else
			AsString = AsString & ", SubMenu: (Object)"
		End If
		AsString = AsString & " }" & "<br />"
	End Function
End Class

' Menu item adding
Function MenuItem_Adding(Item)

    'Response.Write Item.AsString
    ' Return False if menu item not allowed

    MenuItem_Adding = True
End Function
%>
<!-- Begin Main Menu -->
<div class="aspreportmaker">
<%

' Generate all menu items
Dim RootMenu
Set RootMenu = new cMenu
RootMenu.Id = "RootMenu"
RootMenu.IsRoot = True
RootMenu.AddMenuItem 2, "Ramossinpond", "Ramossinpondsmry.asp", -1, True
RootMenu.Render
Set RootMenu = Nothing
%>
</div>
<!-- End Main Menu -->
