var errores_don = new Array();


$(document).ready(function () {
    $('#enviarActa_Don').click(function () {
        if (checkActaDonacion())
            enviarActaDonacion();  
        else
           erroresActaDonacion();
    });
    putNumActaDonacion();
});

function putNumActaDonacion(){
    Proxy.ultimaActaDonacion();
}

function enviarActaDonacion(){
    var nomPolicia = $('#nom_policia').val();
    var policia = new Policia(1 ,"2", "a", "b", "c"); 
    var institucion= $('#institucion').val();
    var test = new Testigo(1, "", "", "", "");
    var fech = new Date("02/03/2016");
    var distrito = new Distrito(0, "");
    var lugar = new Lugar(distrito, "");
    var inter = new Interesado(1, "20/03/2016", lugar, "", "", "", "", "");
    var decomisos = [new Decomiso(5, "a", 1, "xxx"), new Decomiso(6, "a", 1, "xxx")];
    var actaDecomiso = new ActaDecomiso(1, policia, test, lugar, fech, "", inter, decomisos, "");
    //(int idInteresado, Date fechaNacimiento, Lugar domicilio, String identificacion, String nombre, String apellido1, String apellido2)
    var actaDonacion = new ActaDonacion(1, institucion, policia, actaDecomiso); 
    Proxy.actaDonacion(JSON.stringify(actaDonacion, replacer));
}

function checkActaDonacion(){
    var bool = true;
    if($('#num_acta_dec1').val() === ""){
        bool = false;
        errores_don.push("El campo del número de Acta de Decomiso relacionada con el acta actual no puede estar en blanco");
    }
    if ($('#fecha_don').val() === "") {
        bool = false;
        errores_don.push("Por favor indique la fecha en que se realizó la donación.");
    }
    if ($('#fecha_don').val() !== "") {
        var y = $('#fecha_don').val();
        var yDate = new Date(y);
        if (yDate > new Date()) {
            errores_don.push("La fecha de la donación es mayor a la fecha actual.");
        }
    }
    if($('#institucion').val() === ""){
        bool = false;
        errores_don.push("Por favor indique el nombre de la institución a la cual se le hizo la donación");
    }
    if($('#nom_policia').val() === ""){
        bool = false;
        errores_don.push("Por favor indique el nombre del policía municipal a cargo de la donación");
    }
    return bool;
}


function actaDonacionModal() {
    $('#exitoD').modal('show');
    window.setTimeout(hide_modalDon, 2000);
    document.getElementById("acta_donacion").reset();
}


function hide_modalDon() {
    $('#exitoD').modal('hide');
}


function erroresActaDonacion(){
    $('#errorListDon').html(' ');
    $('#errorListDon').append("<strong>Atención, se presentaron los siguientes errores:\n</strong>");
    for (var i = 0; i < errores_don.length; i++) {
        $('#errorListDon').append("<p>" + (i + 1) + ") " + errores_don[i] + "</p>");
    }
    $('#errorListDon').show();
    $(window).scrollTop(0);
    errores_don = [];
}
