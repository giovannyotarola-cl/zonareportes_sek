<%@ Page Title="Página principal" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="SistemaPresupuestos._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
      <script type="text/javascript" src="<%= ResolveUrl("~/Scripts/checkdate.js") %>"></script>
      <%  
         If (Session("username") = "y_feal") OR (Session("username") = "a_lillo") Then
      %>
         <div class = "div_fecha">
             <div>
                <b>Editar fecha límite</b><br />
                <small>Mantener formato dd-mm-yy</small>
             </div><br />
             <asp:GridView ID="grilla_fecha_tope" runat="server" AutoGenerateColumns="False" 
                 DataSourceID="dataSource_fechatope">
                 <Columns>
                     <asp:TemplateField HeaderText="Fecha Tope" SortExpression="fecha_tope">
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha_tope") %>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fecha_tope") %>' Width="50px" Font-Size="12px"></asp:TextBox>
                         </EditItemTemplate>
                         <ItemStyle HorizontalAlign="Center"/>
                     </asp:TemplateField>
                     <asp:CommandField ShowEditButton="True" ShowCancelButton="False" ControlStyle-CssClass="confirmar_fecha_link"/>
                 </Columns>
             </asp:GridView>
         
             <br />
             <asp:CheckBox ID="usar_fecha_tope" runat="server" Text="Utilizar fecha tope" />
             <br />
         
             <asp:SqlDataSource ID="dataSource_fechatope" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>" 
                 SelectCommand="SELECT TOP 1 convert(varchar, fecha_tope, 5) as fecha_tope from dbo.SEK_Presupuestos_Parametros" 
                 UpdateCommand="UPDATE dbo.SEK_Presupuestos_Parametros SET fecha_tope=@fecha_tope">
                 <UpdateParameters>
                    <asp:Parameter Name="fecha_tope" />
                 </UpdateParameters>
             </asp:SqlDataSource>
         
         </div>    
      <%  
         End If
     %>

    <h2>
       <%-- Presupuestos 2015--%>
        <asp:Label ID="lblPresupuestos" runat="server" Text="Presupuestos 2017"></asp:Label>
    </h2>
    <br />
    
    <div class = "sedes_container">
        <div class = "titulo_filtro_desglose">
            Filtro por Sedes
        </div>    
        <asp:Button ID="boton_sede" runat="server" Height="21px" 
            Text="Desmarcar todo" PostBackUrl="Default.aspx" CssClass="boton_marcar" />
        <div class = "div_sedes">
            <asp:CheckBoxList ID="listado_sedes" runat="server" DataTextField="Name" 
                DataValueField="SEDE" 
                RepeatLayout="Table">
            </asp:CheckBoxList>
        </div>  
    </div>
    <div class = "areas_container">
         <div class="titulo_filtro_desglose">
            Filtro por &Aacute;reas
        </div> 
        <asp:Button ID="boton_area" runat="server" Height="21px" 
            Text="Desmarcar todo" PostBackUrl="Default.aspx" CssClass="boton_marcar" />
        <div class = "div_areas">
            <asp:CheckBoxList ID="listado_areas" runat="server" DataTextField="Name" 
                DataValueField="AREA" BorderStyle="None" 
                RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Table">
            </asp:CheckBoxList>
        </div>
   </div>
   <div class="clear_both"></div>
   <asp:Button ID="aplicar_filtros" runat="server" Text="Aplicar filtros" />
    <p>
        <asp:GridView ID="globalGrid" runat="server" DataSourceID="UCHILE" 
            BorderColor="Black" BorderWidth="1px" PageSize="30" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False">
                        
            <Columns>
                <asp:BoundField DataField="NumeroCuenta" HeaderText="Cuenta" 
                    SortExpression="NumeroCuenta" >
                <HeaderStyle HorizontalAlign="Center" CssClass="td_tabla" Width="50px" />
                <ItemStyle HorizontalAlign="Center" CssClass="td_tabla" />
                </asp:BoundField>
                <asp:BoundField DataField="Cuenta" HeaderText="Desc. Cuenta" SortExpression="Cuenta">
                <HeaderStyle CssClass="td_tabla" Width="80px" />
                <ItemStyle CssClass="td_tabla"/>
                </asp:BoundField>
                 <asp:TemplateField HeaderText="Presupuesto" SortExpression="Presupuestado">
                     <ItemTemplate>
                         <asp:HyperLink ID="HyperLink1" runat="server" 
                             NavigateUrl='<%# Eval("NumeroCuenta", "desglosePr.aspx?NumeroCuenta={0}") %>' 
                             Target="_blank" Text='<%# FormatNumber(Cint(Eval("Presupuestado")/1000), 0) %>'></asp:HyperLink>
                     </ItemTemplate>
                     <HeaderStyle BackColor="#DADADA" CssClass="td_tabla" />
                     <ItemStyle BackColor="#DADADA" CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Aplicado" SortExpression="Gastado">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle BackColor="#DADADA" CssClass="td_tabla" />
                    <ItemStyle BackColor="#DADADA" CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Diferencia">
                    <ItemTemplate>
                        <%# IIf(Left(Eval("NumeroCuenta"), 1) = 6, FormatNumber(Eval("Presupuestado")/1000 - Eval("Gastado")/1000, 0), FormatNumber(-1 * (Eval("Presupuestado")/1000 - Eval("Gastado")/1000), 0))%>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_diferencia" />
                    <ItemStyle HorizontalAlign="Right" CssClass="td_diferencia" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="%">
                    <ItemTemplate>
                        <%# CStr(IIf(Eval("Presupuestado") = 0, " - ", (FormatNumber((Eval("Gastado") * 100) / IIf(Eval("Presupuestado") = 0, 1, Eval("Presupuestado")), 1)))) + " %"%>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_diferencia" Width="40px"/>
                    <ItemStyle HorizontalAlign="Right" CssClass="td_diferencia" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Enero">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink3" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=1") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Enero")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Febrero">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink4" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=2") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Febrero")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Marzo">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink5" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=3") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Marzo")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Abril">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink6" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=4") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Abril")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mayo">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink7" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=5") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Mayo")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Junio">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink8" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=6") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Junio")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Julio">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink9" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=7") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Julio")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Agosto">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink10" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=8") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Agosto")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sept.">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink11" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=9") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Septiembre")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Oct.">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink12" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=10") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Octubre")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nov.">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink13" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=11") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Noviembre")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Dic.">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink14" runat="server" 
                            NavigateUrl='<%# Eval("NumeroCuenta", "desglose.aspx?NumeroCuenta={0}&mes=12") %>' 
                            Target="_blank" Text='<%# FormatNumber(Cint(Eval("Gastado_Diciembre")/1000), 0) %>'></asp:HyperLink>
                    </ItemTemplate>
                    <HeaderStyle CssClass="td_tabla" />
                    <ItemStyle CssClass="td_tabla" HorizontalAlign="Right" />
                </asp:TemplateField>
                
            </Columns>
                        
            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" 
                Font-Strikeout="False" Font-Underline="False" ForeColor="Black" 
                HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />             
            <PagerSettings Position="TopAndBottom" />
        </asp:GridView>
    </p>
     <div class = "aclaracion">
        *Todos los importes están expresados en miles de pesos chilenos
     </div>

         <asp:SqlDataSource ID="UCHILE" runat="server" 
            ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>">
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="Global_Sede" runat="server" ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="Global_Area" runat="server" ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>">
        </asp:SqlDataSource>
</asp:Content>
