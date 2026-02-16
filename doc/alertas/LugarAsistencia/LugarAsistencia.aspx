<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="LugarAsistencia.aspx.vb" Inherits="MorososFuturos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">

    <h3>REPORTE LUGAR ASISTENCIA</h3>
    <table>
        <tbody>
            <tr class="inter">
                <td class="bolder">Código Profesor</td>
                <td><asp:TextBox ID="txt_codProf" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="bolder">Apellido Paterno</td>
                <td><asp:TextBox ID="txt_paterno" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="inter">
                <td class="bolder">Apellido Materno</td>
                <td><asp:TextBox ID="txt_materno" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="bolder">Nombres</td>
                <td><asp:TextBox ID="txt_nombre" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="bolder">Código Asignatura</td>
                <td><asp:TextBox ID="txt_codAsignatura" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="inter">
                <td class="bolder">Semestre</td>
                <td>
                    <asp:DropDownList ID="ddl_semestre" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="bolder">Asignatura</td>
                <td>
                    <asp:DropDownList ID="ddl_asignatura" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="bolder">Sección</td>
                <td>
                    <asp:DropDownList ID="ddl_seccion" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="bolder">Lugar</td>
                <td>
                    <asp:DropDownList ID="ddl_lugar" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td colspan="2">
                    <asp:Button ID="Enviar" runat="server" Text="Buscar" CssClass="float-left" /> 
                    <asp:Button ID="Exportar" runat="server" Text="Exportar a Excel" CssClass="float-right" OnClick="ExportToExcel" />
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
