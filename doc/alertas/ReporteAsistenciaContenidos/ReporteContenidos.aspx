<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ReporteContenidos.aspx.vb" Inherits="ReporteContenidos" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <h3>REGISTRO DE CONTENIDOS</h3>
    <table>
        <tbody>
            <tr>
                <td class="bolder">RUT PROFESOR</td>
                <td><asp:TextBox ID="TB_Rut" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="inter">
                <td class="bolder">NOMBRE PROFESOR</td>
                <td><asp:DropDownList ID="CB_Profesor" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="bolder">SEMESTRE ACADEMICO</td>
                <td><asp:DropDownList ID="CB_Semestre" runat="server" AutoPostBack="true"></asp:DropDownList></td>
            </tr>
            <tr class="inter">
                <td class="bolder">CARRERA</td>
                <td><asp:DropDownList ID="CB_Carrera" runat="server" AutoPostBack="true"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="bolder">ASIGNATURA</td>
                <td><asp:DropDownList ID="CB_Asignatura" runat="server" AutoPostBack="true"></asp:DropDownList></td>
            </tr>
            <tr class="inter">
                <td class="bolder">SECCIÓN</td>
                <td><asp:DropDownList ID="CB_Seccion" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="bolder">FECHA ASISTENCIA</td>
                <td><asp:TextBox ID="TB_FechaAsistencia" runat="server" CssClass="datepicker"></asp:TextBox></td>
            </tr>
            <!--<tr>
                <td class="bolder">ESTADO</td>
                <td>
                    <asp:DropDownList ID="CB_Estado" runat="server">
                        <asp:ListItem Value="Todo" Selected="True" Text="TODOS"></asp:ListItem>
                        <asp:ListItem Value="Aceptado" Text="APROBADOS"></asp:ListItem>
                        <asp:ListItem Value="Rechazado" Text="RECHAZADOS"></asp:ListItem>
                        <asp:ListItem Value="Blanco" Text="BLANCOS"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>-->
            <tr>
                <td colspan="2"><asp:Button ID="Enviar" runat="server" Text="Buscar" CssClass="float-left" /> <asp:Button ID="Exportar" runat="server" Text="Exportar a Excel" CssClass="float-right" /></td>
            </tr>
        </tbody>
    </table>

    <div id="data-result" class="content-arancel">
        <asp:Table ID="TBL_Aranceles" runat="server" CssClass="display">
            <asp:tableHEaderRow ID="TableHEaderRow1" TableSection="TableHeader" runat="server">
                <asp:TableHeaderCell>PROFESOR</asp:TableHeaderCell>
                <asp:TableHeaderCell>FECHA</asp:TableHeaderCell>
                <asp:TableHeaderCell>CONTENIDO</asp:TableHeaderCell>                
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
