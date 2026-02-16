$(document).ready(function ($) {

    var table = $('.table-datos').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'copyHtml5', 'excel'
        ],
        "language": {
            buttons: {
                'copy': 'Copiar',
                'excel': 'Excel',
                copyTitle: 'Copiando resultados',
                copySuccess: {
                    _: '%d líneas copiadas',
                    1: '1 linea copiada'
                },
                excelTitle: 'Generando Excel',
                excelSuccess: 'Excel generado'
            },
            "lengthMenu": "Mostrar _MENU_ registros por página",
            "zeroRecords": "No se han encontrado resultados",
            "info": "Página _PAGE_ de _PAGES_",
            "infoEmpty": "Sín resultados",
            "infoFiltered": "(filtered from _MAX_ total records)",
            "search": "Buscar",
            "paginate" : {
                "previous": "Anterior",
                "next": "Siguiente"
            }
        }
    });

    $("#anioconsultado").on("change", function () {

        $("#MainContent_lb_carrera").find("option").remove().end();
        $("#MainContent_lb_facultad").val("");
        $("#MainContent_lb_asignatura").find("option").remove().end();

    });

    $("#MainContent_lb_facultad").on("change", function () {
        
        $("#span-carrera").html("<i class='fa fa-spinner loader'></i>");
        $("#MainContent_lb_carrera").prop("disabled", "disabled");
        $.ajax({
            type: "POST",
            url: "Filtros.aspx/filtroFacultad",
            data: '{codFacultad: "' + $("#MainContent_lb_facultad").val() + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                $("#MainContent_lb_carrera").find("option").remove().end();
                $.each(response.d, function (key, value) {
                    $("#MainContent_lb_carrera").append($('<option>', {
                        value: key,
                        text: value
                    }));
                });
                $('#span-carrera').html("Carrera");
                $("#MainContent_lb_carrera").prop("disabled", "");
            },
            failure: function (response) {
                
            }
        });
    });

    $("#MainContent_lb_carrera").on("change", function () {

        $(".a_loading").html("<i class='fa fa-spinner loader'></i>");
        $("#MainContent_lb_asignatura").prop("disabled", "disabled");
        $.ajax({
            type: "POST",
            url: "Filtros.aspx/filtroCarrera",
            data: '{codCarrera: "' + $("#MainContent_lb_carrera").val() + '", codAno : "' + $('#anioconsultado').val() + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                $("#MainContent_lb_asignatura").find("option").remove().end();
                $.each(response.d, function (key, value) {
                    $("#MainContent_lb_asignatura").append($('<option>', {
                        value: key,
                        text: value
                    }));
                });
                $('.a_loading').find("i").remove().end();
                $("#MainContent_lb_asignatura").prop("disabled", "");
            },
            failure: function (response) {

            }
        });
    });
});