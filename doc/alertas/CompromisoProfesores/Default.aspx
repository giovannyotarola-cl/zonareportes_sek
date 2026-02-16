<%@ Page Title="Porcentajes Aprobación - Reprobación" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="container content">
        <!-- Example row of columns -->
        <div class="col-4">
            <div class="form-area"> 
                <form id="frmfiltros" action="ResultadoReporte.aspx" method="post">
                    <h4>Filtros Disponibles</h4>
                    <hr />
                    <div class="form-group">
                        <div class="input-group input-group-sm mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroup-sizing-sm">Facultad</span>
                            </div>
                            <select runat="server" id="lb_facultad" name="lb_facultad" class="form-control form-control-sm"></select>
                        </div>
					</div>
                    <div class="form-group">
                        <div class="input-group input-group-sm mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="span-carrera">Carrera</span>
                            </div>
                            <select runat="server" id="lb_carrera" name="lb_carrera" class="form-control form-control-sm"></select>
                            <small class="c_loading"></small>
                        </div>
					</div>
                    <div class="form-group col-12 p-0">
                        <div class="input-group col-6 input-group-sm mb-3 p-0">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="Span3">Año</span>
                            </div>
                            <select runat="server" id="lb_anio" name="lb_facultad" class="form-control form-control-sm">
                                <option value=""></option>                                
                                <option value="2018">2018</option>
								<option value="2019">2019</option>
                            </select>
                        </div>
                        <div class="input-group col-6 input-group-sm mb-3 p-0">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="Span4">Periodo</span>
                            </div>
                            <select runat="server" id="lb_periodo" name="lb_facultad" class="form-control form-control-sm">
                                <option value=""></option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                            </select>
                        </div>
					</div>
                    <!--<div class="form-group">
                        <div class="input-group input-group-sm mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="Span1">Sección</span>
                            </div>
                            <select id="lb_seccion" name="lb_seccion" class="form-control form-control-sm">
                                <option value=""></option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                            <small class="c_loading"></small>
                        </div>
					</div>-->
                    <hr />
    				<div class="form-group">
                        <select runat="server" id="lb_asignatura" name="lb_asignatura" class="form-control form-control-sm" visible="false">
                        </select>
					</div>
                <button type="submit" id="btn-filtros" name="submit" class="btn btn-primary pull-right btn-sm">Enviar Formulario</button>
                </form>
            </div>
        </div>
    </div> <!-- /container -->
    <div class="clearfix"></div>
</asp:Content>