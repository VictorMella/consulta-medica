<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RegistroUsuarios.aspx.vb" Inherits="Proyecto_Consulta.RegistroUsuarios" %>


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

  

    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
     <script src="js/loginregistro/validarut.js"></script>
</head>
<body>
    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="Home.aspx">Inicio</a>
          <a class="navbar-brand" href="LoginPrincipal.aspx">Iniciar Sesion</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">                
        </div>
      </nav>
    </header>
      <br />
    <br />
    <form id="form1" name="form1" onsubmit="return Rut(document.getElementById('rut').value);" runat="server">
        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-2">
            &nbsp;&nbsp;
          </div>
            <div class="col-md-4">
                <h2 class="featurette-heading" style="text-align: center">Registrate Aquí</h2>
                <br />
                <h3 style="text-align: center" class="blockquote text-center">Registrate ingresando tus datos</h3>

                <div class="input-group col-md-4">
                    <label>Rut Paciente</label>
                </div>
                <div class="form-group col-md-6" >
                    <asp:TextBox ID="rut" runat="server" TabIndex="1" class="form-control" required="" placeholder="11.111.111-1" MaxLength="12" ></asp:TextBox>
                </div>             
                <div class="input-group col-md-4">
                     <label>Ingresa tu Password</label>
                    </div>
                   <div class="form-group col-md-6">
                    <asp:TextBox ID="Pass1" runat="server" TabIndex="2" class="form-control" required="" placeholder="password de 8 caracteres " TextMode="Password" MaxLength="8"></asp:TextBox>
                </div>
                 <div class="input-group col-md-6">
                            <label>Confirma tu Password</label>
                        </div>
                <div class="form-group col-md-6">
                    <asp:TextBox ID="Pass2" runat="server" TabIndex="3" class="form-control" required="" placeholder="Confirma tu password " TextMode="Password" MaxLength="8"></asp:TextBox>
                </div>
               
                      
                <div class="form-group col-md-4">
                    <div class="row">
                        <div class="col-sm-6">
                            <asp:Button ID="RegistrarUser" runat="server" CssClass="btn btn-success" Text="Registrate Ahora" />
                        </div>
                    </div>

                </div>
                </div>            
         
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" style="width:500px; height:700px" src="img/Edificio-Amanecer-Concepcion.jpg" alt="Generic placeholder image">
          </div>
        </div>
       
        <hr class="featurette-divider">
         </form>

       
</body>
</html>
