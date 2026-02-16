<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Admin_Login" %>

<asp:Content ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent" Runat="Server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h2>Ingreso</h2>
            </hgroup>
            <p>
                Para acceder a la plataforma de reportes, ingrese en el siguiente formulario sus datos de acceso. 
                En el apartado usuario ingrese su Rut sin puntos ni guion, ingrese su contraseña y presione el botón ingresar. 
            </p>
            <p>
                Si presenta algún inconveniente, o no recuerda sus credenciales de acceso, por favor comuníquese con el <mark>departamento de soporte
                de la Universidad</mark>.
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong>Formulario de Ingreso</strong>
                </div>
                <div class="panel-body">
                    <div class="col-lg-6 col-sm-12">
                        <div class="form-group">
                            <label for="username">Usuario</label>
                            <asp:TextBox ID="username" runat="server" CssClass="form-control input-xs" placeholder="Usuario" required=""></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="password">Contraseña</label>
                            <asp:TextBox ID="password" runat="server" CssClass="form-control input-xs" placeholder="Contraseña" required="" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="ingresar" CssClass="btn btn-success" runat="server" Text="Ingresar" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

