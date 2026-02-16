<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ResultadoReporte.aspx.cs" Inherits="ResultadoReporte" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="./Default.aspx">Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Resultado</a></li>
            </ol>
        </nav>
        <div class="col-md-6 table-responsive">
            <table class="table dataTable table-hover table-striped">
                <tbody>
                    <tr>
                        <td>Carrera: </td>
                        <td><label id="lb_codcarr" runat="server"></label></td>
                    </tr>
                    <tr>
                        <td>Sede: </td>
                        <td><label id="lb_sede" runat="server"></label></td>
                    </tr>
                    <tr>
                        <td>Facultad: </td>
                        <td><label id="lb_facultad" runat="server"></label></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table-responsive">
            <div id="tbl_reporte" class="table" runat="server">


            </div>
        </div>
    </div>
</asp:Content>

