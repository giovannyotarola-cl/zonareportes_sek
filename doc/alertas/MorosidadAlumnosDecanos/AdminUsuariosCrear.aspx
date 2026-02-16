<%@ Page Title="Crear Usuario" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="AdminUsuariosCrear.aspx.vb" Inherits="AdminUsuarioEdit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Agregar Usuario</h2>
    <table class="tablaEdit">
        <tr>
            <td><span>Usuario</span></td>
            <td><asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtUsuario"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><span>Contraseña</span></td>
            <td><asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtPass"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><span>RUT</span></td>
            <td><asp:TextBox ID="txtRut" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtRut"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><span>Nombre</span></td>
            <td><asp:TextBox ID="txtNom" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtNom"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><span>Nivel</span></td>
            <td>
                <asp:DropDownList ID="ddlNivel" runat="server">
                    <asp:ListItem Text="Seleccione Nivel"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Jefe de Carrera"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Decano"></asp:ListItem>
                    <asp:ListItem Value="3" Text="Decanos All Fac"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td><span>Facultad</span></td>
            <td>
                <asp:DropDownList ID="ddlFacultad" runat="server">
                    <asp:ListItem Text="Seleccione Facultad"></asp:ListItem>
                    <asp:ListItem Value="HED" Text="Patrimonio Cultural y Educación"></asp:ListItem>
                    <asp:ListItem Value="INA" Text="Ingeniería y Administración"></asp:ListItem>
                    <asp:ListItem Value="SAF" Text="Ciencias de la Salud y Actividad Física"></asp:ListItem>
                    <asp:ListItem Value="CJS" Text="Ciencias Jurídicas y Sociales"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" />
            </td>
        </tr>
    </table>
</asp:Content>

