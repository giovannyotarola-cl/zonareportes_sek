<!--#include virtual="include/config.asp"-->
<%
'primero asegurar que la session este activa, de lo contrario sacamos al login
If (Session("username") = False) Then
	Response.Redirect("default.asp?s=out")
End If

Dim cnIndex, rsAddUser, usuario
	nusuario = Trim(Request.Form("nusuario"))
	nusuario = Replace(nusuario,"'","''")
	
   Set cnIndex = Server.CreateObject ("ADODB.Connection")
   Set rsAddUser = Server.CreateObject ("ADODB.Recordset")
   cnIndex.Open Conect
   Sql = "SELECT USERNAME FROM IF_USUARIO_INFORMES WHERE USERNAME = '"&nusuario&"'"
   rsAddUser.Open Sql, cnIndex

   If (rsAddUser.EOF = false) then		
		Response.Write true
   Else 
   		Response.Write false
   End If
   'Response.Redirect("http://192.168.30.250/alertas/acceso.asp?a=informes/admin/usuarios")
%>