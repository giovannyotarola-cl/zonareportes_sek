<%@ Page Title="Porcentajes Aprobación - Reprobación" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="container content">
        <!-- Example row of columns -->
        <div class="col-md-5">
            <div class="form-area"> 
                <form id="frmfiltros" action="ResultadoReporte.aspx" method="post">
                    <h4>Filtros Disponibles</h4>
                    <div class="form-group">
                        <label>Año</label>
						<input id="anioconsultado" type="text" class="form-control" name="anioconsultado" placeholder="Año" required>
					</div>
                    <div class="form-group">
                        <label>Facultad</label>
                        <select runat="server" id="lb_facultad" name="lb_facultad" class="form-control"></select>
					</div>
                    <div class="form-group">
                        <label>Carrera <small class="c_loading"></small></label>
                        <select runat="server" id="lb_carrera" name="lb_carrera" class="form-control"></select>
					</div>
    				<div class="form-group">
                        <label>Asignatura <small class="a_loading"></small></label>
                        <select runat="server" id="lb_asignatura" name="lb_asignatura" class="form-control" visible="false"></select>
					</div>
                <button type="submit" id="btn-filtros" name="submit" class="btn btn-primary pull-right">Enviar Formulario</button>
                </form>
            </div>
        </div>
    </div> <!-- /container -->
    <div class="clearfix"></div>
</asp:Content>