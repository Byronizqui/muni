
$(document).ready(function () {
    //$("#decomisosTable").dataTable();
    Proxy.listaDecomisos();
    
    $("#decomisosTable tbody").on("click", 'button[class="btn-donacion"]', function (e) {
        var $row = $(this).closest("tr");
        var n = $row[0];
        var idDecomiso = n.childNodes[0].innerHTML;
        redireccionar("actaDonacion.jsp?id="+idDecomiso);
        // Prevent click event from propagating to parent
        e.stopPropagation();
    });
    $("#decomisosTable tbody").on("click", 'button[class="btn-devolucion"]', function (e) {
        var $row = $(this).closest("tr");
        var n = $row[0];
        var idDecomiso = n.childNodes[0].innerHTML;
        redireccionar("actaDevolucion.jsp?id="+idDecomiso);
        // Prevent click event from propagating to parent
        e.stopPropagation();
    });
    $("#decomisosTable tbody").on("click", 'button[class="btn-destruccion"]', function (e) {
        var $row = $(this).closest("tr");
        var n = $row[0];
        var idDecomiso = n.childNodes[0].innerHTML;
        redireccionar("actaDestruccion.jsp?id="+idDecomiso);
        // Prevent click event from propagating to parent
        e.stopPropagation();
    });

});
function redireccionar(direccion){
    window.location.href = direccion;
}
