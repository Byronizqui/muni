function ActaDonacion(idDonacion, fecha, institucion, policia, decomiso, detalles) {
    this.ActaDonacion(idDonacion, fecha, institucion, policia, decomiso, detalles);
}

ActaDonacion.prototype = {
    idDonacion: 0, 
    fecha: "",
    institucion: "",
    policia: "",
    decomiso: "",
    detalles: "",
    ActaDonacion: function (idDonacion,fecha, institucion, policia, decomiso, detalles) {
        this.idDonacion = idDonacion;
        this.fecha = fecha;
        this.institucion = institucion;
        this.policia = policia;
        this.decomiso = decomiso;
        this.detalles = detalles;
    }
};


ActaDonacion.from = function (plain) {
    acta = new ActaDonacion(
    plain.idDonacion,
    plain.fecha,
    plain.institucion, 
    plain.policia,
    plain.decomiso,
    plain.detalles);
    return acta;
};

ActaDonacion.to = function (acta) {
    return {
        _class: 'ActaDonacion',
        idDonacion: acta.idDonacion, 
        fecha: acta.fecha,
        institucion: acta.institucion, 
        policia: acta.policia, 
        decomiso: acta.decomiso,
        detalles: acta.detalles
    };
};