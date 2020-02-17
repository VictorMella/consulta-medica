<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSecretaria.Master" CodeBehind="Pacientesdiarios.aspx.vb" Inherits="Proyecto_Consulta.Pacientesdiarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Listado de Pacientes</h3>
    </section>
    <form runat="server" id="form1" name="form1" onsubmit="return Rut(document.getElementById('ContentPlaceHolder1_rut').value);">
        <section class="content">
            <div class="row, row justify-content-around">
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h5 class="box-title" style="text-align:center">Ingresa el Rut del Paciente</h5>
                        </div>
                        <br />
                        <div class="box-body">
                            <div class="input-group" >
                                <asp:TextBox ID="rut" runat="server" CssClass="form-control" TextMode="SingleLine" MaxLength="12" placeholder="11.111.111-1"></asp:TextBox>&nbsp;&nbsp;
                            <span class="input-group-btn">
                                <asp:Button ID="BTN_ListadoPacientes" CssClass="btn btn-success" runat="server" Text="Buscar Paciente"  TabIndex="0" />&nbsp;&nbsp;
                            </span>
                                   <span class="input-group-btn">
                                <asp:Button ID="BTN_Cancelar" CssClass="btn btn-danger" runat="server" Text="Cancelar Edicion" TabIndex="0" />&nbsp;&nbsp;
                            </span>  
                            </div>
                         
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <br />
          <section class="content">
        <div class="row, row justify-content-around">       
         <div class="col-md-11">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title" id="numpaciente" style="text-align:center" runat="server"></h3>

                    </div>
                    <br />
                    <div class="table table-responsive">
                              <!-- Crear nuestro GridView-->
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id Paciente,Comuna"
                            ShowFooter="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"
                            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand" 
                            OnRowDeleting="GridView1_RowDeleting"
                            CellPadding="0" ForeColor="#333333" width="1200px" CssClass="table table-striped table-bordered table-condensed">

                            <Columns >
                       
                        <asp:TemplateField HeaderText="Rut del Paciente" ControlStyle-Width="90px">
                            <EditItemTemplate>
                                <asp:TextBox id="txtrutpaciente" runat="server" Text='<%# Eval("[Rut Paciente]") %>' enabled="false"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label1" runat="server" Text='<%# Eval("[Rut Paciente]") %>' enabled="false"></asp:Label>
                            </ItemTemplate>                         
                            <ItemStyle Wrap="True" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Nombre ">
                            <EditItemTemplate>
                                <asp:TextBox id="txtnompaciente" runat="server" Text='<%# Eval("[Nombre Paciente]") %>' enabled="True" MaxLength="30"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label2" runat="server" Text='<%# Eval("[Nombre Paciente]") %>' enabled="true" ></asp:Label>
                            </ItemTemplate>                         
                            <ItemStyle Wrap="True" />
                        </asp:TemplateField>   
                        
                        <asp:TemplateField HeaderText="Apellido Paterno">
                            <EditItemTemplate>
                                <asp:TextBox id="txtAppaciente" runat="server" Text='<%# Eval("[Apellido Paterno]")%>' enabled="true" MaxLength="20"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label3" runat="server" Text='<%# Eval("[Apellido Paterno]")%>' enabled="true"></asp:Label>
                            </ItemTemplate>        
                                <ItemStyle Wrap="True" />
                        </asp:TemplateField>  
                        
                        <asp:TemplateField HeaderText="Apellido Materno">
                            <EditItemTemplate>
                                <asp:TextBox id="txtAmpaciente" runat="server" Text='<%# Eval("[Apellido Materno]")%>' enabled="true" MaxLength="20"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label4" runat="server" Text='<%# Eval("[Apellido Materno]")%>' enabled="True"></asp:Label>
                            </ItemTemplate>  
                        </asp:TemplateField>

                          <asp:TemplateField HeaderText="Fecha Nacimiento">
                            <EditItemTemplate>
                                <asp:TextBox id="txtfecha" runat="server" Text='<%# Eval("[Fecha de Nacimiento]")%>' enabled="true" TextMode="DateTime"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label5" runat="server" Text='<%# Eval("[Fecha de Nacimiento]")%>' enabled="True"></asp:Label>
                            </ItemTemplate>  
                        </asp:TemplateField>

                           <asp:TemplateField HeaderText="Direccion ">
                            <EditItemTemplate>
                                <asp:TextBox id="txtdireccion" runat="server" Text='<%# Eval("[Direccion Paciente]")%>' enabled="true" placeholder="" MaxLength="50"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label6" runat="server" Text='<%# Eval("[Direccion Paciente]")%>' enabled="True"></asp:Label>
                            </ItemTemplate>  
                        </asp:TemplateField>

                           <asp:TemplateField HeaderText="Telefono">
                            <EditItemTemplate>
                                <asp:TextBox id="txtfono" runat="server" Text='<%# Eval("[Telefono Paciente]")%>' enabled="true" placeholder="123456789" TextMode="Number"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label7" runat="server" Text='<%# Eval("[Telefono Paciente]")%>' enabled="True"></asp:Label>
                            </ItemTemplate>  
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Comuna">
                            <EditItemTemplate>
                                        
                                <asp:DropDownList ID="cmbComuna" runat="server" DataSourceID="OrigenComuna" DataTextField="Comuna" DataValueField="Comuna">                               
                                </asp:DropDownList>   
                                <asp:SqlDataSource ID="OrigenComuna" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Comunas] ORDER BY [Id Comun]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("[Comuna]")%>' id="Label8"></asp:Label>
                            </ItemTemplate>                            
                        </asp:TemplateField>  

                         <asp:TemplateField HeaderText="Prevision">
                            <EditItemTemplate>
                                       
                                <asp:DropDownList ID="cmbPrevision" runat="server" DataSourceID="OrigenPrevision" DataTextField="Prevision" DataValueField="Prevision">                               
                                </asp:DropDownList>   
                                <asp:SqlDataSource ID="OrigenPrevision" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Prevision] ORDER BY [Id Prevision]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("[Prevision]")%>' id="Label9"></asp:Label>
                            </ItemTemplate>                            
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtemail" runat="server" Text='<%# Eval("[Email Paciente]")%>' Enabled="true" required="" MaxLength="50"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("[Email Paciente]")%>' Enabled="true" required=""></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="True" />
                        </asp:TemplateField>

                            <asp:TemplateField HeaderText="Estado">
                            <EditItemTemplate>
                                         
                                <asp:DropDownList ID="cmbPEstado" runat="server" DataSourceID="OrigenEstadoPaciente" DataTextField="Estado Paciente" DataValueField="Id Estado">                               
                                </asp:DropDownList>   
                                <asp:SqlDataSource ID="OrigenEstadoPaciente" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Estado Paciente] ORDER BY [Id Estado]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("[Id Estado]")%>' id="Label11"></asp:Label>
                            </ItemTemplate>                            
                        </asp:TemplateField> 

                        <asp:TemplateField HeaderText="Actualizar Datos" ShowHeader="False">
                                <ItemTemplate>                                    
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary" Text="Actualizar Registro"></asp:LinkButton>  
                                </ItemTemplate>
                                <EditItemTemplate>
                                      <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CssClass="btn btn-info" CommandName="Update" Text="Guardar Cambio"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-info"  CommandName="Cancel" Text="Cancelar"></asp:LinkButton> 
                                </EditItemTemplate>
                              </asp:TemplateField>                            
                    </Columns>                
            </asp:GridView>       
                           
                        </div>
                  
                </div>
            </div>
           
              
     </div>
   </section>
            <section class="content">
        <div class="row, row justify-content-around">
            <!-- Columna 1 -->
            <div class="col-md-11">
                <div class="box box-primary">
                    <div class="box-body">                     
                        <div class="table table-responsive">
                            <asp:GridView ID="gridpacientes" runat="server" width="1400px"  
                                CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed" AutoGenerateColumns="False" DataKeyNames="Rut_Paciente" DataSourceID="OrigenPaciente" 
                                AllowPaging="True" OnPageIndexChanging="gridpacientes_PageIndexChanging" PageSize="10" HeaderStyle-CssClass="text-center" RowStyle-CssClass="text-center"  
                                       HeaderStyle-Font-Bold="true" RowStyle-Font-Size="Small" GridLines="None" HeaderStyle-Font-Size="Medium">
                                <Columns>
                                    <asp:BoundField DataField="Rut_Paciente" HeaderText="Rut Paciente" ReadOnly="True" SortExpression="Rut_Paciente" />
                                    <asp:BoundField DataField="Nombre_Paciente" HeaderText="Nombre" SortExpression="Nombre_Paciente" />
                                    <asp:BoundField DataField="Apellido_Paterno" HeaderText="Ap. Paterno" SortExpression="Apellido_Paterno" />
                                    <asp:BoundField DataField="Apellido_Materno" HeaderText="Ap. Materno" SortExpression="Apellido_Materno" />
                                    <asp:BoundField DataField="Fecha_de_Nacimiento" HeaderText="Fecha de Nacimiento" SortExpression="Fecha_de_Nacimiento" />
                                    <asp:BoundField DataField="Direccion_Paciente" HeaderText="Direccion" SortExpression="Direccion_Paciente" />
                                    <asp:BoundField DataField="Telefono_Paciente" HeaderText="Telefono" SortExpression="Telefono_Paciente" />
                                    <asp:BoundField DataField="Comuna" HeaderText="Comuna" SortExpression="Comuna" />
                                    <asp:BoundField DataField="Prevision" HeaderText="Prevision" SortExpression="Prevision" />
                                    <asp:BoundField DataField="Email_Paciente" HeaderText="Email" SortExpression="Email_Paciente" />
                                </Columns>
                               
                            </asp:GridView>
                         
                            <asp:SqlDataSource ID="OrigenPaciente" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Rut Paciente] AS Rut_Paciente, [Nombre Paciente] AS Nombre_Paciente, [Apellido Paterno] AS Apellido_Paterno, [Apellido Materno] AS Apellido_Materno, [Fecha de Nacimiento] AS Fecha_de_Nacimiento, [Direccion Paciente] AS Direccion_Paciente, [Telefono Paciente] AS Telefono_Paciente, [Comuna], [Prevision], [Email Paciente] AS Email_Paciente FROM [Paciente] WHERE ([Id Estado] = @Id_Estado) ORDER BY [Id Paciente]">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="Id_Estado" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                         
                        </div>
                    </div>
                       <div align="center" >
                                <span class="input-group-btn">
                                <asp:Button ID="BTN_Imprimir" CssClass="btn btn-success" runat="server" Text="Imprimir Listado" Width="300" TabIndex="0" />
                            </span>
                                </div>
                </div>
            </div>                   
             </div>
                </section>
    </form>




   

</asp:Content>
