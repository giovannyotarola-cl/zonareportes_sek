$(document).ready(function () {


    

    $("#MainContent_grd_Coordinador").DataTable({
        oLanguage: {
            "sUrl": "lan/dataTable/es_Es.txt"
        },
        iDisplayLength: 15,
        aoColumns: [null, null, null, null, null, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }],
        sPaginationType: "full_numbers",
        bPaginate: true,
        bInfo: true,
        bLengthChange: false,
        bAutoWidth: true,
        bFilter: true,
        stateSave: true
    });
    $("#MainContent_grd_Docente").DataTable({
        oLanguage: {
            "sUrl": "lan/dataTable/es_Es.txt"
        },
        iDisplayLength: 15,
        aoColumns: [{ "bSortable": false }, null, null, { "bSortable": false }, { "bSortable": false }, null, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }],
        sPaginationType: "full_numbers",
        bPaginate: true,
        bInfo: true,
        bLengthChange: false,
        bAutoWidth: true,
        bFilter: true,
        stateSave: true
    });
    $("#MainContent_grd_Solicitantes").DataTable({
        oLanguage: {
            "sUrl": "lan/dataTable/es_Es.txt"
        },
        iDisplayLength: 15,
        aoColumns: [null, null, null, null, null, null, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }],
        sPaginationType: "full_numbers",
        bPaginate: true,
        bInfo: true,
        bLengthChange: false,
        bAutoWidth: true,
        bFilter: true,
        stateSave: true
    });
    $("#MainContent_grd_gastos").DataTable({
        oLanguage: {
            "sUrl": "lan/dataTable/es_Es.txt"
        },
        iDisplayLength: 15,
        aoColumns: [{ "bSortable": false }, null, null, null, { "bSortable": false }, null, { "bSortable": false }, null, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }],
        sPaginationType: "full_numbers",
        bPaginate: true,
        bInfo: true,
        bLengthChange: false,
        bAutoWidth: true,
        bFilter: true,
        stateSave: true
    });
    $("#MainContent_grd_visualizar_alumno").DataTable({
        oLanguage: {
            "sUrl": "lan/dataTable/es_Es.txt"
        },
        iDisplayLength: 15,
        aoColumns: [{ "bSortable": false },null,null, { "bSortable": false }],
        sPaginationType: "full_numbers",
        bPaginate: true,
        bInfo: true,
        bLengthChange: false,
        bAutoWidth: true,
        bFilter: true,
        stateSave: true
    });
    $("#MainContent_grd_autorizacionGatos").DataTable({
        oLanguage: {
            "sUrl": "lan/dataTable/es_Es.txt"
        },
        iDisplayLength: 15,
        aoColumns: [{ "bSortable": false }, null, null, null, null, null, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }, { "bSortable": false }],
        sPaginationType: "full_numbers",
        bPaginate: true,
        bInfo: true,
        bLengthChange: false,
        bAutoWidth: true,
        bFilter: true,
        stateSave: true
    });
});


function confirmarguardado() {
    if (typeof FileReader !== "undefined") {
        if (document.getElementById("FileUpload") != null) {
            if (document.getElementById('FileUpload').files.length > 0) {
                var size = document.getElementById('FileUpload').files[0].size;
                // check file size

                if (size > 246579200) {
                    $("#FileUpload").val("");
                    alert('Solo se aceptan archivos tipo PDF de hasta 2 mb.');
                    return false;
                }
                var filePath = document.getElementById('FileUpload').value;
                var allowedExtensions = /(\.pdf)$/i;
                if (!allowedExtensions.exec(filePath)) {
                    alert("Solo admite archivos de tipo PDF");
                    $("#FileUpload").val("");
                    return false;
                }
            }
        }
    }
    var confirm_value = document.createElement('INPUT');
    confirm_value.type = 'hidden';
    confirm_value.name = 'confirm_value';
    if (confirm('¿Está seguro/a que desea guardar los datos?')) {
        confirm_value.value = 'Yes';
        document.forms[0].appendChild(confirm_value);
        return true;
    }
    else {
        confirm_value.value = 'No';
        document.forms[0].appendChild(confirm_value);
        return false;
    }
}


function Factura(tracking, subTracking, nombre_archivo) {

    window.open('downloadOther.aspx?t=' + tracking + '&st=' + subTracking + '&arc=' + nombre_archivo);

}

function confirmareliminacionactividad() {
    var confirm_value = document.createElement('INPUT');
    confirm_value.name = 'confirm_value';
    if (confirm('Se procedera a eliminar la actividad.\n¿Desea proseguir?')) {
        confirm_value.value = 'Yes';
        document.forms[0].appendChild(confirm_value);
        return true;
    }
    else {
        confirm_value.value = 'No';
        document.forms[0].appendChild(confirm_value);
        return false;
    }
}

function confirmareliminacionacomponenete() {
    var confirm_value = document.createElement('INPUT');
    confirm_value.name = 'confirm_value';
    if (confirm('Se procedera a eliminar el componente.\n¿Desea proseguir?')) {
        confirm_value.value = 'Yes';
        document.forms[0].appendChild(confirm_value);
        return true;
    }
    else {
        confirm_value.value = 'No';
        document.forms[0].appendChild(confirm_value);
        return false;
    }
}

//Validar el ingreso de numeros
function valid(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla == 8) return true;

    patron = /\d/;
    te = String.fromCharCode(tecla);
    return patron.test(te);
}

//Función para validar el ingreso de solo fechas 
function validar(e) {

    tecla = e.which || e.keyCode;
    if (tecla == 8) return false;
    patron = /\d&&/;

    te = String.fromCharCode(tecla);

    return (patron.test(te) || tecla == 9 || tecla == 8);

}

function Editar(tracking) {

    if (tracking != "") {
        window.open("EditarProyecto.aspx?t=" + tracking);
    }
}

function ResumenProyecto(tracking) {

    if (tracking != "") {
        $("#lbl_ResumenProyecto").html(tracking);
        document.getElementById("frm_Resumen").src = "ResumenProyecto.aspx?t=" + tracking;
        $('#ModalResumen').modal('show');
    }
}

function GastosProyectos(tracking) {

    if (tracking != "") {
        $("#lbl_ResumenGasto").html(tracking);
        document.getElementById("frm_ResumenGasto").src = "ResumenGastos.aspx?t=" + tracking;
        $('#ModalResumenGasto').modal('show');
    }
}


function enviaPaso1(paso, accion, tracking, usuario, ele) {

    var elemento = ele.id;
    $("#" + elemento).val("0");
    if (accion != "0") {
        if (accion == "Seguimiento") {
            window.open("seguimiento.aspx?t=" + tracking);
        }
        if (accion == "Gasto") {

            window.open("AutorizacionGastos.aspx?t=" + tracking);
        }
        if (accion == "Alumno") {
            window.open("FichaAlumnos.aspx?t=" + tracking);
        }
        if (accion == "Cierre") {
            window.open("ProcesoCierre.aspx?t=" + tracking);
        }
    }
}
function enviaPaso2(paso, accion, tracking, usuario) {
    if (accion != "0") {
        $('#hd_tracking').val(tracking);
        $('#hd_paso').val(paso);
        $('#hd_accion').val(accion);
        $('#ModalPasosObservaciones').modal('show');
    }
}
function confirmaPasos() {
    Page_ClientValidate("Pasos");
    if (Page_IsValid) {
        var answer;
        if ($('#hd_accion').val() == "Revisar")
            answer = confirm("¿Esta seguro que desea regresar a revisión?");
        if ($('#hd_accion').val() == "Siguiente")
            answer = confirm("¿Esta seguro que desea aprobar este proyecto?");

        if ($('#hd_accion').val() == "Regresar")
            answer = confirm("¿Esta seguro que desea negar el cierre de este proyecto?");
        if ($('#hd_accion').val() == "Cerrar")
            answer = confirm("¿Esta seguro que desea aprobar el cierre de este proyecto?");

        if (answer)
            return true;

        else
            return false;
    }
    else
        return false;

}
function revisaFechasSeguimineto(oSrc, args) {
    if ($('#pnl_Seguimiento').is(":visible")) {
        if ($('#txt_fechaInicioSeg').val() != "" && $('#txt_fechaFinSeg').val() != "" && $('#txt_codigoProyecto').val() != "")
            args.IsValid = true;

        else
            args.IsValid = false;
    }
    else
        args.IsValid = true;
}
function enviaPaso3(paso, accion, tracking, usuario) {
    if (accion != "0") {
        $('#hd_tracking').val(tracking);
        $('#hd_paso').val(paso);
        $('#hd_accion').val(accion);
        $('#ModalPasosObservaciones').modal('show');
        $('#pnl_Seguimiento').hide();
        $('#txt_ObservacionPasos').val();

    }
}
function enviaPaso4(paso, accion, tracking, usuario) {
    if (accion != "0") {
        $('#hd_tracking').val(tracking);
        $('#hd_paso').val(paso);
        $('#hd_accion').val(accion);
        $('#ModalPasosObservaciones').modal('show');
        if ($('#hd_accion').val() == "Siguiente")
            $('#pnl_Seguimiento').show();
        else
            $('#pnl_Seguimiento').hide();
        $('#txt_ObservacionPasos').val();
    }
}

function enviaPaso5(paso, accion, tracking, usuario) {
    if (accion != "0") {
        $('#hd_tracking').val(tracking);
        $('#hd_paso').val(paso);
        $('#hd_accion').val(accion);
        $('#ModalPasosObservaciones').modal('show');
        $('#pnl_Seguimiento').hide();
        $('#txt_ObservacionPasos').val();
    }
}
function enviaGasto4(paso, accion, tracking, subtracking, usuario, ele) {
    var elemento = ele.id;
    $("#" + elemento).val("0");
    if (accion != "0") {
        $('#hd_tracking').val(tracking);
        $('#hd_subtracking').val(subtracking);
        $('#hd_paso').val(paso);
        $('#hd_accion').val(accion);
        $('#ModalGatosObservaciones').modal('show');

    }
}
function enviaGasto5(paso, accion, tracking, subtracking, usuario, ele) {
    var elemento = ele.id;
    $("#" + elemento).val("0");
    if (accion != "0") {
        $('#hd_tracking').val(tracking);
        $('#hd_subtracking').val(subtracking);
        $('#hd_paso').val(paso);
        $('#hd_accion').val(accion);
        $('#ModalGatosObservaciones').modal('show');

    }
}
function SubirGastos(tracking, subTracking, accion) {

    if (accion == "Subir") {
        $('#hd_tracking').val(tracking);
        $('#hd_subtracking').val(subTracking);
        $('#ModalGatosArchivo').modal('show');
    }
}
function confirmaGastos() {
    Page_ClientValidate("Gastos");
    if (Page_IsValid) {
        var answer;
        if ($('#hd_accion').val() == "Revisar")
            answer = confirm("¿Esta seguro que desea regresar a revisión?");
        if ($('#hd_accion').val() == "Siguiente")
            answer = confirm("¿Esta seguro que desea aprobar esta autorización?");
        if ($('#hd_accion').val() == "Negar")
            answer = confirm("¿Esta seguro que desea negar esta autorización?");

        if (answer)
            return true;

        else
            return false;
    }
    else
        return false;

}
function confirmaArchivoGastos() {
    Page_ClientValidate("ArchGastos");
    if (Page_IsValid) {
        if (typeof FileReader !== "undefined") {
            if (document.getElementById("file_upload") != null) {
                if (document.getElementById('file_upload').files.length > 0) {
                    var size = document.getElementById('file_upload').files[0].size;
                    // check file size

                    if (size > 2465792) {
                        $("#file_upload").val("");
                        alert('Solo se aceptan archivos tipo PDF de hasta 2 mb.');
                        return false;
                    }
                    var filePath = document.getElementById('file_upload').value;
                    var allowedExtensions = /(\.pdf)$/i;
                    if (!allowedExtensions.exec(filePath)) {
                        alert("Solo admite archivos de tipo PDF");
                        $("#file_upload").val("");
                        return false;
                    }
                }
            }
        }
        var confirm_value = document.createElement('INPUT');
        confirm_value.type = 'hidden';
        confirm_value.name = 'confirm_value';
        if (confirm('¿Está seguro/a que desea guardar los datos?')) {
            confirm_value.value = 'Yes';
            document.forms[0].appendChild(confirm_value);
            return true;
        }
        else {
            confirm_value.value = 'No';
            document.forms[0].appendChild(confirm_value);
            return false;
        }
    }
    else
        return false;
}