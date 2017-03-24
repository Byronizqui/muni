var erroresDev = new Array();

$(document).ready(function () {
    $("#num_acta_dec2").val(id);
    
    Proxy.listadoPolicias();
    Proxy.listadoInteresadosCombo();
    $('[data-rel="chosen"],[rel="chosen"]').chosen();
    $("#fecha_dev").datepicker({
        dateFormat: "dd/mm/yy",
        closeText: 'Cerrar',
        prevText: '<Ant',
        nextText: 'Sig>',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
        weekHeader: 'Sm',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    });
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
    var policiaID = $("#nomPoli option:selected").val();
    var policia = new Policia(policiaID, "a", "nomPoli", "c", 1);
    var fecha= $('#fecha_dev').val();
    var distrito = new Distrito(0, "");
    var lugar = new Lugar(distrito, "");
    var fech = new Date("02/03/2016");
    var decomisos = new Contenedor();
    decomisos.add(new Decomiso(0,"some", 1, "asdad"));
    var interesadoID = $("#nomInteresado option:selected").val();
    var interesado = new Interesado(interesadoID, fecha, lugar, "", "", "", "", "");
    var test = new Testigo(1, "", "", "", "");
    var actaDecomiso = new ActaDecomiso($("#num_acta_dec2").val(), policia, test, lugar, fech, "", interesado, decomisos, "");
    var actaDevolucion = new ActaDevolucion(document.getElementById("nActa_dev").innerHTML.replace(" ",""), policia, actaDecomiso, interesado, fecha); 
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
    window.location.href = "listaDecomisos.jsp";
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