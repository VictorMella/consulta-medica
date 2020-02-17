<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSecretaria.Master" CodeBehind="CargarAgenda.aspx.vb" Inherits="Proyecto_Consulta.CargarAgenda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Cargar Agenda </h3>
    </section>
    <hr class="featurette-divider">
    <br />
   <form runat="server">
      <section class="content">
        <div class="row, row justify-content-around">
            <!-- Columna 1 -->
            <div class="col-md-1">
                <div class="box box-primary">
                    <div class="box-body">
                       <div class="box-header">
                        <h4 class="box-title">&nbsp;</h4>
                    </div>
                    
                    </div>
                </div>
            </div>            
            <!-- Columna 2 -->
              <div class="col-md-7">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="box-header">
                        <h4 class="box-title">Disponibilidad del Medico</h4>
                    </div>
                <div class="table table-responsive">
                            <asp:GridView ID="gridDisponibilidad" runat="server"  
                                CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed">                                   
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
                        <h5 class="box-title">Busca la Disponibilidad del medico </h5>
                    </div>
                        <div class="form group ">
                            <asp:DropDownList ID="cmbMedico" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="Rut Empleado"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="select [Rut Empleado],'nombre'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],'') 
                                from Empleado e             
                                where e.[Cargo Empleado]='medico'"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT [Rut Medico] AS Rut_Medico FROM [Medico] ORDER BY [Rut Medico]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <br/>
                     <div class="form-group" style="align-content:center">
                            <asp:Button ID="BuscaDispon" runat="server" CssClass="btn btn-success" Text="Buscar Disponibilidad" />
                        </div>
                </div>
            </div>  
                <!-- Columna 1 -->
            <div class="col-md-1">
                <div class="box box-primary">
                    <div class="box-body">
                       <div class="box-header">
                        <h4 class="box-title">&nbsp;</h4>
                    </div>
                    
                    </div>
                </div>
            </div>    
            </div>
           
        </section>
       <hr class="featurette-divider">
          <hr class="featurette-divider">
       <br />
       <br />
       <div class="box-footer" style="text-align: center">
                        <%--<asp:Button ID="btnAgregarHorario" runat="server" CssClass="btn btn-primary" Text="Agregar Horario" />--%>
                        <asp:LinkButton ID="btnAgregarHorario" runat="server" CssClass="btn btn-success btn-lg btn-block" href="#AgregarHorario" data-toggle="modal" Width="400px" >Agregar Horario</asp:LinkButton>
                        <%--<asp:Button ID="btnGuardarHorario" runat="server" CssClass="btn btn-success" Text="Guarda Horario" />--%>
                    </div>     
       
       
       <br />          
       <br />    
        <br /> 
        <br /> 
        <section class="content">
        <div class="row, row justify-content-around">
            <!-- Columna 3 -->
            <div class="col-md-2">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="box-header">
                        <h5 class="box-title">Revisar Horas Ingresadas</h5>
                    </div>
                        <div class="form group">
                           <asp:TextBox ID="Fecha" runat="server" CssClass="form-control" textmode="Date"></asp:TextBox>
                        </div>
                    </div>
                    <br/>
                     <div class="form-group" style="align-content:center">
                            <asp:Button ID="BTN_Buscar" runat="server" CssClass="btn btn-success" Text="Revisar Horas" />
                        </div>
                </div>
            </div>    

       
            <!-- Columna 2 -->
              <div class="col-md-8">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="box-header">
                        <h4 class="box-title">Horas Agendadas</h4>
                    </div>
                   <div class="table table-responsive">
                            <asp:GridView ID="GridHoras" runat="server"  
                                CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed">                                   
                            </asp:GridView>                         
                           
                        </div>
                          
                    </div>
                </div>
            </div>            
        </div>
        </section>
        <hr class="featurette-divider">
          <hr class="featurette-divider">
       <br/>
          <br />          
       <br />    
      
      
     


           <hr class="featurette-divider">   

       <div class="modal fade" id="AgregarHorario" tabindex="-1" role="dialog" aria-hidden="true">
           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                       <h3 class="modal-title"><i class="fa fa-clock-o"></i>Agregar Horario Atención</h3>
                   </div>
                   <div class="modal-body">
                       <div class="form-group">
                           <label>Hora de la Reserva:</label>
                           <div class="form group  ">
                               <asp:DropDownList ID="cmbhora" CssClass="form-control" runat="server" DataSourceID="origenHora" DataTextField="Hora Consulta" DataValueField="Hora Consulta"></asp:DropDownList>
                               <asp:SqlDataSource ID="origenHora" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Horarios] ORDER BY [Id Horarios]"></asp:SqlDataSource>
                           </div>
                       </div>
                       <div class="form-group">
                           <label>Fecha de la Reserva:</label>
                           <div class="input-group">
                               <asp:TextBox ID="txtfecha" CssClass="form-control" Text="" TextMode="Date" data-mask="" runat="server"></asp:TextBox>
                           </div>
                       </div>
                       <div class="form-group">
                         <label>Rut del Medico:</label>
                           <div class="form group  ">
                               <asp:DropDownList ID="cmbrutmedico" CssClass="form-control" runat="server" DataSourceID="Otroorigenrutmedico" DataTextField="nombre" DataValueField="Rut Empleado"></asp:DropDownList>
                               <asp:SqlDataSource ID="Otroorigenrutmedico" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="select [Rut Empleado],'nombre'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],'') 
                                from Empleado e             
                                where e.[Cargo Empleado]='medico'"></asp:SqlDataSource>
                               <asp:SqlDataSource ID="OrigenRutmedico" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Rut Medico] AS Rut_Medico FROM [Medico] ORDER BY [Id Empleado]"></asp:SqlDataSource>
                           </div>


                       </div>
                       <div class="form-group">
                           <label>Estado de la Reserva:</label>
                           <div class="form group  ">
                               <asp:DropDownList ID="cmbEstadoReserva" CssClass="form-control" runat="server" DataSourceID="Origenestadoreserva" DataTextField="Estado Reserva Medica" DataValueField="Estado Reserva Medica"></asp:DropDownList>
                               <asp:SqlDataSource ID="Origenestadoreserva" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Estado Reserva] WHERE (([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica2) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica3) AND ([Id Consulta Medica] &lt;&gt; @Id_Consulta_Medica4)) ORDER BY [Id Consulta Medica]">
                                   <SelectParameters>
                                       <asp:Parameter DefaultValue="2" Name="Id_Consulta_Medica" Type="Int32" />
                                       <asp:Parameter DefaultValue="3" Name="Id_Consulta_Medica2" Type="Int32" />
                                       <asp:Parameter DefaultValue="4" Name="Id_Consulta_Medica3" Type="Int32" />
                                       <asp:Parameter DefaultValue="6" Name="Id_Consulta_Medica4" Type="Int32" />
                                   </SelectParameters>
                               </asp:SqlDataSource>
                           </div>

                       </div>
                   </div>
                   <div class="modal-footer clearfix">
                        <asp:Button ID="BtnAgregar" runat="server" CssClass="btn btn-success" Text="Agregar Hora" />
                   </div>
               </div>
           </div>
       </div>






     
     </form>

</asp:Content>

