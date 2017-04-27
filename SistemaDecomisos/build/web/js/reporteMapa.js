/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    //$('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover(); 
    Proxy.obtenerCantidadDecomisos();
});
function calcularPorcentaje(cantidad,total){
    return cantidad*100/total;
}
function editarEstadistica(id,contenido){
    document.getElementById(id).setAttribute("data-content",contenido);
    document.getElementById(id+"b").setAttribute("data-content",contenido);
}

