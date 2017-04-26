/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('[data-rel="chosen"],[rel="chosen"]').chosen();
    $('input[name="daterange"]').daterangepicker({
        "locale": {
            "format": "MM/DD/YYYY",
            "separator": " - ",
            "applyLabel": "Aplicar",
            "cancelLabel": "Cancelar",
            "fromLabel": "Desde",
            "toLabel": "Hasta",
            "customRangeLabel": "Custom",
            "daysOfWeek": [
                "Do",
                "Lu",
                "Ma",
                "Mi",
                "Ju",
                "Vi",
                "Sa"
            ],
            "monthNames": [
                "Enero",
                "Febrero",
                "Marzo",
                "Abril",
                "Mayo",
                "Junio",
                "Julio",
                "Agusto",
                "Septiembre",
                "Octubre",
                "Noviembre",
                "Diciembre"
            ],
            "firstDay": 1
        }
    });
    Proxy.listadoInteresados();
    Proxy.listadoPolicias();
    $("#btnSendData").click(function(){
        sendData(); 
    });
});

function dibujarTabla(dataJson) {
    for (var i = 0; i < dataJson.length; i++) {
        var a = "<option value='" + dataJson[i].identificacion + "'>" + dataJson[i].nombre +
                " " + dataJson[i].apellido1 +
                " " + dataJson[i].apellido2 + "</option>";
        $("#interesadoChosen").append(a);
    }
    $('[data-rel="lInt"],[rel="lInt"]').chosen({width: "100%"});
    $('[data-rel="lInt"],[rel="lInt"]').chosen();
}

function sendData(){
    var tipoReporte = document.getElementsByName("tipo_reporte");
    var reporteVal;
    for (var i =0; i < tipoReporte.length; i++){
        if(tipoReporte[i].checked){
            reporteVal = tipoReporte[i].value;
            break;
        }
    }
    
    Proxy.reportes(reporteVal);
};
