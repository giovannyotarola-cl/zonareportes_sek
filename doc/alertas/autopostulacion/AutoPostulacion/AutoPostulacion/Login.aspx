<%@ Page Title="Principal" Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AutoPostulacion._Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo text-center">
        <h1 style="color: #2E89B6">Ingreso de Usuario</h1>
    </div>
<script src="Scripts/Funciones.js?ver=1.9.1"></script>

<%--USUARIO INICIO--%>
<asp:Panel runat="server" ID="pnl_Seguimiento" ClientIDMode="Static">
  <div class="row">
     <div class="col-xs-6">
            <asp:Label runat="server" ID="lbl_usuario" Text="Usuario"></asp:Label>
     </div>
  </div>
  
    <div class="row">
         <div class="col-xs-6">
              <asp:TextBox runat="server" ID="txt_usuario" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
         </div>
    </div>
<%--USUARIO TERMINO--%>


<%--USUARIO PASSWORD INICIO--%>
    <div class="row">
     <div class="col-xs-6">
            <asp:Label runat="server" ID="Label2" Text="Password" ></asp:Label>
     </div>
  </div>
  
    <div class="row">
         <div class="col-xs-6">
              <asp:TextBox runat="server" ID="Txt_password" ClientIDMode="Static" CssClass="form-control" TYPE="password" ></asp:TextBox>
         </div>
    </div>

<%--USUARIO PASSWORD TERMINO--%>



<%--BOTON BUSCAR INICIO--%>
<div class="modal-footer">
     <asp:Button ID="btn_buscar" runat="server" Text="Ingresar" CssClass="btn btn-xs btn-success" OnClick="btn_buscar_Click" />
</div>
<%--BOTON BUSCAR TERMINO--%>

</asp:Panel>

</asp:Content>