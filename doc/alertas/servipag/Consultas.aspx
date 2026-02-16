<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Consultas.aspx.cs" Inherits="Consultas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form method="POST" action="http://zonareportes.usek.cl/doc/alertas/servipag/Service.asmx/ConsultaDeuda">
       <input type="text" name="Identificador1">
       <input type=submit value="Subtract">
   </form>
</body>
</html>
