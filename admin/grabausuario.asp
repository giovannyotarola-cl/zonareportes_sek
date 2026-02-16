<!--#include virtual="include/config.asp"-->
<%
'primero asegurar que la session este activa, de lo contrario sacamos al login
If (Session("username") = False) Then
	Response.Redirect("default.asp?s=out")
End If

Dim cnIndex, rsAddUser
   Set cnIndex = Server.CreateObject ("ADODB.Connection")
   Set rsAddUser = Server.CreateObject ("ADODB.Recordset")
   cnIndex.Open Conect
   Sql = "INSERT INTO IF_USUARIO_INFORMES VALUES('"&Request("nusuario")&"','"&Request("clave")&"','"&Request("nombre")&" "&Request("apellido")&"')"
   rsAddUser.Open Sql, cnIndex
   
   Response.Redirect("http://zonareportes.usek.cl/alertas/acceso.asp?a=informes/admin/usuarios")
%>