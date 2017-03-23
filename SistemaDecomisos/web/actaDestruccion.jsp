<%-- 
    Document   : actaDestruccion
    Created on : 30-ene-2017, 17:58:36
    Author     : Mery Zúñiga
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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/chosen.css">
        <!-- Font Awesome -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="css/nprogress.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>

        <!-- Custom Theme Style -->
        <link href="css/custom.min.css" rel="stylesheet">
        <link href="css/forms.css" rel="stylesheet">
        <link rel="shortcut icon" href="media/images/logo2.ico" type="image/x-icon" />


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
                                    <h2>Registrar Acta de Destrucción </h2><small>Nº de Acta <label id="nActa_dest"></label></small>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="alert alert-danger" id="errorListDe" style="background: #fff">
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form id="acta_destruccion" role="form" class="form-horizontal form-label-left">
                                        <div class="form-group status"  id="groupFecha">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Fecha en la que se realiza la destrucción<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="fechaDes" class="date-picker form-control col-md-7 col-xs-12" type="text" required>
                                                <span class="fa fa-calendar form-control-feedback right" aria-hidden="true"></span>
                                                <span class="alert-dismissible form-control-static"> Ejemplo 10/10/2016</span>
                                            </div>
                                        </div>
                                        <div class="form-group status">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nombre_policia">Nombre del Policía Municipal a cargo de la destrucción<span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div id="groupNombrePolicia">
                                                        <input type="text" id="nom_policiaDes" class="form-control col-md-7 col-xs-12" required="required">
                                                        <span class="fa fa-search form-control-feedback right" aria-hidden="true"></span>
                                                    </div>
                                                </div>
                                        </div>
                                        
                                        <div class="form-group status">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="distrito">Distrito/dirección específica donde se realiza la destrucción<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <div class="col-md-5">
                                                    <select class="form-control" data-rel="chosen" name="distrito" id="distritoDes">
                                                        <option value="heredia">Heredia</option>
                                                        <option value="mercedes">Mercedes</option>
                                                        <option value="san_frencisco">San Francisco</option>
                                                        <option value="ulloa">Ulloa</option>
                                                        <option value="vara_blanca">Vara Blanca</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-7" id="groupLugar">
                                                    <textarea required class="form-control" id="direccionDes"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group status" id="groupNombreEncargado">
                                            <label class="control-label  col-md-3 col-sm-3 col-xs-12" for="nombre_interesado">Nombre del encargado de la destrucción </label>              
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="nombre_encargado" required class="form-control col-md-7 col-xs-12">
                                                <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        </br>
                                        <span class="section">Testigos</span>
                                        <div class="form-group">
                                            <table class="table" id="tablaTestigos">
                                                <thead>
                                                    <tr>
                                                        <th class="col-md-3">Nombre</th>
                                                        <th class="col-md-3">1º Apellido</th>
                                                        <th class="col-md-3">2º Apellido</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><input type="text" class="form-control" id="nombre_testigo1"/></td>
                                                        <td><input type="text" class="form-control" id="apellido1_testigo1"/></td>
                                                        <td><input type="text" class="form-control" id="apellido2_testigo1"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input type="text" class="form-control" id="nombre_testigo2"/></td>
                                                        <td><input type="text" class="form-control" id="apellido1_testigo2"/></td>
                                                        <td><input type="text" class="form-control" id="apellido2_testigo2"/></td>
                                                     </tr>
                                                </tbody>
                                            </table>
                                            <div class="ln_solid"></div>
                                        </div>
                                        <span class="alert">¡Datos requeridos (*) incompletos! <br/>Complete la información correctamente</span>
                                        <div class="form-group">
                                            <div class="col-md-9 col-md-offset-3">
                                                <button type="button" class="btn btn-primary" id="enviarActa_Des"><i class="fa fa-save"></i> Guardar </button>
                                                <button type="reset" class="btn btn-danger" id="cancelarActa_Des"><i class="fa fa-remove"></i> Cancelar </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 
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
        
        <div id="exitoDes" class="modal fade" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header" style="color: #fff; background: #00aeef">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Éxito</h4>
                    </div>
                    <div class="modal-body">
                        <p>Se ingresó el acta de destrucción en la base de datos.</p>
                    </div>
                </div>
            </div>
        </div>     
    </body>
    
    <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="js/chosen.jquery.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="js/fastclick.js"></script>
        <!-- NProgress -->
        <script src="js/nprogress.js"></script>
        <!--Date-->
        <script src="js/daterangepicker.js"></script>
        <script src="js/moment.min.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="js/custom.js"></script>
        <script src="js/home.js"></script>
        <script src="js/Utils.js"></script>
        <script src="js/forms.js"></script>
        <script src="js/multifield.js"></script>
        <script src="js/validator.js"></script>
        <script src="js/actaDestruccion.js"></script>
        <script src="js/Proxy.js"></script>
        <script src="js/BaseDatos.js"></script>     
        <script src="js/objects/Contenedor.js"></script>
        <script src="js/objects/ActaDecomiso.js"></script>
        <script src="js/objects/ActaDonacion.js"></script>
        <script src="js/objects/ActaDevolucion.js"></script>       
        <script src="js/objects/ActaDestruccion.js"></script>
        <script src="js/objects/Decomiso.js"></script>
        <script src="js/objects/Distrito.js"></script>
        <script src="js/objects/Funcionario.js"></script>
        <script src="js/objects/Interesado.js"></script>
        <script src="js/objects/Lugar.js"></script>
        <script src="js/objects/Persona.js"></script>
        <script src="js/objects/Policia.js"></script>
        <script src="js/objects/Testigo.js"></script>  
        <script src="js/objects/Usuario.js"></script>   
</html>
