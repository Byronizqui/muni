var errores = new Array();

$(document).ready(function () {
    $('[data-rel="chosen"],[rel="chosen"]').chosen();
    $("#id_interesado").mask("9-9999-9999");
    $("#fechaNac").datepicker({
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
    $("#datepicker").datepicker({ 
        dateFormat: "dd/mm/yy",
        closeText: 'Cerrar',
        prevText: '<Ant',
        nextText: 'Sig>',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
        dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
        weekHeader: 'Sm',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    }).val();
    
    $('#enviarActa_Dec').click(function () {
        if (checkActa())
            enviarActa();
        else
            erroresActa();
    });
    putNumActa();
    $('#id_policia').change(function () {

        //Cuando se escribe algo en el texto de policia se autocompleta el formulario

    });

    $('#tags').on('autocompletechange change', function () {
        $('#tagsname').html('You selected: ' + this.value);
    }).change();
    $("#avatar-2").fileinput({
        language: 'es',
        overwriteInitial: true,
        maxFileSize: 5000,
        showClose: false,
        showCaption: false,
        showBrowse: false,
        browseOnZoneClick: true,
        removeLabel: '',
        removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
        removeTitle: 'Cancelar o volver a cargar foto',
        elErrorContainer: '#kv-avatar-errors-2',
        msgErrorClass: 'alert alert-block alert-danger',
        defaultPreviewContent: '<img src="/SistemaDecomisos/media/images/avatar.jpg" alt="Your Avatar" style="width:160px"><h6 class="text-muted">Seleccione una foto</h6>',
        layoutTemplates: {main2: '{preview} {remove} {browse}'},
        allowedFileExtensions: ["jpg", "png", "gif"]
    });
});

function putNumActa() {
    Proxy.ultimaActa();
    Proxy.completePolicias();
}
function obtenerDecomisosTabla(){
    var x=document.getElementById('tabla').rows;  //Toma las filas de la tabla
    var contenedor = new Contenedor();
    for (var i =2; i < x.length; i++){   //Toma una por una las filas de la tabla, i representa la fila
        var y=x[i].cells;  //y representa las columnas, por ejemplo y[3] es el precio en la tabla
        var categoria= y[0].childNodes[1].value;
        var cantidad = y[1].childNodes[0].value;
        var observaciones = y[2].childNodes[0].value;
        
        contenedor.add(new Decomiso(0,categoria,Number(cantidad),observaciones));
    }
    return contenedor;
}
function enviarActa() {
    
    var pDistrito = document.getElementById("distrito");
    var pTestigo = document.getElementById("nombre_testigo");
    var idDecomiso = 0;

    var policia = new Policia("2", "a", "b", "c", 1);
    var testigo;
    if (pTestigo.selectedIndex === 1)
        testigo = new Testigo(1, $('#id_testigo').val(), $('#nombre_testigoText').val(), "asd", "asd");
    else
        testigo = new Testigo(1, " ", " ", " ", " ");
    var lugar = new Lugar(new Distrito(pDistrito.selectedIndex, pDistrito.options[pDistrito.selectedIndex].value), "Por el parque central");
    var fechaDecomiso = $('#fecha').val();
    var horaDecomiso = $('#hora').val();
    var iDate = formatDate(new Date().getUTCDate());
    var cedulaInteresado = $('#id_interesado').val();
    cedulaInteresado = cedulaInteresado.split("-").join("");
    var interesado = new Interesado(1, $('#fechaNac').val() === "" ? iDate : $('#fechaNac').val(), lugar,
            cedulaInteresado === "" ? "NA" : cedulaInteresado,
            $('#nombre_interesado').val() === "" ? "NA" : $('#nombre_interesado').val(),
            $('#apellido1_interesado').val() === "" ? "NA" : $('#apellido1_interesado').val(),
            $('#apellido2_interesado').val() === "" ? "NA" : $('#apellido2_interesado').val(),
            "En algun lugar de heredia");
    var decomisos = obtenerDecomisosTabla();
    var observaciones = $("#observaciones").val();
    var actaDecomiso = new ActaDecomiso(0, policia, testigo, lugar,
            fechaDecomiso, horaDecomiso, interesado,
            decomisos, observaciones);
    Proxy.actaDecomiso(JSON.stringify(actaDecomiso, replacer));
}

function checkActa() {
    var pTestigo = document.getElementById("nombre_testigo");
    var bool = true;
    if ($('#direccion').val() === "") {
        bool = false;
        errores.push("El campo de dirección no puede estar vacío.");
    }
    if (pTestigo.selectedIndex === 2)
        if ($('#info_policia').val() === "") {
            bool = false;
            errores.push("Debe proveer una identificación para el policía testigo.");
        }
    if (pTestigo.selectedIndex === 1) {
        if ($('#nombre_testigoText').val() === "") {
            bool = false;
            errores.push("Debe proveer un nombre para el civil testigo.");
        }
        if ($('#id_testigo').val() === "") {
            bool = false;
            errores.push("Debe proveer una identificación para el civil testigo.");
        }
    }

    if ($('#id_policia').val() === "") {
        bool = false;
        errores.push("Debe proveer una identificación para el policía encargado.");
    }

    /*if ($('#id_policia').val() !== "") {
     if (!idVerificator($('#id_policia').val(), document.getElementById('ext').checked)) {
     bool = false;
     errores.push("El número de identificación del policía tiene formato incorrecto.");
     }
     }*/

//    if ($('#apellido1_interesado').val() === ""){
//        bool = false;
//        errores.push("El campo para el primer apellido del interesado, no puede estar vacío.");
//    }
//    if ($('#apellido2_interesado').val() === ""){
//        bool = false;
//        errores.push("El campo para el segundo apellido del interesado, no puede estar vacío.");
//    }
//    if ($('#nombre_interesado').val() === ""){
//        bool = false;
//        errores.push("El campo para el nombre del interesado, no puede estar vacío.");
//    }
//    if ($('#id_interesado').val() === ""){
//        bool = false;
//        errores.push("El campo para la identificación del interesado, no puede estar vacío.");
//    }
    if ($('#proobs').val() === "") {
        bool = false;
        errores.push("Debe completar el campo de observaciones para cada producto.");
    }
    if ($('#fecha').val() === "") {
        bool = false;
        errores.push("Por favor indique la fecha en que se realizó el decomiso.");
    }
    if ($('#fecha').val() !== "") {
        var y = $('#fecha').val();
        var yDate = new Date(y);
        if (yDate > new Date()) {
            errores.push("El fecha del decomiso es mayor a la fecha actual.");
        }
    }
    if ($('#hora').val() === "") {
        bool = false;
        errores.push("Por favor indique la hora en la que se realizó el decomiso.");
    }
    return bool;
}

function actaDecomisoModal() {
    $('#exito').modal('show');
    window.setTimeout(hide_modal, 2000);
    document.getElementById("acta_decomiso").reset();
}

function hide_modal() {
    $('#exito').modal('hide');
}

function erroresActa() {
    $('#errorList').html(' ');
    $('#errorList').append("<strong>Atención, se presentaron los siguientes errores:\n</strong>");
    for (var i = 0; i < errores.length; i++) {
        $('#errorList').append("<p>" + (i + 1) + ") " + errores[i] + "</p>");
    }
    $('#errorList').show();
    $(window).scrollTop(0);
    errores = [];
}

function formatDate(date) {
    var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

    if (month.length < 2)
        month = '0' + month;
    if (day.length < 2)
        day = '0' + day;

    return [year, month, day].join('-');
}