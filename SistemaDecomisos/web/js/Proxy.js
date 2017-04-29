var Proxy = Proxy || {};
//------------------LOGIN LOGOUT-----------------------
Proxy.userLogin = function (criterio) {
    var loader = "<img src='media/images/ajax-loader-1.gif' alt='0' width='15' height='15'>";
    $("#login").html("Iniciando Sesi\u00F3n " + loader);

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=userLogin",
        type: "POST",
        data: "user=" + criterio,
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            if (data != null) {
                window.location.href = "home.jsp";
            } else {
                $("#login").html("Iniciar Sesi\u00F3n ");
                errorLogin();
            }
        }
    });
};
Proxy.userLogout = function (criterio) {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=userLogout",
        type: "POST",
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            window.location.href = "login.jsp";
        }
    });
};

Proxy.ultimaActa = function () {
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=ultimaActa",
        type: "POST",
        dataType: 'text',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            $('#nActa').html(" ");
            $('#nActa').append(data);
        }
    });
};
Proxy.ultimaActaDonacion = function () {
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=ultimaActaDonacion",
        type: "POST",
        dataType: 'text',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            $('#nActa_donac').html(" ");
            $('#nActa_donac').append(data);
        }
    });
};

Proxy.ultimaActaDestruccion = function () {
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=ultimaActaDestruccion",
        type: "POST",
        dataType: 'text',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            $('#nActa_dest').html(" ");
            $('#nActa_dest').append(data);
        }
    });
};

Proxy.ultimaActaDevolucion = function () {
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=ultimaActaDevolucion",
        type: "POST",
        dataType: 'text',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            $('#nActa_dev').html(" ");
            $('#nActa_dev').append(data);
        }
    });
};
Proxy.listadoFuncionarios = function () {
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=listadoFuncionarios",
        type: "POST",
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            var select = document.getElementById("listadoNombre");
            clearRoot(select);

            if (data != null) {
                funcionarios = new Contenedor();
                funcionarios.items = data;
                for (var i = 0; i < funcionarios.size(); i++) {
                    var opt = document.createElement('option');
                    funcionario = funcionarios.get(i);
                    opt.value = funcionario.idFuncionario;
                    opt.innerHTML = funcionario.nombre + " " + funcionario.apellido1 + " " + funcionario.apellido2;
                    select.appendChild(opt);
                }
            } else {
                var opt = document.createElement('option');
                opt.value = 0;
                opt.innerHTML = "Lista vacia";
                select.appendChild(opt);
            }
        }
    });
};
Proxy.listadoPolicias = function () {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=listadoPolicias",
        type: "POST",
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var d = "<option value='" + data[i].idPolicia + "'>" + data[i].nombre 
                            + " " + data[i].apellido1 + "</option>";
                    $("#nomPoli").append(d);
                    $("#nomPoli2").append(d);
                }
                $('[data-rel="chos"],[rel="chos"]').chosen({width: "100%"});
                $('[data-rel="chos"],[rel="chos"]').chosen();
            } else {
                var opt = document.createElement('option');
                opt.value = 0;
                opt.innerHTML = "Lista vacia";
                select.appendChild(opt);
            }

            
        }
    });
};

Proxy.actualizarInteresado = function (interesado) {
    var s = Interesado.to(JSON.parse(interesado));
    var ns = JSON.stringify(s, replacer);
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=actualizarInteresado",
        type: "POST",
        data: {
            interesado : ns
        },
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            if (data === 2) {
                //actaDecomisoModal();
                //Proxy.ultimaActa();
                window.location.href="listaInteresados.jsp";
            } else {
                alert("No se guardó");
                $("#login").html("Iniciar Sesi\u00F3n ");
                errorLogin();
            }
        }
    });
};

Proxy.listadoInteresadosCombo = function () {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=listadoInteresados",
        type: "POST",
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            if (data != null) {
                for (var i = 0; i < data.length; i++) {
                    var d = "<option value='" + data[i].idInteresado + "'>" + data[i].identificacion + " - " + data[i].nombre + " " + data[i].apellido1 + " " + data[i].apellido2 + "</option>";
                    $("#nomInteresado").append(d);
                }
                $('[data-rel="chos2"],[rel="chos2"]').chosen({width: "100%"});
                $('[data-rel="chos2"],[rel="chos2"]').chosen();
            } else {
                var opt = document.createElement('option');
                opt.value = 0;
                opt.innerHTML = "Lista vacia";
                select.appendChild(opt);
            }
        }
    });
};
Proxy.listadoUsuarios = function () {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=listadoUsuarios",
        type: "POST",
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            usuarios = new Contenedor();
            usuarios.items = data;
            usuariosTable = document.getElementById("usuariosTable");
            store(usuariosTable.modelId, usuarios);
            Table.refresh(usuariosTable, "");
        }
    });
};
Proxy.guardarUsuario = function (criterio) {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=guardarUsuario",
        type: "POST",
        data: "usuario=" + criterio,
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {

            var mensaje = "";
            var divError = document.getElementById("alertError");
            var divSuccess = document.getElementById("alertSuccess");
            divError.style.display = "none";
            divSuccess.style.display = "none";
            if (data != null) {
                var res = Number(data);
                switch (res) {
                    case 0:
                        mensaje = "Error en conexion al guardar.";
                        document.getElementById("labelAlertError").innerHTML = mensaje;
                        divError.style.display = "inline-table";
                        $("#alertError").delay(3000).hide(600);
                        break;
                    case 1:
                        mensaje = "Error al guardar, usuario existente";
                        document.getElementById("labelAlertError").innerHTML = mensaje;
                        divError.style.display = "inline-table";
                        $("#alertError").delay(3000).hide(600);
                        break;
                    case 2:
                        mensaje = "Usuario guardado correctamente";
                        document.getElementById("labelAlertSuccess").innerHTML = mensaje;
                        divSuccess.style.display = "inline-table";
                        $("#alertSuccess").show();
                        $("#alertSuccess").delay(3000).hide(600);
                        clearForm();
                        listadoUsuarios();
                        break;
                }
            } else {
                mensaje = "Error  al guardar, intente mas tarde";
                document.getElementById("labelAlertError").innerHTML = mensaje;
                divError.style.display = "inline-table";
                $("#alertError").delay(3000).hide(600);
            }
        }
    });
};

Proxy.actaDecomiso = function (criterio) {
    var s = ActaDecomiso.to(JSON.parse(criterio));
    var ns = JSON.stringify(s, replacer);
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=guardarActa",
        type: "POST",
        data: {
            actaDecomiso: ns
        },
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            if (data === 2) {
                actaDecomisoModal();
                Proxy.ultimaActa();
            } else {
                alert("No se guardó");
                $("#login").html("Iniciar Sesi\u00F3n ");
                errorLogin();
            }
        }
    });
};


Proxy.completePolicias = function () {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=listadoPolicias",
        type: "POST",
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            var names = [];
            for (var i = 0; i < data.length; i++) {
                names.push(data[i].nombre);
            }
            $('#id_policia').autocomplete({
                source: names
            });
            var appendTo = $("#id_policia").autocomplete("option", "source");
        }
    });
};

Proxy.actaDonacion = function (criterio) {
    var s = ActaDonacion.to(JSON.parse(criterio));
    var ns = JSON.stringify(s, replacer);
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=guardarActaDonacion",
        type: "POST",
        data: {
            actaDonacion: ns
        },
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            if (data === 2) {
                actaDonacionModal();
                Proxy.ultimaActaDonacion();
            } else {
                alert("No se guardó");
                $("#login").html("Iniciar Sesi\u00F3n ");
                errorLogin();
            }
        }
    });
};


Proxy.actaDevolucion = function (criterio) {
    var s = ActaDevolucion.to(JSON.parse(criterio));
    var ns = JSON.stringify(s, replacer);
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=guardarActaDevolucion",
        type: "POST",
        data: {
            actaDevolucion: ns
        },
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            if (data === 2) {
                actaDevolucionModal();
                Proxy.ultimaActaDevolucion();
            } else {
                alert("No se guardó");
                $("#login").html("Iniciar Sesi\u00F3n ");
                errorLogin();
            }
        }
    });
};

Proxy.reportes = function (p_tit, where) {
    $("#pdfFrame").remove();
    $("#pdfGenerated").append("<iframe id='pdfFrame' name='pdfFrame' width='560' height='315  src=''></iframe>");
    $("#pdfFrame").removeAttr("src");
    $("#pdfFrame").attr('src', "http://localhost:8080/SistemaDecomisos/Reportes?action=printPDF&tituloVal=" 
            + p_tit  + "&data=" + where);

};

Proxy.actaDestruccion = function (criterio) {
    var s = ActaDestruccion.to(JSON.parse(criterio));
    var ns = JSON.stringify(s, replacer);
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=guardarActaDestruccion",
        type: "POST",
        data: {
            actaDestruccion: ns
        },
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            if (data === 2) {
                actaDestruccionModal();
                Proxy.ultimaActaDestruccion();
            } else {
                alert("No se guardó");
                $("#login").html("Iniciar Sesi\u00F3n ");
                errorLogin();
            }
        }
    });
};

//************************************************************************
Proxy.listadoInteresados = function () {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=listadoInteresados",
        type: "POST",
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            /*usuarios = new Contenedor();
             usuarios.items = data;
             usuariosTable = document.getElementById("usuariosTable");
             store(usuariosTable.modelId, usuarios);
             Table.refresh(usuariosTable, "");
             */
            dibujarTabla(data);
        }
    });
};

Proxy.getInteresado = function (idInteresado) {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=getInteresado",
        type: "POST",
        data: "cedula=" + idInteresado,
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            /*usuarios = new Contenedor();
             usuarios.items = data;
             usuariosTable = document.getElementById("usuariosTable");
             store(usuariosTable.modelId, usuarios);
             Table.refresh(usuariosTable, "");
             */
            displayInteresado(data);
        }
    });
};
//*************************************************************************
Proxy.listaDecomisos = function () {

    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=listaDecomisos",
        type: "POST",
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {
            actasDecomisos = new Contenedor();
            actasDecomisos.items = data;
            var table = $('#decomisosTable').dataTable();
            for (i = 0; i < actasDecomisos.size(); i++) {
                var actaDecomiso = actasDecomisos.get(i);
                table.fnAddData([
                    actaDecomiso.idDecomiso,
                    actaDecomiso.fecha,
                    actaDecomiso.hora,
                    obtenerDistrito(actaDecomiso.lugar.distrito.idDistrito),
                    actaDecomiso.policia.nombre + " " + actaDecomiso.policia.apellido1 + " " + actaDecomiso.policia.apellido2,
                    actaDecomiso.interesado.nombre + " " + actaDecomiso.interesado.apellido1 + " " + actaDecomiso.interesado.apellido2,
                    '   <div style="display:inline-block;">  ' +
                            '   <button class="btn-donacion">Acta Donación</button>  ' +
                            '  </div>  ' +
                            '   <div style="display:inline-block;">  ' +
                            '   <button class="btn-devolucion">Acta Devolución</button>  ' +
                            '  </div>  ' +
                            '   <div style="display:inline-block;">  ' +
                            '   <button class="btn-destruccion">Acta Destrucción</button>  ' +
                            '  </div>  '


                ]);
            }

        }
    });
};
function obtenerDistrito(index) {
    var distrito = "Heredia";
    if (index == 1)
        distrito = "Mercedes";
    else if (index == 2)
        distrito = "San Francisco";
    else if (index == 3)
        distrito = "Ulloa";
    else if (index == 4)
        distrito = "Vara Blanca";
    return distrito;
}
Proxy.obtenerCantidadDecomisos = function () {
    $.ajax({
        url: "/SistemaDecomisos/Servlet?action=obtenerCantidadDecomisos",
        type: "POST",
        dataType: 'json',
        contentType: "application/x-www-form-urlencoded",
        success: function (data) {//va a recibir una lista
            /*
             * 0:heredia
             * 1:mercedes
             * 2:san francisco
             * 3:ulloa
             * 4:vara blanca
             **/
            var arreglo = data;
            var total = 0;
            
            for(j = 0;j<arreglo.length;j++){
                var item = arreglo[j];
                if(item == null){
                    total +=0;
                }else{
                    total+=item;
                }
            }
            for(i = 0;i<arreglo.length;i++){
                var item = arreglo[i];
                var cantidad = 0;
                if(item !=null)
                    cantidad = item;
                var porcentaje = Math.round(calcularPorcentaje(cantidad,total));
               
                var contenido = "Cantidad: "+cantidad+"\tPorcentaje: "+porcentaje+"%";
                editarEstadistica(i,contenido);
                $('[data-toggle="popover"]').popover(); 
            }
        }
    });
};