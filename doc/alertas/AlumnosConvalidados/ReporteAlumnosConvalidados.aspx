<%@ Page Title="Reporte" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ReporteAlumnosConvalidados.aspx.vb" Inherits="AlumnosConvalidados" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script>
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
    <h3>REPORTE ALUMNOS CONVALIDADOS</h3>
    <table>
        <tbody>
            <tr class="inter">
                <td class="cell-border">RUT ALUMNO</td>
                <td>
                    <asp:TextBox ID="txtRutAlumno" runat="server"></asp:TextBox>
                </td>
            </tr>
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
                        <asp:ListItem Text="Todo" Value="Todo"></asp:ListItem>
                        <asp:ListItem Text="D" Value="Diurno"></asp:ListItem>
                        <asp:ListItem Text="V" Value="Vespertino"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="cell-border">AÑO INGRESO</td>
                <td>
                    <asp:DropDownList ID="ddlAnioIngreso" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="cell-border">ÚLTIMO AÑO MATRICULA</td>
                <td>
                    <asp:DropDownList ID="ddlUltimaMatricula" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="cell-border">ESTADO ACADÉMICO ACTUAL</td>
                <td>
                    <asp:DropDownList ID="ddlEstadoAcademico" runat="server"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="Enviar" runat="server" Text="Buscar" CssClass="float-left" /> <asp:Button ID="Exportar" runat="server" Text="Exportar a Excel" CssClass="float-right" /></td>
            </tr>
        </tbody>
    </table>

    <div id="data-result" class="content-arancel">
        <asp:Table ID="tblAlumnosConvalidados" runat="server" CssClass="display font9 dataTable">
            <asp:tableHEaderRow ID="TableHEaderRow1" TableSection="TableHeader" runat="server">
                <asp:TableHeaderCell>CÓD. Cliente</asp:TableHeaderCell>
                <asp:TableHeaderCell>APELLIDO PATERNO</asp:TableHeaderCell>
                <asp:TableHeaderCell>APELLIDO MATERNO</asp:TableHeaderCell>
                <asp:TableHeaderCell>NOMBRE</asp:TableHeaderCell>
                <asp:TableHeaderCell>RUT</asp:TableHeaderCell>
                <asp:TableHeaderCell>GÉNERO</asp:TableHeaderCell>
                <asp:TableHeaderCell>CÓD. CARRERA</asp:TableHeaderCell>
                <asp:TableHeaderCell>CARRERA</asp:TableHeaderCell>
                <asp:TableHeaderCell>JORNADA</asp:TableHeaderCell>
                <asp:TableHeaderCell>CÓD. FACULTAD</asp:TableHeaderCell>
                <asp:TableHeaderCell>FACULTAD</asp:TableHeaderCell>
                <asp:TableHeaderCell>AÑO INGRESO</asp:TableHeaderCell>
                <asp:TableHeaderCell>ÚLTIMA MATRICULA</asp:TableHeaderCell>
                <asp:TableHeaderCell>ESTADO ACADÉMICO ACTUAL</asp:TableHeaderCell>
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

