<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="InformeMorosidadAlumnos.aspx.vb" Inherits="InformeMorosidadAlumnos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3>Reporte Alumnos Morosos</h3>
    <table>
        <tbody>
            <tr>
                <td>Carrera</td>
                <td><asp:DropDownList ID="ddlCarreras" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Año de Cohorte</td>
                <td><asp:TextBox ID="txtAño" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
                    <asp:Button ID="Exportar" runat="server" Text="Exportar a Excel" CssClass="float-right" />
                </td>
            </tr>
        </tbody>
    </table>
    <asp:Table ID="tblAlumnos" runat="server">
        <asp:TableHeaderRow ID="headertblAlumnos" TableSection="TableHeader" runat="server">
            <asp:TableHeaderCell>RUT</asp:TableHeaderCell>
            <asp:TableHeaderCell>NOMBRES</asp:TableHeaderCell>
            <asp:TableHeaderCell>APELLIDO PATERNO</asp:TableHeaderCell>
            <asp:TableHeaderCell>APELLIDO MATERNO</asp:TableHeaderCell>
            <asp:TableHeaderCell>AÑO INGRESO</asp:TableHeaderCell>
            <asp:TableHeaderCell>CÓDIGO CARRERA</asp:TableHeaderCell>
            <asp:TableHeaderCell>NOMBRE CARRERA</asp:TableHeaderCell>
            <asp:TableHeaderCell>DEUDA TOTAL</asp:TableHeaderCell>
            <asp:TableHeaderCell>ESTADO ACADÉMICO</asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>

    <script>
        $(document).ready(function () {
            $('#MainContent_tblAlumnos').dataTable({
                "bLengthChange": false,
                "bFilter": false,
                "sScrollX": "100%",
                "bProcessing": true
            });
        });
    </script>
</asp:Content>

