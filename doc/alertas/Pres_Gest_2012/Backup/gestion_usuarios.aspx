<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="gestion_usuarios.aspx.vb" Inherits="SistemaPresupuestos.gestion_usuarios" MasterPageFile="~/Site.Master"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:GridView ID="grilla_usuarios" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="origen_usuarios">
        <Columns>
            <asp:BoundField DataField="username" HeaderText="Usuario" 
                SortExpression="username" HeaderStyle-CssClass="celda_users" ItemStyle-CssClass="celda_users"/>
            <asp:BoundField DataField="password" HeaderText="Clave" 
                SortExpression="password" HeaderStyle-CssClass="celda_users" ItemStyle-CssClass="celda_users"/>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" Visible="False" HeaderStyle-CssClass="celda_users" ItemStyle-CssClass="celda_users"/>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="origen_usuarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>" 
        DeleteCommand="DELETE FROM SEK_Presupuestos_Users WHERE id=@id" 
        InsertCommand="INSERT INTO SEK_Presupuestos_Users (username, password, is_admin) VALUES (@username, @password, 0)" 
        SelectCommand="SELECT username, password, id FROM SEK_Presupuestos_Users" 
        UpdateCommand="UPDATE SEK_Presupuestos_Users SET username=@username, password=@password WHERE id=@id">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="username" />
            <asp:Parameter Name="password" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" />
            <asp:Parameter Name="password" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br /><br />
       <asp:FormView ID="agregar_user" runat="server" DataKeyNames="id" DataSourceID="agregar_user_source">
       <InsertItemTemplate>
            <table>
                <tr>
                    <td class="celda_users">
                        Nombre de usuario:
                    </td>
                    <td class="celda_users">
                        <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="celda_users">
                        Contraseña:
                    </td>
                    <td class="celda_users">
                        <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
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

    <asp:SqlDataSource ID="agregar_user_source" runat="server" 
        ConnectionString="<%$ ConnectionStrings:UCHILEConnectionString %>" 
        InsertCommand="INSERT INTO SEK_Presupuestos_Users(username, password, is_admin) VALUES (@username,@password,0)" 
        SelectCommand="Select * from SEK_Presupuestos_Users">
        <InsertParameters>
            <asp:Parameter Name="username" />
            <asp:Parameter Name="password" />
        </InsertParameters>
    </asp:SqlDataSource>

    <br /><br /><asp:HyperLink ID="enlace" runat="server" NavigateUrl="~/Index.aspx">Volver</asp:HyperLink>

</asp:Content>
