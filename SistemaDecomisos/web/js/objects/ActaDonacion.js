function ActaDonacion(idDonacion, institucion, policia, decomiso) {
    this.ActaDonacion(idDonacion, institucion, policia, decomiso);
}

ActaDonacion.prototype = {
    idDonacion: 0, 
    institucion: "",
    policia: "",
    decomiso: "",
    ActaDonacion: function (idDonacion, institucion, policia, decomiso) {
        this.idDonacion = idDonacion;
        this.institucion = institucion;
        this.policia = policia;
        this.decomiso = decomiso;
    }
};


ActaDonacion.from = function (plain) {
    acta = new ActaDonacion(
    plain.idDonacion,
    plain.institucion, 
    plain.policia,
    plain.decomiso);
    return acta;
};

ActaDonacion.to = function (acta) {
    return {
        _class: 'ActaDonacion',
        idDonacion: acta.idDonacion, 
        institucion: acta.institucion, 
        policia: acta.policia, 
        decomiso: acta.decomiso
    };
};