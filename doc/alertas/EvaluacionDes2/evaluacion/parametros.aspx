<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="parametros.aspx.vb" Inherits="SistemaEvaluacion.parametros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="evaluar_titulo">
        Modificar Parametros del sistema
    </div>
    <asp:GridView ID="grilla_parametros" runat="server" 
        DataSourceID="source_parametros" AutoGenerateColumns="False" DataKeyNames="id" CssClass="tablaNueva tableFullWidth">
        <Columns>
            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" 
                Visible="False">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Año" SortExpression="ano">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ano")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ano") %>'></asp:TextBox>
                </EditItemTemplate>
            <ControlStyle></ControlStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Semestre" SortExpression="semestre">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("semestre")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:DropDownList runat="server" ID="ddlSemestre" SelectedValue='<%# Bind("semestre")%>'>
                            <asp:ListItem Text="1" Value="1">
                            </asp:ListItem>
                            <asp:ListItem Text="2" Value="2">
                            </asp:ListItem>
                        </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Habilitado" SortExpression="habilitado">
                <ItemTemplate>
                    <asp:DropDownList runat="server" ID="ddlHabilitadoVer" Enabled="false" SelectedValue='<%# Bind("habilitado")%>'>
                        <asp:ListItem Text="NO" Value="0">
                        </asp:ListItem>
                        <asp:ListItem Text="SI" Value="1">
                        </asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:DropDownList runat="server" ID="ddlHabilitado" SelectedValue='<%# Bind("habilitado")%>'>
                        <asp:ListItem Text="NO" Value="0">
                        </asp:ListItem>
                        <asp:ListItem Text="SI" Value="1">
                        </asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Habilitar Recepcion" SortExpression="habilitarRecepcion">
                <ItemTemplate>
                    <asp:DropDownList runat="server" ID="ddlHabilitarRecepcionVer" Enabled="false" SelectedValue='<%# Bind("habilitarRecepcion")%>'>
                        <asp:ListItem Text="NO" Value="0">
                        </asp:ListItem>
                        <asp:ListItem Text="SI" Value="1">
                        </asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:DropDownList runat="server" ID="ddlHabilitarRecepcion" SelectedValue='<%# Bind("habilitarRecepcion")%>'>
                        <asp:ListItem Text="NO" Value="0">
                        </asp:ListItem>
                        <asp:ListItem Text="SI" Value="1">
                        </asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="false">
            </asp:CommandField>
        </Columns>      
    </asp:GridView>
    <asp:Button ID="btnAlertaRealizar" runat="server" Text="Notificar Realizar Evaluación" CssClass="btnInputNuevo " />
    <asp:Button ID="btnAlertaRecibir" runat="server" Text="Notificar Comprobación Evaluación" CssClass="btnInputNuevo " />
    <br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>
    <asp:SqlDataSource ID="source_parametros" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>">
        <UpdateParameters>
            <asp:Parameter Name="id" />
            <asp:Parameter Name="ano" />
            <asp:Parameter Name="semestre" />
            <asp:Parameter Name="habilitado" />
            <asp:Parameter Name="habilitarRecepcion" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
