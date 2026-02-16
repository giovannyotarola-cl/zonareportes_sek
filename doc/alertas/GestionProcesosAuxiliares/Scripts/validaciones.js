//Validar Largo Texto
function validarLength9(sender, args) {
    debugger;
    if (args.Value.length > 9)
        return args.IsValid = false;
    else
        return args.IsValid = true;
}
//Validar ddl
function validarDropDownList(sender, args) {
    debugger;
    if (args.Value != "-")
        return args.IsValid = true;
    else
        return args.IsValid = false;
}
//Validar Fecha
function validarFecha(sender, args) {
    debugger;
    if (validarFormatoFecha(args.Value) && existeFecha(args.Value))
        return args.IsValid = true;
    else
        return args.IsValid = false;
}
function validarFormatoFecha(campo) {
    var RegExPattern = /^\d{1,2}\/\d{1,2}\/\d{2,4}$/;
    if ((campo.match(RegExPattern)) && (campo != '')) {
        return true;
    } else {
        return false;
    }
}
function existeFecha(fecha) {
    var fechaf = fecha.split("/");
    var day = fechaf[0];
    var month = fechaf[1];
    var year = fechaf[2];
    var date = new Date(year, month, '0');
    if ((day - 0) > (date.getDate() - 0)) {
        return false;
    }
    return true;
}
//EndValidarFecha