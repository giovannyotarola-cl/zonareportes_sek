<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/SiteMenu.Master" CodeBehind="AlumnosSinFirma.aspx.cs" Inherits="AutoPostulacion.AlumnosSinFirma" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script src="Scripts/plugin.js?ver=0.1.9"></script>

    <link href="Scripts/datatables/css/buttons.dataTables.css" rel="stylesheet" />
    <link href="Scripts/datatables/css/jquery.dataTable.css" rel="stylesheet" />
    <link href="Scripts/datatables/css/dataTables.bootstrap.css" rel="stylesheet" />


<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    
    <div id="contenedor">
        <div id="content_top">

         </div>
    <form id="form1" runat="server">
    <div>
        <asp:Table ID="sinFirma" runat="server"></asp:Table>
    </div>
    </form>
</body>
</html>
