<%@ Page Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="AutoPostulacion.error" %>
<asp:Content ID="error" ContentPlaceHolderID="MainContent" runat="server">
  <%--  <script language="javascript">
        function Confirmar() {
            if (confirm('Desea Modificar la Fecha de Matrícula?'))
                return true;
            else
                return false;
        }
        function Salir() {
            if (confirm('Desea Salir?'))
                return true;
            else
                return false;
        }
        function closeWinConfirm() {
            if (confirm('Desea Salir'))
                myWindow.close();
            else
                return false;
        }
        function closeWin() {
            myWindow.close();
        }
    </script>--%>
    <div class="titulo text-center">
        <h1 style="background-color: #FFFFFF; color: #e80b0b;">Error!</h1>
    </div>
    <div class="container-content">
        <asp:Label ID="lblTipoError" runat="server" Text=""></asp:Label>
        <br />
    </div>
    <div class="container-content">
        <%--<asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn btn-xs btn-success" OnClientClick="javascript:window.close();" OnClick="btnSalir_Click"/>--%>
        <asp:Button ID="btnSalir" runat="server" CssClass="btn btn-xs btn-success" Text="Salir" OnClick="btnSalir_Click"/>
    </div>

</asp:Content>