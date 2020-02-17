
<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSecretaria.Master" CodeBehind="Agendar.aspx.vb" Inherits="Proyecto_Consulta.Agendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Agendar Horas Medicas</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Reserva de Horas Medicas </h3>
    </section>
 <form runat="server">
    <div class="box-header">
        <h3 style="text-align: center" class="box-title">Ver Disponibilidad</h3>
    </div>
    <br />
    <section class="content">
        <div class="row, row justify-content-around">
            <!-- Columna 1 -->
            <div class="col-md-2">
                <div class="box box-primary">
                <div class="box-body">
                        <div class="input-group">
                            <label>&nbsp;&nbsp;</label>
                        </div>
                    </div>
                </div>
            </div>
       

            <!-- Columna 3 -->
            <div class="col-md-2">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="Input-group">
                            <h6>Elegir la Fecha</h6>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="Fecha_Dispn" runat="server" CssClass="form-control" TextMode="Date" required=""></asp:TextBox>

                        </div>
                    </div>
                </div>
                </div>
                  
            <div class="col-md-2">
                    <div class="box box-primary">
                            <div class="box-header">
                               <h6>Nombre del Medico</h6>
                            </div> 
                        <div class="box-body">                                                      
                            <div class="input-group">
                         <asp:dropdownlist id="Medico" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="Rut Empleado"></asp:dropdownlist>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="select [Rut Empleado],'nombre'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],'') 
                from Empleado e             
                where e.[Cargo Empleado]='medico'"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="OrigenRUTMEDICO" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT [Rut Medico] AS Rut_Medico FROM [Medico] ORDER BY [Rut Medico]"></asp:SqlDataSource>
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
                            <asp:Button ID="BTN_Buscar" runat="server" CssClass="btn btn-success" Text="Buscar Horas Disponibles" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-2">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="input-group">
                            <label>&nbsp;&nbsp;</label>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>


                <br />
                <section class="content-header">
                    <h3 style="text-align: center">HORARIOS DE ATENCIÓN</h3>
                </section>               
                 <br />
        <section class="content">

            <div class="row, row justify-content-around ">
                <div class="col-md-10">
                    <div class="box box-primary">
                    <div class="box-body">                     
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
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("[Rut Medico]")%>' Enabled="false"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Rut Paciente">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRut" runat="server" Text='<%# Eval("[Rut Paciente]")%>' Enabled="true" placeholder="11.111.111-1" required="" MaxLength="12"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("[Rut Paciente]")%>' Enabled="True" required=""></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado de la Reserva">
                                <EditItemTemplate>

                                    <asp:DropDownList ID="cmbEstadoResrva" runat="server" DataSourceID="OrigenEstadoDisponibilidad" DataTextField="Estado Reserva Medica" DataValueField="Estado Reserva Medica">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="OrigenEstadoDisponibilidad" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Estado Reserva] WHERE (([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica2) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica3) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica4)) ORDER BY [Id Consulta Medica]">
                                        <SelectParameters>

                                            <asp:Parameter DefaultValue="3" Name="Id_Consulta_Medica2" Type="Int32" />
                                            <asp:Parameter DefaultValue="4" Name="Id_Consulta_Medica3" Type="Int32" />
                                            <asp:Parameter DefaultValue="6" Name="Id_Consulta_Medica4" Type="Int32" />
                                            <asp:Parameter DefaultValue="1" Name="Id_Consulta_Medica" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Eval("[Estado Reserva]")%>' ID="Label6"></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Telefono de Contacto">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtfono" runat="server" Text='<%# Eval("[Telefono de Contacto]")%>' Enabled="true" TextMode="number" MaxLength="9" placeholder="123456789"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("[Telefono de Contacto]")%>' Enabled="true" textmode="number" MaxLength="9"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Editar" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-success" Text="Tomar Hora"></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CssClass="btn btn-success" CommandName="Update" Text="Guardar Hora"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-success" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Borrar" ShowHeader="False">
                                <ItemTemplate>
                                    <span onclick="return confirm('Estas seguro de que quieres borrar el registro?')">

                                        <asp:LinkButton ID="lnkB" runat="Server" CssClass="btn btn-success" Text="Borrar" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Delete"></asp:LinkButton>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                        </div>
                        </div>
                    </div>
            </div>
        </section>
        <br />
     
    
    </form>
    
</asp:Content>
