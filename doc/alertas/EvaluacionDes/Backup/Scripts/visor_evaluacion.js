$(document).ready(function () {
    var gr = 1;
    var subgr = 'a';
    var preg = 1;
    var localtext = ''

    do {
        localtext = $("#MainContent_FormView1_G" + gr.toString() + "_" + subgr + preg.toString() + "Label").text();
        //alert("#" + gr.toString() + "_" + subgr + preg.toString() + "_" + localtext.toString());
        $("#" + gr.toString() + "_" + subgr + preg.toString() + "_" + localtext.toString()).css('color', 'black');
        $("#" + gr.toString() + "_" + subgr + preg.toString() + "_" + localtext.toString()).css('font-weight', '600');
        $("#" + gr.toString() + "_" + subgr + preg.toString() + "_" + localtext.toString()).html("X");
        if (preg < 3) {
            preg = preg + 1;
        } else {
            preg = 1;
            if (subgr == 'a') {
                subgr = 'b';
            } else if (subgr == 'b') {
                subgr = 'c';
            } else {
                subgr = 'a';
                gr++;
            }
        };
    }
    while (gr <= 2 || subgr != 'c' || preg != '3');

});