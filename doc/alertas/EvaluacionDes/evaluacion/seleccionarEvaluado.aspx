<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="seleccionarEvaluado.aspx.vb" Inherits="SistemaEvaluacion.seleccionarEvaluado" MasterPageFile="~/Site.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class = "evaluar_title">
        Empleados por evaluar
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="personal_por_evaluar" EmptyDataText= "No hay empleados por evaluar" CssClass="tabla_sel_ev">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Id" Visible="False" />
            <asp:TemplateField HeaderText="Empleado">
                <ItemTemplate>
                    <%# Eval("nombre") + " " + Eval("apellidos")%>
                </ItemTemplate>
                <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle CssClass="td_sel_ev" />
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="evaluacion_usuarios.aspx?evaluado={0}" 
                HeaderText="Acciones" Text="Evaluar" >
            <HeaderStyle CssClass="td_sel_ev" />
            <ItemStyle CssClass="td_sel_ev" />
            </asp:HyperLinkField>
        </Columns>
    </asp:GridView>

    <br />

    <div class = "evaluar_title">
        Evaluaciones realizadas
        <asp:DropDownList ID="ddlPeriodos_EvReal" runat="server" AutoPostBack="True" 
            DataSourceID="sqlPeriodos" DataTextField="Periodo" DataValueField="Periodo"></asp:DropDownList>
    </div>
    <asp:GridView ID="grilla_evaluados" runat="server" AutoGenerateColumns="False" 
        DataSourceID="personal_evaluado" EmptyDataText= "No hay empleados evaluados" BorderColor="Transparent" CssClass="tabla_sel_ev">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Id" Visible="False" />
            <asp:TemplateField HeaderText="Empleado">
                <ItemTemplate>
                    <%# Eval("nombre") + " " + Eval("apellidos")%>
                </ItemTemplate>
                <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle CssClass="td_sel_ev" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Periodo">
                <ItemTemplate>
                    <%# Eval("ano")%>-<%# Eval("semestre")%>
                </ItemTemplate>
                <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle CssClass="td_sel_ev" />
            </asp:TemplateField>
            <asp:BoundField DataField="Aceptada" HeaderText="¿Aceptada?" >
                <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle HorizontalAlign="Center" CssClass="td_sel_ev"/>
            </asp:BoundField>
             <asp:BoundField DataField="comentario_evaluado" HeaderText="Comentarios" >
                 <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle HorizontalAlign="Center" CssClass="td_sel_ev"/>
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="ver_evaluacion.aspx?evaluacion={0}" 
                HeaderText="Acciones" Text="Revisar evaluación" >
            <HeaderStyle CssClass="td_sel_ev" />
            <ItemStyle CssClass="td_sel_ev" />
            </asp:HyperLinkField>
            <asp:TemplateField HeaderText="" Visible="false">
                <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" 
                    CommandArgument='<%# Bind("id")%>'
                    CommandName="Delete" runat="server" OnClientClick="return confirm('¿Seguro que quiere elminiar este registro?')">
                    Eliminar</asp:LinkButton>
                </ItemTemplate>   
                <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle CssClass="td_sel_ev" />                 
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
      <br />
        <div class = "evaluar_title">
            Evaluaciones recibidas
        <asp:DropDownList ID="ddlPeriodos_EvRec" runat="server" AutoPostBack="True" 
            DataSourceID="sqlPeriodos" DataTextField="Periodo" DataValueField="Periodo"></asp:DropDownList>
        </div>
    <asp:GridView ID="grilla_ev_recibidas" runat="server" AutoGenerateColumns="False" 
        DataSourceID="evaluaciones_recibidas" EmptyDataText= "No se han recibido evaluaciones" BorderColor="Transparent" CssClass="tabla_sel_ev">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Id" Visible="False" />
            <asp:TemplateField HeaderText="Evaluador">
                <ItemTemplate>
                    <%# Eval("Evaluador")%>
                </ItemTemplate>
                <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle CssClass="td_sel_ev" />
            </asp:TemplateField>
            <asp:BoundField DataField="Aceptada" HeaderText="¿Aceptada?" >
                 <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle HorizontalAlign="Center" CssClass="td_sel_ev"/>
            </asp:BoundField>
            <asp:BoundField DataField="comentario_evaluado" HeaderText="Comentarios" >
                <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle HorizontalAlign="Center" CssClass="td_sel_ev"/>
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="id" 
                DataNavigateUrlFormatString="ver_evaluacion.aspx?evaluacion={0}" 
                HeaderText="Acciones" Text="Revisar evaluación" >
            <HeaderStyle CssClass="td_sel_ev" />
            <ItemStyle CssClass="td_sel_ev" />
            </asp:HyperLinkField>
        </Columns>
    </asp:GridView>

    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>

        <asp:SqlDataSource ID="sqlPeriodos" runat="server" 
            ConnectionString="<%$ ConnectionStrings:cadenaConexion %>">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="user_id" />
            </SelectParameters>
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="personal_por_evaluar" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>"></asp:SqlDataSource>
    <asp:SqlDataSource ID="personal_evaluado" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>">
        <DeleteParameters>
            <asp:Parameter Name="id_evaluacion" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="evaluaciones_recibidas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>"></asp:SqlDataSource>
</asp:Content>
