<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="camFrame.aspx.vb" Inherits="carnetEstudiante.camFrame" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
        <div class = "foto_title">
            TOMAR FOTOGRAFÍA
        </div>
        <div class = "texto_ayuda">
            Si el sistema solicita el acceso a la cámara del equipo, debe aceptar para poder tomar la foto del alumno.
        </div>
        <div class = "foto_frame">
             <object width="405" height="233">
		    <param name="movie" value="WebcamResources/save_picture.swf">
		    <embed src="WebcamResources/save_picture.swf" width="405" height="233"></embed>
	        </object>
        </div>
        <div class="enlace_carnet">
            Una vez tomada la fotografía, puede visualizar el carnet <a href='mostrarCarnet.aspx?alumno=<%= Session("umas") %>' target="_blank">aquí</a>.
        </div>    
</asp:Content>
  