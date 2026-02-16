<%@ Page Title="Usuarios" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Administrador.aspx.vb" Inherits="Administrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
        $(document).ready(function () {
            $(".dataTable").dataTable({
                "iDisplayLength": 15,
                "sPaginationType": "full_numbers",
                "bLengthChange": false,
                "bFilter": true,
                "bInfo": true,
                "bPaginate": true
            });
        });
    </script>
    <h1>Seleccione usuario</h1>
    <br />
    <asp:Table ID="tblUsuarios" runat="server" CssClass="display dataTable">
        <asp:tableHEaderRow ID="TableHEaderRow1" TableSection="TableHeader" runat="server">
            <asp:TableHeaderCell>Usuario</asp:TableHeaderCell>
            <asp:TableHeaderCell>Descripción</asp:TableHeaderCell>
            <asp:TableHeaderCell>Carrera</asp:TableHeaderCell>
            <asp:TableHeaderCell></asp:TableHeaderCell>
        </asp:tableHEaderRow>
    </asp:Table>
</asp:Content>

