<%-- 
    Document   : PerfilInteresado
    Created on : 21/03/2017, 03:47:55 PM
    Author     : Fabio
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
        <link rel="stylesheet" href="css/jquery.dataTables.min.css">

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

                <div class="right_col" role="main">
                    <div class="form_decomiso">
                        <!-- form input mask -->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                               
                                <div class="alert alert-danger" id="errorList" style="background: #fff"></div>
                                <div class="x_content">
                                    <br />
                                    <button class="btn btn-info" id="btn-editar"><i class="fa fa-edit"></i> Editar Perfil</button>
                                    <form id="perfil-interesado" role="form" class="form-horizontal form-label-left">
                                        
                                        <div class="x_title">
                                            <div class="clearfix"></div>
                                        </div>
                                        <span class="section">Datos del Interesado</span>
                                        
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
                                                <input type="text" id="apellido1_interesado" class="form-control col-md-7 col-xs-12">
                                                <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group status" id="groupApellido2Interesado">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="apellido2_interesado">Segundo Apellido </label>              
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="apellido2_interesado" class="form-control col-md-7 col-xs-12">
                                                <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group status" id="groupNombreInteresado">
                                            <label class="control-label  col-md-3 col-sm-3 col-xs-12" for="nombre_interesado">Nombre </label>              
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="nombre_interesado" class="form-control col-md-7 col-xs-12">
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
                                        <span class="alert">¡Datos requeridos (*) incompletos! <br/>Complete la información correctamente</span>
                                        <div class="form-group">
                                            <div class="col-md-9 col-md-offset-3">
                                                <button class="btn btn-primary" id="guardar_interesado"><i class="fa fa-save"></i> Guardar </button>
                                                <button type="reset" class="btn btn-danger" id="cancelar_interesado"><i class="fa fa-remove"></i> Cancelar </button>
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
                <!-- /page content -->
            </div>
        </div>

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="js/chosen.jquery.js"></script>
        <script src="js/jquery.maskedinput.min.js"></script>
        <script src="js/jquery.dataTables.min.js"></script>
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
        <script src="js/Proxy.js"></script>
        <script src="js/objects/Interesado.js"></script>
        <script src="js/objects/ActaDecomiso.js"></script>
        <script src="js/objects/ActaDonacion.js"></script>
        <script src="js/objects/ActaDevolucion.js"></script>
        <script src="js/objects/ActaDestruccion.js"></script>
        <script src="js/objects/Decomiso.js"></script>
        <script src="js/objects/Distrito.js"></script>
        <script src="js/objects/Funcionario.js"></script>
        <script src="js/objects/Contenedor.js"></script>
        <script src="js/objects/Lugar.js"></script>
        <script src="js/objects/Persona.js"></script>
        <script src="js/objects/Policia.js"></script>
        <script src="js/objects/Testigo.js"></script>  
        <script src="js/objects/Usuario.js"></script> 
        <script src="js/BaseDatos.js"></script>
        <script src="js/PerfilInteresado.js"></script>   
        <script src="fileinput/js/plugins/sortable.js" type="text/javascript"></script>
        <script src="fileinput/js/fileinput.js" type="text/javascript"></script>
        <script src="fileinput/js/locales/es.js" type="text/javascript"></script> 
        <script src="fileinput/themes/explorer/theme.js" type="text/javascript"></script>
    </body>
</html>
