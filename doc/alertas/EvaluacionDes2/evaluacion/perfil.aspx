<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="perfil.aspx.vb" Inherits="SistemaEvaluacion.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="evaluar_titulo">
        Modificar datos personales
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="source_perfil" CssClass="tableFullWidth tablaNueva" BorderStyle="None">
        <Columns>
            <asp:BoundField DataField="username" HeaderText="Usuario" />
            <asp:BoundField DataField="password" HeaderText="Clave"/>
            <asp:BoundField DataField="nombre" HeaderText="Nombre"/>
            <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo"/>
            <asp:BoundField DataField="correo" HeaderText="Correo"/>
            <asp:BoundField DataField="rut" HeaderText="Rut"/>
            <asp:CommandField ShowEditButton="True"/>
        </Columns>
    </asp:GridView>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
    <asp:SqlDataSource ID="source_perfil" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>">
        <UpdateParameters>
            <asp:Parameter Name="username" />
            <asp:Parameter Name="password" />
            <asp:Parameter Name="correo" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
