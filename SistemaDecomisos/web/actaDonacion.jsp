<%-- 
    Document   : actaDonacion
    Created on : 18-ene-2017, 13:01:18
    Author     : Mery Zúñiga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <!-- Font Awesome -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="css/nprogress.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


        <!-- Custom Theme Style -->
        <link href="css/custom.min.css" rel="stylesheet">
        <link href="css/forms.css" rel="stylesheet">
        <link rel="shortcut icon" href="media/images/logo2.ico" type="image/x-icon" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
        <link href="fileinput/themes/explorer/theme.css" media="all" rel="stylesheet" type="text/css"/> 

        <script>
            "<%
                String id = "";
                id = request.getParameter("id");
            %>"
            id = "<%=id%>";
        </script>
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

                <!--page content-->
                <div class="right_col" role="main">
                    <div class="form_decomiso">
                        <!-- form input mask -->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Registrar Acta de Donación</h2><small>Nº de Acta <label id="nActa_donac"></label></small>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="alert alert-danger" id="errorListDon" style="background: #fff">
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form id="acta_donacion" role="form" class="form-horizontal form-label-left">
                                        <div class="form-group status"  id="groupNumActa">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Nº de Acta de Decomiso<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="number" id="num_acta_dec1" required="required" class="form-control col-md-7 col-xs-12" disabled>
                                            </div>
                                        </div>

                                        <div class="form-group status"  id="groupFecha_Don">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Fecha de la donación<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="fecha_don" class="date-picker form-control col-md-7 col-xs-12" type="text" required>
                                                <span class="fa fa-calendar form-control-feedback right" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group status" id="groupInstitucion">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="institucion">Nombre de la Institución beneficiada<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="institucion" required="required" class="form-control col-md-7 col-xs-12">
                                                <span class="fa fa-institution form-control-feedback right" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group status">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nombre_policia">Nombre del Policía Municipal a cargo de la donación<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <div id="groupNombrePolicia">
                                                    <select class="form-control" data-rel="chos" name="nomPol" id="nomPoli">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="groupDonacion" class="form-group status">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="donacion">Detalles de la donación<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-xs-10" id="groupDonacion">
                                                <textarea required class="form-control" id="detallesDona" type="text"></textarea>
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>

                                        <span class="alert">¡Datos requeridos (*) incompletos! <br/>Complete la información correctamente</span>
                                        <div class="form-group">
                                            <div class="col-md-9 col-md-offset-3">
                                                <button type="button" class="btn btn-primary" id="enviarActa_Don"><i class="fa fa-save"></i> Guardar</button>
                                                <button type="reset" class="btn btn-danger" id="cancelarActa_Don"><i class="fa fa-remove"></i> Cancelar </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- page content -->


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
        <div id="exitoD" class="modal fade" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header" style="color: #fff; background: #00aeef">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Éxito</h4>
                    </div>
                    <div class="modal-body">
                        <p>Se ingresó el acta de donación en la base de datos.</p>
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
    <script src="js/jquery.maskedinput.min.js"></script>
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
    <script src="js/actaDonacion.js"></script>
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
    <script src="fileinput/js/plugins/sortable.js" type="text/javascript"></script>
    <script src="fileinput/js/fileinput.js" type="text/javascript"></script>
    <script src="fileinput/js/locales/es.js" type="text/javascript"></script> 
    <script src="fileinput/themes/explorer/theme.js" type="text/javascript"></script>
</html>
