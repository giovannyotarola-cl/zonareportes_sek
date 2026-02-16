<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="desglosePr.aspx.vb" Inherits="SistemaPresupuestos.WebForm2" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        PRESUPUESTO DE CUENTA <%= Request.QueryString("NumeroCuenta") %>
    </h2>
    
    <br />
    <div class="titulo_filtro_desglose">
        Filtro por &Aacute;reas
    </div> 
    <asp:Button ID="boton_area" runat="server" Height="21px" 
            Text="Desmarcar todo" CssClass="boton_marcar" />
    <div class="clear_both"></div>
    <div class="div_areas">
        <asp:CheckBoxList ID="Lista_Areas" runat="server"
            DataTextField="Name" DataValueField="AREA" RepeatColumns="2" 
            RepeatDirection="Horizontal" RepeatLayout="Table">
        </asp:CheckBoxList>
    </div>
    <br />
    <asp:Button ID="desglosepr_aplicar_filtros" runat="server" Text="Aplicar filtros" />
    
    <p>
        <asp:GridView ID="globalGrid" runat="server"
            BorderColor="Black" BorderWidth="1px" PageSize="30" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False">
                        
            <Columns>
                <asp:BoundField DataField="Importe" HeaderText="Importe" 
                    SortExpression="Importe" DataFormatString="{0:N0}">
                <HeaderStyle CssClass="td_tabla" />
                <ItemStyle Width="115px" HorizontalAlign="Right" CssClass="td_tabla" />
                </asp:BoundField>
                <asp:BoundField DataField="AREA" HeaderText="Área" SortExpression="AREA">
                <HeaderStyle CssClass="td_tabla" />
                <ItemStyle Width="100px" CssClass="td_tabla" />
                </asp:BoundField>
            </Columns>
                        
            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" 
                Font-Strikeout="False" Font-Underline="False" ForeColor="Black" 
                HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />             
            <PagerSettings Position="TopAndBottom" />
        </asp:GridView>
    </p>
    <p>
        <asp:Button ID="boton_cerrar" runat="server" Text="Cerrar" />
    </p>
     
    <asp:SqlDataSource ID="CheckFill_AreaMes" runat="server" ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>">
        <SelectParameters>
            <asp:QueryStringParameter Name="cuenta" QueryStringField="NumeroCuenta" Type="String" />
            <asp:QueryStringParameter Name="mes" QueryStringField="mes" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CheckFill_Area" runat="server" ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>">
        <SelectParameters>
            <asp:QueryStringParameter Name="cuenta" QueryStringField="NumeroCuenta" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:sqldatasource id="uchile_conmes" runat="server" 
        connectionstring="<%$ connectionstrings:uchileconnectionstring %>" >
        <selectparameters>
            <asp:querystringparameter name="cuenta" querystringfield="NumeroCuenta" type="String" />
            <asp:querystringparameter name="mes" querystringfield="mes" type="String" />
        </selectparameters>
    </asp:sqldatasource>
     <asp:SqlDataSource ID="UCHILE_sinMes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>">
        <SelectParameters>
            <asp:QueryStringParameter Name="cuenta" QueryStringField="NumeroCuenta" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>



