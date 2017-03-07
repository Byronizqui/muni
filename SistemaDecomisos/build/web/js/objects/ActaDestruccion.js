function ActaDestruccion(idDestruccion, fecha, /*policia,*/ testigo1, testigo2, lugar, encargado, decomiso) {
    this.ActaDestruccion(idDestruccion, fecha, /*policia,*/ testigo1, testigo2, lugar, encargado, decomiso);
}

ActaDestruccion.prototype = {
    idDestruccion: 0,
    fecha: "",
  //  policia: "",
    testigo1: "",
    testigo2: "",
    lugar: "",
    encargado: "",
    decomiso: "",
    ActaDestruccion: function (idDestruccion, fecha, /*policia,*/ testigo1, testigo2, lugar, encargado, decomiso) {
        this.idDestruccion = idDestruccion;
        this.fecha = fecha;
       // this.policia = policia;
        this.testigo1 = testigo1;
        this.testigo2 = testigo2;
        this.lugar = lugar;
        this.encargado = encargado;
        this.decomiso = decomiso;
    }
};

ActaDestruccion.from = function (plain) {
    acta = new ActaDestruccion(
            plain.idDestruccion,
            plain.fecha,
         //   plain.policia,
            plain.testigo1,
            plain.testigo2,
            plain.lugar,
            plain.encargado,
            plain.decomiso);
    return acta;
};

ActaDestruccion.to = function (acta) {
    return {
        _class: 'ActaDestruccion',
        idDestruccion: acta.idDestruccion,
        fecha: acta.fecha,
    //    policia: acta.policia,
        testigo1: acta.testigo1,
        testigo2: acta.testigo2,
        lugar: acta.lugar,
        encargado: acta.encargado,
        decomiso: acta.decomiso
    };
};

