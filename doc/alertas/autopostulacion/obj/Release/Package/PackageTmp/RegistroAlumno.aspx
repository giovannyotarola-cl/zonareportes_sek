<%@ Page Title="Principal" Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="RegistroAlumno.aspx.cs" Inherits="AutoPostulacion.RegistroAlumno" %>

<asp:Content ID="RegistroAlumno" ContentPlaceHolderID="MainContent" runat="server">
    <script language="JavaScript">
        function Confirmar() {
            if (confirm('Desea Salir?'))
                return true;
            else
                return false;
        }
    </script>
    <script src="Scripts/validarut.js?ver=0.1.4"></script>
    <div class="titulo text-center">
        <h1 style="background-color: #FFFFFF; color: #2E89B6;">Actividad de Alumnos</h1>
    </div>
    <table class="nav-justified" style="width: 95%">
        <td style="height: 20px"></td>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="width: 10%">
                <asp:Label ID="lblRut" runat="server" Text="Rut"></asp:Label>
            </td>
            <td style="width: 30%">
                <asp:TextBox ID="txt_Rut" runat="server" onchange="javascript:checkRutField(this.value);" value="" MaxLength="12" Width="98%"></asp:TextBox>
            </td>
            <td style="width: 20%">
                <asp:Button ID="bntBuscar" runat="server" CommandArgument="" CssClass="btn btn-info btn-xs" ClientIDMode="Static" Visible="true" Text="Buscar" OnClick="bntBuscar_Click" />
            </td>
            <td style="width: 40%"></td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="width: 95%; height: 30px"></td>
        </tr>
        <tr>
            <td style="width: 95%">
                <table class="nav-justified" style="width: 95%">
                    <td style="height: 20px" class="text-left">
                        <asp:GridView ID="grdRegistroAlumno" runat="server" Width="95%" CssClass="table-sorting" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Visible="False">
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
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td style="width: 15%">

            </td>
            <td style="width: 70%">

            </td>
            <td style="width: 15%">
                <asp:Button ID="btn_salir" runat="server" CssClass="btn btn-xs btn-success" Text="Salir" OnClick="btn_salir_Click" OnClientClick="return Confirmar();" />
            </td>
        </tr>
    </table>
</asp:Content>
