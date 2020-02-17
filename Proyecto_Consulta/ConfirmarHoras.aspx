<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSecretaria.Master" CodeBehind="ConfirmarHoras.aspx.vb" Inherits="Proyecto_Consulta.ConfirmarHoras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Confirmar Horas</h3>
    </section>
     <form runat="server">
        <section class="content">
        <div class="row, row justify-content-around">
        <div class="col-md-3">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Ingresa la Fecha a Buscar</h3>
                    </div>
                    <br />
                    <div class="box-body">
                       
                        <div class="input-group">
                            <asp:TextBox ID="txtFechaAtencion" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>&nbsp;&nbsp;
                            <span class="input-group-btn">
                                <asp:Button ID="btnBuscar" CssClass="btn btn-success" runat="server" Text="Buscar" />
                            </span>
                        </div>
                    </div>                       
                    </div>
            </div>
             </div>                       
                   </section>

            <br />
              <br />       
             
                          <section class="content-header">
                    <h3 style="text-align: center">Confirmar Horas Medicas</h3>
                </section>               
                 <br />   
                        <section class="content">
             <div class="row, row justify-content-around ">
                    <div class="col-md-11">
                        <div class="table table-responsive">
                                 <!-- Crear nuestro GridView-->
                                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id Reserva,Estado Reserva"
                                     ShowFooter="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"
                                     OnRowDeleting="GridView1_RowDeleting"
                                     OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand"
                                     CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed">

                                     <Columns>

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
                                         <asp:TemplateField HeaderText="Rut Medico">
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="txtRutMedico" runat="server" Text='<%# Eval("[Rut Medico]")%>' Enabled="false"></asp:TextBox>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label ID="Label3" runat="server" Text='<%# Eval("[Rut Medico]")%>' Enabled="false"></asp:Label>
                                             </ItemTemplate>
                                             <ItemStyle Wrap="True" />
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Rut Paciente">
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="txtRut" runat="server" Text='<%# Eval("[Rut Paciente]")%>' Enabled="false" placeholder="11.111.111-1"></asp:TextBox>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label ID="Label4" runat="server" Text='<%# Eval("[Rut Paciente]")%>' Enabled="false"></asp:Label>
                                             </ItemTemplate>

                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Estado de la Reserva">
                                             <EditItemTemplate>
                                                       
                                <asp:DropDownList ID="cmbEstadoReserva" runat="server" DataSourceID="OrigenEstadoDisponibilidad" DataTextField="Estado Reserva Medica" DataValueField="Estado Reserva Medica">
                                </asp:DropDownList>

                                                 <asp:SqlDataSource ID="OrigenEstadoDisponibilidad" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Estado Reserva] WHERE (([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica2)) ORDER BY [Id Consulta Medica]">
                                                     <SelectParameters>

                                                         <asp:Parameter DefaultValue="2" Name="Id_Consulta_Medica" Type="Int32" />
                                                         <asp:Parameter DefaultValue="6" Name="Id_Consulta_Medica2" Type="Int32" />
                                                     </SelectParameters>
                                                 </asp:SqlDataSource>

                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label runat="server" Text='<%# Eval("[Estado Reserva]")%>' ID="Label6"></asp:Label>
                                             </ItemTemplate>

                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Telefono de Contacto">
                                             <EditItemTemplate>
                                                 <asp:TextBox ID="txtfono" runat="server" Text='<%# Eval("[Telefono de Contacto]")%>' Enabled="false" placeholder="123456789"></asp:TextBox>
                                             </EditItemTemplate>
                                             <ItemTemplate>
                                                 <asp:Label ID="Label5" runat="server" Text='<%# Eval("[Telefono de Contacto]")%>' Enabled="false"></asp:Label>
                                             </ItemTemplate>
                                             <ItemStyle Wrap="True" />
                                         </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Nombre del Paciente">
                                <EditItemTemplate>
                                    <asp:TextBox ID="NomPas" runat="server" Text='<%# Eval("[Nombre del Paciente]") %>' Enabled="false"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("[Nombre del Paciente]") %>' Enabled="false"></asp:Label>
                                </ItemTemplate>

                                <ItemStyle Wrap="True" />
                            </asp:TemplateField>


                                         <asp:TemplateField HeaderText="Editar" ShowHeader="False">
                                             <ItemTemplate>
                                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary" Text="Confirmar Hora"></asp:LinkButton>
                                             </ItemTemplate>
                                             <EditItemTemplate>
                                                 <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CssClass="btn btn-info" CommandName="Update" Text="Guardar Hora"></asp:LinkButton>
                                                 <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-info" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
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
