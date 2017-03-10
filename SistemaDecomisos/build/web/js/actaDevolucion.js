var erroresDev = new Array();

$(document).ready(function () {
    $('#enviarActa_Dev').click(function () {
        if (checkActaDev())
            enviarActaDevolucion();
        else
            erroresActaDev();
    });
    putNumActaDevolucion(); 
});

function putNumActaDevolucion(){
    Proxy.ultimaActaDevolucion();
}

function checkActaDev(){
    var bool = true;
    if ($('#num_acta_dec2').val() === "") {
        bool = false;
        erroresDev.push("El campo del número de Acta de Decomiso relacionada con el acta actual no puede estar en blanco");
    }
    if ($('#nom_policiaDev').val() === "") {
        bool = false;
        erroresDev.push("Por favor indique el nombre del policía a cargo de la destrucción.");
    }
    if ($('#id_interesadoDev').val() === "") {
        bool = false;
        erroresDev.push("Debe proveer una identificación para el interesado(a).");
    }
    if ($('#fecha_dev').val() === "") {
        bool = false;
        erroresDev.push("Por favor indique la fecha en que se realizó la devolución.");
    }
    return bool;
}



function enviarActaDevolucion(){
    //var actaDecomiso = $('#num_acta_dec2').val();
    var nomPolicia = $('#nom_policiaDev').val();
    var policia = new Policia(1, "2","a", "b", "c"); 
    var id = $('#id_interesadoDev').val();
    var fecha= $('#fecha_dev').val();
    var distrito = new Distrito(0, "");
    var lugar = new Lugar(distrito, "");
    var fech = new Date("02/03/2016");
    var decomisos = [new Decomiso(5, "a", 1, "xxx"), new Decomiso(6, "a", 1, "xxx")];
    var interesado = new Interesado(1, fecha, lugar, "", "", "", "", "");
    /*var interesado = new Interesado(1, $('#fechaNac').val() === "" ? iDate : $('#fechaNac').val(), lugar,
            cedulaInteresado === "" ? "NA" : cedulaInteresado,
            $('#nombre_interesado').val() === "" ? "NA" : $('#nombre_interesado').val(),
            $('#apellido1_interesado').val() === "" ? "NA" : $('#apellido1_interesado').val(),
            $('#apellido2_interesado').val() === "" ? "NA" : $('#apellido2_interesado').val(),
            "En algun lugar de heredia"); */
    var test = new Testigo(1, "", "", "", "");
    var actaDecomiso = new ActaDecomiso(1, policia, test, lugar, fech, "", interesado, decomisos, "");
    var actaDevolucion = new ActaDevolucion(0, policia, actaDecomiso, interesado, fecha); 
    Proxy.actaDevolucion(JSON.stringify(actaDevolucion, replacer));
}
/*
 * "{"_class":"ActaDevolucion","idDevolucion":0,"policia":{"_class":"Policia","idPolicia":1,"identificacion":"2","nombre":"a","apellido1":"b","apellido2":"c"},"decomiso":{"_class":"ActaDecomiso","idDecomiso":1,"policia":{"_class":"Policia","idPolicia":1,"identificacion":"2","nombre":"a","apellido1":"b","apellido2":"c"},"testigo":{"_class":"Testigo","idTestigo":1,"identificacion":"","nombre":"","apellido1":"","apellido2":""},"lugar":{"_class":"Lugar","distrito":{"_class":"Distrito","idDistrito":0,"nombreDistrito":""},"direccionExacta":""},"fecha":"2016-02-03T06:00:00.000Z","hora":"","interesado":{"_class":"Interesado","idInteresado":1,"fechaNacimiento":"2016-03-02","domicilio":{"_class":"Lugar","distrito":{"_class":"Distrito","idDistrito":0,"nombreDistrito":""},"direccionExacta":""},"identificacion":"","nombre":"","apellido1":"","apellido2":"","direccionExacta":""},"decomisos":[{"_class":"Decomiso","idDecomiso":5,"cantidad":1,"observaciones":"xxx"},{"_class":"Decomiso","idDecomiso":6,"cantidad":1,"observaciones":"xxx"}],"observaciones":""},"fecha":"2016-03-02"}"
 */



function actaDevolucionModal() {
    $('#exitoDev').modal('show');
    window.setTimeout(hide_modalDev, 2000);
    document.getElementById("acta_devolucion").reset();
}


function hide_modalDev() {
    $('#exitoDev').modal('hide');
}



function erroresActaDev(){
    $('#errorListDev').html(' ');
    $('#errorListDev').append("<strong>Atención, se presentaron los siguientes errores:\n</strong>");
    for (var i = 0; i < erroresDev.length; i++) {
        $('#errorListDev').append("<p>" + (i + 1) + ") " + erroresDev[i] + "</p>");
    }
    $('#errorListDev').show();
    $(window).scrollTop(0);
    erroresDev = [];
}