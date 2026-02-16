<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ReporteWebpay.aspx.vb" Inherits="ReporteWebpay" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <h3>REPORTE DE PAGOS POR WEBPAY</h3>
    <table>
        <tbody>
            <tr class="inter">
                <td class="bolder">TIPO INFORME</td>
                <td>
                    <asp:DropDownList ID="CB_TipoInforme" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                        <asp:ListItem Value="OC" Text="ARANCELES"></asp:ListItem>
                        <asp:ListItem Value="CE" Text="CERTIFICADOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="bolder">RUT ALUMNO</td>
                <td><asp:TextBox ID="TB_Rut" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="inter">
                <td class="bolder">CARRERA</td>
                <td><asp:DropDownList ID="CB_Carrera" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="bolder">FECHA COMPRA</td>
                <td><asp:TextBox ID="TB_FechaDesde" runat="server" CssClass="datepicker"></asp:TextBox> a <asp:TextBox ID="TB_FechaHasta" runat="server" CssClass="datepicker"></asp:TextBox></td>
            </tr>
            <tr class="inter">
                <td class="bolder">ORDEN COMPRA</td>
                <td><asp:TextBox ID="TB_OrdenCompra" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="bolder">ESTADO</td>
                <td>
                    <asp:DropDownList ID="CB_Estado" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                        <asp:ListItem Value="Aceptado" Text="APROBADOS"></asp:ListItem>
                        <asp:ListItem Value="Rechazado" Text="RECHAZADOS"></asp:ListItem>
                        <asp:ListItem Value="Blanco" Text="BLANCOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="Enviar" runat="server" Text="Buscar" CssClass="float-left" /> <asp:Button ID="Exportar" runat="server" Text="Exportar a Excel" CssClass="float-right" /></td>
            </tr>
        </tbody>
    </table>

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

        <asp:Table ID="TBL_MontoAlumno" runat="server" CssClass="dataAlumno">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>DETALLE PAGOS</asp:TableHeaderCell>
                <asp:TableHEaderCell CssClass="th-center">APROBADOS</asp:TableHEaderCell>
                <asp:TableHEaderCell CssClass="th-center">RECHAZADOS</asp:TableHEaderCell>
                <asp:TableHEaderCell CssClass="th-center">BLANCOS</asp:TableHEaderCell>
                <asp:TableHEaderCell CssClass="th-center">TOTAL</asp:TableHEaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow CssClass="odd">
                <asp:TableCell>ARANCELES</asp:TableCell>
                <asp:TableCell CssClass="lb-center"><asp:Label ID="LB_ArancelAceptado" runat="server" Text=""></asp:Label></asp:TableCell>
                <asp:TableCell CssClass="lb-center"><asp:Label ID="LB_ArancelRechazado" runat="server" Text=""></asp:Label></asp:TableCell>
                <asp:TableCell CssClass="lb-center"><asp:Label ID="LB_ArancelBlanco" runat="server" Text=""></asp:Label></asp:TableCell>
                <asp:TableCell CssClass="lb-center bolder"><asp:Label ID="LB_ArancelTotal" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow CssClass="even">
                <asp:TableCell>CERTIFICADOS</asp:TableCell>
                <asp:TableCell CssClass="lb-center"><asp:Label ID="LB_CertificadoAceptado" runat="server" Text=""></asp:Label></asp:TableCell>
                <asp:TableCell CssClass="lb-center"><asp:Label ID="LB_CertificadoRechazado" runat="server" Text=""></asp:Label></asp:TableCell>
                <asp:TableCell CssClass="lb-center"><asp:Label ID="LB_CertificadoBlanco" runat="server" Text=""></asp:Label></asp:TableCell>
                <asp:TableCell CssClass="lb-center bolder"><asp:Label ID="LB_CertificadoTotal" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow CssClass="odd">
                <asp:TableCell CssClass="bolder">TOTAL</asp:TableCell>
                <asp:TableCell CssClass="lb-center bolder"><asp:Label ID="LB_TotalAceptados" runat="server" Text=""></asp:Label></asp:TableCell>
                <asp:TableCell CssClass="lb-center bolder"><asp:Label ID="LB_TotalRechazados" runat="server" Text=""></asp:Label></asp:TableCell>
                <asp:TableCell CssClass="lb-center bolder"><asp:Label ID="LB_TotalBlancos" runat="server" Text=""></asp:Label></asp:TableCell>
                <asp:TableCell CssClass="lb-center bolder"><asp:Label ID="LB_TotalFinal" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

    <div id="data-result" class="content-arancel">
        <asp:Table ID="TBL_Aranceles" runat="server" CssClass="display">
            <asp:tableHEaderRow ID="TableHEaderRow1" TableSection="TableHeader" runat="server">
                <asp:TableHeaderCell>RUT ALUMNO</asp:TableHeaderCell>
                <asp:TableHeaderCell>ORDEN COMPRA</asp:TableHeaderCell>
                <asp:TableHeaderCell>CUOTA</asp:TableHeaderCell>
                <asp:TableHeaderCell>FECHA</asp:TableHeaderCell>
                <asp:TableHeaderCell>MONTO</asp:TableHeaderCell>
                <asp:TableHeaderCell>CÓDIGO CARRERA</asp:TableHeaderCell>
                <asp:TableHeaderCell>ESTADO</asp:TableHeaderCell>
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

