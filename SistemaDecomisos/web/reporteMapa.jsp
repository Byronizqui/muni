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
        <title>Reporte de Decomisos por Distrito</title>
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
                                <h2>Decomisos por Distrito</h2>
                                <ul class="nav navbar-right panel_toolbox">

                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="content">
                                <div style="text-align: center;">
                                    <img src="media/images/mapa_heredia.png" height="600" width="600" usemap="#Map"/>
                                    <map name="Map" id="Map">
                                        <area id="0" shape="poly" coords="465,93,578,94,579,142,582,145,582,198,462,199" title="Heredia" data-toggle="popover" data-content="Some content inside the popover" data-placement="right" data-trigger="hover" alt="heredia" />
                                        <area id="1" shape="poly" coords="514,86,508,71,503,59,498,51,495,42,488,32,483,23,478,16,460,16,453,17,440,17,435,22,433,25,430,26,428,29,418,35,411,40,407,41,404,47,400,56,394,62,390,63,385,63,379,63,373,62,368,59,363,56,357,57,353,61,351,67,351,70,349,74,344,76,339,77,335,79,333,82,330,87,326,90,320,93,315,95,310,96,306,96,301,100,301,106,299,112,298,116,296,119,293,122,290,124,290,126,294,129,302,133,308,136,312,136,317,139,321,142,327,143,335,144,343,147,354,150,364,152,373,154,387,157,398,157,402,157,408,159,418,160,425,160,436,160,444,160,455,159,455,141,456,91,457,86" title="Mercedes"  data-toggle="popover" data-content="Some content inside the popover" data-placement="right" data-trigger="hover" alt="mercedes" />
                                        <area id="2" shape="poly" coords="169,271,153,212,157,209,164,203,171,197,178,191,186,182,189,179,194,179,201,181,208,182,212,182,217,183,222,183,251,155,261,151,267,149,271,142,272,137,277,135,283,135,298,145,305,149,312,152,324,154,333,158,345,162,357,164,368,166,383,166,391,166,394,168,404,168,416,168,427,168,438,167,452,167,455,168,455,180,454,205,556,208,558,213,561,220,562,228,565,236,567,243,572,249,575,256,577,261,540,343,532,342,522,338,514,338,506,338,500,339,491,333,486,332,487,326,493,317,500,304,507,293,515,279,521,267,526,256,530,251,530,237,530,220,513,216,483,214,465,213,438,210,356,204,354,199,352,195,342,194,331,194,321,191,310,189,300,188,287,187,267,186,265,212,257,217,248,218,242,221,237,225,231,225,220,235,211,244,200,252,192,260,183,266" title="San Francisco"  data-toggle="popover"  data-content="Some content inside the popover" data-placement="right" data-trigger="hover"  alt="san_francisco" />
                                        <area id="3" shape="poly" coords="274,220,275,197,282,196,291,200,301,200,309,201,321,204,330,206,341,207,345,207,346,211,349,216,359,217,368,219,383,220,513,226,517,227,516,233,517,238,520,241,471,334,473,336,480,341,490,347,497,348,505,348,513,349,520,351,528,354,534,358,544,383,545,389,545,395,548,404,552,410,555,418,560,425,567,431,564,433,558,433,553,431,551,434,548,439,545,438,539,428,536,425,529,423,522,422,515,422,510,422,502,417,494,411,485,411,478,411,471,406,462,399,454,399,447,396,440,392,430,391,420,391,412,389,403,382,391,381,384,382,378,384,355,405,351,404,343,403,335,405,327,406,321,411,315,411,306,412,301,414,298,418,296,419,296,412,294,407,289,405,285,403,279,402,271,402,264,399,254,395,247,392,239,387,232,381,226,373,226,366,231,359,237,350,238,346,233,339,228,333,226,328,227,319,227,311,222,304,215,301,208,297,202,292,192,285,182,282,178,280,186,275,196,275,202,268,211,262,217,255,223,247,232,242,240,235,255,227" data-toggle="popover" title="Ulloa" data-content="Some content inside the popover" data-placement="right" data-trigger="hover" alt="ulloa" />
                                        <area id="4" shape="poly" coords="14,390,13,514,26,521,36,525,46,527,55,528,64,530,72,536,75,544,81,552,83,562,89,569,99,577,109,584,115,590,122,590,127,590,130,583,132,576,136,574,144,571,150,566,154,560,158,558,164,556,169,551,170,542,171,531,172,524,174,515,175,507,176,498,186,495,198,487,210,481,219,474,221,469,210,471,201,471,192,472,183,475,177,478,166,481,153,482,142,482,135,484,127,485,121,485,116,480,109,473,101,469,96,468,89,468,84,474,77,476,73,478,67,471,63,465,63,456,63,446,63,440,59,437,59,428,58,423,54,419,47,415,39,411" title="Vara Blanca"   data-toggle="popover" data-content="Some content inside the popover" data-placement="right" data-trigger="hover" alt="vara_blanca" />
                                        <area id="0b" shape="rect" coords="438,484,452,499"  title="Heredia"   data-toggle="popover" data-content="Some content inside the popover" data-placement="right" data-trigger="hover" alt="heredia_box" />
                                        <area id="3b" shape="rect" coords="438,505,452,519"  title="Ulloa"   data-toggle="popover" data-content="Some content inside the popover" data-placement="right" data-trigger="hover" alt="ulloa_box" />
                                        <area id="2b" shape="rect" coords="438,526,452,541"  title="San Francisco"   data-toggle="popover" data-content="Some content inside the popover" data-placement="right" data-trigger="hover" alt="san_francisco_box" />
                                        <area id="1b" shape="rect" coords="438,549,452,563"  title="Mercedes"   data-toggle="popover" data-content="Some content inside the popover" data-placement="right" data-trigger="hover" alt="mercedes_box" />
                                        <area id="4b" shape="rect" coords="437,569,453,585"  title="Vara Blanca"   data-toggle="popover" data-content="Some content inside the popover" data-placement="right" data-trigger="hover" alt="vara_blanca_box" />
                                    </map>
                                </div>
                            </div>

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
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="js/chosen.jquery.js"></script>
        <script src="js/reporteMapa.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/daterangepicker.js"></script>
        <script src="js/moment.min.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/validator.js"></script>
        <script src="js/daterangepicker.js"></script>
        <script src="js/moment.min.js"></script>
        <script src="js/daterangepicker.js"></script>
        <script src="js/Proxy.js"></script>
    </body>

</html>
