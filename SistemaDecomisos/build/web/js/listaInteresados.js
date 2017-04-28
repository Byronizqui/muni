
$(document).ready(function () {
    Proxy.listadoInteresados();
});

function dibujarTabla(dataJson) {
    $("#interesadosTable").html(function () {
        return "";
    });

    var head = $("<thead />");
    var row = $("<tr />");
    row.append($("<th><b>Cedula</b></th>"));
    row.append($("<th><b>Nombre</b></th>"));
    row.append($("<th><b>Primer Apellido</b></th>"));
    row.append($("<th><b>Segundo Apellido</b></th>"));
    row.append($("<th><b>ACCIÓN</th>"));
    head.append(function () {
        return row;
    });
    $("#interesadosTable").append(function () {
        return head;
    });
    //carga la tabla con el json devuelto
    for (var i = 0; i < dataJson.length; i++) {
        if (dataJson[i].nombre !== "NA")
            dibujarFila(dataJson[i]);
    }
    $("#interesadosTable").DataTable();
}

function dibujarFila(rowData) {
    var row = $("<tr />");
    row.append($("<td>" + rowData.identificacion + "</td>"));
    row.append($("<td>" + rowData.nombre + "</td>"));
    row.append($("<td>" + rowData.apellido1 + "</td>"));
    row.append($("<td>" + rowData.apellido2 + "</td>"));
    row.append($("<td class='text-center'><button class='btn btn-primary' onclick='verPerfilInteresado(" + rowData.identificacion + ");'><i class='fa fa-user'></i> Ver Perfil</button></td>"));
    $("#interesadosTable").append(function () {
        return row;
    });
}

function verPerfilInteresado(idInteresado) {
    /*sessionStorage.setItem()
     window.location.href="PerfilInteresado.jsp?id="+idInteresado;
     Proxy.getInteresado(idInteresado);*/
    if (typeof (Storage) !== "undefined") {
        sessionStorage.idInteresado = idInteresado;
    } else {
        alert("Sorry! No Web Storage support..");

    }
    window.location.href = "PerfilInteresado.jsp";
}