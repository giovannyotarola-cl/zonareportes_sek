$(document).ready(function ($) {

    $(".table-datos").dataTable();

    $("#anioconsultado").on("change", function () {

        $("#MainContent_lb_carrera").find("option").remove().end();
        $("#MainContent_lb_facultad").val("");
        $("#MainContent_lb_asignatura").find("option").remove().end();

    });

    $("#MainContent_lb_facultad").on("change", function () {
        
        $(".c_loading").html("<i class='fa fa-spinner loader'></i>");
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
                $('.c_loading').find("i").remove().end();
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