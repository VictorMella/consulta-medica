<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPaciente.Master" CodeBehind="MisHoras.aspx.vb" Inherits="Proyecto_Consulta.MisHoras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">

          <section class="content-header">
                    <h3 style="text-align: center">Mis Horas Agendadas</h3>
                </section>  
      <br />  
        <div class="text-center">
       <strong><label id="rut" runat="server"></label></strong> 
            </div>
        <br/>
     
        <br />
                 <section class="content">
                 
                                <div class="row, row justify-content-around ">
                                    <div class="col-md-10">
                                         <div class="table table-responsive">
                                        <!-- Crear nuestro GridView-->
                                        <asp:GridView  ID="HorasAgendadas" runat="server" AutoGenerateColumns="False" DataKeyNames="Id Reserva,Estado Reserva" 
                ShowFooter="True" OnRowCancelingEdit="HorasTomadas_RowCancelingEdit" OnRowDataBound="HorasTomadas_RowDataBound"  
                     OnRowDeleting="HorasTomadas_RowDeleting"
                OnRowEditing="HorasTomadas_RowEditing" OnRowUpdating="HorasTomadas_RowUpdating" OnRowCommand="HorasTomadas_RowCommand" 
                CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed" >
       
                    <Columns >
                       
                        <asp:TemplateField HeaderText="Hora de la Reserva">
                            <EditItemTemplate>
                                <asp:TextBox id="txtHora" runat="server" Text='<%# Eval("[Hora Reserva]") %>' enabled="false"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label1" runat="server" Text='<%# Eval("[Hora Reserva]") %>' enabled="false"></asp:Label>
                            </ItemTemplate>                         
                            <ItemStyle Wrap="True" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Fecha de la Reserva">
                            <EditItemTemplate>
                                <asp:TextBox id="txtfechareserva" runat="server" Text='<%# Eval("[Fecha Reserva]") %>' enabled="false" ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label2" runat="server" Text='<%# Eval("[Fecha Reserva]") %>' enabled="false" ></asp:Label>
                            </ItemTemplate>
                         
                            <ItemStyle Wrap="True" />
                        </asp:TemplateField>  
                                 <asp:TemplateField HeaderText="Nombre del Medico">
                            <EditItemTemplate>
                                <asp:TextBox id="medico" runat="server" Text='<%# Eval("[Nombre del Medico]") %>' enabled="false"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label9" runat="server" Text='<%# Eval("[Nombre del Medico]") %>' enabled="false"></asp:Label>
                            </ItemTemplate>                         
                            <ItemStyle Wrap="True" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rut Medico">
                            <EditItemTemplate>
                                <asp:TextBox id="txtRutMedico" runat="server" Text='<%# Eval("[Rut Medico]")%>' enabled="false" ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label4" runat="server" Text='<%# Eval("[Rut Medico]")%>' enabled="false"></asp:Label>
                            </ItemTemplate>        
                                <ItemStyle Wrap="True" />
                        </asp:TemplateField>                                               
                        <asp:TemplateField HeaderText="Rut Paciente">
                            <EditItemTemplate>
                                <asp:TextBox id="txtRut" runat="server" Text='<%# Eval("[Rut Paciente]")%>' enabled="false" ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label5" runat="server" Text='<%# Eval("[Rut Paciente]")%>' enabled="false"></asp:Label>
                            </ItemTemplate>  

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado de la Reserva">
                            <EditItemTemplate>
                                     
                                <asp:DropDownList ID="cmbEstadoResrva" runat="server" DataSourceID="OrigenEstadoDisponibilidad" DataTextField="Estado Reserva Medica" DataValueField="Estado Reserva Medica">
                               
                                </asp:DropDownList>
                          
                                <asp:SqlDataSource ID="OrigenEstadoDisponibilidad" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Estado Reserva] WHERE (([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica2) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica3) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica4)) ORDER BY [Id Consulta Medica]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="2" Name="Id_Consulta_Medica" Type="Int32" />
                                        <asp:Parameter DefaultValue="3" Name="Id_Consulta_Medica2" Type="Int32" />
                                        <asp:Parameter DefaultValue="4" Name="Id_Consulta_Medica3" Type="Int32" />
                                        <asp:Parameter DefaultValue="6" Name="Id_Consulta_Medica4" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                          
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("[Estado Reserva]")%>' id="Label6"></asp:Label>
                            </ItemTemplate>                            
                        </asp:TemplateField>                      
                
                        <asp:TemplateField HeaderText="Editar" ShowHeader="False">
                                <ItemTemplate>                                    
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-success" Text="Cambiar"></asp:LinkButton>  
                                </ItemTemplate>
                                <EditItemTemplate>
                                      <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CssClass="btn btn-success" CommandName="Update" Text="Anular Hora"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-success"  CommandName="Cancel" Text="Cancelar"></asp:LinkButton> 
                                </EditItemTemplate>
                              </asp:TemplateField>                            
                    </Columns>
                
            </asp:GridView>       
                                    </div>
                                </div>                            
                  </div>
            </section>
    </form>

</asp:Content>
