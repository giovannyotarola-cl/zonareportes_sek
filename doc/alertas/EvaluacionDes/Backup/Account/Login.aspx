<%@ Page Title="Iniciar sesión" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Login.aspx.vb" Inherits="SistemaEvaluacion.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Iniciar sesión
    </h2>
    <p>
        Especifique su nombre de usuario y contraseña.
    </p>
    <asp:Login ID="LoginUser" runat="server" OnAuthenticate="Login1_Authenticate" PasswordLabelText="Contraseña" UserNameLabelText="Usuario" TitleText="Introduzca sus datos de login">
    </asp:Login>

  

</asp:Content>