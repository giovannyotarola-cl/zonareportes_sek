<!-- #include file="config.asp" -->
<%
Session.CodePage = 65001
If (Session("username") = False) Then
	Response.Redirect("default.asp?s=out")
End If

Dim rsUserHisto, cnIndex

Set cnIndex = Server.CreateObject ("ADODB.Connection")
Set rsUserHisto = Server.CreateObject ("ADODB.Recordset")

cnIndex.Open Conect

If request("tipo") = "a" Then
	If session("idusuario") <> "1" Then
	rsUserHisto.Open "INSERT INTO IF_USUARIO_HISTO VALUES('"&Session("idusuario")&"', getdate(), '"&request("codigo")&"', '"&request("reporte")&"', '"&Request.ServerVariables("REMOTE_ADDR")&"')", cnIndex
	End If
End If
%>