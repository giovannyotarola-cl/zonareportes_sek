<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SelUsuarioCosto.aspx.vb" Inherits="SistemaPresupuestos.CentrosCosto" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class = "titulo_permisos">
        Seleccionar usuario para editar permisos
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="Source_usuarios">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" 
                Visible="False" />
            <asp:BoundField DataField="username" HeaderText="Usuario" 
                SortExpression="username" />
            <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="permisosCentrosCosto.aspx?usuario={0}" HeaderText="Acción" Text="Permisos" />
        </Columns>
    </asp:GridView>

    <div class = "link_volver">
        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx" runat="server">Volver</asp:HyperLink>
    </div>

    <asp:SqlDataSource ID="Source_usuarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>" 
        SelectCommand="SELECT id, username FROM SEK_Presupuestos_Users">
    </asp:SqlDataSource>


</asp:Content>