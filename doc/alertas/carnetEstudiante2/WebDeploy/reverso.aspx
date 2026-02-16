<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="reverso.aspx.vb" Inherits="CarnetEstudiante_Chile.reverso" MasterPageFile="~/Carnet.Master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="Main_Carnet">
    <div class = "div_reverso">
        <div class = "texto_sede">
            <b>CAMPUS PROVIDENCIA</b><br />
            <b>Fernando Manterola 0789, Metro Salvador - Providencia<br />
            Tlf: (56-2) 2483 7300, Fax: (56-2) 2483 7326</b>
        </div>
        <div class = "text_univ">
            <b>UNIVERSIDAD INTERNACIONAL SEK</b>
        </div>
        <div class = "logo_div">
            <img src="img/logo.jpg" alt="logo" border="0" 
                style="height: 85px; width: 73px" />
        </div>
        <div class = "texto_aviso">
            <b>Este carnet es personal e intransferible, en caso de pérdida comunicarse con cualquiera de nuestros Campus.</b>
        </div>
        <img src="img/reverso.png" border="0" />
    </div>
</asp:Content>