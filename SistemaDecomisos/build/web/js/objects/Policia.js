function Policia(idPolicia, identificacion, nombre, apellido1, apellido2) {
    this.Policia(idPolicia, identificacion, nombre, apellido1, apellido2);
}

Policia.prototype = {
    idPolicia: 0,
    identificacion: "",
    nombre: "",
    apellido1: "",
    apellido2: "",
    Policia: function (idPolicia, identificacion, nombre, apellido1, apellido2) {
        this.idPolicia = idPolicia;
        this.identificacion = identificacion;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
    }
};

Policia.from = function (plain) {
    policia = new Policia(
            plain.idPolicia,
            plain.identificacion,
            plain.nombre,
            plain.apellido1,
            plain.apellido2);
    return policia;
};

Policia.to = function (policia) {
    return {
        _class: 'Policia',
        idPolicia: policia.idPolicia,
        identificacion: policia.identificacion,
        nombre: policia.nombre,
        apellido1: policia.apellido1,
        apellido2: policia.apellido2,
    };
};
 