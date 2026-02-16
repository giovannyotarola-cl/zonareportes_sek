<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="gestion_usuarios.aspx.vb" Inherits="SistemaEvaluacion.gestion_usuarios" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="evaluar_titulo">
        Usuarios del sistema
    </div>
    <asp:GridView ID="grilla_usuarios" runat="server" 
        DataSourceID="perfiles_usuarios" AutoGenerateColumns="False" DataKeyNames="id">
        <Columns>
            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id" 
                Visible="False" HeaderStyle-CssClass="td_sel_ev" ItemStyle-CssClass="td_sel_ev">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Usuario" SortExpression="username" HeaderStyle-Width="120px" ControlStyle-Width="120px"  HeaderStyle-CssClass="td_sel_ev" ItemStyle-CssClass="td_sel_ev">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                </EditItemTemplate>
            <ControlStyle Width="80px"></ControlStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Clave" SortExpression="password" ControlStyle-Width="120px" HeaderStyle-CssClass="td_sel_ev" ItemStyle-CssClass="td_sel_ev">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                </EditItemTemplate>
                <ControlStyle Width="80px"></ControlStyle>
            </asp:TemplateField>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre">
                <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle CssClass="td_sel_ev" />
            </asp:BoundField>
            <asp:BoundField DataField="apellidos" HeaderText="Apellidos" 
                SortExpression="apellidos" >
                <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle CssClass="td_sel_ev" />
            </asp:BoundField>
            <asp:BoundField DataField="cargo" HeaderText="Cargo" 
                SortExpression="cargo" >
                <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle CssClass="td_sel_ev" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Nivel" SortExpression="nivel"  HeaderStyle-CssClass="td_sel_ev" ItemStyle-CssClass="td_sel_ev">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("nivel") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:DropDownList runat="server" ID="nivelDropDown" SelectedValue='<%# Bind("nivel") %>'>
                            <asp:ListItem Text="1" Value="1">
                            </asp:ListItem>
                            <asp:ListItem Text="2" Value="2">
                            </asp:ListItem>
                            <asp:ListItem Text="3" Value="3">
                            </asp:ListItem>
                        </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True">    
                <HeaderStyle CssClass="td_sel_ev" />
                <ItemStyle CssClass="td_sel_ev" />
            </asp:CommandField>
        </Columns>      
    </asp:GridView>

    <asp:SqlDataSource ID="perfiles_usuarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>" 
        DeleteCommand="DELETE FROM dbo.Evaluacion_Users Where id = @id" 
        SelectCommand="Select * from dbo.Evaluacion_Users"
        UpdateCommand="UPDATE dbo.Evaluacion_Users Set username=@username, password=@password, nombre=@nombre, apellidos=@apellidos, cargo=@cargo, nivel=@nivel where id = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" />
            <asp:Parameter Name="password" />
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="apellidos" />
            <asp:Parameter Name="cargo" />
            <asp:Parameter Name="id" />
            <asp:Parameter Name="nivel" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="InsertarUsuario_source">
       <InsertItemTemplate>
            <table>
                <tr>
                    <td>
                        Nombre de usuario:
                    </td>
                    <td>
                        <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Contraseña:
                    </td>
                    <td>
                        <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Nombre:
                    </td>
                    <td>
                        <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Apellidos:
                    </td>
                    <td>
                        <asp:TextBox ID="apellidosTextBox" runat="server" Text='<%# Bind("apellidos") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Cargo:
                    </td>
                    <td>
                        <asp:TextBox ID="cargoTextBox" runat="server" Text='<%# Bind("cargo") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        Nivel:
                    </td>
                    <td>
                        <asp:DropDownList runat="server" ID="nivelDropDown" SelectedValue='<%# Bind("nivel") %>'>
                            <asp:ListItem Text="1" Value="1">
                            </asp:ListItem>
                            <asp:ListItem Text="2" Value="2">
                            </asp:ListItem>
                            <asp:ListItem Text="3" Value="3">
                            </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
           <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
         <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Insertar usuario" CssClass="insertar_usuario" />
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="InsertarUsuario_source" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>" 
        InsertCommand="INSERT INTO dbo.Evaluacion_Users(username, password, nombre, apellidos, cargo, nivel, is_admin) VALUES (@username,@password,@nombre,@apellidos,@cargo,@nivel, 0)" 
        SelectCommand="Select * from dbo.Evaluacion_Users">
        <InsertParameters>
            <asp:Parameter Name="username" />
            <asp:Parameter Name="password" />
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="apellidos" />
            <asp:Parameter Name="cargo" />
            <asp:Parameter Name="nivel" />
        </InsertParameters>
    </asp:SqlDataSource>

    <br /><br /><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>

</asp:Content>
