function ActaDevolucion(idDevolucion, policia, decomiso, interesado, fecha) {
    this.ActaDevolucion(idDevolucion, policia, decomiso, interesado, fecha);
}

ActaDevolucion.prototype = {
    idDevolucion: 0, 
    policia: "", 
    decomiso: "", 
    interesado: "", 
    fecha: "",
    ActaDevolucion: function (idDevolucion, policia, decomiso, interesado, fecha) {
        this.idDevolucion = idDevolucion;
        this.policia = policia;
        this.decomiso = decomiso;
        this.interesado = interesado;
        this.fecha=  fecha;
    }
};

ActaDevolucion.from = function (plain) {
    acta = new ActaDevolucion(
    plain.idDevolucion, 
    plain.policia, 
    plain.decomiso,
    plain.interesado, 
    plain.fecha);
    return acta;
};

ActaDevolucion.to = function (acta) {
    return {
        _class: 'ActaDevolucion',
        idDevolucion: acta.idDevolucion, 
        policia: acta.policia, 
        decomiso: acta.decomiso,
        interesado: acta.interesado,
        fecha: acta.fecha
    };
};
 

