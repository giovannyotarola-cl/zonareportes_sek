$body = $("body");

$(document).on({
    ajaxStart: function () {
        $body.addClass("loading");
    },
    ajaxStop: function () {
        $body.removeClass("loading");
    }
});

$(document).ready(function () {

    $('#MainContent_Tbl_usuarios').DataTable({
        "sScrollX": false
    });

    $('#MainContent_Tbl_reportes').DataTable({
        "sScrollX": false
    });

    $('#GrabaUsuario').html('Grabar Usuario').addClass('btn-grabar').attr('event', 'insert');

    $.ajax({
        type: "POST",
        url: "../MetodosWeb.aspx/getAllDeptos",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: getDeptos,
        failure: function (response) {
            alert(response.d);
        },
        error: function (response) {
            alert(response.d);
        }
    });

    $('.btn-edit').click(function () {

        var idusuario = $(this).attr('id');
        $.ajax({
            type: "POST",
            url: "../MetodosWeb.aspx/getUserByid",
            data: '{IdUser: ' + idusuario + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var usuario = response.d;
                $(usuario).each(function () {
                    $('#RutUsr').val(this.Rut);
                    $('#NombUsr').val(this.Nombre);
                    $('#ApeUsr').val(this.Apellidos);
                    $('#EmailUsr').val(this.Email);
                    $('#DeptoUsr').val(this.Depto);
                    $('#ClaveUsr').val(this.Clave);
                    $('#ConfClaveUsr').val(this.Clave);
                });
                $('#ClaveUsr').removeAttr('required');
                $('#ConfClaveUsr').removeAttr('required');
                $('#GrabaUsuario').html('Actializar Usuario').addClass('btn-actualiza').attr('event', 'update');
            },
            failure: function (response) {
                alert(response.d);
            },
            error: function (response) {
                alert(response.d);
            }
        });
    });


    $('.btn-delete').click(function () {

        var idusuario = $(this).attr('id');
        bootbox.confirm({
            message: "Esta seguro de eliminar el usuario seleccionado?",
            buttons: {
                confirm: {
                    label: 'Sí eliminar',
                    className: 'btn-danger'
                },
                cancel: {
                    label: 'Cancelar',
                    className: 'btn-warning'
                }
            },
            callback: function (result) {
                if (result == true) {
                    $.ajax({
                        type: "POST",
                        url: "../MetodosWeb.aspx/deleteUser",
                        data: "{'idusuario': '" + idusuario + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d == "success") {
                                bootbox.alert("Usuario eliminado correctamente!", function (response) {
                                    window.location.reload(true);
                                });
                            } else {
                                bootbox.alert("Error " + response.d, function (response) {
                                    window.location.reload(true);
                                });
                            }
                        },
                        failure: function (response) {
                            alert(response.d);
                        },
                        error: function (response) {
                            alert(response.d);
                        }
                    });
                }
            }
        });

    });

    $('form').submit(function (e) {
        
        e.preventDefault();
        var event = $('#GrabaUsuario').attr('event');

        if (event == 'update') {

            /* Acciones para formulario de usuarios, ingreso, actualizacion*/
            var rutusuario = $('#RutUsr').val();
            var nombreusuario = $('#NombUsr').val();
            var apellidousuario = $('#ApeUsr').val();
            var claveusuario = $('#ClaveUsr').val();
            var emailusuario = $('#EmailUsr').val();
            var deptousuario = $('#DeptoUsr').val();

            $.ajax({
                type: "POST",
                url: "../MetodosWeb.aspx/updateUser",
                data: "{'rutUsuario': '" + rutusuario + "', " +
                        "'nombreusuario': '" + nombreusuario + "', " +
                        "'apellidousuario': '" + apellidousuario + "', " +
                        "'claveusuario': '" + claveusuario + "', " +
                        "'emailusuario': '" + emailusuario + "', " +
                        "'deptousuario': '" + deptousuario + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == "success") {
                        bootbox.alert("Usuario actualizado correctamente!", function (result) {
                            window.location.reload(true);
                        });
                    } else {
                        bootbox.alert("Error " + response.d, function (result) {
                            window.location.reload(true);
                        });
                    }
                },
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
            return false;
        }

        if (event == 'insert') {

            var rutusuario = $('#RutUsr').val();
            var nombreusuario = $('#NombUsr').val();
            var apellidousuario = $('#ApeUsr').val();
            var claveusuario = $('#ClaveUsr').val();
            var emailusuario = $('#EmailUsr').val();
            var deptousuario = $('#DeptoUsr').val();

            $.ajax({
                type: "POST",
                url: "../MetodosWeb.aspx/insertUser",
                data: "{'rutUsuario': '" + rutusuario + "', " +
                        "'nombreusuario': '" + nombreusuario + "', " +
                        "'apellidousuario': '" + apellidousuario + "', " +
                        "'claveusuario': '" + claveusuario + "', " +
                        "'emailusuario': '" + emailusuario + "', " +
                        "'deptousuario': '" + deptousuario + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == "success") {
                        bootbox.alert("Usuario ingresado correctamente!", function (result) {
                            window.location.reload(true);
                        });
                    } else {
                        bootbox.alert("Error " + response.d, function (result) {
                            window.location.reload(true);
                        });
                    }
                },
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
            return false;
        }
        
        /* Acciones para formulario de proyectos, ingreso, actualizacion*/
    });
});

function getDeptos(response) {

    var select = $('#DeptoUsr option').eq(0).clone(true);
    var departamentos = response.d;
    $("#DeptoUsr option").eq(0).remove();

    $('#DeptoUsr').append('<option value="">-- Seleccione --</option>');
    $(departamentos).each(function () {
        $('#DeptoUsr').append('<option value="' + this.ID + '">' + this.Nombre + '</option>');
    });
}