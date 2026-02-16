<%@ Page Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="RevisionArchivos2.aspx.cs" Inherits="AutoPostulacion.RevisionArchivos2" %>

<asp:Content ID="RevisionArchivo2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-1.11.2.js"></script>
    <script src="Scripts/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Content/jquery.dataTables.min.css" />
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Content/jquery.dataTables.min.css"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                url: '../WS/wsRegistroContrato.asmx/GetRegistros',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    var arr;
                    arr = JSON.stringify(data);
                    alert(arr);
                    
                }
            });
        });
    </script>
    <div class="titulo text-center">
        <h1 style="background-color: #FFFFFF; color: #2E89B6;">Revisión de Archivos Enviados</h1>
    </div>
    <div class="row">

    </div>
    <div class="row">
        <div id="example_filter" class="dataTables_filter">
            <label>
                Search:
	<input type="search" class="" placeholder="" aria-controls="example">
            </label>
        </div>
    </div>
    <div class="fw-body">
        <div class="container-content">
            <table id="tabla_registros" runat="server" class="table table-striped table-bordered" style="width: 100%" visible="true">
                <thead>
                    <tr>
                        <th>Rutee</th>
                        <th>Apellido Paterno</th>
                        <th>Apellido Materno</th>
                        <th>Nombres</th>
                        <th>Carrera</th>
                        <th>Nivel</th>
                        <th>Categoría</th>
                        <th>Localidad</th>
                        <th>Mail</th>
                        <th>Documentación</th>
                        <th>Jornada</th>
                        <th>Arancel Real</th>
                        <th>Arancel Documentado</th>
                        <th>Matriculado</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tfoot>
                    <tr>
                        <th>Rut</th>
                        <th>Apellido Paterno</th>
                        <th>Apellido Materno</th>
                        <th>Nombres</th>
                        <th>Carrera</th>
                        <th>Nivel</th>
                        <th>Categoría</th>
                        <th>Localidad</th>
                        <th>Mail</th>
                        <th>Documentación</th>
                        <th>Jornada</th>
                        <th>Arancel Real</th>
                        <th>Arancel Documentado</th>
                        <th>Matriculado</th>
                        <th>Estado</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</asp:Content>