<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="perfil.aspx.vb" Inherits="SistemaEvaluacion.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="evaluar_title">
        Modificar datos personales
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="source_perfil">
        <Columns>
            <asp:BoundField DataField="username" HeaderText="Usuario" HeaderStyle-CssClass="td_sel_ev" ItemStyle-CssClass="td_sel_ev" ItemStyle-Width="80px" ControlStyle-Width="80px" />
            <asp:BoundField DataField="password" HeaderText="Clave" HeaderStyle-CssClass="td_sel_ev" ItemStyle-CssClass="td_sel_ev" ItemStyle-Width="80px" ControlStyle-Width="80px"  />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" HeaderStyle-CssClass="td_sel_ev" ItemStyle-CssClass="td_sel_ev" ItemStyle-Width="90px" ControlStyle-Width="90px"  />
            <asp:BoundField DataField="apellidos" HeaderText="Apellidos" HeaderStyle-CssClass="td_sel_ev" ItemStyle-CssClass="td_sel_ev" ItemStyle-Width="100px" ControlStyle-Width="100px"  />
            <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" HeaderStyle-CssClass="td_sel_ev" ItemStyle-CssClass="td_sel_ev" ItemStyle-Width="80px" ControlStyle-Width="80px"  />
            <asp:CommandField ShowEditButton="True" HeaderStyle-CssClass="td_sel_ev" ItemStyle-CssClass="td_sel_ev" ItemStyle-Width="125px"  />
        </Columns>
    </asp:GridView>
    <br /><br /><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
    <asp:SqlDataSource ID="source_perfil" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>">
        <UpdateParameters>
            <asp:Parameter Name="username" />
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="apellidos" />
            <asp:Parameter Name="password" />
            <asp:Parameter Name="cargo" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
