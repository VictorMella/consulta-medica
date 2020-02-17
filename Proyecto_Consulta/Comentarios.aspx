<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPaciente.Master" CodeBehind="Comentarios.aspx.vb" Inherits="Proyecto_Consulta.Comentarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="col-md-5">
            <div class="form-area">
                <form role="form" runat="server">
                    <h3 style="margin-bottom: 25px; text-align: center">Dejanos tus Comentarios</h3>
                    <h6 class="control-label">Nombre</h6>
                    <div class="form-group">
                        <asp:TextBox ID="Nombre_Paciente" name="" placeholder="Ingresa tu Nombre" CssClass="form-control" runat="server" TextMode="SingleLine" MaxLength="50"></asp:TextBox>
                    </div>
                    <h6 class="control-label">Email</h6>
                    <div class="form-group">
                        <asp:TextBox ID="Email_Paciente" name="" placeholder="Ingresa tu Mail" class="form-control" runat="server" TextMode="Email" MaxLength="50"></asp:TextBox>
                    </div>
                    <h6 class="control-label">Tipo de Comentario</h6>
                    <div class="form-group">
                        <asp:DropDownList ID="cmbEleccion" runat="server" CssClass="form-control" DataSourceID="OrigenComentario1" DataTextField="Tipo Comentario" DataValueField="Tipo Comentario">
                        
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="OrigenComentario1" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Tipo Comentario] ORDER BY [Id Comentario]"></asp:SqlDataSource>
                    </div>

                    <h6 class="control-label">Deja tus Comentarios</h6>
                    <div class="form-group">

                        <asp:TextBox ID="txtComentario" runat="server" class="form-control" placeholder="Deja aqui tus comentarios" Height="200px" Width="430px" Columns="40" Rows="12" TextMode="MultiLine" MaxLength="1000"></asp:TextBox>

                    </div>
                    <div align="center">
                        <asp:Button ID="BTN_Comentario" runat="server" class="btn btn-success" Text="Enviar Comentarios" />
                    </div>

                </form>

            </div>
        </div>
    </div>

</asp:Content>
