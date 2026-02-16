<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MantencionCarrerasEliminar.aspx.cs" Inherits="AutoPostulacion.MantencionCarrerasEliminar" %>--%>
<%@ Page Title="Principal" Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="MantencionCarrerasEliminar.aspx.cs" Inherits="AutoPostulacion.MantencionCarrerasEliminar" %>

<asp:Content ID="MantencionCarreras" ContentPlaceHolderID="MainContent" runat="server">
    <script language="javascript">
        var myWindow;

        function openWin() {
            myWindow = window.open("", "myWindow", "width=200,height=100");
            //myWindow = window.open("MantencionCarrerasAgregar.aspx", "_blank", "width=500, height=500");
        }
        function closeWin() {
            myWindow.close();
        }
        function Confirmar() {
            if (confirm('Desea Eliminar esta carrera?'))
                return true;
            else
                return false;
        }
    </script>

    <div class="titulo text-center">
        <h1 style="background-color: #FFFFFF; color: #2E89B6;">Eliminar Carrera</h1>
    </div>
    <table class="nav-justified" style="width: 95%">
        <tr style="height: 40px">
            <td style="width: 50%">

            <td style="width: 50%">
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="height: 24px">
                <asp:Label ID="lblCarrera" runat="server" Text="Carrera"></asp:Label>
            </td>
            <td style="height: 24px">
                <%-- <asp:TextBox ID="txtBuscarListaCarrera" runat="server" Width="80%" AutoPostBack="True" OnTextChanged="txtBuscarListaCarrera_TextChanged"></asp:TextBox>--%>
                <asp:DropDownList ID="drpListaCarreras" AutoPostBack="false" runat="server" Width="80%" OnSelectedIndexChanged="drpListaCarreras_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 20%; height: 24px;"></td>
            <td style="width: 80%; height: 24px;"></td>
        </tr>
        <tr>
            <td style="height: 42px"></td>
        </tr>
        <tr>
            <td style="width: 20%">
                <asp:Button ID="btnEliminarCarrera" runat="server" CssClass="btn-danger" Text="Eliminar Carrera" Visible="true" OnClientClick="return Confirmar();" OnClick="btnEliminarCarrera_Click" />
            </td>
            <td style="width: 60%"></td>
            <td style="20%">
                <asp:Button ID="btn_salir" runat="server" CssClass="btn btn-xs btn-success" Text="Salir" OnClientClick="javascript:window.close();" />
            </td>
        </tr>
    </table>

</asp:Content>
