/* global Proxy */

var erroresDes = new Array();

$(document).ready(function () {
    
    $("#num_acta_dec1").val(id);
    $('[data-rel="chosen"],[rel="chosen"]').chosen();
    $("#fechaDes").datepicker({
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
    $('#enviarActa_Des').click(function () {
        if (checkActaDes())
            enviarActaDes();  
        else
            erroresActaDes();
    });
    putNumActaDestruccion();
    Proxy.listadoPolicias();
});


function putNumActaDestruccion() {
    Proxy.ultimaActaDestruccion();
}

function checkActaDes() {
    var bool = true;
    if($('#num_acta_dec1').val() === ""){
        bool = false;
        errores_don.push("El campo del número de Acta de Decomiso relacionada con el acta actual no puede estar en blanco");
    }
    if ($('#nom_policiaDes').val() === "") {
        bool = false;
        erroresDes.push("Por favor indique el nombre del policía a cargo de la devolución.");
    }
    if ($('#nombre_encargado').val() === "") {
        bool = false;
        erroresDes.push("Por favor indique el nombre de la persona a cargo de la destrucción.");
    }
    if ($('#fechaDes').val() === "") {
        bool = false;
        erroresDes.push("Por favor indique la fecha en que se realizó la destrucción.");
    }
    if ($('#nombre_testigo1').val() === "" || $('#apellido1_testigo1').val() === "" || $('#apellido2_testigo1').val() === "") {
        bool = false;
        erroresDes.push("Debe ingresar el nombre completo del testigo Nº1.");
    }
    if ($('#nombre_testigo2').val() === "" || $('#apellido1_testigo2').val() === "" || $('#apellido2_testigo2').val() === "") {
        bool = false;
        erroresDes.push("Debe ingresar el nombre completo del testigo Nº2.");
    }
    return bool;
}

function enviarActaDes() {
    var policia = new Policia($("#nomPoli").val(), "a", "b", "c", 1);
    var testigo1 = new Testigo(1, "1", $('#nombre_testigo1').val(), $('#apellido1_testigo1').val(), $('#apellido2_testigo1').val());
    var testigo2 = new Testigo(1, "1", $('#nombre_testigo2').val(), $('#apellido1_testigo2').val(), $('#apellido2_testigo2').val());
    var pDistrito = document.getElementById("distritoDes");
    var lugar = new Lugar(new Distrito(pDistrito.selectedIndex, pDistrito.options[pDistrito.selectedIndex].value), $('#direccionDes').val());
    var encargado = $('#nombre_encargado').val();
    var fecha = $('#fechaDes').val();
    var test = new Testigo(1, "", "", "", "");
    var interesado = new Interesado(1, fecha, lugar, "", "", "", "", "");
    var decomisos = new Contenedor();
    decomisos.add(new Decomiso(0,"some", 1, "asdad"));
    var decomiso = new ActaDecomiso($("#num_acta_dec1").val(), policia, test, lugar, fecha, "", interesado, decomisos, "");
    var actaDestruccion = new ActaDestruccion(document.getElementById("nActa_dest").innerHTML.replace(" ",""), fecha, policia, testigo1, testigo2, lugar, encargado, decomiso);
    Proxy.actaDestruccion(JSON.stringify(actaDestruccion, replacer));
}

function erroresActaDes() {
    $('#errorListDe').html(' ');
    $('#errorListDe').append("<strong>Atención, se presentaron los siguientes errores:\n</strong>");
    for (var i = 0; i < erroresDes.length; i++) {
        $('#errorListDe').append("<p>" + (i + 1) + ") " + erroresDes[i] + "</p>");
    }
    $('#errorListDe').show();
    $(window).scrollTop(0);
    erroresDes = [];
}



function actaDestruccionModal() {
    $('#exitoDes').modal('show');
    window.setTimeout(hide_modalDest, 2000);
    document.getElementById("acta_destruccion").reset();
    
}


function hide_modalDest() {
    $('#exitoDes').modal('hide');
    window.location.href = "listaDecomisos.jsp";
}
