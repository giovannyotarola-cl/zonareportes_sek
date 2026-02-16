<%@ Page Title="Principal" Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="MantencionCarreras.aspx.cs" Inherits="AutoPostulacion._MantencionCarreras" %>

<asp:Content ID="MantencionCarreras" ContentPlaceHolderID="MainContent" runat="server">
    <script language="JavaScript">
        var myWindow;

        function url() {
            hidden = open('MantencionCarrerasAgregar.aspx', 'NewWindow', 'top=0,left=0,width=800,height=600,status=no,resizable=no,scrollbars=no');
        }
        function openWin() {
            myWindow = window.open("MantencionCarrerasAgregar.aspx", "_blank", "width=500, height=500");
        }
        function openWinEliminar() {
            myWindow = window.open("MantencionCarrerasEliminar.aspx", "_blank", "width=500, height=500");
        }
        function Confirmar() {
            if (confirm('Desea Salir?'))
                return true;
            else
                return false;
        }
    </script>

    <div class="titulo text-center">
        <h1 style="background-color: #FFFFFF; color: #2E89B6;">Carreras Incluídas</h1>
    </div>
    <table class="nav-justified" style="width: 95%">
        <td style="height: 20px"></td>
    </table>
    <table class="nav-justified" style="width: 95%">
        <td style="height: 20px" class="text-left">
            <asp:GridView ID="grdCarreras" runat="server" OnSelectedIndexChanged="grdCarreras_SelectedIndexChanged" OnRowEditing="grdCarreras_RowEditing" Width="95%" CssClass="table-sorting" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" OnRowDeleting="grdCarreras_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </td>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="width: 95%"></td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="width: 20%">
                <asp:Button ID="btnAgregarCarrera" runat="server" CssClass="btn btn-info btn-xs" Text="Agregar Carrera" OnClick="btnAgregarCarrera_Click" Visible="False" />
            </td>
            <td style="width: 25%">
                <asp:Button ID="btnEliminarCarrera" runat="server" CssClass="btn-danger active" OnClick="btnEliminarCarrera_Click" Text="Eliminar Carrera" />
                
            </td>
            <td style="width: 40%">
                <asp:Label ID="lblAgregarCarreras" runat="server" Text="Listado de Carreras" Visible="False"></asp:Label>
                <asp:DropDownList ID="drpListaCarreras" runat="server" Visible="False" Width="100%" CssClass="dropdown-header">
                </asp:DropDownList>

            </td>
            <td style="width: 15%">
                <asp:Button ID="btnAgrega" runat="server" CssClass="btn-info btn-xs" Text="Agregar" Visible="False" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_salir" runat="server" CssClass="btn btn-xs btn-success" Text="Salir" OnClick="btn_salir_Click" OnClientClick="return Confirmar();" />
            </td>
        </tr>
    </table>
</asp:Content>
