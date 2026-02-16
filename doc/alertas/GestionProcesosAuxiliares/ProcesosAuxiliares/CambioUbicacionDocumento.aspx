<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="CambioUbicacionDocumento.aspx.vb" Inherits="ProcesosAuxiliares_CambioUbicacionDocumento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script src="../Scripts/validaciones.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/ecmascript">
        $(document).ready(function () {
            $(".datepicker").datepicker({dateFormat: "dd/mm/yy"});
            $(".dataTable").dataTable({
                responsive: {
                    details: {
                        type: 'column',
                        target: -1
                    }
                },
                columnDefs: [{
                    className: 'control',
                    orderable: false,
                    targets: -1
                }],
                "iDisplayLength": 15,
                "sPaginationType": "full_numbers",
                "bLengthChange": false,
                "bFilter": false,
                "bInfo": true,
                "bPaginate": true
            });
        });
    </script>
    <h1>Cambio Ubicación Documentos</h1>
    <asp:Panel id="pnlFiltros" runat="server">
        <h3>Filtros</h3>
        <table>
            <tbody>
                <tr>
                    <td>
                        <asp:Label ID="lblRut" Text="Rut Alumno" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRut" runat="server"></asp:TextBox>
                        <asp:CustomValidator runat="server" ControlToValidate="txtRut" ForeColor="Red" ErrorMessage="*" ClientValidationFunction="validarTxtRut"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblFecVencInicial" Text="Fecha vencimiento inicial" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFecVenInicial" runat="server" CssClass="datepicker"></asp:TextBox>
                        <asp:CustomValidator runat="server" ControlToValidate="txtFecVenInicial" ClientValidationFunction="validarFecha" ForeColor="Red" ErrorMessage="*"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblFecVenFinal" Text="Fecha vencimiento final" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFecVenFinal" runat="server" CssClass="datepicker"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtFecVenFinal"  ClientValidationFunction="validarFecha" ForeColor="Red" ErrorMessage="*"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblTipoDoc" runat="server" Text="Tipo Documento"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTipoDoc" runat="server"></asp:DropDownList>
                        <asp:CustomValidator runat="server" ControlToValidate="ddlTipoDoc" ClientValidationFunction="validarDropDownList" ForeColor="Red" ErrorMessage="*"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblOrigenDoc" runat="server" Text="Origen documento"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlOrigenDoc" runat="server"></asp:DropDownList>
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="ddlOrigenDoc" ClientValidationFunction="validarDropDownList" ForeColor="Red" ErrorMessage="*"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>
                            <asp:Label ID="lblDestinoDoc" runat="server" Text="Destino documento"></asp:Label>
                        </h3>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDestinoDoc" runat="server"></asp:DropDownList>
                        <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="ddlDestinoDoc" ClientValidationFunction="validarDropDownList" ForeColor="Red" ErrorMessage="*"></asp:CustomValidator>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Button ID="btnFiltrar" runat="server" Text="Buscar" />
    </asp:Panel>
    <asp:Panel ID="pnlPreCarga" runat="server" Visible="false">
        <asp:Table ID="tblPreCarga" runat="server" CssClass="display dataTable">
            <asp:tableHEaderRow ID="TableHEaderRow1" TableSection="TableHeader" runat="server">
                <asp:TableHeaderCell>RUT</asp:TableHeaderCell>
                <asp:TableHeaderCell>NOMBRE COMPLETO</asp:TableHeaderCell>
                <asp:TableHeaderCell>TIPO DOCUMENTO</asp:TableHeaderCell>
                <asp:TableHeaderCell>NUMERO DOCUMENTO</asp:TableHeaderCell>
                <asp:TableHeaderCell>FECHA VENCIMIENTO</asp:TableHeaderCell>
                <asp:TableHeaderCell>AÑO DEUDA</asp:TableHeaderCell>
                <asp:TableHeaderCell>SEDE</asp:TableHeaderCell>
                <asp:TableHeaderCell>TIPO CARRERA</asp:TableHeaderCell>
                <asp:TableHeaderCell>UBICACIÓN</asp:TableHeaderCell>
            </asp:tableHEaderRow>
        </asp:Table>
        <asp:Button ID="btnCancelar" runat="server"  Text="Cancelar"/>
        <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" />
    </asp:Panel>
</asp:Content>

