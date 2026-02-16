<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="Dashboard" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="server">
    <nav class="navbar navbar-default">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Zona Reportes</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <asp:Panel runat="server" ID="MenuTop" CssClass="collapse navbar-collapse">

            </asp:Panel>
        </div><!-- /.container-fluid -->
    </nav>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb default square rsaquo xs">
	        	<li><a href="Dashboard.aspx"><i class="fa fa-home"></i></a></li>
                <asp:Literal ID="literalLi" runat="server"></asp:Literal>
	        </ol>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong><i class="fa fa-line-chart" aria-hidden="true"></i> Reportes Disponibles</strong>
                </div>
                <asp:Panel runat="server" ID="listaReportes" CssClass="panel-body clearfix">

                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>

