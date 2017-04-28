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
    $("#btnSendData").click(function () {
        sendData();
    });
});

function dibujarTabla(dataJson) {
    for (var i = 0; i < dataJson.length; i++) {
        if (dataJson[i].nombre !== "NA") {
            var a = "<option value='" + dataJson[i].identificacion + "'>" + dataJson[i].nombre +
                    " " + dataJson[i].apellido1 +
                    " " + dataJson[i].apellido2 + "</option>";
            $("#interesadoChosen").append(a);
        }

    }
    $('[data-rel="lInt"],[rel="lInt"]').chosen({width: "100%"});
    $('[data-rel="lInt"],[rel="lInt"]').chosen();
}

function sendData() {
    var tipoReporte = document.getElementsByName("tipo_reporte");
    var reporteVal;
    var perecederos = document.getElementById("perecederos");
    var no_perecederos = document.getElementById("no_perecederos");
    var distrito = $("#distrito").val();

    var where = "WHERE 1=1";
    for (var i = 0; i < tipoReporte.length; i++) {
        if (tipoReporte[i].checked) {
            reporteVal = tipoReporte[i].value;
            break;
        }
    }

    if (perecederos.checked) {
        where += " and ( c.categoria = 'perecederos' ";
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
            default :
            {
                if (where !== "WHERE 1=1")
                    where += ")";
            }
        }





    Proxy.reportes(reporteVal, where);
}
;
