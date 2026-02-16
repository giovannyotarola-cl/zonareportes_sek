<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="MorososFuturos.aspx.vb" Inherits="MorososFuturos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">

    <h3>REPORTE MOROSOS FUTUROS</h3>
    <table>
        <tbody>
            <tr class="inter">
                <td class="bolder">RUT ALUMNO</td>
                <td><asp:TextBox ID="txt_rut" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="bolder">APELLIDO PATERNO</td>
                <td><asp:TextBox ID="txt_paterno" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="inter">
                <td class="bolder">APELLIDO MATERNO</td>
                <td><asp:TextBox ID="txt_materno" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="bolder">NOMBRE</td>
                <td><asp:TextBox ID="txt_nombre" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="inter">
                <td class="bolder">CARRERA</td>
                <td>
                    <asp:DropDownList ID="txt_carrera" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="bolder">TIPO CARRERA</td>
                <td>
                    <asp:DropDownList ID="txt_tipocarrera" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="bolder">FACULTAD</td>
                <td>
                    <asp:DropDownList ID="txt_facultad" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="bolder">AÑO</td>
                <td>
                    <asp:DropDownList ID="txt_anio" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="bolder">PERIODO</td>
                <td>
                    <asp:DropDownList ID="txt_periodo" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="bolder">ESTADO ACADÉMICO</td>
                <td>
                    <asp:DropDownList ID="txt_estado" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="bolder">NÚMERO PAGARÉ</td>
                <td><asp:TextBox ID="txt_numpagare" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="bolder">DOCUMENTO</td>
                <td>
                    <asp:DropDownList ID="txt_documento" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="bolder">FECHA VENCIMIENTO</td>
                <td>
                    <asp:TextBox ID="txt_vencimiento" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="bolder">SITUACIÓN ACADÉMICA</td>
                <td>
                    <asp:DropDownList ID="txt_situacion" runat="server">
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
        <asp:Table ID="TBL_Alumnos" runat="server" CssClass="display">
            <asp:tableHEaderRow ID="TableHEaderRow1" TableSection="TableHeader" runat="server">
                <asp:TableHeaderCell>PAGARÉ</asp:TableHeaderCell>
                <asp:TableHeaderCell>RUT</asp:TableHeaderCell>
                <asp:TableHeaderCell>NOMBRE</asp:TableHeaderCell>
                <asp:TableHeaderCell>CARRERA</asp:TableHeaderCell>
                <asp:TableHeaderCell>TIPO CARRRA</asp:TableHeaderCell>
                <asp:TableHeaderCell>FACULTAD</asp:TableHeaderCell>
                <asp:TableHeaderCell>ESTADO</asp:TableHeaderCell>
                <asp:TableHeaderCell>AÑO MATRÍCULA</asp:TableHeaderCell>
                <asp:TableHeaderCell>AÑO</asp:TableHeaderCell>
                <asp:TableHeaderCell>PERIODO</asp:TableHeaderCell>
                <asp:TableHeaderCell>CUOTA</asp:TableHeaderCell>
                <asp:TableHeaderCell>NUM CUOTAS</asp:TableHeaderCell>
                <asp:TableHeaderCell>MONTO</asp:TableHeaderCell>
                <asp:TableHeaderCell>SALDO</asp:TableHeaderCell>
                <asp:TableHeaderCell>VENCIMIENTO</asp:TableHeaderCell>
                <asp:TableHeaderCell>EMAIL</asp:TableHeaderCell>
                <asp:TableHeaderCell>DIRECCIÓN</asp:TableHeaderCell>
                <asp:TableHeaderCell>COMUNA</asp:TableHeaderCell>
                <asp:TableHeaderCell>FONO</asp:TableHeaderCell>
                <asp:TableHeaderCell>USUARIO</asp:TableHeaderCell>
                <asp:TableHeaderCell>APODERADO</asp:TableHeaderCell>
            </asp:tableHEaderRow>
        </asp:Table>
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
            $('#TableContent_TBL_Alumnos').DataTable({
                "bLengthChange": false,
                "bFilter": false,
                "sScrollX": "100%",
                "bProcessing": true
            });
        });
    </script>
</asp:Content>
