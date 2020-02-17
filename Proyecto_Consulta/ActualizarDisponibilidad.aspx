<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSecretaria.Master" CodeBehind="ActualizarDisponibilidad.aspx.vb" Inherits="Proyecto_Consulta.ActualizarDisponibilidad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Actualizar Disponibilidad de los Medicos </h3>
    </section>
    <hr class="featurette-divider">
    <form runat="server">
      <section class="content">
        <div class="row, row justify-content-around">
               <!-- Columna 1 -->
            <div class="col-md-8">
                <div class="box box-primary">
                    <div class="box-body">
                      <div class="box-header">
                        <h4 class="box-title"> &nbsp;&nbsp;</h4>
                    </div>
                     <div class="table table-responsive">

            <asp:GridView  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id Disponibilidad,Nombre Dia" 
                ShowFooter="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound"  
                     OnRowDeleting="GridView1_RowDeleting"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand" 
                CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed" >
       
                    <Columns >
                       <asp:TemplateField HeaderText="Nombre del Especialista">
                            <EditItemTemplate>
                                <asp:TextBox id="nmedico" runat="server" Text='<%# Eval("[Nombre del Especialista]") %>' enabled="false"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label10" runat="server" Text='<%# Eval("[Nombre del Especialista]") %>' enabled="false"></asp:Label>
                            </ItemTemplate>                         

                            <ItemStyle Wrap="True" />
                        </asp:TemplateField>
                            <asp:TemplateField HeaderText="Especialidad" >
                            <EditItemTemplate>
                                <asp:TextBox id="nespe" runat="server" Text='<%# Eval("[Especialidad]") %>' enabled="false"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label11" runat="server" Text='<%# Eval("[Especialidad]") %>' enabled="false"></asp:Label>
                            </ItemTemplate>                         

                            <ItemStyle Wrap="True" />
                        </asp:TemplateField>

                          <asp:TemplateField HeaderText="Rut del Medico" >
                            <EditItemTemplate>
                                      
                                <asp:DropDownList ID="cmbrut" runat="server" DataSourceID="OrigenRutMedico" DataTextField="Rut_Medico" DataValueField="Rut_Medico" Enabled="false">

                                </asp:DropDownList>
                                <asp:SqlDataSource ID="OrigenRutMedico" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT [Rut Medico] AS Rut_Medico FROM [Medico] ORDER BY [Especialidad]"></asp:SqlDataSource>
    
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Rut Medico")%>' id="Label1"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="cmbNewrut" runat="server" DataSourceID="Medico" DataTextField="Rut_Medico" DataValueField="Rut_Medico" >
                            
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="Medico" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT [Rut Medico] AS Rut_Medico FROM [Medico] ORDER BY [Especialidad]"></asp:SqlDataSource>

                            </FooterTemplate>
                        </asp:TemplateField>
                      
                        <asp:TemplateField HeaderText="Dia">
                            <EditItemTemplate>
                                   
                                <asp:DropDownList ID="cmbDia" runat="server" DataSourceID="OrigenDias" DataTextField="Nombre Dia" DataValueField="Nombre Dia">
                          
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="OrigenDias" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT * FROM [Dias Semana] ORDER BY [Id Dias]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Nombre Dia")%>' id="Label2"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="cmbNewDia" runat="server" DataSourceID="OrigenDias" DataTextField="Nombre Dia" DataValueField="Nombre Dia" >
                      
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="OrigenDias" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT * FROM [Dias Semana] ORDER BY [Id Dias]"></asp:SqlDataSource>
                            </FooterTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Hora de Inicio">
                            <EditItemTemplate>
                                      
                                <asp:DropDownList ID="cmbInicio" runat="server" DataSourceID="OrigenHora1" DataTextField="Hora Consulta" DataValueField="Hora Consulta">

                                </asp:DropDownList>
                                <asp:SqlDataSource ID="OrigenHora1" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT * FROM [Horarios] ORDER BY [Id Horarios]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Hora Inicio")%>' id="Label3"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="cmbNewInicio" runat="server" DataSourceID="OrigenHora1" DataTextField="Hora Consulta" DataValueField="Hora Consulta" >
                            
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="OrigenHora1" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT * FROM [Horarios] ORDER BY [Id Horarios]"></asp:SqlDataSource>
                            </FooterTemplate>
                        </asp:TemplateField>

                           <asp:TemplateField HeaderText="Hora de Termino">
                            <EditItemTemplate>
                                      
                                <asp:DropDownList ID="cmbTermino" runat="server" DataSourceID="OrigenHora2" DataTextField="Hora Consulta" DataValueField="Hora Consulta">
                             
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="OrigenHora2" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT * FROM [Horarios] ORDER BY [Id Horarios]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Hora Termino")%>' id="Label4"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="cmbNewTermino" runat="server" DataSourceID="OrigenHora2" DataTextField="Hora Consulta" DataValueField="Hora Consulta" >
                                
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="OrigenHora2" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT * FROM [Horarios] ORDER BY [Id Horarios]"></asp:SqlDataSource>
                            </FooterTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Editar" ShowHeader="False" ControlStyle-Width="100px"  >
                                <ItemTemplate>                                    
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-success" Text="Editar" Width="70px"></asp:LinkButton>  
                                </ItemTemplate>
                                <EditItemTemplate>
                                      <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CssClass="btn btn-success" CommandName="Update" Text="Actualizar" Width="90px"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-success"  CommandName="Cancel" Text="Cancelar" Width="90px"></asp:LinkButton> 
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="lnkAddNew" CssClass="btn btn-success" runat="server" CommandName="AgragarNuevo">Agragar</asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>
    
                        <asp:TemplateField HeaderText="Borrar" ShowHeader="False">
                            <ItemTemplate>        
                                <span onclick="return confirm('Estas seguro de que quieres borrar el registro?')">
                                    
                                    <asp:LinkButton ID="lnkB" runat="Server" CssClass="btn btn-success"  Text="Borrar" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Delete"></asp:LinkButton>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>                
            </asp:GridView>   
                            </div>

                    </div>

                </div>

            </div>
              <!-- Columna 3 -->
            <div class="col-md-2">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="box-header">
                        <h5 class="box-title">Busca Medico </h5>
                    </div>
                        <div class="form group  ">
                                                         <asp:dropdownlist id="cmbdoctor" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="Rut Empleado"></asp:dropdownlist>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="select [Rut Empleado],'nombre'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],'') 
                from Empleado e             
                where e.[Cargo Empleado]='medico'"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="OrigenRUTMEDICO" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT [Rut Medico] AS Rut_Medico FROM [Medico] ORDER BY [Rut Medico]"></asp:SqlDataSource>
                           
                        </div>
                    </div>
                    <br/>
                     <div class="form-group" style="align-content:center">
                            <asp:Button ID="BTN_BuscaMedico" runat="server" CssClass="btn btn-success" Text="Buscar Disponibilidad del Medico" />
                        </div>
                </div>
            </div>   
               <div class="col-md-1">
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
        </form>
</asp:Content>
