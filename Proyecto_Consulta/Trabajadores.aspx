<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPrincipal.Master" CodeBehind="Trabajadores.aspx.vb" Inherits="Proyecto_Consulta.Trabajadores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Actualizar datos de Trabajadores</h3>
    </section>
    <form id="form1" name="form1" onsubmit="return Rut(document.getElementById('ContentPlaceHolder1_rut').value);" runat="server">
                  <section class="content">
            <div class="row, row justify-content-around">
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h5 class="box-title" style="text-align:center">Ingresa el Rut del Trabajador</h5>
                        </div>
                        <br />
                        <div class="box-body">
                            <div class="input-group" >
                                <asp:TextBox ID="rut" runat="server" CssClass="form-control" TextMode="SingleLine" MaxLength="12" placeholder="11.111.111-1"></asp:TextBox>&nbsp;&nbsp;
                            <span class="input-group-btn">
                                <asp:Button ID="BTN_BuscaTrabajador" CssClass="btn btn-success" runat="server" Text="Buscar Trabajador"  TabIndex="0" />&nbsp;&nbsp;
                            </span>
                                   <span class="input-group-btn">
                                <asp:Button ID="BTN_Cancela" CssClass="btn btn-danger" runat="server" Text="Cancelar Edicion" TabIndex="0" />
                            </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
                 <br />                            <%--  Aqui va otro gridview --%>
        <section class="content">
        <div class="row, row justify-content-around">       
         <div class="col-md-11">
                <div class="box box-primary">
                    <div class="box-header">
                        <h4 class="box-title" id="numtrabajador" style="text-align:center" runat="server"></h4>

                    </div>
                    <br />
                    <div class="table table-responsive">
                              <!-- Crear nuestro GridView-->
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id Empleado,Cargo Empleado"
                            ShowFooter="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"
                            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand" 
                            OnRowDeleting="GridView1_RowDeleting"
                            CellPadding="0" ForeColor="#333333" width="1200px" CssClass="table table-striped table-bordered table-condensed" >

                            <Columns >
                       
                        <asp:TemplateField HeaderText="Rut Empleado" ControlStyle-Width="90px">
                            <EditItemTemplate>
                                <asp:TextBox id="txtrutempleado" runat="server" Text='<%# Eval("[Rut Empleado]") %>' enabled="false"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label1" runat="server" Text='<%# Eval("[Rut Empleado]") %>' enabled="false"></asp:Label>
                            </ItemTemplate>                         

                            <ItemStyle Wrap="True" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Nombre ">
                            <EditItemTemplate>
                                <asp:TextBox id="txtnom" runat="server" Text='<%# Eval("[Nombre Paciente]") %>' enabled="True" MaxLength="30"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label2" runat="server" Text='<%# Eval("[Nombre Paciente]") %>' enabled="true" ></asp:Label>
                            </ItemTemplate>                         
                            <ItemStyle Wrap="True" />
                        </asp:TemplateField>   
                        
                        <asp:TemplateField HeaderText="Ap. Paterno">
                            <EditItemTemplate>
                                <asp:TextBox id="txtApp" runat="server" Text='<%# Eval("[Apellido Paterno]")%>' enabled="true" MaxLength="20"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label3" runat="server" Text='<%# Eval("[Apellido Paterno]")%>' enabled="true"></asp:Label>
                            </ItemTemplate>        
                                <ItemStyle Wrap="True" />
                        </asp:TemplateField>  
                        
                        <asp:TemplateField HeaderText="Ap. Materno">
                            <EditItemTemplate>
                                <asp:TextBox id="txtApm" runat="server" Text='<%# Eval("[Apellido Materno]")%>' enabled="true" MaxLength="20"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label4" runat="server" Text='<%# Eval("[Apellido Materno]")%>' enabled="True"></asp:Label>
                            </ItemTemplate>  
                        </asp:TemplateField>

                          <asp:TemplateField HeaderText="Direccion">
                            <EditItemTemplate>
                                <asp:TextBox id="txtdireccion" runat="server" Text='<%# Eval("[Direccion Empleado]")%>' enabled="true" MaxLength="50"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label5" runat="server" Text='<%# Eval("[Direccion Empleado]")%>' enabled="True"></asp:Label>
                            </ItemTemplate>  
                        </asp:TemplateField>

                           <asp:TemplateField HeaderText="Telefono">
                            <EditItemTemplate>
                                <asp:TextBox id="txtfono" runat="server" Text='<%# Eval("[Telefono Paciente]")%>' enabled="true" placeholder="" textmode="number" MaxLength="9"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label7" runat="server" Text='<%# Eval("[Telefono Paciente]")%>' enabled="True" textmode="number" MaxLength="9"></asp:Label>
                            </ItemTemplate>  
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Cargo">
                            <EditItemTemplate>
                                      
                                <asp:DropDownList ID="cmbCargo" runat="server" DataSourceID="OrigenCargo1" DataTextField="Nombre Cargo" DataValueField="Nombre Cargo">                               
                                </asp:DropDownList>   
                                <asp:SqlDataSource ID="OrigenCargo1" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT * FROM [Cargos] WHERE ([Id Cargo] &lt;&gt; @Id_Cargo) ORDER BY [Id Cargo]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="3" Name="Id_Cargo" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="OrigenComuna" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Comunas] ORDER BY [Id Comun]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("[Cargo Empleado]")%>' id="Label8"></asp:Label>
                            </ItemTemplate>                            
                        </asp:TemplateField>                 

                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtemail" runat="server" Text='<%# Eval("[Email Empleado]")%>' Enabled="true" required="" MaxLength="50"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("[Email Empleado]")%>' Enabled="true" required=""></asp:Label>
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
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-success" Text="Actualizar Registro"></asp:LinkButton>  
                                </ItemTemplate>
                                <EditItemTemplate>
                                      <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CssClass="btn btn-success" CommandName="Update" Text="Guardar Cambio"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-success"  CommandName="Cancel" Text="Cancelar"></asp:LinkButton> 
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
                            <asp:GridView ID="gridtrabajador" runat="server" width="1300px"  
                                CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed" AutoGenerateColumns="False" 
                                DataSourceID="OrigenEmpleado" AllowPaging="True" OnPageIndexChanging="gridtrabajador_PageIndexChanging" PageSize="10">
                                <Columns>
                                    <asp:BoundField DataField="Rut_Empleado" HeaderText="Rut Empleado" SortExpression="Rut_Empleado" />
                                    <asp:BoundField DataField="Nombre_Paciente" HeaderText="Nombre Paciente" SortExpression="Nombre_Paciente" />
                                    <asp:BoundField DataField="Apellido_Paterno" HeaderText="Apellido Paterno" SortExpression="Apellido_Paterno" />
                                    <asp:BoundField DataField="Apellido_Materno" HeaderText="Apellido Materno" SortExpression="Apellido_Materno" />
                                    <asp:BoundField DataField="Direccion_Empleado" HeaderText="Direccion" SortExpression="Direccion_Empleado" />
                                    <asp:BoundField DataField="Telefono_Paciente" HeaderText="Telefono" SortExpression="Telefono_Paciente" />
                                    <asp:BoundField DataField="Cargo_Empleado" HeaderText="Cargo" SortExpression="Cargo_Empleado" />
                                    <asp:BoundField DataField="Email_Empleado" HeaderText="Email" SortExpression="Email_Empleado" />
                                </Columns>
                            </asp:GridView>
                         
                            <asp:SqlDataSource ID="OrigenEmpleado" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT [Rut Empleado] AS Rut_Empleado, [Nombre Paciente] AS Nombre_Paciente, [Apellido Paterno] AS Apellido_Paterno, [Apellido Materno] AS Apellido_Materno, [Direccion Empleado] AS Direccion_Empleado, [Telefono Paciente] AS Telefono_Paciente, [Cargo Empleado] AS Cargo_Empleado, [Email Empleado] AS Email_Empleado FROM [Empleado] WHERE ([Id Estado] &lt;&gt; @Id_Estado) ORDER BY [Id Empleado]">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="2" Name="Id_Estado" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                         
                            
                         
                        </div>
                    </div>
                </div>
            </div>                   
             </div>
                </section>

     </form>
</asp:Content>
