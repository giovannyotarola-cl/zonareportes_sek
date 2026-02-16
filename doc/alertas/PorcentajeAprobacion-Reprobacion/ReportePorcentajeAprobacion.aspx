<%@ Page Title="Reporte" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ReportePorcentajeAprobacion.aspx.vb" Inherits="ReporteWebpay" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <h3>REPORTE DE PORCENTAJE APROBACIÓN/REPROBACIÓN POR CARRERA</h3>
    <table>
        <tbody>
            <tr class="inter">
                <td class="bolder">FACULTAD</td>
                <td>
                    <asp:DropDownList ID="ddlFacultad" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="cell-border">CARRERA</td>
                <td>
                    <asp:DropDownList ID="ddlCarrera" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="cell-border">JORNADA</td>
                <td>
                    <asp:DropDownList ID="ddlJornada" runat="server">
                        <asp:ListItem Value="Todo"></asp:ListItem>
                        <asp:ListItem Value="D" Text="Diurno"></asp:ListItem>
                        <asp:ListItem Value="V" Text="Vespertino"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="Enviar" runat="server" Text="Buscar" CssClass="float-left" /> <asp:Button ID="Exportar" runat="server" Text="Exportar a Excel" CssClass="float-right" /></td>
            </tr>
        </tbody>
    </table>

    <div id="data-result" class="content-arancel">
        <asp:Table ID="tblPorcentajeAR" runat="server" CssClass="display">
            <asp:tableHEaderRow ID="TableHEaderRow1" TableSection="TableHeader" runat="server">
                <asp:TableHeaderCell>CÓD. FAC</asp:TableHeaderCell>
                <asp:TableHeaderCell>FACULTAD</asp:TableHeaderCell>
                <asp:TableHeaderCell>CÓD. CARR</asp:TableHeaderCell>
                <asp:TableHeaderCell>CARRERA</asp:TableHeaderCell>
                <asp:TableHeaderCell>JORNADA</asp:TableHeaderCell>
                <asp:TableHeaderCell>AÑO</asp:TableHeaderCell>
                <asp:TableHeaderCell>% APROBACIÓN</asp:TableHeaderCell>
                <asp:TableHeaderCell>% REPROBACIÓN</asp:TableHeaderCell>
            </asp:tableHEaderRow>
        </asp:Table>
    </div>
    <script>
        $(document).ready(function () {
            $(function () {
                /*Cargar los calendarios*/
                $(".datepicker").datepicker();
                /*Llenar la tabla*/
                var table = $('#MainContent_TBL_Aranceles').DataTable();
            });
        });
    </script>
</asp:Content>

