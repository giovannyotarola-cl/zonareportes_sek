<%@ Page Title="Editar Usuario" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="AdminUsuarioEdit.aspx.vb" Inherits="AdminUsuarioEdit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
        function cambiarPermiso() {
            alert('asdasd');
        }
    </script>
    <h2>Editar permisos</h2>
    <asp:CheckBoxList ID="chkListProcesos" runat="server"></asp:CheckBoxList>
</asp:Content>

