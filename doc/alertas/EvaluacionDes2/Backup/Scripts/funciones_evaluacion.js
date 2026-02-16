$(document).ready(function () {

    //Cuando hace click en cualquier radio, escribe el valor de la nota del radio en la última casilla
    $("input[type=radio]").click(function () {
        $("#MainContent_" + $(this).attr('name') + "_nota").val($(this).val());
        //alert($(this).val());
    });

    $("input[type=radio]").click(function () {
        //Obtener valores de posición de casilla --> "gx_yz_nota"
        cadena = $(this).attr('name');
        x = cadena.substring(1, 2);
        y = cadena.substring(3, 4);
        z = cadena.substring(4, 5);

        //Calculo de subfactor
        if ((isNumeric($("#MainContent_g" + x + "_" + y + "1_nota").val())) && (isNumeric($("#MainContent_g" + x + "_" + y + "2_nota").val())) && (isNumeric($("#MainContent_g" + x + "_" + y + "3_nota").val()))) {
            a1 = parseInt($("#MainContent_g" + x + "_" + y + "1_nota").val());
            a2 = parseInt($("#MainContent_g" + x + "_" + y + "2_nota").val());
            a3 = parseInt($("#MainContent_g" + x + "_" + y + "3_nota").val());
            $("#MainContent_g" + x + "_" + y + "_nota").val(((a1 + a2 + a3) / 3).toFixed(2));
        }

        //Calculo de factor
        if (isNumeric($("#MainContent_g" + x + "_" + "a_nota").val()) && isNumeric($("#MainContent_g" + x + "_" + "b_nota").val()) && isNumeric($("#MainContent_g" + x + "_" + "c_nota").val())) {
            a = parseFloat($("#MainContent_g" + x + "_" + "a_nota").val());
            b = parseFloat($("#MainContent_g" + x + "_" + "b_nota").val());
            c = parseFloat($("#MainContent_g" + x + "_" + "c_nota").val());
            $("#MainContent_g" + x + "_nota").val(((a + b + c) / 3).toFixed(2));
        }
    });

    // Comprobacion de que todos los radio buttons están marcados
    var names = {};
    var count = 0;

    $('input:radio').each(function () {
        names[$(this).attr('name')] = true;
    });

    $.each(names, function () {
        count++;
    });

    $("#MainContent_Button1").click(function () {
        if ($('input:radio:checked').length == count) {
            if ($("#MainContent_compromiso_mejora").val() == "") {
                alert("Debe rellenar el campo de Compromiso de Mejora");
                return false;
            }
            return true;
        }
        else {
            alert("Debe marcar una respuesta en cada pregunta.");
            return false;
        }
    });

});

// Función para saber si hay valores en las casillas de calificación
function isNumeric(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}
