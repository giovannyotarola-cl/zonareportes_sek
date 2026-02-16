<%@ Page Title="Página principal" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="SistemaEvaluacion._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:LoginView runat="server" ID="Vista_inicio">
        <AnonymousTemplate>
            Debe iniciar sesión para utilizar el sistema.<br />
            Si ha olvidado su nombre de usuario o contraseña, por favor diríjase a la dirección marcos.duque@uisek.cl
        </AnonymousTemplate>
        <LoggedInTemplate>
            <div class = "front_bienv">Bienvenido al Sistema de Evaluación del Desempeño - Universidad SEK Chile.</div>
            <div class = "front_ayuda">Seleccione una acción del menú superior para empezar.</div>
            <ul>
                <li class = "front_lista">
                    <strong>Perfil: </strong>Permite modificar sus datos personales así como cambiar la contraseña.
                </li>
                <li class= "front_lista">
                    <strong>Evaluaciones: </strong>Podrá evaluar a otros miembros del personal o comprobar las evaluaciones recibidas.
                </li>
            </ul>
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>
