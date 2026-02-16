<!-- #include file="funciones.asp" -->
<%
'primero asegurar que la session este activa, de lo contrario sacamos al login
Dim page
If (Session("username") = False) Then
	Response.Redirect("default.asp?s=out")
End If

Dim cnIndex, rsAcceso, Sql
Set cnIndex = Server.CreateObject ("ADODB.Connection")
   Set rsAcceso = Server.CreateObject ("ADODB.Recordset")
   cnIndex.Open Conect
  
   rsAcceso.Open "SELECT     a.LINK, a.ENLACE, a.LINKDESC, b.USERID, a.CODLINK, b.CODLINK AS Expr1 FROM IF_ACCESOS_DESC AS a INNER JOIN IF_USUARIO_ACCESO AS b ON a.CODLINK = b.CODLINK WHERE (b.USERID = '" & Session("idusuario") & "') ORDER BY a.CODLINK", cnIndex
Server.Execute url%> 