<%@ Page Title="Usuarios" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Administrador.aspx.vb" Inherits="Administrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Administrador de Usuarios</h1>
    <asp:GridView ID="gvUsuarios" CssClass="tablaUsuarios" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dsUsuarios">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="True" />
            <asp:BoundField DataField="usuario" HeaderText="Usuario" SortExpression="usuario" />
            <asp:BoundField DataField="contrasena" HeaderText="Contraseña" SortExpression="contrasena" />   
            <asp:BoundField DataField="rut" HeaderText="RUT" SortExpression="rut" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
            <asp:BoundField DataField="nivel" HeaderText="Nivel" SortExpression="nivel" />
            <asp:BoundField DataField="facultad" HeaderText="Facultad" SortExpression="facultad" />
            <asp:CommandField ShowSelectButton="True" SelectText="Editar" />            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dsUsuarios" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" >
    </asp:SqlDataSource>

</asp:Content>

