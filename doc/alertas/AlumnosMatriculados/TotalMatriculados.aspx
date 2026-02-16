<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="TotalMatriculados.aspx.vb" Inherits="TotalMatriculados" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <h3>REPORTE TOTAL MATRICULADOS</h3>
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
                <td class="bolder">AÑO INGRESO</td>
                <td>
                    <asp:DropDownList ID="txt_anioingresod" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                    A
                    <asp:DropDownList ID="txt_anioingresoa" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="inter">
                <td class="bolder">AÑO MATRÍCULA</td>
                <td>
                    <asp:DropDownList ID="txt_aniomatriculad" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                    </asp:DropDownList> 
                    A
                    <asp:DropDownList ID="txt_aniomatriculaa" runat="server">
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
            <tr>
                <td colspan="2">
                    <asp:Button ID="Enviar" runat="server" Text="Buscar" CssClass="float-left" /> 
                    <asp:Button ID="Exportar" runat="server" Text="Exportar a Excel" CssClass="float-right" />
                </td>
            </tr>
        </tbody>
    </table>

    <div class="content-estadistica">
        <asp:Table ID="TBL_InfoAlumno" runat="server" CssClass="dataAlumno">
            <asp:tableHEaderRow>
                <asp:TableHeaderCell>INFORMACIÓN GENERAL</asp:TableHeaderCell>
                <asp:TableHEaderCell>VIGENTES</asp:TableHEaderCell>
                <asp:TableHEaderCell>ELIMINADOS</asp:TableHEaderCell>
                <asp:TableHEaderCell>SUSPENDIDOS</asp:TableHEaderCell>
                <asp:TableHEaderCell>EGRESADOS</asp:TableHEaderCell>
                <asp:TableHEaderCell>TITULADOS</asp:TableHEaderCell>
            </asp:tableHEaderRow>
            <asp:TableRow CssClass="even">
                <asp:TableCell>ESTADO ACADÉMICO</asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="LB_TotalVIgentes" runat="server" Text=""></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="LB_TotalEliminados" runat="server" Text=""></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="LB_TotalSuspendidos" runat="server" Text=""></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="LB_TotalEgresados" runat="server" Text=""></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="LB_TotalTitulados" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow CssClass="odd">
                <asp:TableCell><strong>TOTAL ALUMNOS</strong></asp:TableCell>
                <asp:TableCell>
                    <strong><asp:Label ID="LB_TotalAlumnos" runat="server" Text=""></asp:Label></strong>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow CssClass="even">
                <asp:TableCell><strong>TOTAL SITUACIONES</strong></asp:TableCell>
                <asp:TableCell>
                    <strong><asp:Label ID="LB_TotalSituaciones" runat="server" Text=""></asp:Label></strong>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

    <div id="data-result" class="content-arancel">
        <asp:Table ID="TBL_Alumnos" runat="server" CssClass="display">
            <asp:tableHEaderRow ID="TableHEaderRow1" TableSection="TableHeader" runat="server">
                <asp:TableHeaderCell>CÓDIGO</asp:TableHeaderCell>
                <asp:TableHeaderCell>RUT</asp:TableHeaderCell>
                <asp:TableHeaderCell>NOMBRE</asp:TableHeaderCell>
                <asp:TableHeaderCell>CARRERA</asp:TableHeaderCell>
                <asp:TableHeaderCell>ESTADO</asp:TableHeaderCell>
                <asp:TableHeaderCell>SITUACIÓN</asp:TableHeaderCell>
                <asp:TableHeaderCell>INGRESO</asp:TableHeaderCell>
                <asp:TableHeaderCell>MATRÍCULA</asp:TableHeaderCell>
            </asp:tableHEaderRow>
        </asp:Table>
    </div>
    <script>
        $(document).ready(function () {
            $(function () {
                /*Llenar la tabla*/
                var table = $('#MainContent_TBL_Alumnos').DataTable();
            });
        });

        function wOpen(rut) {
            window.open('InfoAlumno.aspx?codcli=' + rut, 'Información', 'width=500,height=600,toolbar=no,scrollbars=no,resizable=no');
        }
    </script>
</asp:Content>

