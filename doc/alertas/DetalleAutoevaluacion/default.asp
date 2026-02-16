<%
Dim sExport, i, sTmp
%>
<!--#include file="rptinc/ewrcfg3.asp"-->
<!--#include file="rptinc/ewrfn3.asp"-->
<%

' Open connection to the database
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open EW_REPORT_CONNECTION_STRING
Response.Redirect "Detalle_Reporte_Autoevaluacionsmry.asp"

' Close connection
conn.Close
Set conn = Nothing
%>
