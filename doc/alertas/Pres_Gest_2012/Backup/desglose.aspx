<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="desglose.aspx.vb" Inherits="SistemaPresupuestos.WebForm1" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript" src="Scripts/funciones.js"></script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Desglose 
        DE GASTOS de CUENTA <%= Request.QueryString("NumeroCuenta") %>
    </h2>
    
    <br />
    <div class= "sedes_container">
        <div class = "titulo_filtro_desglose">
            Filtro por Sedes
        </div>
        <input type="checkbox" onclick="marcarSedes(this)"/>Marcar Todo
        <!--<asp:Button ID="boton_sede" runat="server" Height="21px" 
            Text="Desmarcar todo" CssClass="boton_marcar" />-->
        <div class="div_sedes">
            <asp:CheckBoxList ID="lista_sedes" runat="server" 
                DataTextField="Name" DataValueField="SEDE">
            </asp:CheckBoxList>      
        </div>
    </div>
    <div class="areas_container">
        <div class="titulo_filtro_desglose">
            Filtro por &Aacute;reas
        </div>
        <input type="checkbox" onclick="marcarAreas(this)"/>Marcar Todo
        <!--<asp:Button ID="boton_area" runat="server" Height="21px" 
            Text="Desmarcar todo" CssClass="boton_marcar" />-->
        <div class="div_areas">
            <asp:CheckBoxList ID="lista_areas" runat="server"
                DataTextField="Name" DataValueField="AREA" RepeatColumns="2" 
                RepeatDirection="Horizontal" RepeatLayout="Table">
            </asp:CheckBoxList>
        </div>
    </div>
    <div class="clear_both"></div>
    <br />
    <asp:Button ID="desglose_aplicarfiltros" runat="server" Text="Aplicar filtros" />
    <p>
        <asp:GridView ID="globalGrid" runat="server"
            BorderColor="Black" BorderWidth="1px" PageSize="30" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False">
                        
            <Columns>
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha_orden">
                <HeaderStyle HorizontalAlign="Center" CssClass="td_tabla" />
                <ItemStyle HorizontalAlign="Center" Width="80px" CssClass="td_tabla" />
                </asp:BoundField>
                <asp:BoundField DataField="Documento" HeaderText="Documento" 
                    SortExpression="Documento" >
                <HeaderStyle HorizontalAlign="Center" Width="110px" CssClass="td_tabla" />
                <ItemStyle HorizontalAlign="Center" CssClass="td_tabla" />
                </asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripción">
                <HeaderStyle CssClass="td_tabla" />
                <ItemStyle HorizontalAlign="Left" Width="320px" CssClass="td_tabla" />
                </asp:BoundField>
                <asp:BoundField DataField="Importe" HeaderText="Importe" 
                    SortExpression="Importe" DataFormatString="{0:N0}">
                <HeaderStyle CssClass="td_tabla" />
                <ItemStyle Width="115px" HorizontalAlign="Right" CssClass="td_tabla" />
                </asp:BoundField>
                <asp:BoundField DataField="AREA" HeaderText="Área" SortExpression="AREA">
                <HeaderStyle CssClass="td_tabla" />
                <ItemStyle Width="100px" CssClass="td_tabla" />
                </asp:BoundField>
                <asp:BoundField DataField="SEDE" HeaderText="Sede" SortExpression="SEDE">
                <HeaderStyle CssClass="td_tabla" />
                <ItemStyle Width="90px" CssClass="td_tabla" />
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

    <asp:SqlDataSource ID="CheckFill_AreaMes" runat="server" ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>" 
        SelectCommand="SELECT DISTINCT AREA, Name FROM dbo.V_SEK_DesgloseGastos INNER JOIN dbo.V_SEK_DimensionArea ON dbo.V_SEK_DesgloseGastos.AREA = dbo.V_SEK_DimensionArea.Code where NumeroCuenta = @cuenta and MONTH(Fecha) = @mes">
        <SelectParameters>
            <asp:QueryStringParameter Name="cuenta" QueryStringField="NumeroCuenta" Type="String" />
            <asp:QueryStringParameter Name="mes" QueryStringField="mes" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CheckFill_Area" runat="server" ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>" 
        SelectCommand="SELECT DISTINCT AREA, Name FROM dbo.V_SEK_DesgloseGastos INNER JOIN dbo.V_SEK_DimensionArea ON dbo.V_SEK_DesgloseGastos.AREA = dbo.V_SEK_DimensionArea.Code where NumeroCuenta = @cuenta">
        <SelectParameters>
            <asp:QueryStringParameter Name="cuenta" QueryStringField="NumeroCuenta" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:sqldatasource id="uchile_conmes" runat="server" 
        connectionstring="<%$ connectionstrings:uchileconnectionstring %>">
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
    <asp:SqlDataSource ID="CheckFill_Sede" runat="server" ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>" 
            SelectCommand="SELECT DISTINCT SEDE, Name FROM dbo.V_SEK_DesgloseGastos INNER JOIN dbo.V_SEK_DimensionSede ON dbo.V_SEK_DesgloseGastos.SEDE = dbo.V_SEK_DimensionSede.Code where NumeroCuenta = @cuenta">
            <SelectParameters>
                <asp:QueryStringParameter Name="cuenta" QueryStringField="NumeroCuenta" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CheckFill_SedeMes" runat="server" ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>" 
            SelectCommand="SELECT DISTINCT SEDE, Name FROM dbo.V_SEK_DesgloseGastos INNER JOIN dbo.V_SEK_DimensionSede ON dbo.V_SEK_DesgloseGastos.SEDE = dbo.V_SEK_DimensionSede.Code where NumeroCuenta = @cuenta and MONTH(Fecha) = @mes">
            <SelectParameters>
                <asp:QueryStringParameter Name="cuenta" QueryStringField="NumeroCuenta" Type="String" />
                <asp:QueryStringParameter Name="mes" QueryStringField="mes" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CuentaInfo" runat="server" ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>" 
            SelectCommand="SELECT TOP 1 Descripcion FROM dbo.V_SEK_DesgloseGastos where NumeroCuenta = @cuenta">
            <SelectParameters>
                <asp:QueryStringParameter Name="cuenta" QueryStringField="NumeroCuenta" Type="String" />
            </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>



