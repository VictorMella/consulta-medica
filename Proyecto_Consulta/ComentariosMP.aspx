<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSecretaria.Master" CodeBehind="ComentariosMP.aspx.vb" Inherits="Proyecto_Consulta.ComentariosMP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Revisar Comentarios</h3>
    </section>

    <form runat="server">
        <section class="content">
            <div class="row, row justify-content-around">
                <!-- Columna 1 -->
                <div class="col-md-3">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h5 class="box-title">Selecciona el Criterio de los comentarios</h5>
                        </div>
               
                        <div class="box-body">

                            <div class="input-group">
                                <asp:DropDownList ID="cmbEleccion" runat="server" CssClass="form-control" DataSourceID="OrigenComentario2" DataTextField="Tipo Comentario" DataValueField="Tipo Comentario">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="OrigenComentario2" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Tipo Comentario] ORDER BY [Id Comentario]"></asp:SqlDataSource>
                                &nbsp;&nbsp;
                            <span class="input-group-btn">
                                <asp:Button ID="BTN_BuscarComentario" CssClass="btn btn-success" runat="server" Text="Buscar" />
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
                  <!-- Columna 2 -->
                <div class="col-md-8">
                    <div class="box box-primary">
                         <div class="box-header">
                            <h5 class="box-title" id="seleccion" runat="server"></h5>
                        </div>                  
                        <div class="table table-responsive">
                            <asp:GridView ID="GridTotalComentarios" runat="server" Width="900px" 
                                CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed" 
                                PageSize="5" AllowPaging="True" OnPageIndexChanging="GridTotalComentarios_PageIndexChanging">
                            </asp:GridView>
                        </div>
                    </div>
                </div>


            </div>
        </section>


    </form>

</asp:Content>
