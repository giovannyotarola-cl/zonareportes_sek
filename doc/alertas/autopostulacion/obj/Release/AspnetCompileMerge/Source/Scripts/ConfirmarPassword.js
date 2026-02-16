function ValidarPassword(source, args) {

    var password = document.getElementById(source.controltovalidate);

    if (password.value == "") {
       // alert("Error: NULO");
        args.IsValid = false;
    }
    else if (password.value.length < 8 || password.value.lenght > 16) 
    {
        source.errormessage = "El password debe ser de 8 caracteres minimo y 16 maximo!";
        //alert("Error: La contraseña debe ser de 8 caracteres minimo y 16 maximo!");
        args.IsValid = false;
    }
    else 
    {
        //alert("Error: Exito");
        args.IsValid = true;
    }

}

function ValidarDropDownList(source, args) {
    var valor = document.getElementById(source.controltovalidate);
    if (valor[answer.SelectedIndex].value == 0) {
        alert("Error: Exito");
    }
    else {
        alert("Error: error");
    }
}

function ValidateEmail(source, args) {
    $("cs_emailError").hide();
    //var mail_info = $("txt_email_insert").val().trim();
    var email = document.getElementById(source.controltovalidate);
    var mail_info = email.value.trim();
    var arrobas = 0;
    for (var i = 0, len = mail_info.length; i < len; i++) {
        if (mail_info[i] == '@') {
            arrobas++;
        }
    }

    if (mail_info.endsWith("@uisek.edu.ec") == true && mail_info.startsWith("@") == false && arrobas == 1) {
        arrobas == 0;
        args.IsValid = true;
        return;
    } else {
        arrobas == 0;
        args.IsValid = false;
    }
}
