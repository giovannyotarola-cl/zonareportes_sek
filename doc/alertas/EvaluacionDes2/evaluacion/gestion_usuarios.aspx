<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="gestion_usuarios.aspx.vb" Inherits="SistemaEvaluacion.gestion_usuarios" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="evaluar_titulo">
        Usuarios del sistema
    </div>
    <asp:GridView ID="grilla_usuarios" runat="server" 
        DataSourceID="perfiles_usuarios" AutoGenerateColumns="False" DataKeyNames="id" CssClass="tablaNueva tableFullWidth">
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
            <asp:TemplateField HeaderText="Usuario" SortExpression="username">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                </EditItemTemplate>
            <ControlStyle></ControlStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Clave" SortExpression="password">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                </EditItemTemplate>
                <ControlStyle></ControlStyle>
            </asp:TemplateField>
            <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                SortExpression="nombre">
            </asp:BoundField>
            <asp:BoundField DataField="cargo" HeaderText="Cargo" 
                SortExpression="cargo" >
            </asp:BoundField>
            <asp:TemplateField HeaderText="Nivel" SortExpression="nivel">
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
            <asp:BoundField DataField="correo" HeaderText="Correo" 
                SortExpression="correo" >
            </asp:BoundField>
            <asp:BoundField DataField="rut" HeaderText="Rut" 
                SortExpression="rut" >
            </asp:BoundField>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True">
            </asp:CommandField>
        </Columns>      
    </asp:GridView>

    <asp:SqlDataSource ID="perfiles_usuarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>" 
        DeleteCommand="DELETE FROM dbo.SEK_EvDes_Users Where id = @id" 
        SelectCommand="Select * from dbo.SEK_EvDes_Users"
        UpdateCommand="UPDATE dbo.SEK_EvDes_Users Set username=@username, password=@password, nombre=@nombre, cargo=@cargo, nivel=@nivel,correo=@correo,rut=@rut where id = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" />
            <asp:Parameter Name="password" />
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="cargo" />
            <asp:Parameter Name="id" />
            <asp:Parameter Name="nivel" />
            <asp:Parameter Name="correo" />
            <asp:Parameter Name="rut" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="InsertarUsuario_source" CssClass="formInsert">
       <InsertItemTemplate>
            <div class="subTit">
                <span>Ingreso de usuario</span>
            </div>
            <table class="tblInsertUsuario">
                <tr>
                    <td>
                        <span>Nombre de usuario:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Contraseña:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Nombre:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Cargo:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="cargoTextBox" runat="server" Text='<%# Bind("cargo") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Nivel:</span>
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
                <tr>
                    <td>
                        <span>Correo:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCorreo" runat="server" Text='<%# Bind("correo")%>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>Rut:</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRut" runat="server" Text='<%# Bind("rut") %>' />
                    </td>
                </tr>
            </table>
            <br />
           <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" CssClass="linkBoton" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" CssClass="linkBoton"/>
        </InsertItemTemplate>
        <ItemTemplate>
         <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Insertar usuario" CssClass="insertar_usuario" />
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="InsertarUsuario_source" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cadenaConexion %>" 
        InsertCommand="INSERT INTO dbo.SEK_EvDes_Users(username, password, nombre, cargo, nivel, is_admin,correo,rut) VALUES (@username,@password,@nombre,@cargo,@nivel, 0,@correo,@rut)" 
        SelectCommand="Select * from dbo.SEK_EvDes_Users">
        <InsertParameters>
            <asp:Parameter Name="username" />
            <asp:Parameter Name="password" />
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="cargo" />
            <asp:Parameter Name="nivel" />
            <asp:Parameter Name="correo" />
            <asp:Parameter Name="rut" />
        </InsertParameters>
    </asp:SqlDataSource>

    <br /><br /><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Volver</asp:HyperLink>

</asp:Content>
