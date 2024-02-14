<%@page import="agencia_logica.Cliente"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="agencia_logica.Controladora"%>
<%@page import="java.util.Date"%>
<%@page import="agencia_logica.Usuario"%>
<%@page import="agencia_logica.Empleado"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-AR">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>A-Travel</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <!-- Icons font CSS-->
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <!-- Font special for pages-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

        <!-- Vendor CSS-->
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/main2.css" rel="stylesheet" media="all">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: Company - v4.7.0
        * Template URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>
        <% //chequeo de sesión activa con user/pass válidos
            HttpSession sesion = request.getSession();
            String usuario = (String) sesion.getAttribute("usuario");
            //sin usuario válido mando al log in:
            if (usuario == null) {
                response.sendRedirect("login.jsp");
            }
        %>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top">
            <div class="d-flex flex-row-reverse">
                <!--muestro qué usuario tiene sesión activa -->
                <div class="p-2">Bienvenido, <b><%=usuario%></b>  |  <a href="login.jsp">[Nuevo usuario]</div>
            </div>
            <div class="container d-flex align-items-center">

                <h1 class="logo me-auto"><a href="index.jsp">A-TRAVEL</a></h1>

                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a href="index.jsp">INICIO</a></li>
                        <li class="dropdown"><a href="#"><span>SERVICIOS</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="form-servicio.jsp">ALTA SERVICIOS</a></li>
                                <li><a href="lista-servicios.jsp">LISTA SERVICIOS</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>PAQUETES</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="form-paquete.jsp">ALTA PAQUETE</a></li>
                                <li><a href="lista-paquetes.jsp">LISTA PAQUETES</a></li>
                            </ul>
                        </li>
                        <!--pongo a CLIENTES como clase activa -->
                        <li class="dropdown" class="active"><a href="#"><span>CLIENTES</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="form-cliente.jsp">ALTA CLIENTE</a></li>
                                <li><a href="lista-clientes.jsp">LISTA CLIENTES</a></li>
                            </ul>
                        </li>

                        <li class="dropdown"><a href="#"><span>EMPLEADOS</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="form-empleado.jsp">ALTA EMPLEADO</a></li>
                                <li><a href="lista-empleados.jsp">LISTA EMPLEADOS</a></li>
                            </ul>
                        </li>
                       
                    </ul>  
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </nav><!-- .navbar -->
            </div>
        </header><!-- End Header -->



        <main id="main">
            <div class="page-wrapper bg-gra-03 p-t-45 p-b-50"> <!-- agrego esto para mantener -->
                <!-- el mismo estilo del formulario! -->
                <div class="card card-5" style="margin-top: 80px;"> <!-- agrego style para que no me pise el navbar -->
                    <div class="card-heading">
                        <h2 class="title">Listado de Clientes</h2>
                    </div>
                    <!--quité el wrapper que estaba en el form para que la tabla llene la pantalla-->   
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Estado</th>
                                <th scope="col">Apellido y nombre</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">DNI</th>
                                <th scope="col">Fecha de nacimiento</th>
                                <th scope="col">Nacionalidad</th>
                                <th scope="col">Celular</th>
                                <th scope="col">E-mail</th>
                                <th scope="col">Edita</th>
                                <th scope="col">Baja</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   <tr>
                                   <th scope="row">January</th>
                                   <td>85</td>
                                   <td>$13,555.00</td>
                               </tr> -->
                            <%  //HttpSession miSesion = request.getSession();
                                //List<Cliente> listaClientes = (List) request.getSession().getAttribute("listaClientes");
                                //no me anduvo de la forma anterior....veré el por qué mas adelante :-(
                                Controladora controladora = new Controladora();
                                List<Cliente> listaClientes = controladora.leeClientes();
                                for (Cliente c : listaClientes) {%>  
                            <tr>
                                <%String estado = c.getEstado();%>
                                <td><%=estado%></td>
                                <%String apellidoNombre = c.getApellido() + ", " + c.getNombre();%>
                                <td><%=apellidoNombre%></td>
                                <%String direccion = c.getDireccion();%>
                                <td><%=direccion%></td>
                                <%String dni = c.getDni();%>
                                <td><%=dni%></td>
                                <%
                                    Date fecha_nac = c.getFecha_nac();
                                    String fecha_nac_str = new SimpleDateFormat("dd/MM/yyyy").format(fecha_nac);
                                    /*Tuve que aplicar un formateo a la fecha puesto que al leer el Date directo
                                del SQL me mostraba en pantalla por ej: "Fri Oct 01 00:00:00 ART 1976"
                                en vez de: 1976-10-01 que era lo que estaba en la tabla MySQL realmente
                                Ya que lo formateo cambio a dd/MM/YYYY*/
                                %>
                                <td><%=fecha_nac_str%></td>
                                <%String nacionalidad = c.getNacionalidad();%>
                                <td><%=nacionalidad%></td>
                                <%String celular = c.getCelular();%>
                                <td><%=celular%></td>
                                <%String email = c.getEmail();%>
                                <td><%=email%></td>
                                <%int id_Cliente = c.getId_cliente();%>
                                <td>
                                    <form action="SvLeeCliente" method="POST"> <!--observar que mando al servlet que lee el cliente con método POST en primer lugar -->
                                        <input type="hidden" name="id_Cliente" value="<%=id_Cliente%>"> <!--no olvidar del cierre del input! -->
                                        <button type="submit" class="btn btn-sm btn-primary">Edita</button>
                                    </form>
                                </td>
                                <td>
                                    <form action="SvBajaCliente" method="POST">
                                        <input type="hidden" name="id_Cliente" value="<%=id_Cliente%>"> <!--no olvidar del cierre del input! -->
                                        <button type="submit" class="btn btn-sm btn-danger">Baja</button>
                                    </form>
                                </td>
                            </tr>
                            <%}%> <!--cierre del for -->


                        </tbody>
                    </table>


                </div>

            </div>

        </main><!-- End #main -->


        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="container d-md-flex py-4">

                <div class="me-md-auto text-center text-md-start">
                    <div class="copyright">
                        &copy;Copyright Adrián Ezequiel Angió
                    </div>
                    <div class="credits">
                        <!-- All the links in the footer should remain intact. -->
                        <!-- You can delete the links only if you purchased the pro version. -->
                        <!-- Licensing information: https://bootstrapmade.com/license/ -->
                        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/company-free-html-bootstrap-template/ -->

                    </div>
                </div>
            </div>
        </footer><!-- End Footer -->

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <!-- Jquery JS-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <!-- Vendor JS-->
        <script src="vendor/select2/select2.min.js"></script>
        <script src="vendor/datepicker/moment.min.js"></script>
        <script src="vendor/datepicker/daterangepicker.js"></script>

        <!-- Main JS-->
        <script src="js/global.js"></script>
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>

