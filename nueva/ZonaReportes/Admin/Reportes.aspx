<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Reportes.aspx.vb" Inherits="Admin_Reportes" %>

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
        </div><!-- /.container-fluid -->
    </nav>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb default square rsaquo xs">
	        	<li><a href="Dashboard.aspx"><i class="fa fa-home"></i></a></li>
                <li><a href="Dashboard.aspx">Dashboard</a></li>
                <li><a href="#">Reportes</a></li>
	        </ol>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong><i class="fa fa-user" aria-hidden="true"></i> Nuevo Reporte</strong>
                    <input type="hidden" id="formtype" value="reportform" />
                </div>
                <div class="panel-body clearfix">
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="NombRep" class="col-xs-3 col-form-label">Nombres</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" id="NombRep" placeholder="Nombres del reporte" required />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="ProyRep" class="col-xs-3 col-form-label">Proyecto</label>
                            <div class="col-xs-9">
                                <input type="email" class="form-control" id="ProyRep" placeholder="Directorio/NombreProyecto/" required />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="DeptoUsr" class="col-xs-3 col-form-label">Departamento</label>
                            <div class="col-xs-9">
                                <select id="DeptoUsr" class="form-control" required>
                                    <option value="">-- Seleccione --</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group row">
                            <label for="DescRep" class="col-xs-3 col-form-label">Descripción</label>
                            <div class="col-xs-9">
                                <textarea id="DescRep" class="form-control" placeholder="Descripción del reporte" required rows="5"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="form-group row text-right">
                            <input type="reset" value="Limpiar" class="btn btn-danger btn-sm" />
                            <button type="submit" id="GrabaReporte" class="btn btn-success btn-sm">Crear Reporte</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <strong><i class="fa fa-user" aria-hidden="true"></i> Lista Reportes</strong>
                </div>
                <div class="panel-body clearfix">
                    <div class="table-responsive">
                        <asp:Table ID="Tbl_reportes" runat="server" CssClass="table"></asp:Table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modalbox"><!-- Place at bottom of page --><div class="textbox">Espere un momento...</div></div>
</asp:Content>

