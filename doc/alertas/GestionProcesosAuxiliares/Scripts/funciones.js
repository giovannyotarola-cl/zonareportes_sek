$(document).ready(function () {
    if ($("#MainContent_ddlAsignaturaInforme").val() != "0" || $("#MainContent_ddlSeccionInforme").val() != "0") {
        $('html, body').animate({
            scrollTop: $(document).height()
        },
       1500);
        return false;
    }
});