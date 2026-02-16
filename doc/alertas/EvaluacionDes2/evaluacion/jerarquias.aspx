<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="jerarquias.aspx.vb" Inherits="SistemaEvaluacion.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="evaluar_titulo">
        Gestión de Jerarquías
    </div>
    <asp:GridView ID="grilla_jerarquias" runat="server" AutoGenerateColumns="False" 
        DataSourceID="origen_sql_jerarquias" DataKeyNames= "id" OnRowDeleted="fila_borrada" CssClass="tablaNueva table50Percent">
        <Columns>
              <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate>
                        <%# Eval("nombre")%>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_sel_ev" />
                    <ItemStyle CssClass="td_sel_ev"/>
                </asp:TemplateField>
              <asp:CommandField HeaderText="Acciones" ShowDeleteButton="True" 
                  ShowHeader="False" ControlStyle-CssClass="td_sel_ev" HeaderStyle-CssClass="td_sel_ev" />
        </Columns>
    </asp:GridView>

    
    <asp:DropDownList ID="lista_empleados" runat="server" 
        DataSourceID="fill_dropdown" DataTextField = "nombre_empleado" DataValueField="id" CssClass="ddlNuevo">
    </asp:DropDownList>
    
    <asp:Button ID="Button1" runat="server" Text="Agregar jerarquía" CssClass="btnInputNuevo" />

    <asp:SqlDataSource ID="fill_dropdown" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="origen_sql_jerarquias" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>">
    </asp:SqlDataSource>
    
    <div class="clear"></div><br /><br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/evaluacion/jerarquias_usuarios.aspx">Volver</asp:HyperLink>

</asp:Content>
