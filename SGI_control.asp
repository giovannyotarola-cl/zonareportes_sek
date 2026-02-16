<!--#include file = "include/config.asp"-->
<%
Dim usuario, password, cnIndex, rsUsrnames, IdUsuario, rsLogs
<!--If Request.Form("Username") = "" OR Request.Form("Pass") = "" then -->
If Request.QueryString("Username") = "" OR Request.QueryString("Pass") = "" then
   Response.Redirect("default.asp?Aut=false")
   
Else

   usuario = Trim(Request.QueryString("Username"))
   password = Trim(Request.QueryString("Pass"))
   usuario = Replace(usuario,"'","''")
   password = Replace(password,"'","''")
   
   Set cnIndex = Server.CreateObject ("ADODB.Connection")
   Set rsUsrnames = Server.CreateObject ("ADODB.Recordset")
   Set rsLogs = Server.CreateObject ("ADODB.Recordset")
   cnIndex.Open Conect

   rsUsrnames.Open "SELECT * FROM IF_USUARIO_INFORMES WHERE USERNAME = '" & usuario & "'", cnIndex

   If (rsUsrnames.EOF = true) then
   	  Call grabaLog("0",usuario, password, "fallido")
      Response.redirect("default.asp?Aut=false")
   ElseIf rsUsrnames.Fields("USERPASS") = password then 
      'Si el campo de la tabla es igual a nuestra variable, estas logueado.
	  Session("username") = rsUsrnames.Fields("USERNAME")
	  Session("idusuario") = rsUsrnames("USERID")
	  Session("nombreusuario") = rsUsrnames("USERDES")
	  IdUsuario = Session("idusuario")
	  Call grabaLog(IdUsuario, usuario, password, "exito")
      Response.redirect ("acceso.asp?a=informes")
   Else 
   	  'Otra cosa, seria cuando el password no es la que seleccionamos.
	  Call grabaLog(rsUsrnames("USERID"), usuario, password, "fallido")
      Response.redirect("default.asp?Aut=false") 
   End If
   
Sub grabaLog(IdUsuario, usuario, password, estado)
	
	fecha = date()
	hora = time()
	'dia=day(fecha)
	'mes=month(fecha)
	'ano=year(fecha)
	'fechaespanol=dia&"-"&mes&"-"&ano
	fechaespanol = fecha&" "&hora
	
	Sql = "INSERT INTO IF_USUARIO_LOG VALUES("&IdUsuario&",'"&usuario&"','"&password&"','"&Request.ServerVariables("REMOTE_ADDR")&"','"&fechaespanol&"','"&estado&"', 'Zona Reportes')"
	rsLogs.Open Sql, cnIndex
	
End Sub

   'Limpiamos y cerramos.
   rsUsrnames.Close
   cnIndex.Close
   Set rsUsrnames = Nothing
   Set cnIndex = Nothing
   
End If

%>
