
$(function () {
    $("#btn-editar").click(function () {
        editarPerfil();
    });
     $("#guardar_interesado").click(function () {        
        actualizarInteresado();
    });
});

$(document).ready(function () {      
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
    $(":button").prop('disabled',true);
    $("#btn-editar").prop('disabled',false);
    $("#avatar-2").prop('disabled',true);
    $("#nac").prop('disabled',true);
    $("#ext").prop('disabled',true);
    $("#id_interesado").prop('readonly',true);
    $("#apellido1_interesado").prop('readonly',true);
    $("#apellido2_interesado").prop('readonly',true);
    $("#nombre_interesado").prop('readonly',true);
    $("#fechaNac").prop('readonly',true);
    $("#guardar_interesado").hide();
    $("#cancelar_interesado").hide();    
    var idInteresado = sessionStorage.idInteresado;
    Proxy.getInteresado(idInteresado);
});

function editarPerfil(){
    $(":button").prop('disabled',false);
    $("#btnEditar").prop('disabled',false);
    $("#avatar-2").prop('disabled',false);
    $("#nac").prop('disabled',false);
    $("#ext").prop('disabled',false);
    //$("#id_interesado").prop('readonly',false);
    $("#apellido1_interesado").prop('readonly',false);
    $("#apellido2_interesado").prop('readonly',false);
    $("#nombre_interesado").prop('readonly',false);
    $("#fechaNac").prop('readonly',false);
    $("#guardar_interesado").show();
    $("#cancelar_interesado").show();
}

function displayInteresado(data){
    //$("#avatar-2").prop('disabled',false);
    $("#id_interesado").val(data.identificacion);
    $("#apellido1_interesado").val(data.apellido1);
    $("#apellido2_interesado").val(data.apellido2);
    $("#nombre_interesado").val(data.nombre);
    $("#fechaNac").val(data.fechaNacimiento);
}

function actualizarInteresado(){
    var lugar = new Lugar(new Distrito(1, "Heredia"), "Por el parque central");
    var iDate = formatDate(new Date().getUTCDate());
    var cedulaInteresado = $('#id_interesado').val();
    cedulaInteresado = cedulaInteresado.split("-").join("");
    var interesado = new Interesado(1, $('#fechaNac').val() === "" ? iDate : $('#fechaNac').val(), lugar,
            cedulaInteresado === "" ? "NA" : cedulaInteresado,
            $('#nombre_interesado').val() === "" ? "NA" : $('#nombre_interesado').val(),
            $('#apellido1_interesado').val() === "" ? "NA" : $('#apellido1_interesado').val(),
            $('#apellido2_interesado').val() === "" ? "NA" : $('#apellido2_interesado').val(),
            'weaita', "NA");
    Proxy.actualizarInteresado(JSON.stringify(interesado, replacer));
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