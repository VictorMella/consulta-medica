<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterDoc.Master" CodeBehind="RegistroConsultas.aspx.vb" Inherits="Proyecto_Consulta.RegistroConsultas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Registar visita Medica </h3>
    </section>
    <br />

    <form runat="server"  >
       <section class="content">
            <div class="row, row justify-content-around">       
     <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="Input-group">
                                <label>&nbsp;&nbsp;</label>
                            </div>
                            <div class="form-group">
                                &nbsp;&nbsp;
                            </div>
                        </div>
                   </div>
                
                </div>
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="Input-group">
                                <label>Elegir la Fecha</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="Fecha" runat="server" CssClass="form-control" TextMode="Date" required=""></asp:TextBox>
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
                                <asp:Button ID="BTN_Agenda" runat="server" CssClass="btn btn-success" Text="Buscar Mis Horas" formnovalidate="" />
                            </div>
                        </div>
                    </div>
                    </div>
                </div>            
        </section>
        <section class="content">
            <div class="row, row justify-content-around">
                <!-- Columna 1 -->
                <div class="col-md-10">
                    <div class="table table-responsive">
                    <!-- Crear nuestro GridView-->
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id Reserva,Estado Reserva"
                        ShowFooter="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"
                        OnRowDeleting="GridView1_RowDeleting" 
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand"
                        CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed">

                        <Columns>
                           
                            <asp:TemplateField HeaderText="Rut Paciente">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRut" runat="server" Text='<%# Eval("[Rut Paciente]")%>' Enabled="false" ></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("[Rut Paciente]")%>' Enabled="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Rut Medico">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRutMedico" runat="server" Text='<%# Eval("[Rut Medico]")%>' Enabled="false"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("[Rut Medico]")%>' Enabled="false"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hora de la Reserva">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtHora" runat="server" Text='<%# Eval("[Hora Reserva]") %>' Enabled="false"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("[Hora Reserva]") %>' Enabled="false"></asp:Label>
                                </ItemTemplate>

                                <ItemStyle Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha de la Reserva">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtfechareserva" runat="server" Text='<%# Eval("[Fecha Reserva]") %>' Enabled="false"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("[Fecha Reserva]") %>' Enabled="false"></asp:Label>
                                </ItemTemplate>

                                <ItemStyle Wrap="True" />
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Estado de la Reserva">
                                <EditItemTemplate>
                                           
                                <asp:DropDownList ID="cmbEstadoResrva" runat="server" DataSourceID="OrigenEstadoDisponibilidad" DataTextField="Estado Reserva Medica" DataValueField="Estado Reserva Medica">
                                </asp:DropDownList>

                                    <asp:SqlDataSource ID="OrigenEstadoDisponibilidad" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Estado Reserva] WHERE (([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica2) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica3) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica4)) ORDER BY [Id Consulta Medica]">
                                        <SelectParameters>

                                            <asp:Parameter DefaultValue="1" Name="Id_Consulta_Medica" Type="Int32" />
                                            <asp:Parameter DefaultValue="2" Name="Id_Consulta_Medica2" Type="Int32" />
                                            <asp:Parameter DefaultValue="3" Name="Id_Consulta_Medica3" Type="Int32" />
                                            <asp:Parameter DefaultValue="4" Name="Id_Consulta_Medica4" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("[Estado Reserva]")%>' ID="Label6"></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                               <asp:TemplateField HeaderText="Nombre del Paciente">
                                <EditItemTemplate>
                                    <asp:TextBox ID="NomPas" runat="server" Text='<%# Eval("[Nombre del Paciente]") %>' Enabled="false"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("[Nombre del Paciente]") %>' Enabled="false"></asp:Label>
                                </ItemTemplate>

                                <ItemStyle Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actualizar Atencion" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-success" Text="Finalizar Atencion"></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CssClass="btn btn-success" CommandName="Update" Text="Cerrar Visita"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-success" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                       </div>
                </div></div>
        </section>
               

         <section class="align-content-center">
        <h4 style="margin-bottom: 25px; text-align: center">Datos Clinicos </h4>
    </section>
        <section class="content">
            <div class="row, row justify-content-around">
                 
                <!-- Columna 1 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                          
                        <div class="box-body">
                            <div class="input-group">
                                <label>Rut Paciente</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="RutPac" runat="server" CssClass="form-control" MaxLength="12" Required="" placeholder="11.111.111-1"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Columna 2 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>Rut Médico</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="RutDoc" runat="server" CssClass="form-control" MaxLength="12"  Required="" Enabled="false"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                 <!-- Columna 3 -->
             <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>Peso del Paciente</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtPeso" runat="server" CssClass="form-control" TextMode="SingleLine" MaxLength="6" placeholder="22.5"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                 <!-- Columna 4 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>Estatura del Paciente (en mts)</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtEstatura" runat="server" CssClass="form-control" TextMode="SingleLine" MaxLength="4" placeholder="1.11"></asp:TextBox>
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
                                <asp:TextBox ID="txtTemperatura" runat="server" CssClass="form-control" TextMode="SingleLine" MaxLength="4" placeholder="36.5"></asp:TextBox>
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
                                <asp:TextBox ID="N_Receta" runat="server" CssClass="form-control" TextMode="number" required="" placeholder="0"></asp:TextBox>
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
                                <asp:TextBox ID="N_Certificado" runat="server" CssClass="form-control" TextMode="Number" required="" placeholder="0"></asp:TextBox>
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
                                <asp:TextBox ID="N_Licencia" runat="server" CssClass="form-control" textmode="number" MaxLength="9" required="" placeholder="0"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                  <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>Fecha de Atencion</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="Fecha_HC" runat="server" CssClass="form-control" textmode="Date"  Required=""></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

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
                            <asp:TextBox id="Obs_Paciente" runat="server" class="form-control" placeholder="Registra aqui la observacion de la atencion" Height="100px" Width="1000" Columns="40" Rows="12" TextMode="MultiLine"  Required="" MaxLength="1000"></asp:TextBox>
                        </div>
                          <div class="input-group">
                            <h3>Tratamiento</h3>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="Tr_Paciente" runat="server" class="form-control" placeholder="Registra aqui el tratamiento a seguir" Height="100px" Width="1000" Columns="40" Rows="12" TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                        </div>
                      
                    </div>
                </div>
            </div>
        

        </div>
        <br />
            <div align="center">
                <table>
                    <tr>
                        <td>
                             <asp:Button ID="BTN_Guardar_Paciente" runat="server" class="btn btn-success" width="200px" Text="Guardar Registro" />
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                       
                         <td>
                             <asp:Button ID="BTN_Cancelar" runat="server" class="btn btn-danger" width="200px" Text="Cancelar Registro" />
                        </td>
                      
                    </tr>
                </table>
         

            </div>        
    </section>
        <br />
         <br />  
        
      

    </form>
 

</asp:Content>
