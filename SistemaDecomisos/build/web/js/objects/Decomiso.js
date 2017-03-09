function Decomiso(idDecomiso, categoria, cantidad, observaciones) {
    this.Decomiso(idDecomiso, categoria, cantidad, observaciones);
}

Decomiso.prototype = {
    idDecomiso: 0, 
    categoria: "", 
    cantidad: 0,
    observaciones: "",
    Decomiso: function (idDecomiso, categoria, cantidad, observaciones) {
        this.idDecomiso = idDecomiso;
        this.categoria = categoria;
        this.cantidad = cantidad;
        this.observaciones = observaciones;
    }
};

Decomiso.from = function (plain) {
    decomiso = new Decomiso(
    plain.idDecomiso, 
    plain.categoria,
    plain.cantidad,
    plain.observaciones);
    return decomiso;
};

Decomiso.to = function (decomiso) {
    return {
        _class: 'Decomiso',
        idDecomiso: decomiso.idDecomiso, 
        categoria : decomiso.categoria,
        cantidad : decomiso.cantidad,
        observaciones: decomiso.observaciones
    };
};
 