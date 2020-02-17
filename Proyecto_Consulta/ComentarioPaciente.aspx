<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ComentarioPaciente.aspx.vb" Inherits="Proyecto_Consulta.ComentarioPaciente" %>

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
</head>
<body>
    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="Home.aspx">Inicio</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">                
        </div>
      </nav>
    </header>
     <br />
    <br />
    <form runat="server">
        <hr class="featurette-divider">
        <div class="row featurette">
            <div class="col-md-2">
                &nbsp;&nbsp;
            </div>
            <div class="col-md-4">
                <h2 class="featurette-heading" style="text-align: center">Dejanos tus Comentarios</h2>
                <br />
                <div class="input-group col-md-6">
                    <h6>Nombre</h6>
                </div>
                <div class="form-group col-md-6">
                    <asp:TextBox ID="Nom" runat="server" TabIndex="1" class="form-control" required="Ingresa tu Nombre" placeholder="" MaxLength="50"></asp:TextBox>
                </div>
                <div class="input-group col-md-4">
                    <h6>Email</h6>
                </div>
                <div class="form-group col-md-6">
                    <asp:TextBox ID="Mail" runat="server" TabIndex="2" class="form-control" required="" placeholder="Ingresa tu email " TextMode="Email" MaxLength="50"></asp:TextBox>
                </div>
                <div class="input-group col-md-4">
                    <h6>Tipo de Comentario</h6>
                </div>
                <div class="form-group col-md-6">
                    <asp:DropDownList ID="cmbTipoComentario" runat="server" tabIndr="3" CssClass="form-control" DataSourceID="OrigenTipoComentario" DataTextField="Tipo Comentario" DataValueField="Tipo Comentario" >
                 
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="OrigenTipoComentario" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Tipo Comentario]"></asp:SqlDataSource>
                </div>
                <div class="input-group col-md-6">
                    <h6>Dejanos Tus Comentarios</h6>
                </div>
                <div class="form-group col-md-6">
                    <asp:TextBox ID="Txtcomentarios" runat="server" class="form-control" tabIndr="4" placeholder="Deja aqui tus comentarios" required="" Height="200px" 
                        Width="430px" Columns="40" Rows="12" TextMode="MultiLine" MaxLength="1000"></asp:TextBox>
                </div>
                <div class="form-group col-md-4">
                    <div class="row">
                        <div class="col-sm-6">
                            <asp:Button ID="RegistrarComentario" runat="server" CssClass="btn btn-success" Text="Enviar Comentario" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <img class="featurette-image img-fluid mx-auto" style="width: 500px; height: 700px" src="img/Edificio-Amanecer-Concepcion.jpg" alt="Generic placeholder image">
            </div>
        </div>
        <hr class="featurette-divider">
    </form>
</body>
</html>
