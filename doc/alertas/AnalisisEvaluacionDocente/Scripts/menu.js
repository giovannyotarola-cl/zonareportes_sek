$(window).load(function () {

    $("#cssmenu").prepend("<div id='menu-line'></div>");

    var foundActive = false, activeElement, linePosition = 0, menuLine = $("#cssmenu #menu-line"), lineWidth, defaultPosition, defaultWidth;

    $("#cssmenu > ul > li").each(function () {
        if ($(this).hasClass('active')) {
            activeElement = $(this);
            foundActive = true;
        }
    });

    if (foundActive === false) {
        activeElement = $("#cssmenu > ul > li").first();
    }

    defaultWidth = lineWidth = activeElement.width();

    defaultPosition = linePosition = activeElement.position().left;

    menuLine.css("width", lineWidth);
    menuLine.css("left", linePosition);

    $("#cssmenu > ul > li").hover(function () {
        activeElement = $(this);
        lineWidth = activeElement.width();
        linePosition = activeElement.position().left;
        menuLine.css("width", lineWidth);
        menuLine.css("left", linePosition);
    },
    function () {
        menuLine.css("left", defaultPosition);
        menuLine.css("width", defaultWidth);
    });

    var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    };

    $('#btnImprimirEvDocente').click(function () {

        var asignatura = getUrlParameter('ASIGNATURA');
        var profesor = getUrlParameter('PROFESOR');
        var anio = getUrlParameter('ANO');
        var periodo = getUrlParameter('PERIODO');
        var seccion = getUrlParameter('SECCION');
        var carrera = getUrlParameter('CARRERA');
        var comentario = $('#MainContent_txt_observacion').val();

        if (comentario != null && comentario != '') {
            $.ajax({
                type: "POST",
                url: "ws.aspx/Observacion",
                data: '{comentario: "' + comentario + '", profesor: "' + profesor + '", asignatura: "' + asignatura + '", anio: "' + anio + '", periodo: "' + periodo + '", seccion: "' + seccion + '", carrera: "' + carrera + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == 'OK') {
                        $('.content-comentario #MainContent_txt_observacion').css('display', 'none');
                        $('.content-comentario').html('<div>' + comentario + '</div>');
                        window.print();

                    } else {
                        alert("A ocurrido un error al grabar la observación");
                    }
                }
            });
        } else {
            window.print();
        }

        return false;
    });

});

$(document).ready(function () {



    /*
    $('#MainContent_ddlAsignaturaInforme').change(function () {

        if ($(this).val() != '') {

            var anio = $('#MainContent_ddlAno').val();
            var semestre = $('#MainContent_ddlSemestre').val();
            var asignatura = $(this).val();

            $(".s_loading").html("<i class='fa fa-spinner loader'></i>");
            $("#MainContent_ddlSeccionInforme").prop("disabled", "disabled");
            $.ajax({
                type: "POST",
                url: "ws.aspx/cargarAsignaturasFiltro",
                data: '{anio: "' + anio + '", semestre: "' + semestre + '", asignatura: "' + asignatura + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#MainContent_ddlSeccionInforme").find("option").remove().end().append('<option selected value="0"></option>');
                    $.each(response.d, function (key, value) {
                        $("#MainContent_ddlSeccionInforme").append($('<option>', {
                            value: key,
                            text: value
                        }));
                    });
                    $('.p_loading').find("i").remove().end();
                    $("#MainContent_ddlSeccionInforme").prop("disabled", "");
                }
            });
        }
        return false;
    });

    $('#MainContent_ddlSeccionInforme').change(function () {

        if ($(this).val() != '') {

            var anio = $('#MainContent_ddlAno').val();
            var semestre = $('#MainContent_ddlSemestre').val();
            var asignatura = $('#MainContent_ddlAsignaturaInforme').val();
            var seccion = $(this).val();

            $(".p_loading").html("<i class='fa fa-spinner loader'></i>");
            $("#MainContent_ddlProfesorInforme").prop("disabled", "disabled");
            $.ajax({
                type: "POST",
                url: "ws.aspx/cargarProfesoresFiltro",
                data: '{anio: "' + anio + '", semestre: "' + semestre + '", asignatura: "' + asignatura + '", seccion: "' + seccion + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $("#MainContent_ddlProfesorInforme").find("option").remove().end().append('<option selected value="0"></option>');
                    $.each(response.d, function (key, value) {
                        $("#MainContent_ddlProfesorInforme").append($('<option>', {
                            value: key,
                            text: value
                        }));
                    });
                    $('.p_loading').find("i").remove().end();
                    $("#MainContent_ddlProfesorInforme").prop("disabled", "");
                }
            });
        }
        return false;
    });

    $('#MainContent_btnGenerar').click(function () {

        var asignatura = $('#MainContent_ddlAsignaturaInforme').val();
        var seccion = $('#MainContent_ddlSeccionInforme').val();
        var profesor = $('#MainContent_ddlProfesorInforme').val();
        var encuesta = $('#MainContent_ddlTipoEncuesta').val();

        if (asignatura == '0' || seccion == '0' || profesor == '0' || encuesta == '0') {
            return false;
        } else {
            return true;
        }

        return false;
    });
    */
});