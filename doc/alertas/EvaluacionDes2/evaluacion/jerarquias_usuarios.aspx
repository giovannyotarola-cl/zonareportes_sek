<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="jerarquias_usuarios.aspx.vb" Inherits="SistemaEvaluacion.jerarquias_usuarios" MasterPageFile="~/Site.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class = "evaluar_titulo">
        Seleccione un empleado para editar su jerarquía
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="seleccionar_empleado_jerarquia" EmptyDataText= "No hay empleados en el sistema" BorderColor="Transparent" CssClass="tablaNueva table60Percent">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Id" Visible="False">
                <ItemStyle CssClass="td_sel_ev" />
                <HeaderStyle CssClass="td_sel_ev" />
            </asp:BoundField>
            <asp:BoundField DataField="Empleado" HeaderText="Empleado">
                <ItemStyle CssClass="td_sel_ev" />
                <HeaderStyle CssClass="td_sel_ev" />
            </asp:BoundField>
            <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo">
                <ItemStyle CssClass="td_sel_ev" />
                <HeaderStyle CssClass="td_sel_ev" />
            </asp:BoundField>
            <asp:BoundField DataField="nivel" HeaderText="Nivel" SortExpression="nivel" >
                <ItemStyle HorizontalAlign="Center" CssClass="td_sel_ev"  />
                <HeaderStyle CssClass="td_sel_ev" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="jerarquias.aspx?empleado={0}" 
                HeaderText="Acciones" Text="Editar" >
            <HeaderStyle CssClass="td_sel_ev" />
            <ItemStyle CssClass="td_sel_ev" />
            </asp:HyperLinkField>
        </Columns>
    </asp:GridView>

    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>

    <asp:SqlDataSource ID="seleccionar_empleado_jerarquia" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>"></asp:SqlDataSource>
</asp:Content>