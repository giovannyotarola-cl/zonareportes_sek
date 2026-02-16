<%@ Page Title="Página principal" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="SistemaEvaluacion._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:LoginView runat="server" ID="Vista_inicio">
        <AnonymousTemplate>
            <div style="margin:30px auto">
            <h2>Inicio de sesión requerido</h2>
                <br />
                Debe iniciar sesión para utilizar el sistema.<br />
                Si ha olvidado su nombre de usuario o contraseña, por favor comuníquese con el area de informática.
            </div>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <div class = "front_bienv">Bienvenido al Sistema de Evaluación del Desempeño - Universidad SEK Chile.</div>
            <div class = "front_ayuda">Seleccione una acción del menú superior para empezar.</div>
            <ul>
                <li class = "front_lista"> 
                    <strong>Perfil: </strong>Permite modificar el nombre de usuario, contraseña y correo.
                </li>
                <li class= "front_lista">
                    <strong>Evaluaciones: </strong>Podrá evaluar a otros miembros del personal o comprobar las evaluaciones recibidas.
                </li>
                <asp:LoginView runat="server">
                    <RoleGroups>
                        <asp:RoleGroup Roles="admin">
                            <ContentTemplate>
                                <li class= "front_lista">
                                    <strong>Gestión usuarios: </strong>Permite modificar los perfiles de los usuarios ingresados al sistema.
                                </li>
                                <li class= "front_lista">
                                    <strong>Jerarquías: </strong>Se podrá relacionar a los usuarios de forma jerárquica.
                                </li>
                                <li class= "front_lista">
                                    <strong>Parámetros: </strong>Definir periodos de evaluación y vista de evaluaciones.
                                </li>
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
            </ul>
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>
