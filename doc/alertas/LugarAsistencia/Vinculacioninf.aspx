<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="LugarAsistencia.aspx.vb" Inherits="MorososFuturos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">

    <h3>REPORTE VINCULACION CON EL MEDIO</h3>
    <table>
        <tbody>
            <tr class="inter">
                <td colspan="2">
                    <asp:Button ID="Enviar" runat="server" Text="Buscar" CssClass="float-left" /> 
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
<asp:Content ID="TableContent" ContentPlaceHolderID="TableContent" runat="server">
    <div id="data-result" class="content-arancel">
        <asp:GridView ID="TBL_Alumnos" runat="server" AllowPaging="True" PageSize="15" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="TBL_Alumnos_PageIndexChanging">
            <AlternatingRowStyle CssClass="alternating-ys" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle />
            <HeaderStyle CssClass="head-ys" />
            <PagerStyle CssClass="pagination-ys" />
            <RowStyle CssClass="rows-ys" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
    <script>
        $(document).ready(function () {
            $(function () {
                $.datepicker.setDefaults($.datepicker.regional["es"]);
                $("#MainContent_txt_vencimiento").datepicker({
                    firstDay: 1,
                    dateFormat: 'dd/mm/yy'
                });
            });
        });
    </script>
</asp:Content>
