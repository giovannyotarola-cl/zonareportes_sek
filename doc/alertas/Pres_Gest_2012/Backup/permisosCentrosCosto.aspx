<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="permisosCentrosCosto.aspx.vb" Inherits="SistemaPresupuestos.permisosCentrosCosto" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <div class="titulo_permisos">
       Listado de permisos del usuario
    </div>

    <asp:CheckBoxList ID="listado_centrosCosto" runat="server" 
    DataSourceID="Source_CentrosCosto" DataTextField="Name" DataValueField="AREA" 
        RepeatColumns="3" RepeatDirection="Horizontal">
    </asp:CheckBoxList>
    <br />
     <asp:Button ID="boton_permisos" runat="server" Text="Aplicar permisos" />
    <br />
    <br />
    
    <div class="link_volver">
        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/SelUsuarioCosto.aspx" runat="server">Volver</asp:HyperLink>
    </div>

<asp:SqlDataSource ID="Source_CentrosCosto" runat="server" 
    ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>" 
    SelectCommand="SELECT SEK_V_areas_activas.AREA, V_SEK_DimensionArea.Name FROM SEK_V_areas_activas INNER JOIN V_SEK_DimensionArea ON SEK_V_areas_activas.AREA = V_SEK_DimensionArea.Code">
</asp:SqlDataSource>
</asp:Content>