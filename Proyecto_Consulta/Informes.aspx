<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSecretaria.Master" CodeBehind="Informes.aspx.vb" Inherits="Proyecto_Consulta.Informes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Informes para los Pacientes</h3>
    </section>
     <hr class="featurette-divider">
    <form runat="server" id="form1" name="form1" onsubmit="return Rut(document.getElementById('ContentPlaceHolder1_rut').value);">
        <section class="content">
            <div class="row, row justify-content-around">
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h4 class="box-title" style="text-align: center">Ingresa el Rut del Paciente</h4>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <div class="row, row justify-content-around">
                <div class="col-md-2">
                    <div class="box box-primary">

                        <div class="box-body">
                            <div class="input-group">
                                <asp:TextBox ID="rut" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="11.111.111-1" MaxLength="12"></asp:TextBox>&nbsp;&nbsp;
                                <asp:Button ID="limpiar" runat="server" CssClass="btn btn-danger" Text="Limpiar Rut" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <hr class="featurette-divider">
      
        <section class="content">
            <div class="row, row justify-content-around">
                      <!-- Columna 3 -->
                <div class="col-md-8">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3 class="box-title">Reservas Agendadas</h3>
                        </div>
                        <div class="box-body">
                            <div class="table table-responsive">
                                <asp:GridView ID="gridreservas" runat="server" 
                                    CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed" HeaderStyle-Font-Size="Medium"
                                    PageSize="10" AllowPaging="True" OnPageIndexChanging="gridreservas_PageIndexChanging" GridLines="None" RowStyle-CssClass="text-center"  
                                       HeaderStyle-Font-Bold="true" RowStyle-Font-Size="Small">
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>         


                <!-- Columna 4 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>&nbsp;&nbsp;</label>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="BTN_Buscar" runat="server" CssClass="btn btn-success" Text="Buscar Reservas" Width="200" />
                            </div>
                             <div class="form-group">
                                <asp:Button ID="PDF1" runat="server" CssClass="btn btn-success" Text="Imprimir Reservas" Width="200" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <hr class="featurette-divider">
        <hr class="featurette-divider">          
        <section class="content">
            <div class="row, row justify-content-around">

                <div class="col-md-8">
                    <div class="box box-primary">
                         <div class="box-header">
                            <h3 class="box-title">Recetas Emitidas</h3>
                        </div>
                        <div class="box-body">
                            <div class="table table-responsive">
                                <asp:GridView ID="gridRecetas" runat="server" 
                                    CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed"
                                    PageSize="10" AllowPaging="True" OnPageIndexChanging="gridRecetas_PageIndexChanging" RowStyle-CssClass="text-center"  
                                       HeaderStyle-Font-Bold="true" RowStyle-Font-Size="Small" GridLines="None" HeaderStyle-Font-Size="Medium">
                                </asp:GridView>


                            </div>
                        </div>
                    </div>
                </div>


                <!-- Columna 4 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>&nbsp;&nbsp;</label>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="BTN_Receta" runat="server" CssClass="btn btn-success" Text="Buscar Recetas" Width="200" />
                            </div>
                            <div class="form-group">
                                <asp:Button ID="PDF2" runat="server" CssClass="btn btn-success" Text="Imprimir Recetas" Width="200" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <hr class="featurette-divider">

      
        <section class="content">
            <div class="row, row justify-content-around">

                <div class="col-md-8">
                    <div class="box box-primary">
                         <div class="box-header">
                            <h3 class="box-title">Certificados Emitidos </h3>
                        </div>
                        <div class="box-body">
                            <div class="table table-responsive">
                                <asp:GridView ID="gridcertificados" runat="server" 
                                    CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed"
                                    PageSize="10" AllowPaging="True" OnPageIndexChanging="gridcertificados_PageIndexChanging" RowStyle-CssClass="text-center"  
                                       HeaderStyle-Font-Bold="true" RowStyle-Font-Size="Small" GridLines="None" HeaderStyle-Font-Size="Medium">
                                </asp:GridView>


                            </div>
                        </div>
                    </div>
                </div>

                <!-- Columna 4 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>&nbsp;&nbsp;</label>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="BTN_Certificado" runat="server" CssClass="btn btn-success" Text="Buscar Certificados" Width="200" />
                            </div>
                            <div class="form-group">
                                <asp:Button ID="PDF3" runat="server" CssClass="btn btn-success" Text="Imprimir Certificados" Width="200" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <hr class="featurette-divider">
    </form>
</asp:Content>
