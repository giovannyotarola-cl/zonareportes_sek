<%@ Page Title="Reporte" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="CambioFechaDocumento.aspx.vb" Inherits="CambioFechaDocumento" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script>

        function seleccuenta(ctadocnum, fechaven) {
            

            document.getElementById('MainContent_hctadocnum').value = ctadocnum;
            document.getElementById('MainContent_hfecven').value = fechaven;
            document.getElementById('MainContent_Exportar').style.display = "block";

        }
        $(document).ready(function () {
            $(".dataTable").dataTable({
                "iDisplayLength": 15,
                "sPaginationType": "full_numbers",
                "bLengthChange": false,
                "bFilter": false,
                "bInfo": true,
                "bPaginate": true
            });
        });
    </script>
    <style>
        .disponibleguardar
        {
            display:none;
        }

    </style>
    <h3>Cambio Fecha Documento</h3>
    <table>
        <tbody>
            <tr class="inter">
                <td class="cell-border">RUT ALUMNO</td>
                <td>
                    <asp:TextBox ID="txtRutAlumno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="inter">
                <td class="bolder">TIPO DOCUMENTO</td>
                <td>
                    <asp:DropDownList ID="ddlTDocumento" runat="server"></asp:DropDownList>
                </td>
            </tr>
            
           <tr class="inter">
                <td class="cell-border">Nueva Fecha Vencimiento</td>
                <td>
                    <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="Enviar" runat="server" Text="Buscar" CssClass="float-left" /> <asp:Button ID="Exportar"  runat="server" Text="Cambiar Fecha" CssClass="float-right disponibleguardar" /></td>
            </tr>
        </tbody>
    </table>

    <div id="data-result" class="content-arancel">
        <asp:HiddenField ID="hctadocnum" runat="server" />
        <asp:HiddenField ID="hfecven" runat="server" />

        <asp:Table ID="tblAlumnosConvalidados" runat="server" CssClass="display font9 dataTable">
            <asp:tableHEaderRow ID="TableHEaderRow1" TableSection="TableHeader" runat="server">
                <asp:TableHeaderCell></asp:TableHeaderCell>
                <asp:TableHeaderCell>CÓD. Cliente</asp:TableHeaderCell>
                <asp:TableHeaderCell>CTADOC</asp:TableHeaderCell>
                <asp:TableHeaderCell>CTADOCNUM</asp:TableHeaderCell>
                <asp:TableHeaderCell>CUOTA</asp:TableHeaderCell>
                <asp:TableHeaderCell>NUMCUOTA</asp:TableHeaderCell>
                <asp:TableHeaderCell>SALDO</asp:TableHeaderCell>
                <asp:TableHeaderCell>FECVEN</asp:TableHeaderCell>
                <asp:TableHeaderCell>FECDEUDA</asp:TableHeaderCell>
                <asp:TableHeaderCell>AÑO</asp:TableHeaderCell>
                <asp:TableHeaderCell>PERIODO</asp:TableHeaderCell>
                <asp:TableHeaderCell>VCTOORI</asp:TableHeaderCell>           
            </asp:tableHEaderRow>
        </asp:Table>
    </div>
    <script>
        $(document).ready(function () {
            $(function () {
                /*Cargar los calendarios*/
                $("#MainContent_txtFecha").datepicker();
               
            });
        });
    </script>
</asp:Content>

