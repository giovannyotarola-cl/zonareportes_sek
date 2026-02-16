<%@ Page Title="Iniciar sesión" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.vb" Inherits="Account_Login" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

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
    <asp:Login ID="LoginForm" runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
        <LayoutTemplate>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong><i class="fa fa-wpforms" aria-hidden="true"></i> Formulario de Ingreso</strong>
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-6 col-sm-12">
                                <div class="form-group">
                                    <label for="username"><i class="fa fa-user" aria-hidden="true"></i> Usuario</label>
                                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control input-xs" placeholder="Usuario" required></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="password"><i class="fa fa-unlock" aria-hidden="true"></i> Contraseña</label>
                                    <asp:TextBox ID="Password" runat="server" CssClass="form-control input-xs" placeholder="Contraseña" required TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="login" runat="server" CssClass="btn btn-success" CommandName="Login" Text="Ingresar" />
                                </div>
                                <%--<p>
                                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Registrarse</asp:HyperLink>
                    si no tiene una cuenta.
                                </p>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>
