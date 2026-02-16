<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="DetalleDocumentos.aspx.cs" Inherits="AutoPostulacion.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script src="Scripts/plugin.js?ver=0.1.9"></script>

    <link href="Scripts/datatables/css/buttons.dataTables.css" rel="stylesheet" />
    <link href="Scripts/datatables/css/jquery.dataTable.css" rel="stylesheet" />
    <link href="Scripts/datatables/css/dataTables.bootstrap.css" rel="stylesheet" />
<%--    <script>
        $(function () {
            $(document).on('click', '.bto-ver', function (event) {
                let id = this.id;
                document.getElementById("<%=txt_Rut.ClientID%>").value = id;  
              
                var valores = table.row($(this).parents("tr")).data();              
                console.log(valores);
                    
            });
        });

    </script>--%>

    
<style>
        #contenedor_indicadores{
            width: 100%;
            float: left;
            margin-bottom: 20px;
            margin-left: 0%;
            margin-top: 20px;
            background-color: #fff;
            border-bottom: #0b5a9c solid 2px;
            background-color: white;
    }
		#contenedor_indicadores div{
            float:left;
            width:190px;
            margin-left:20px;             
    }
        .txt_kpi{
            font-size:30px;
            color:#0b5a9c;
            margin-bottom:10px;
        }

        .txt_kpi_titulo{
            color:#9f9f9f;
        }
       
       
        .modal iframe {
            width: 98%;
            height: 100%;
        }

        .la {
            width: 65%;
        }

        .modal-dialog.reg,
        .modal-content.reg, .modal-body.reg {
            /* 80% of window height */
            height: 68%;
        }

    .modal.in .modal-dialog {
        -webkit-transform: translate(0, 0);
        -ms-transform: translate(0, 0);
        -o-transform: translate(0, 0);
        position: fixed;
        transform: translate(0, 0);
        top: 185px;
        left: 500px;
    }

    .txt_kpi:hover{
        text-decoration:underline;
    }

        th {
            background-color: #f6d883;
			text-align:left;
        }

        #contenedor {
            width: 95%;
            max-width: 1920px;
            margin: auto;
        }
        

        .container {
            width: 100%;
        }

        #content_top {
           width: 100%;
           height: 60px;
           margin-top: 20px;
           top: 80px;
           left:0;
           position: fixed;
           background-color: #fff;
           z-index: 1300;
        }

        #content_center {
                width: 100%;
                margin-top: 10px;
                height: 500px;
                position: absolute;
                top: 195px;
                left:0;
        }

        #content_center_left {
            width: 6%;
            margin: auto;
            float: left;
            margin-top: 0px;
            border-top: #ccc solid 2px;
        }

        #content_center_right {
            width: 93%;
            margin: auto;
            float: right;
            border-left: #ccc solid 2px;
        }

        #filtros {
            width: 110%;
            margin: auto;
            float: left;
        }

        #grillaDocumentos {
            width: 845px;
            margin: auto,1px,1px;
            float: left;
        }

        footer {    
            width: 86%;
            margin: auto;
            float: right;
            top: 750px;
            position: absolute;
        }

        select {
            width: 100%;
            max-width: 340px;
        }

        select, option {
            margin-bottom: 5px;
        }
        #example{
            text-align:left;
        }

        .DTFC_LeftBodyLiner{
            top:-5%;
        }
        /*.modal-content {
        }*/
    </style>

    <div id="contenedor">
        <div id="content_top">
            <div id="contenedor_indicadores">
                <div id="total_ingresado">
                    <div  class="txt_kpi_titulo"><asp:Label ID="Label1" runat="server" Style="font-weight: 700">Total Ingresado:</asp:Label>     </div>
                    <div id="ingresado" class="txt_kpi"><asp:Label ID="lbltingresado" runat="server"></asp:Label></div>
                </div>
                <div id="total_descargado">
                    <div class="txt_kpi_titulo"><asp:Label ID="Label2" runat="server" Style="font-weight: 700">Total Descargado:</asp:Label></div>
                    <div id="descargado" class="txt_kpi"><asp:Label ID="lbltdescargado" runat="server"></asp:Label></div>
                </div>
                <div id="total_aprobados">
                    <div class="txt_kpi_titulo"><asp:Label ID="Label3" runat="server" Style="font-weight: 700">Total Aprobados:</asp:Label></div>
                    <div id="aprobados" class="txt_kpi"><asp:Label ID="lbltaprobado" runat="server"></asp:Label></div>
                </div>
                <div id="total_rechazados">
                    <div class="txt_kpi_titulo"><asp:Label ID="Label4" runat="server" Style="font-weight: 700">Total Rechazados:</asp:Label></div>
                    <div id="rechazados" class="txt_kpi"><asp:Label ID="lblrechazado" runat="server"></asp:Label></div>
                </div>
                <div id="total_matriculado">
                    <div class="txt_kpi_titulo"><asp:Label ID="Label5" runat="server" Style="font-weight: 700">Total Matriculado:</asp:Label></div>
                    <div id="matriculado" class="txt_kpi"><asp:Label ID="lbltmatriculado" runat="server"></asp:Label></div>
                </div>    
            </div>
        </div>
            <div id="content_center">
            <div id="content_center_left">
				<div >
						<div><h5>Filtros:</h5></div>
						<div  class="select" id="filtros"></div>
						<div  id="filtros1"></div>
				</div>
            </div>
            <div id="content_center_right">
                <table id="example" class="table table-hover" align="center" width="190%" style="border-color: azure; font-size: 10px;">
                    <thead>
                        <tr>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Rut</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Nombre</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Codigo Alumno</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Sexo</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Mail</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Telefono</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Región</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Comuna</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Facultad</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Carrera</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Cohorte</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Jornada</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Estado</th>   
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Descripcion Estado</th>                  
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Contrato</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Anexo Compromiso</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Pagaré</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Estado Postulante</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Ver Estado</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Matriculado</th>
                            <th style="background-color: #5bc0de; font-size: 12px; text-align: left; ">Fecha Matricula</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

        <!-- Modal Estructura -->
    <div class="container">
        <div class="modal fade " id="ModalEstructura" role="dialog">
            <div class="modal-dialog modal-xs reg">
                <!-- Modal content-->
                <div class="modal-content reg">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">
                            <asp:Label runat="server" ClientIDMode="Static" ID="lbltitulo" text="Estado Documentos" CssClass="titulo"></asp:Label></h4>
                    </div>
                    <div class="modal-body reg">
                        <iframe id="frm_RevisionArchivos" style="border: none;"></iframe>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btn_CerrarEstructura" runat="server" CssClass="btn btn-danger btn-xs" data-dismiss="modal" Text="Cerrar" Width="110px" Height="22px" CausesValidation="false" />
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Modal -->
    <%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Revisión Estado Archivo</h4>
                </div>
                <div class="modal-body">
                    <table class="nav-justified">
                        <tr>
                            <td>
                                <asp:Label ID="lbl_Rut" runat="server" Text="Rut" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_Rut" runat="server" value="" MaxLength="12"></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Nombre" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" value="TERESA DEL CARMEN VIVALLAO OLAVE" MaxLength="12"></asp:TextBox>
                            </td>
                            <td>
                                
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_ArchivoContrato" runat="server" Visible="true" Style="font-weight: 700">Contrato</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_RutaArchivoContrato" runat="server" ClientIDMode="Static" Visible="true" />
                                <asp:HyperLink ID="link_RutaArchivoContrato" NavigateUrl="#" Text="DESCARGAR" runat="server" Target="_blank"></asp:HyperLink>
                            </td>
                            <td>
                                <asp:DropDownList ID="ListEstContrato" runat="server" Height="16px" Width="140px" Visible="true">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_ArchivoDetalle" runat="server" Visible="true" Style="font-weight: 700">Anexo Compromiso</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_RutaArchivoDetalle" runat="server" ClientIDMode="Static" Visible="true" />
                                <asp:HyperLink ID="link_RutaArchivoDetalle" NavigateUrl="#" Text="DESCARGAR" runat="server" Target="_blank"></asp:HyperLink>
                            </td>
                            <td>
                                <asp:DropDownList ID="ListEstAnexContrato" runat="server" Height="16px" Width="140px" Visible="true">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_ArchivoPagare" runat="server" Visible="true" Style="font-weight: 700">Pagaré</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lbl_RutaArchivoPagare" runat="server" ClientIDMode="Static" Visible="true" />
                                <asp:HyperLink ID="link_RutaArchivoPagare" NavigateUrl="#" Text="DESCARGAR" runat="server" Target="_blank"></asp:HyperLink>
                            </td>
                            <td>
                                <asp:DropDownList ID="ListEstPagare" runat="server" Height="16px" Width="140px" Visible="true">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="bntBuscar" runat="server" CommandArgument="" CssClass="btn btn-info btn-xs" ClientIDMode="Static" Visible="true" Text="Guardar" OnClick="bntBuscar_Click" />
                </div>
            </div>
        </div>
    </div>--%>


    <!--<script src="Scripts/datatables/js/dataTables.scroller.min.js"></script>   -->
    <script src="Scripts/datatables/js/jquery.dataTables.min.js"></script>

    <script src="Scripts/datatables/js/jquery.dataTables.js"></script>
    <script src="Scripts/datatables/js/dataTables.buttons.js"></script>
    <script src="Scripts/datatables/js/jszip.js"></script>
    <script src="Scripts/datatables/js/pdfmake.js"></script>
    <script src="Scripts/datatables/js/vfs_fonts.js"></script>
    <script src="Scripts/datatables/js/buttons.html5.js"></script>
    <script src="Scripts/datatables/js/buttons.print.js"></script>
    <script src="Scripts/datatables/js/buttons.colVis.js"></script>
    <script src="Scripts/datatables/js/dataTables.fixedColumns.js"></script>
    <script src="Scripts/datatables/js/perfect-scrollbar.min.js"></script>

    <script src="Scripts/datatables/js/bootstrap-submenu.min.js"></script>





    <script>
        $.fn.dataTable.ext.search.push(
       function (settings, data, dataIndex) {
           var sel1 = $('#select_1').val();
           var col1 = data[8];
           if ((sel1 == col1) || sel1 == 0) {
               return true;
           }
       }
       );

        $.fn.dataTable.ext.search.push(
       function (settings, data, dataIndex) {
           var sel2 = $('#select_2').val();
           var col2 = data[9];
           if ((sel2 == col2) || sel2 == 0) {
               return true;
           }
       }
       );

        $.fn.dataTable.ext.search.push(
       function (settings, data, dataIndex) {
           var sel3 = $('#select_3').val();
           var col3 = data[10];
           if ((sel3 == col3) || sel3 == 0) {
               return true;
           }
       }
       );

        $.fn.dataTable.ext.search.push(
       function (settings, data, dataIndex) {
           var sel4 = $('#select_4').val();
           var col4 = data[11];
           if ((sel4 == col4) || sel4 == 0) {
               return true;
           }
       }
       );

        $.fn.dataTable.ext.search.push(
       function (settings, data, dataIndex) {
           var sel5 = $('#select_5').val();
           var col5 = data[12];
           if ((sel5 == col5) || sel5 == 0) {
               return true;
           }
       }
       );

        $.fn.dataTable.ext.search.push(
             function (settings, data, dataIndex) {
                 var sel5 = $('#select_6').val();
                 var col5 = data[3];
                 if ((sel5 == col5) || sel5 == 0) {
                     return true;
                 }
             }
             );
        $.fn.dataTable.ext.search.push(
             function (settings, data, dataIndex) {
                 var sel5 = $('#select_7').val();
                 var col5 = data[6];
                 if ((sel5 == col5) || sel5 == 0) {
                     return true;
                 }
             }
             );
        $.fn.dataTable.ext.search.push(
             function (settings, data, dataIndex) {
                 var sel5 = $('#select_8').val();
                 var col5 = data[7];
                 if ((sel5 == col5) || sel5 == 0) {
                     return true;
                 }
             }
             );

        $.fn.dataTable.ext.search.push(
             function (settings, data, dataIndex) {
                 var sel5 = $('#select_9').val();
                 var col5 = data[17];
                 if ((sel5 == col5) || sel5 == 0) {
                     return true;
                 }
             }
             );



        $(document).ready(function () {

            $.ajax({
                url: 'WS/WebService1.asmx/GetFiltros',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    $.each(data, function (i, item) {
                        $("#filtros").append(item.Html);
                        table.draw();
                    });
                }
            });

            function actualizaIndicadores() {
                var facultad = $('#select_1').val();
                var carrera = $('#select_2 ').val();
                var cohorte = $('#select_3').val();
                var jornada = $('#select_4').val();
                var estado = $('#select_5').val();
                var sexo = $('#select_6').val();
                var region = $('#select_7').val();
                var comuna = $('#select_8').val();
                var postulante = $('#select_9').val();


                if (facultad == 0) {
                    facultad = "";
                }

                if (carrera == 0) {
                    carrera = "";
                }

                if (cohorte == 0) {
                    cohorte = "";
                }

                if (jornada == 0) {
                    jornada = "";
                }

                if (estado == 0) {
                    estado = "";
                }

                if (sexo == 0) {
                    sexo = "";
                }

                if (region == 0) {
                    region = "";
                }

                if (comuna == 0) {
                    comuna = "";
                }
                if (postulante == 0) {
                    postulante = "";
                }

                Filtros = new Object();
                Filtros.facultad = facultad;
                Filtros.carrera = carrera;
                Filtros.cohorte = cohorte;
                Filtros.jornada = jornada;
                Filtros.estado = estado;
                Filtros.sexo = sexo;
                Filtros.region = region;
                Filtros.comuna = comuna;
                Filtros.aprobado = postulante;

            $.ajax({
                    url: '<%=ResolveUrl("~/WS/WebService2.asmx/ActualizarIndicador")%>',
                    data: Filtros,
                    method: 'post',
                    dataType: 'json',
                    success: OnSuccessCall,
                    error: OnErrorCall
                    }
                );
             }

             function OnSuccessCall(response) {
             
                  $.each(response, function (i, item) {
                     $('#<%= lbltingresado.ClientID %>').text(item.total_ingresos);
                     $('#<%= lbltaprobado.ClientID %>').text(item.total_aprobados);
                     $('#<%= lbltdescargado.ClientID %>').text(item.total_descargados);
                     $('#<%= lblrechazado.ClientID %>').text(item.total_rechazados);
                     $('#<%= lbltmatriculado.ClientID %>').text(item.total_matriculados);

                 });
                
                 
             }

             function OnErrorCall(response) {
                 alert(response.status + " " + response.statusText);
             }

            $('#filtros').on('change', '#select_1', function () {
                table.draw();
                actualizaIndicadores();
            });


            $('#filtros').on('change', '#select_2', function () {
                table.draw();
                actualizaIndicadores();
            });

            $('#filtros').on('change', '#select_3', function () {
                table.draw();
                actualizaIndicadores();
            });

            
            $('#filtros').on('change', '#select_4', function () {
                table.draw();
                actualizaIndicadores();
            });

            $('#filtros').on('change', '#select_5', function () {
                table.draw();
                actualizaIndicadores();
            });
            $('#filtros').on('change', '#select_6', function () {
                table.draw();
                actualizaIndicadores();
            });
            $('#filtros').on('change', '#select_7', function () {
                table.draw();
                actualizaIndicadores();
            });

            $('#filtros').on('change', '#select_8', function () {
                table.draw();
                actualizaIndicadores();
            });

            $('#filtros').on('change', '#select_9', function () {
                table.draw();
                actualizaIndicadores();
            });

            $('#contenedor_indicadores').on('click', '#total_aprobados', function () {
                table.columns().search('').draw();
                table.column(17).search('APROBADO').draw();
                actualizaIndicadores();
            });

            $('#contenedor_indicadores').on('click', '#total_rechazados', function () {
                table.columns().search('').draw();
                table.column(17).search('RECHAZADO').draw();
                actualizaIndicadores();
            });

            $('#contenedor_indicadores').on('click', '#total_ingresado', function () {
              
                table.columns().search('').draw();
                actualizaIndicadores();
            });

            $('#contenedor_indicadores').on('click', '#total_descargado', function () {
                table.columns().search('').draw();
                table.column(14).search('APROBADO|PENDIENTE|RECHAZADO|OBSERVADO|REVISADO', true, false).draw();
                actualizaIndicadores();
            });

            $('#contenedor_indicadores').on('click', '#total_matriculado', function () {
                table.columns().search('').draw();
                table.column(19).search('SI').draw();
                actualizaIndicadores();
            });


            function actualizarTabla() {
                table.ajax.reload(null, false);
                
            }
            document.getElementById("<%= btn_CerrarEstructura.ClientID%>").addEventListener("click", actualizarTabla, true);

            
            $('#ModalEstructura').on('hidden.bs.modal', function () {
                actualizarTabla();
                actualizaIndicadores();
            });



            var table = $('#example').DataTable({
                "autoWidth": true,
                "bProcessing": true,
                "sAjaxSource": "WS/DatosDocumentosWs.asmx/datosContratos",
                "sServerMethod": "post",

                "aoColumns": [
                                   { mData: 'Rut' },
                                   { mData: 'Nombre' },
                                   { mData: 'CodAlumno' },
                                   { mData: 'Sexo' },
                                   { mData: 'Mail' },
                                   { mData: 'Fonoact' },
                                   { mData: 'Region' },
                                   { mData: 'Comuna' },
                                   { mData: 'Facultad' },
                                   { mData: 'Carrera' },
                                   { mData: 'Cohorte' },
                                   { mData: 'Jornada' },
                                   { mData: 'Estado' },
                                   { mData: 'DescripEstacad' },
                                   { mData: 'EstContrato' },
                                   { mData: 'EstAnxContrato' },
                                   { mData: 'EstPagare' },
                                   { mData: 'EstadoPostul' },
                                   { mData: 'VerEstado' },
                                   { mData: 'matriculado' },
                                   { mData: 'FecMatricula' }
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


