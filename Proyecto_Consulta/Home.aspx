<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Home.aspx.vb" Inherits="Proyecto_Consulta.Home" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Bienvenidos a la consulta de la Pediatra Sonia Carrasco</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
  </head>
  <body  style="background-color:white" >

    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="Home.aspx">Inicio</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
           
          <li class="nav-item active">
              <a class="nav-link" href="LoginPrincipal.aspx">Iniciar Sesion <span class="sr-only">(current)</span></a>
            <%--</li>--%>
          </ul>          
        </div>
      </nav>
    </header>
     <br />
      <section class="content" style="font:serif">
          <div class="row, row justify-content-around">
              <!-- Columna 1 -->
              <div class="col-5">
                  <h2 style="margin-bottom: 25px; text-align: center" >Bienvenidos a la Consulta de la Pediatra Broncopulmonar Dra. Sonia Carrasco Salgado</h2>
              </div>
          </div>
      </section>
      
    <main role="main">

      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active " >
            <img class="first-slide"  src="img/doctor1.jpg"  alt="First slide">
            <div class="container">
              <div class="carousel-caption text-left">
               <br />
                  <br />
                <p><a class="btn btn-lg btn-primary" href="RegistroUsuarios.aspx" role="button">Registrate</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="second-slide" src="img/Amanecer2.jpg"  alt="Second slide">
            <div class="container">
              <div class="carousel-caption">          
                <p><a class="btn btn-lg btn-primary" href="https://www.google.com/search?ei=AJ8MXP_eLYeMwgTXjqjQBQ&q=colo+colo+379+oficina+513&oq=colo+colo+379+oficina+513&gs_l=psy-ab.3..33i160.21056.30316..30580...1.0..0.105.401.4j1......0....1..gws-wiz.......35i39.WkPD7TA8If4" target="_blank" role="button">Encuentranos</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="third-slide" src="img/Familia.jpg" alt="Third slide">
            <div class="container">
              <div class="carousel-caption text-right">               
                <p><a class="btn btn-lg btn-primary" href="ComentarioPaciente.aspx" role="button">Cuentanos tu experiencia</a></p>
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>       

         
          <hr class="featurette-divider">
      <!-- Marketing messaging and featurettes ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->

      <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
          <div class="col-lg-4">
            <img class="rounded-circle" src="img/fonasa.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Compra tu Bono</h2>
            <p>Puedes comprar tu Bono de manera presencial en alguna sucursal de FONASA, Caja vecina o puedes acceder directamente a la Página de FONASA y comprarlo de manera electronica con los siguientes datos del médico. <br />RUT: 78.647.040-4 Nivel especial 0101001</p>
            <p><a class="btn btn-secondary" href="https://www.fonasa.cl/sites/fonasa/beneficiarios/servicios" target="_blank" role="button">Compra de Bono Electronico &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="img/colegiomedico.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Especialidad</h2>
            <p>Sonia Carrasco Salgado con especialidad de Pediatría Broncopulmonar inscrita en el Colegio Médico.</p>
            <p><a class="btn btn-secondary" href="http://directoriomedico.colegiomedico.cl/" target="_blank" role="button">Colegio Médico &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <img class="rounded-circle" src="img/carrasco.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Llamanos</h2>
            <p>Si no puedes agendar via web puedes seguir el canal tradicional llamando al numero +56412243882.</p>
            <p><a class="btn btn-secondary" href="https://www.google.com/search?q=telefono+sonia+carrasco&oq=telefono+sonia+carrasco&aqs=chrome..69i57j0.5371j0j7&sourceid=chrome&ie=UTF-8" target="_blank" role="button">Contactanos &raquo;</a></p>
          </div><!-- /.col-lg-4 -->
            
        </div><!-- /.row -->


        <!-- START THE FEATURETTES -->

      
          <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">Conoce un poco de la la Pediatra. <span class="text-muted">Y algo de su trayectoria.</span></h2>
              <p class="justify-content-center">
                    La Doctora Sonia Carrasco Salgado cuenta con una trayectoria de mas de 40 años
                    de servicio a la comunidad y se ha desempeñado tanto en el servicio público como en el
                    privado ayudando a la mejoria de lo niños que visitan su consulta. Cuenta con el apoyo 
                    de Viviana Muñoz, quien es su secretaria y la apoya con su relacion cordial con los pacientes.
              </p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="img/Edificio-Amanecer-Concepcion.jpg" alt="Generic placeholder image">
          </div>
        </div>

        <hr class="featurette-divider">

       

        <%--<hr class="featurette-divider">--%>

        <!-- /END THE FEATURETTES -->

      </div><!-- /.container -->


      <!-- FOOTER -->
      <footer class="container">
        <p class="float-right"><a href="#">Ir al Inicio</a></p>
        <p>&copy; 2017-2018 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>
    </main>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="js/holder.min.js"></script>
  </body>
</html>
