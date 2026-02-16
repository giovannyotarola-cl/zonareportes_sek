<!--#include virtual="include/config.asp"-->
<%
If (Session("username") = False) Then
	Response.Redirect("../default.asp?s=out")
End If

  Dim cnIndex, rsAcces, idusuario, codLink, nomReport
  idusuario = Session("idusuario")
  codLink = Request("acc")
  Set cnIndex = Server.CreateObject("ADODB.Connection")
  Set rsAcces = Server.CreateObject ("ADODB.Recordset")
  cnIndex.Open Conect
  sql = "SELECT a.CODLINK As codlink, b.PROYECTO as proyecto, b.EXTENCION as extencion, a.USERID As userid, b.LINK As link FROM IF_USUARIO_ACCESO a, IF_ACCESOS_DESC b WHERE a.USERID = '" & idusuario & "' And a.CODLINK = b.CODLINK AND a.CODLINK = '" & codLink &"'"	
  	rsAcces.Open sql, cnIndex
	'response.Write(Sql)
    'response.End()
%>
<div id="getInforme">
<%
	
	
'If(Request("acc") = "EN0000") Then
'	nomProy = Request("dir")
'	nomRepor = Request("file")
'	vars = Request("var")
'	res = Request(vars)
'	urlLink = vars&"="&res
	
'	Response.redirect("alertas/"&nomProy&"/"&nomRepor&"."&extProy)
	%>
   <!--<iframe src="alertas/default2.asp?nomRepor=<%=nomRepor%>&nomProy=<%=nomProy%>&var=<%=urlLink%>&acc=<%=codLink%>" height="90%" width="99%" style="background: none repeat scroll 0% 0% rgb(255, 255, 255); padding: 5px 5px; border:hidden;"></iframe>-->
    <%
'Else
	If (rsAcces.Eof = True) Then
		Response.redirect("report.asp?aut=false")
	ElseIf rsAcces("codlink") = codLink Then
		nomRepor = rsAcces("link")
		nomProy = rsAcces("proyecto")
		extProy = rsAcces("extencion")
		'Session("codReporte") = codLink
			if(Request("acc")="EN0108") Then 
				Response.redirect("alertas/"&nomProy&"/"&nomRepor&"."&extProy&"?user="&Session("username"))
			Else
				
				Response.redirect("alertas/"&nomProy&"/"&nomRepor&"."&extProy)
			End if
		%>
	   <!--<iframe src="alertas/default.asp?nomRepor=<%=nomRepor&"."&extProy%>&nomProy=<%=nomProy%>&acc=<%=codLink%>" height="90%" width="99%" style="background: none repeat scroll 0% 0% rgb(255, 255, 255); padding: 5px 5px; border:hidden;"></iframe>-->
		<%
	Else
		Response.redirect("report.asp?aut=false")
	End If
'End If
%>
</div>
<%
   'Limpiamos y cerramos.
   rsAcces.Close
   cnIndex.Close
   Set rsAcces = Nothing
   Set cnIndex = Nothing
%>