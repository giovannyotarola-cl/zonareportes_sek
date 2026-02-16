<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="AlumnosSinFirma2.aspx.cs" Inherits="AutoPostulacion.AlumnosSinFirma2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script src="Scripts/plugin.js?ver=0.1.9"></script>

    <link href="Scripts/datatables/css/buttons.dataTables.css" rel="stylesheet" />
    <link href="Scripts/datatables/css/jquery.dataTable.css" rel="stylesheet" />
    <link href="Scripts/datatables/css/dataTables.bootstrap.css" rel="stylesheet" />

 <asp:Table ID="sinFirma" class="table table-hover" align="center" width="190%" style="border-color: azure; font-size: 10px;" runat="server"></asp:Table>

 
 <script type="text/javascript">
     
     $(document).ready(function () {
         
             table.draw();
            var table = $('#sinFirma').DataTable({
                "autoWidth": true,
                "bProcessing": true,

                "aoColumns": [
                                   { mData: 'RUT' },
                                   { mData: 'NOMBRE' },
                                   { mData: 'PATERNO' },
                                   { mData: 'MATERNO' },
                                   { mData: 'ESTADO' }
                ],

                "fixedColumns": true, //Fijar columna
                "scrollCollapse": true,
                "scrollX": true,
                //"scrollY": "200px",
                "iDisplayLength": 10,

                

                dom: 'Bfrtip',
                "language": {
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "No se encontraron resultados",
                    "sEmptyTable": "Ningún dato disponible en esta tabla",
                    "sInfo": "Mostrando resultados del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando resultados del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "sInfoThousands": ",",
                    "sLoadingRecords": "Cargando contenido, por favor espere unos segundos...",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast": "Último",
                        "sNext": "Siguiente",
                        "sPrevious": "Anterior"
                    }
                },          

                buttons: [
                           /*{
                                extend: 'colvisGroup',
                                text: '+ base de datos',
                                show: [0, 1]
                            },
                            {
                                extend: 'colvisGroup',
                                text: '- base de datos',
                                hide: [0, 1]
                            },*/
                            /*{
                                extend: 'csvHtml5',
                                text: '<i class="fa fa-file-text-o">Exportar a CSV</i>',
                                titleAttr: 'Exportar a CSV',
                                /*exportOptions: {
                                columns: all
                            }*/
                            /*},*/
                            {
                                extend: 'excelHtml5',
                                text: '<i class="fa fa-file-excel-o">Exportar a Excel</i>',
                                titleAttr: 'Exportar a Excel',
                                /*exportOptions: {
                                columns: all
                            }*/
                            },
                ]
            });
        })

        /*function funcion() {
            alert('hola');
        }*/
    </script>
</asp:Content>
