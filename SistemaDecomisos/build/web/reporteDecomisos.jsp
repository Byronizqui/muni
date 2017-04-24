<%-- 
    Document   : reporteDecomisos
    Created on : Apr 22, 2017, 10:41:05 AM
    Author     : Byron
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
        <title>Reporte de Decomisos</title>
        <!-- Bootstrap -->
        <link href="css/matrix-media.css" rel="stylesheet">
        <link href="css/matrix-style.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/chosen.css">
        <!-- Font Awesome -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="css/nprogress.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- Custom Theme Style -->
        <link href="css/daterangepicker.css" rel="stylesheet">
        <link href="css/custom.min.css" rel="stylesheet">

        <!-- Select2 -->
        <!-- Switchery -->

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
                <div class="right_col" role="main">
                    <div class="">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Reporte de decomisos</h2>
                                <ul class="nav navbar-right panel_toolbox">

                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                                <!-- start form for validation -->
                                <form id="demo-form" data-parsley-validate>
                                    <div class="col-md-1">
                                        <label>Tipo de reporte:</label>  <br/>
                                        <input type="radio" name="gender" id="r_deco" value="r_deco" />Decomiso
                                        <input type="radio" name="gender" id="r_des" value="r_des"   />Destrucción
                                        <input type="radio" name="gender" id="r_dev" value="r_dev"   />Devolución
                                        <input type="radio" name="gender" id="r_dona" value="r_dona" />Donación
                                    </div>
                                    <div class="col-md-2">
                                        <label>Rango de fechas</label>
                                        <fieldset>
                                            <div class="control-group">
                                                <div class="controls">
                                                    <div class="input-prepend input-group">
                                                        <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
                                                        <input type="text" name="daterange" value="01/01/2016 - 01/31/2016" />
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Categorías:</label><br/>
                                        <input type="checkbox" name="categorias[]" id="perecederos" value="perecederos" data-parsley-mincheck="2" /> Perecederos
                                        <br />
                                        <input type="checkbox" name="categorias[]" id="no_perecederos" value="no_perecederos" /> No perecederos
                                        <br />
                                        <input type="checkbox" name="categorias[]" id="patinetas" value="patinetas"/> Patinetas
                                        <br />
                                        <input type="checkbox" name="categorias[]" id="cigarros" value="cigarros"/> Cigarros
                                        <br />
                                    </div>
                                    <div class="col-md-2 ">
                                        <label>Distrito: </label>
                                        <select class="form-control" data-rel="chosen" name="distrito" id="distrito">
                                            <option value="heredia">Heredia</option>
                                            <option value="mercedes">Mercedes</option>
                                            <option value="san_frencisco">San Francisco</option>
                                            <option value="ulloa">Ulloa</option>
                                            <option value="vara_blanca">Vara Blanca</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2 ">
                                        <label>Interesado: </label>
                                        <select class="form-control" data-rel="chosen" name="distrito" id="distrito">
                                            <option value="heredia">Heredia</option>
                                            <option value="mercedes">Mercedes</option>
                                            <option value="san_frencisco">San Francisco</option>
                                            <option value="ulloa">Ulloa</option>
                                            <option value="vara_blanca">Vara Blanca</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2 ">
                                        <label>Policia </label>
                                        <select class="form-control" data-rel="chosen" name="distrito" id="distrito">
                                            <option value="heredia">Heredia</option>
                                            <option value="mercedes">Mercedes</option>
                                            <option value="san_frencisco">San Francisco</option>
                                            <option value="ulloa">Ulloa</option>
                                            <option value="vara_blanca">Vara Blanca</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <span class="alignright btn btn-primary">Imprimir reporte</span>

                            </form>
                            <!-- end form for validations -->

                        </div>
                    </div>
                </div>
            </div>
            <footer>
                <div class="pull-right">
                    Municipalidad de Heredia. 2016 Todos los derechos reservados.
                </div>
                <div class="clearfix"></div>
            </footer>
            <!-- /footer content -->
        </div>
    </div>

    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/chosen.jquery.js"></script>
    <!-- FastClick -->
    <script src="js/fastclick.js"></script>
    <!-- NProgress -->
    <script src="js/nprogress.js"></script>
    <!--Date-->
    <script src="js/daterangepicker.js"></script>
    <script src="js/moment.min.js"></script>
    <!-- Custom Theme Scripts -->

    <script src="js/daterangepicker.js"></script>
    <script src="js/custom.min.js"></script>

    <script src="js/Proxy.js"></script>
    <script src="js/reporteDecomisos.js"></script>

</body>

</html>
