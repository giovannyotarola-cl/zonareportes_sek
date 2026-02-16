<%@ Page Title="Zona Reportes" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="AnalisisPagos.aspx.vb" Inherits="AnalisisPagos" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div id="form-filtros">
        <h3>ANALISIS DE PAGOS</h3>
        <table>
            <tbody>
                <tr>
                    <td class="bolder">RUT ALUMNO</td>
                    <td><asp:TextBox ID="TB_Rut" runat="server"></asp:TextBox></td>
                </tr>
                <tr class="inter">
                    <td class="bolder">FACULTAD</td>
                    <td>
                        <asp:DropDownList ID="CB_Facultad" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr class="inter">
                    <td class="bolder">CARRERA</td>
                    <td><asp:DropDownList ID="CB_Carrera" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="bolder">DOCUMENTO</td>
                    <td><asp:DropDownList ID="CB_Documento" runat="server"></asp:DropDownList></td>
                </tr>
                <tr class="inter">
                    <td class="bolder">PAGO</td>
                    <td><asp:DropDownList ID="CB_Pago" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="bolder">AÑO</td>
                    <td><asp:DropDownList ID="CB_Anio" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button ID="Enviar" runat="server" Text="Buscar" CssClass="float-left" /> <asp:Button ID="Exportar" runat="server" Text="Exportar a Excel" CssClass="float-right" />
                        <asp:Button ID="Button1" runat="server" Text="Button" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="content-estadistica">
        <asp:Table ID="TBL_InfoAlumno" runat="server" CssClass="dataAlumno">
            <asp:tableHEaderRow>
                <asp:TableHeaderCell>INFORMACIÓN ALUMNO</asp:TableHeaderCell>
                <asp:TableHEaderCell></asp:TableHEaderCell>
            </asp:tableHEaderRow>
            <asp:TableRow CssClass="odd">
                <asp:TableCell>NOMBRE ALUMNO</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="LB_NombreAlumno" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow CssClass="even">
                <asp:TableCell>CÓDIGO CLIENTE</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="LB_CodigoCliente" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow CssClass="odd">
                <asp:TableCell>CARRERA</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="LB_CarreraAlumno" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

    <div id="data-result" class="content-arancel">
        <asp:Table ID="TBL_Pagos" runat="server" CssClass="display">
            <asp:tableHEaderRow ID="TableHEaderRow1" TableSection="TableHeader" runat="server">
                <asp:TableHeaderCell>RUT</asp:TableHeaderCell>
                <asp:TableHeaderCell>DOCUMENTO</asp:TableHeaderCell>
                <asp:TableHeaderCell>CTA. DOCNUM</asp:TableHeaderCell>
                <asp:TableHeaderCell>MONTO</asp:TableHeaderCell>
                <asp:TableHeaderCell>VENCIMIENTO</asp:TableHeaderCell>
                <asp:TableHeaderCell>AÑO</asp:TableHeaderCell>
                <asp:TableHeaderCell>CANCELADO</asp:TableHeaderCell>
                <asp:TableHeaderCell>AÑO MOV.</asp:TableHeaderCell>
            </asp:tableHEaderRow>
        </asp:Table>
    </div>
    <script>
        $(document).ready(function () {
            $(function () {
                /*Cargar los calendarios*/
                $(".datepicker").datepicker();
                /*Llenar la tabla*/
                var table = $('#MainContent_TBL_Pagos').DataTable();
            });
        });
    </script>
</asp:Content>

