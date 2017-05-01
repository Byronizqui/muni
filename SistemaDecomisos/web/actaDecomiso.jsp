<%-- 
Document   : actaDecomiso
Created on : 26-oct-2016, 11:52:35
Author     : Mery Zúñiga
aaaaaaaaaaaaa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Sistema de Gestión de Decomisos</title>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/chosen.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/timepicki.css">
        <!-- Font Awesome -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <script src="js/objects/ActaDecomiso.js"></script>
        <link href="css/nprogress.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


        <!-- Custom Theme Style -->
        <link href="css/custom.min.css" rel="stylesheet">
        <link href="css/forms.css" rel="stylesheet">
        <link rel="shortcut icon" href="media/images/logo2.ico" type="image/x-icon" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
        <link href="fileinput/themes/explorer/theme.css" media="all" rel="stylesheet" type="text/css"/> 
        <style>
            .kv-avatar .file-preview-frame,.kv-avatar .file-preview-frame:hover {
                margin: 0;
                padding: 0;
                border: none;
                box-shadow: none;
                text-align: center;
            }
            .kv-avatar .file-input {
                display: table-cell;
                max-width: 220px;
            }
        </style>
    </head>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title" style="border: 0;">
                            <a href="home.jsp" class="site_title"><img src="media/images/logo_home.png"></a>
                        </div>
                        <div class="clearfix"></div>
                        <%@ include file="Fragmentos/side.jspf" %>
                    </div>
                </div>

                <!-- top navigation -->
                <div class="top_nav">
                    <div class="nav_menu">
                        <nav>
                            <div class="nav toggle">
                                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                            </div>
                            <%@ include file="Fragmentos/header.jspf" %>
                        </nav>
                    </div>
                </div>
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="form_decomiso">
                        <!-- form input mask -->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Registrar Acta de Decomiso</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="alert alert-danger" id="errorList" style="background: #fff">
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form id="acta_decomiso" role="form" class="form-horizontal form-label-left">
                                        <div class="form-group status" id="groupNumActa">
                                            <label class="control-label  col-md-3 col-sm-3 col-xs-12" for="numActa">Nº de Acta </label>              
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="number" id="numActa" >
                                            </div>
                                        </div>
                                        <div class="form-group status">
                                            <label class="control-label col-sm-3 col-xs-12" for="distrito">Distrito<span class="required">*</span>
                                            </label>
                                            <div class="control-label">
                                                <div class="col-md-2 ">
                                                    <select class="form-control" data-rel="chosen" name="distrito" id="distrito">
                                                        <option value="heredia">Heredia</option>
                                                        <option value="mercedes">Mercedes</option>
                                                        <option value="san_frencisco">San Francisco</option>
                                                        <option value="ulloa">Ulloa</option>
                                                        <option value="vara_blanca">Vara Blanca</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="groupDireccion" class="form-group status">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="distrito">Dirección específica del decomiso<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-xs-10" id="groupLugar">
                                                <textarea style="text-transform: uppercase" required class="form-control" id="direccion"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group status"  id="groupFecha">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Fecha del decomiso<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="datepicker">
                                            </div>
                                        </div>
                                        <div class="form-group status"  id="groupHora">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Hora del decomiso<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="horaPicker" class="time_element">
                                            </div>
                                        </div>
                                        <div class="form-group status">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nombre_policia">Nombre del Policía Municipal encargado<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select class="form-control" data-rel="chos" name="nomPoli" id="nomPoli">

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group status" id="groupNombreTestigo">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nombre_testigo">Tipo de testigo</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select class="form-control col-md-7 col-xs-12" name="cars" id="nombre_testigo">
                                                    <option value="vacio">No hay testigo</option>
                                                    <option value="civil">Civil</option>
                                                    <option value="policia">Policia</option>
                                                </select>
                                                <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group status" hidden id="info_testigo_policia">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="info_policia">Nombre del Policía Municipal testigo<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select class="form-control chosen-select" data-rel="chos" name="nomPoli3" id="nomPoli3">

                                                </select>
                                            </div>
                                        </div>
                                        <div id="info_testigo_civil" hidden> 
                                            <div class="form-group status" id="nombre_civil">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nombre_testigo">Nombre del testigo<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input style="text-transform: uppercase" type="text" id="nombre_testigoText" required="required" class="form-control col-md-7 col-xs-12">
                                                    <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group status" id="id_civil">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="id_testigo">Identificación del testigo<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="id_testigo" required class="form-control col-md-7 col-xs-12">
                                                    <span class="fa fa-indent form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group status" id="apellido1Civil">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="apellido1Civil">Primer apellido del testigo<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input style="text-transform: uppercase" type="text" id="id_testigo" required class="form-control col-md-7 col-xs-12">
                                                    <span class="fa fa-indent form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group status" id="apellido2Civil">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="id_testigo">Segundo apellido del testigo<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input style="text-transform: uppercase" type="text" id="id_testigo" required class="form-control col-md-7 col-xs-12">
                                                    <span class="fa fa-indent form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="x_title">
                                            <div class="clearfix"></div>
                                        </div>
                                        <span class="section">Datos del Interesado</span>
                                        <div class="col-md-3 " id="chosenInt">
                                            <label>Interesado: </label>
                                            <select class="form-control" data-rel="lInt" name="interesadoChosen" id="interesadoChosen">
                                            </select>
                                        </div>
                                        <div id="addInte" class="col-md-3">
                                            <label>Nuevo interesado </label><br/>
                                            <button id="addInteresado" type="button" class="btn btn-info"><i class="fa fa-user"></i></button>
                                        </div>
                                        <button id="backInte" type="button" class="hidden btn btn-toolbar btn-danger">Cambiar a interesado conocido</button>
                                        <div id="datosInteresado" hidden="hidden">
                                            <div class="form-group status" id="groupFotoInteresado">           
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <div id="kv-avatar-errors-2" class="center-block" style="width:800px;display:none"></div>
                                                    <div class="kv-avatar center-block" style="width:200px">
                                                        <input id="avatar-2" name="avatar-2" type="file" class="file-loading">
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="form-group status" id="groupIdInteresado">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="id_interesado">Identificación del interesado</label>
                                                <div class="col-md-6 col-sm-6">
                                                    <label class="radio-inline">
                                                        <input id="nac" type="radio" name="idI" value="nac" checked="checked"> Nacional<br>
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input id="ext" type="radio" name="idI" value="ext"> Extranjero<br>
                                                    </label>
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input type="text" id="id_interesado" class="form-control col-md-7 col-xs-12">
                                                    <span class="fa fa-indent form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group status" id="groupApellido1Interesado">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="apellido1_interesado">Primer Apellido </label>              
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input style="text-transform: uppercase" type="text" id="apellido1_interesado" class="form-control col-md-7 col-xs-12">
                                                    <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group status" id="groupApellido2Interesado">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="apellido2_interesado">Segundo Apellido </label>              
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input style="text-transform: uppercase" type="text" id="apellido2_interesado" class="form-control col-md-7 col-xs-12">
                                                    <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="form-group status" id="groupNombreInteresado">
                                                <label class="control-label  col-md-3 col-sm-3 col-xs-12" for="nombre_interesado">Nombre </label>              
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input style="text-transform: uppercase" type="text" id="nombre_interesado" class="form-control col-md-7 col-xs-12">
                                                    <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>

                                            <div class="form-group status"  id="groupFechaNac">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="fecha_Nac">Fecha de nacimiento del interesado</label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <input id="fechaNac" class="form-control col-md-7 col-xs-12" type="text">
                                                    <span class="fa fa-calendar form-control-feedback right" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            
                                        </div>

                                        <!-- Cabecera de la tabla -->
                                        <div class="x_title">
                                            <div class="clearfix"></div>


                                        </div>
                                        <span class="section">Datos de Decomisos</span>
                                        <div class="form-group">
                                            <table class="table table-condensed" id="tabla">
                                                <thead>
                                                    <tr>
                                                     
                                                        <th class="col-md-3">Categoría</th>
                                                        <th class="col-md-3">Cantidad</th>
                                                        <th class="col-md-3">Observaciones</th>
                                                        <th class="col-md-3">&nbsp;</th>
                                                    </tr>
                                                </thead>
                                                <!-- Cuerpo de la tabla con los campos -->
                                                <tbody>
                                                    <!-- fila base para clonar y agregar al final -->
                                                    <tr>
                                                        
                                                        <td>
                                                            <select class="form-control" name="cate" id="categoria">
                                                                <option selected="selected" value="discos">Discos</option>
                                                                <option value="licor">Licor</option>
                                                                <option value="cigarrillos">Cigarrillos</option>
                                                                <option value="patinetas">Patinetas</option>
                                                                <option value="perecederos">Perecedero</option>
                                                                <option value="no_perecederos">No Perecedero</option>
                                                                <option value="varios">Varios</option>
                                                            </select>
                                                        </td>
                                                        <td><input required type="number" min="1" class="form-control cantidad"/></td>
                                                        <td><textarea style="text-transform: uppercase" required id="proobs" class="resizable_textarea form-control observaciones"></textarea></td>
                                                        <td class="eliminar" ><button type="button" class="btn btn-danger"><i class="fa fa-remove"></i></button></td>
                                                    </tr>
                                                    <!-- fin de código: fila base -->
                                                    <!-- Fila de ejemplo -->
                                                    <tr>
                                                        
                                                        <td>
                                                            <select class="form-control" name="cate" id="categoria">
                                                                <option selected="selected" value="discos">Discos</option>
                                                                <option value="licor">Licor</option>
                                                                <option value="perecederos">Cigarrillos</option>
                                                                <option value="patinetas">Patinetas</option>
                                                                <option value="perecederos">Perecedero</option>
                                                                <option value="no_perecederos">No Perecedero</option>
                                                                <option value="perecederos">Varios</option>
                                                            </select>
                                                        </td>
                                                        <td><input required type="number" min="1" class="form-control cantidad"/></td>
                                                        <td><textarea style="text-transform: uppercase" required id="proobs" class="resizable_textarea form-control observaciones"></textarea></td>
                                                        <td class="eliminar" ><button type="button" class="btn btn-danger"><i class="fa fa-remove"></i></button></i></td>
                                                    </tr>

                                                    <!-- fin de código: fila de ejemplo -->
                                                </tbody>
                                            </table>
                                            <div class="ln_solid"></div>
                                            <button type="button" class="btn btn-dark" id="agregar"><i class="fa fa-plus"> Agregar fila</i></button>

                                        </div>

                                        <!-- Botón para agregar filas -->

                                        <div class="form-group">
                                            <label class="col-md-3 col-sm-3 col-xs-12">Observaciones</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <textarea style="text-transform: uppercase" id="observaciones" class="resizable_textarea form-control"></textarea>
                                                <span class="fa fa-edit form-control-feedback right" aria-hidden="true"></span>
                                            </div>
                                        </div>

                                        <div class="ln_solid"></div>

                                        <span class="alert">¡Datos requeridos (*) incompletos! <br/>Complete la información correctamente</span>
                                        <div class="form-group">
                                            <div class="col-md-9 col-md-offset-3">
                                                <button type="button" class="btn btn-primary" id="enviarActa_Dec"><i class="fa fa-save"></i> Guardar </button>
                                                <button type="reset" class="btn btn-danger" id="cancelarActa_Dec"><i class="fa fa-remove"></i> Cancelar </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>       
                    </div>
                </div>


                <!-- /page content -->
                <!--uno, dos y tres ********  -->

                <!-- footer content -->
                <footer>
                    <div class="pull-right">
                        Municipalidad de Heredia. 2016 Todos los derechos reservados.
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
            </div>
        </div>
        <div id="exito" class="modal fade" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header" style="color: #fff; background: #00aeef">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Éxito</h4>
                    </div>
                    <div class="modal-body">
                        <p>Se ingresó el acta de decomiso en la base de datos.</p>
                    </div>
                </div>
            </div>
        </div>

        <!--
<div id="modalErrores" class="modal fade" role="dialog">
<div class="modal-dialog ">
<div class="modal-content">
    <div class="modal-header" style="background: #f00; color: #000">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Atención, se presentaron los siguientes errores: </h4>
    </div>
    <div class="modal-body" id="errorList">
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
    </div>
</div>
</div>
</div>
        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="js/chosen.jquery.js"></script>
        <script src="js/jquery.maskedinput.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="js/fastclick.js"></script>
        <!-- NProgress -->
        <script src="js/nprogress.js"></script>
        <!--Date-->
        <script src="js/timepicki.js"></script>
        <script src="js/daterangepicker.js"></script>
        <script src="js/moment.min.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="js/custom.js"></script>
        <script src="js/home.js"></script>
        <script src="js/Utils.js"></script>
        <script src="js/forms.js"></script>
        <script src="js/multifield.js"></script>
        <script src="js/validator.js"></script>
        <script src="js/actaDecomiso.js"></script>
        <script src="js/Proxy.js"></script>
        <script src="js/login.js"></script>
        <script src="js/BaseDatos.js"></script>        

        <script src="js/objects/ActaDonacion.js"></script>
        <script src="js/objects/Contenedor.js"></script>
        <script src="js/objects/ActaDestruccion.js"></script>
        <script src="js/objects/ActaDevolucion.js"></script>
        <script src="js/objects/Decomiso.js"></script>
        <script src="js/objects/Distrito.js"></script>
        <script src="js/objects/Funcionario.js"></script>
        <script src="js/objects/Interesado.js"></script>
        <script src="js/objects/Lugar.js"></script>
        <script src="js/objects/Persona.js"></script>
        <script src="js/objects/Policia.js"></script>
        <script src="js/objects/Testigo.js"></script>  
        <script src="js/objects/Usuario.js"></script>  
        <script src="fileinput/js/plugins/sortable.js" type="text/javascript"></script>
        <script src="fileinput/js/fileinput.js" type="text/javascript"></script>
        <script src="fileinput/js/locales/es.js" type="text/javascript"></script> 
        <script src="fileinput/themes/explorer/theme.js" type="text/javascript"></script>
    </body>
</html>

