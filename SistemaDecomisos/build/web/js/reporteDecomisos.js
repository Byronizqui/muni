/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* global Proxy */

var type = "r_deco";

$(document).ready(function () {
    $('#logout').click(function () {
        Proxy.userLogout("");
    });
    $('[data-rel="chosen"],[rel="chosen"]').chosen();
    $('input[name="daterange"]').daterangepicker({
        "locale": {
            "format": "DD/MM/YYYY",
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
            "firstDay": 01
        }
    });
    Proxy.listadoInteresados();
    Proxy.listadoPolicias();
    $("#btnSendData").click(function () {
        sendData();
    });

    $("#demo-form input[name=tipo_reporte]").on('change', function () {
        type = $('input[name=tipo_reporte]:checked', '#demo-form ').val();
        hideData(type);
    });
});

function dibujarTabla(dataJson) {
    for (var i = 0; i < dataJson.length; i++) {
        if (dataJson[i].nombre !== "NA") {
            var a = "<option value='" + dataJson[i].idInteresado + "'>" + dataJson[i].nombre +
                    " " + dataJson[i].apellido1 +
                    " " + dataJson[i].apellido2 + "</option>";
            $("#interesadoChosen").append(a);
        }

    }
    $('[data-rel="lInt"],[rel="lInt"]').chosen({width: "100%"});
    $('[data-rel="lInt"],[rel="lInt"]').chosen();
}

function hideData(tipo) {
    switch (tipo) {
        case "r_deco":
            {
                $("#lInteresados").show(1000);
                $('#lCategorias').show(1000);
                $('#lDistritos').show(1000);
            }
            break;
        case "r_des":
            {
                $("#lInteresados").hide(1000);
                $('#lCategorias').hide(1000);
                $('#lDistritos').hide(1000);
            }
            break;
        case "r_dev":
            {
                $('#lCategorias').hide(1000);
                $('#lDistritos').hide(1000);
                $("#lInteresados").show(1000);
            }
            break;
        case "r_dona":
            {
                $("#lInteresados").hide(1000);
                $('#lCategorias').hide(1000);
                $('#lDistritos').hide(1000);
            }
            break;
    }
}

function sendData() {
    switch (type) {
        case "r_deco":
            {
                sendDataDeco(type);
            }
            break;
        case "r_des":
            {
                sendDataDes(type);
            }
            break;
        case "r_dev":
            {
                sendDataDev(type);
            }
            break;
        case "r_dona":
            {
                sendDataDona(type);
            }
            break;
    }

}
;

function sendDataDeco(tipo) {
    var perecederos = document.getElementById("perecederos");
    var no_perecederos = document.getElementById("no_perecederos");
    var distrito = $("#distrito").val();
    var policia = $("#nomPoli").val();
    var interesado = $("#interesadoChosen").val();

    var where = "WHERE 1=1";


    if (perecederos.checked) {
        where += " and ( c.categoria = 'perecedero'";
    }
    if (no_perecederos.checked) {
        if (where !== "WHERE 1=1")
            where += " or c.categoria = 'no_perecederos' ";
        else {
            where += " and (c.categoria = 'no_perecederos' ";
        }
    }
    switch (distrito) {
        case "0":
            {
                if (where === "WHERE 1=1")
                    where += " and a.lugar = 0 ";
                else
                    where += ") and a.lugar = 0 ";
            }
            break;
        case "1":
            {
                if (where === "WHERE 1=1")
                    where += " and a.lugar = 1 ";
                else
                    where += ") and a.lugar = 1 ";
            }
            break;
        case "2":
            {
                if (where === "WHERE 1=1")
                    where += " and a.lugar = 2 ";
                else
                    where += ") and a.lugar = 2 ";
            }
            break;
        case "3":
            {
                if (where === "WHERE 1=1")
                    where += " and a.lugar = 3 ";
                else
                    where += ") and a.lugar = 3 ";
            }
            break;
        case "4":
            {
                if (where === "WHERE 1=1")
                    where += " and a.lugar = 4 ";
                else
                    where += ") and a.lugar = 4 ";
            }
            break;
        case "5":
            {
                if (where === "WHERE 1=1")
                    where += " and a.lugar = 5 ";
                else
                    where += ") and a.lugar = 5 ";
            }
            break;
        default :
        {
            if (where !== "WHERE 1=1")
                where += ")";
        }
    }

    if (policia !== "todos_policias") {
        where += " and a.IdPolicia = " + policia;
    }
    
    if (interesado !== "todos_interesados"){
        where += " and a.IdInteresado = " + interesado;
    }

    var fechaIni = $('#rangoFechas').data('daterangepicker').startDate.format('MM/DD/YYYY');
    var fechaFin = $('#rangoFechas').data('daterangepicker').endDate.format('MM/DD/YYYY');

    where += " and a.fecha between to_date('" + fechaIni + "', 'MM/DD/YYYY') and to_date('" + fechaFin + "', 'MM/DD/YYYY') ";

    Proxy.reportes(tipo, where);
}

function sendDataDes(tipo) {
    var policia = $("#nomPoli").val();
    
    var where = "WHERE 1=1";
    
    if (policia !== "todos_policias") {
        where += " and a.IdPolicia = " + policia;
    }

    var fechaIni = $('#rangoFechas').data('daterangepicker').startDate.format('MM/DD/YYYY');
    var fechaFin = $('#rangoFechas').data('daterangepicker').endDate.format('MM/DD/YYYY');

    where += " and a.fecha between to_date('" + fechaIni + "', 'MM/DD/YYYY') and to_date('" + fechaFin + "', 'MM/DD/YYYY') ";


    Proxy.reportes(tipo, where);
}

function sendDataDev(tipo){
    var policia = $("#nomPoli").val();
    var where = "WHERE 1=1";
    var interesado = $("#interesadoChosen").val();
    if (policia !== "todos_policias") {
        where += " and a.IdPolicia = " + policia;
    }
    
    if (interesado !== "todos_interesados"){
        where += " and a.IdInteresado = " + interesado;
    }

    var fechaIni = $('#rangoFechas').data('daterangepicker').startDate.format('MM/DD/YYYY');
    var fechaFin = $('#rangoFechas').data('daterangepicker').endDate.format('MM/DD/YYYY');

    where += " and a.fecha between to_date('" + fechaIni + "', 'MM/DD/YYYY') and to_date('" + fechaFin + "', 'MM/DD/YYYY') ";

    Proxy.reportes(tipo, where);
}

function sendDataDona(tipo){
    var policia = $("#nomPoli").val();
    
    var where = "WHERE 1=1";
    
    if (policia !== "todos_policias") {
        where += " and a.IdPolicia = " + policia;
    }

    var fechaIni = $('#rangoFechas').data('daterangepicker').startDate.format('MM/DD/YYYY');
    var fechaFin = $('#rangoFechas').data('daterangepicker').endDate.format('MM/DD/YYYY');

    where += " and a.fecha between to_date('" + fechaIni + "', 'MM/DD/YYYY') and to_date('" + fechaFin + "', 'MM/DD/YYYY') ";


    Proxy.reportes(tipo, where);
}