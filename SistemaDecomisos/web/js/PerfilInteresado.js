
$(function () {
    $("#btn-editar").click(function () {
        editarPerfil();
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
    
    //Proxy.getInteresado();
});

function editarPerfil(){
    $(":button").prop('disabled',false);
    $("#btnEditar").prop('disabled',false);
    $("#avatar-2").prop('disabled',false);
    $("#nac").prop('disabled',false);
    $("#ext").prop('disabled',false);
    $("#id_interesado").prop('readonly',false);
    $("#apellido1_interesado").prop('readonly',false);
    $("#apellido2_interesado").prop('readonly',false);
    $("#nombre_interesado").prop('readonly',false);
    $("#fechaNac").prop('readonly',false);
    $("#guardar_interesado").show();
    $("#cancelar_interesado").show();
}

function displayInteresado(data){
    //$("#avatar-2").prop('disabled',false);
    alert("DATA: "+data.identificacion+", "+data.nombre);
    $("#id_interesado").val(data.identificacion);
    $("#apellido1_interesado").val(data.apellido1);
    $("#apellido2_interesado").val(data.apellido2);
    $("#nombre_interesado").val(data.nombre);
    $("#fechaNac").val(data.fechaNacimiento);
}