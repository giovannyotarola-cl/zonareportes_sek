<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="NivelEstudios.aspx.vb" Inherits="NivelEstudios" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <h3>Nivel Estudios</h3>
    <table>
        <tbody>
            <tr>
                <td class="bolder">RUT</td>
                <td><asp:TextBox ID="TB_Rut" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="inter">
                <td class="bolder">Nombre</td>
                <td><asp:TextBox ID="TB_Nombre" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="bolder">Apellido Paterno</td>
                <td><asp:TextBox ID="TB_ApellidoP" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="inter">
                <td class="bolder">Apellido Materno</td>
                <td><asp:TextBox ID="TB_ApellidoM" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="bolder">
                <td class="bolder">Carrera</td>
                <td><asp:DropDownList ID="CB_Carrera" runat="server"></asp:DropDownList></td>
            </tr>
            <tr class="inter">
                <td class="bolder">Año</td>
                <td><asp:TextBox ID="TB_AnioMatricula" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="bolder">
                <td class="bolder">Año Nivel</td>
                <td><asp:TextBox ID="TB_Anio" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="inter">
                <td class="bolder">Estado Académico</td>
                <td>
                    <asp:CheckBox ID="CH_eliminado" runat="server" /> Eliminado
                    <asp:CheckBox ID="CH_suspendido" runat="server" /> Suspendido
                    <asp:CheckBox ID="CH_vigente" runat="server" /> Vigente
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="Enviar" runat="server" Text="Buscar" CssClass="float-left" /></td>
            </tr>
        </tbody>
    </table>
    <hr />
    <div id="data-result" class="content-arancel">
        <asp:Table ID="TBL_Aranceles" runat="server" CssClass="display table-nivel">
            <asp:tableHEaderRow ID="TableHEaderRow1" TableSection="TableHeader" runat="server">
                <asp:TableHeaderCell>Rut</asp:TableHeaderCell>
                <asp:TableHeaderCell>Dv</asp:TableHeaderCell>
                <asp:TableHeaderCell>Nombre</asp:TableHeaderCell>               
                <asp:TableHeaderCell>Apeliido Paterno</asp:TableHeaderCell>               
                <asp:TableHeaderCell>Apeliido Materno</asp:TableHeaderCell>               
                <asp:TableHeaderCell>Carrera</asp:TableHeaderCell>   
                <asp:TableHeaderCell>Estado Académico</asp:TableHeaderCell>                
                <asp:TableHeaderCell>Año</asp:TableHeaderCell>              
                <asp:TableHeaderCell>Año Nivel</asp:TableHeaderCell>                        
                <asp:TableHeaderCell>Nivel</asp:TableHeaderCell>              
            </asp:tableHEaderRow>
        </asp:Table>
    </div>
    <script type="text/javascript">
        $('.table-nivel').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'excel', 'pdf', 'print'
            ]
        });
    </script>
</asp:Content>

