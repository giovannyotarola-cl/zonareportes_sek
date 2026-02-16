<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="confirmarEvaluacion.aspx.vb" Inherits="SistemaEvaluacion.confirmarEvaluacion" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="confirmar_titulo">
        ¿Desea dejar algún comentario?
    </div>
    <div>
        <asp:TextBox ID="comentario_usuario" runat="server" CssClass="confirmar_textarea" TextMode="MultiLine" Placeholder="Inserte aqu&iacute; sus comentarios sobre la encuesta recibida"></asp:TextBox>
    </div>
    <div> 
        <asp:Button ID="Button1" runat="server" Text="Enviar comentario y confirmar rechazo de la encuesta" CssClass="btnInputNuevo" />
    </div><br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/evaluacion/seleccionarEvaluado.aspx">Volver sin confirmar</asp:HyperLink>

</asp:Content>
