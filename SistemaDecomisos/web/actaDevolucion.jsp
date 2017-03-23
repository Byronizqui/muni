<%-- 
    Document   : actaDevolucion
    Created on : 02-feb-2017, 20:12:10
    Author     : Mery Zúñiga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Sistema de Gestión de Decomisos</title>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.css">
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
         <script>
            "<%
                String id = "";
                id = request.getParameter("id");
            %>"
                id= "<%=id%>";
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
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="form_devoluvion">
                        <!-- form input mask -->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Registrar Acta de Devolución</h2><small>Nº de Acta <label id="nActa_dev"></label></small>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="alert alert-danger" id="errorListDev" style="background: #fff">
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form id="acta_devolucion" role="form" class="form-horizontal form-label-left">
                                        <div class="form-group status"  id="groupNumActa">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Nº de Acta de Decomiso<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="number" id="num_acta_dec2" required="required" class="form-control col-md-7 col-xs-12" disabled>
                                            </div>
                                        </div> 
                                        <div class="form-group status" id="groupNombrePolicia">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nombre_policia">Nombre del Policía Municipal que realizó la devolución<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="nom_policiaDev" required="required" class="form-control col-md-7 col-xs-12">
                                                <span class="fa fa-search form-control-feedback right" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group status" id="groupIdInteresado">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="id_interesado">Identificación del interesado</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="id_interesadoDev" class="form-control col-md-7 col-xs-12">
                                                <span class="fa fa-indent form-control-feedback right" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group status"  id="groupFecha">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Fecha de la devolución<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="fecha_dev" class="date-picker form-control col-md-7 col-xs-12" type="date" min="2016-01-01" max="2100-01-01"  required>
                                                <span class="fa fa-calendar form-control-feedback right" aria-hidden="true"></span>
                                                <span class="alert-dismissible form-control-static"> Ejemplo 10/10/2016</span>
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>

                                        <span class="alert">¡Datos requeridos (*) incompletos! <br/>Complete la información correctamente</span>
                                        <div class="form-group">
                                            <div class="col-md-9 col-md-offset-3">
                                                <button type="button" class="btn btn-primary" id="enviarActa_Dev"><i class="fa fa-save"></i> Guardar </button>
                                                <button type="reset" class="btn btn-danger" id="cancelarActa_Dev"><i class="fa fa-remove"></i> Cancelar </button>
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
        <div id="exitoDev" class="modal fade" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header" style="color: #fff; background: #00aeef">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Éxito</h4>
                    </div>
                    <div class="modal-body">
                        <p>Se ingresó el acta de devolución en la base de datos.</p>
                    </div>
                </div>
            </div>
        </div>     


        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
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
        <script src="js/actaDevolucion.js"></script>
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
    </body>
</html>
