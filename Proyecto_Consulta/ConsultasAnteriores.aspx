<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterDoc.Master" CodeBehind="ConsultasAnteriores.aspx.vb" Inherits="Proyecto_Consulta.ConsultasAnteriores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Visitas Anteriores </h3>
    </section>
    <br />
        <hr class="featurette-divider">
    <form runat="server" id="form1" name="form1" onsubmit="return Rut(document.getElementById('ContentPlaceHolder1_rut').value);">

         <section class="content">
            <div class="row, row justify-content-around">
                      <!-- Columna 1 -->
                <div class="col-md-7">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h4 class="box-title">Horas Finalizadas</h4>
                        </div>
                        <div class="box-body">
                            <div class="table table-responsive">
                                <asp:GridView ID="GridHoras" runat="server" 
                                    CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed" AllowPaging="True" OnPageIndexChanging="GridHoras_PageIndexChanging">
                                    <Columns>
                                        <asp:CommandField HeaderText="Seleccionar Fecha" ShowSelectButton="True" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
          <!-- Columna 2 -->
                   <div class="col-md-2">
                    <div class="box box-primary">
                          <div class="box-header">
                               <h4>Rut del Paciente</h4>
                            </div> 
                        <div class="box-body">                             
                            <div class="input-group">
                                <asp:TextBox ID="rut" runat="server" CssClass="form-control" TextMode="SingleLine" MaxLength="12" AutoCompleteType="Disabled"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                       <br/>
                       <div class="box box-primary">
                            <div class="box-header">
                               <h4>Visitas Previas</h4>
                            </div> 
                        <div class="box-body">                                                      
                            <div class="input-group">
                               <asp:TextBox id="Fecha_Busqueda" runat="server" CssClass="form-control" Text="" enabled="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                        <br/>
                       <div class="box box-primary">
                            <div class="box-header">
                               <h4>Rut del Medico</h4>
                            </div> 
                        <div class="box-body">                                                      
                            <div class="input-group">
                               <%--<asp:TextBox id="Rut_Medico" runat="server" CssClass="form-control" Text="" Textmode="SingleLine" MaxLength="12" Enabled="false"></asp:TextBox>&nbsp;&nbsp;--%>
                                <asp:DropDownList ID="RUTMEDICO" runat="server" CssClass="form-control"  Enabled="False" DataSourceID="origenmedicos" DataTextField="Nombre del Medico" DataValueField="Rut Empleado" />
                                <asp:SqlDataSource ID="origenmedicos" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT ISNULL([Nombre Paciente], '') + ' ' + ISNULL([Apellido Paterno], '') + ' ' + ISNULL([Apellido Materno], '') AS 'Nombre del Medico', [Rut Empleado] FROM Empleado AS e where e.[Cargo Empleado]='Medico'"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Columna 3 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>&nbsp;&nbsp;</label>
                            </div>
                            <div class="input-group">
                                <asp:Button ID="BTN_Fechas" runat="server" CssClass="btn btn-success" Text="Buscar Historial" Width="200px" />
                            </div>
                        </div>
                    </div>
                    <br/>
                     <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                               <label>&nbsp;&nbsp;</label>
                            </div>
                            
                            <div class="input-group">
                                <asp:Button ID="BTN_Buscar" runat="server" class="btn btn-success"  Text="Buscar Registros Previos" Width="200px" />
                            </div>
                        </div>
                    </div>
                </div>                 
            </div>
        </section>  
        <br />
           <hr class="featurette-divider">
        <!-- siguiente Panel -->

        <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Datos Clinicos </h3>
    </section>
        <section class="content">
            <div class="row, row justify-content-around">
                 
             
                 <!-- Columna 3 -->
             <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>Peso del Paciente</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtPeso" runat="server" CssClass="form-control" TextMode="SingleLine" enabled="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                 <!-- Columna 4 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>Estatura del Paciente</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtEstatura" runat="server" CssClass="form-control" TextMode="SingleLine" enabled="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                  <!-- Columna 5 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>Temperatura del Paciente</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtTemperatura" runat="server" CssClass="form-control" TextMode="SingleLine" enabled="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <br />
              <section class="content">
            <div class="row, row justify-content-around">
    <!-- Columna 1 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>N° de Receta</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="N_Receta" runat="server" CssClass="form-control" enabled="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                 <!-- Columna 2 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>N° de Certificado Médico</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="N_Certificado" runat="server" CssClass="form-control" enabled="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                  <!-- Columna 3 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>N° de Licencia Médica</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="N_Licencia" runat="server" CssClass="form-control" Enabled="false" ></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
              <%--    <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>Fecha de Atencion</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="Fecha_HC" runat="server" CssClass="form-control" textmode="Date" enabled="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>--%>

 </div>
        </section>


        <br />
    <section class="content">
        <div class="row, row justify-content-around">
           <div class="col-md-10">
                <div class="box box-primary">
                    <div class="box-body">    
                          <div class="input-group">
                            <h3>Observaciones</h3>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="Obs_Paciente" runat="server" class="form-control" placeholder="" Height="100px" Width="1300px" Columns="40" Rows="12" TextMode="MultiLine"  enabled="false"></asp:TextBox>
                        </div>
                          <div class="input-group">
                            <h3>Tratamiento</h3>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="Tr_Paciente" runat="server" class="form-control" placeholder="" Height="100px" Width="1300px" Columns="40" Rows="12" TextMode="MultiLine" enabled="false"></asp:TextBox>
                        </div>
                      
                    </div>
                </div>
            </div>
        </div>
    </section>
            <div align="center" >
                                <span class="input-group-btn">
                                <asp:Button ID="BTN_Imprimir" CssClass="btn btn-success" runat="server" Text="Imprimir Visita" Width="300" TabIndex="0" />
                                     <asp:TextBox ID="txtFicheroPDF" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                            </span>
                                </div>
        <br />
                        
    </form>
 
</asp:Content>
