<%@ Page Title="Iniciar sesión" Language="vb" MasterPageFile="~/LoginSite.Master" AutoEventWireup="false"
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
    <asp:Login ID="LoginUser" runat="server" OnAuthenticate="Login1_Authenticate" PasswordLabelText="Contraseña" UserNameLabelText="Usuario" TitleText="Introduzca sus datos de login" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="12px" ForeColor="#333333" Height="173px" Width="373px">
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284775" />
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    </asp:Login>

  

</asp:Content>