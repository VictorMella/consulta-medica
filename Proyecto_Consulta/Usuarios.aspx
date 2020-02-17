<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPrincipal.Master" CodeBehind="Usuarios.aspx.vb" Inherits="Proyecto_Consulta.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Registro de Trabajadores</h3>
    </section>
                                                                        <%--  HOJA TERMINADA NO EDITAAAAAARRR --%>
      <form id="form1" name="form1" onsubmit="return Rut(document.getElementById('ContentPlaceHolder1_rut').value);" runat="server">
    <section class="content">
        <div class="row, row justify-content-around">
            <div class="col-md-5">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="input-group">
                            <label>Rut del Usuario</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox id="rut" runat="server" CssClass="form-control" MaxLength="12" required="" placeholder="11.111.111-1"></asp:TextBox>
                        </div>
                     <div class="input-group">
                            <label>Nombre del Usuario</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="Nom_Usuario" runat="server" CssClass="form-control" Text="" required="" placeholder="Nombre del Trabajador" MaxLength="30"></asp:TextBox>
                        </div>
                          <div class="input-group">
                            <label>Apellido Paterno</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="Ap_Paciente_Usuario" runat="server" CssClass="form-control" Text="" required="" placeholder="Apellido del Trabajador" MaxLength="20"></asp:TextBox>
                        </div>
                        <div class="input-group">
                            <label>Apellido Materno</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="Am_Paciente_Usuario" runat="server" CssClass="form-control" Text="" required="" placeholder="Apellido del Trabajador" MaxLength="20"></asp:TextBox>
                        </div>
                      
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="box box-primary">
                    <div class="box-body">
                         <div class="input-group">
                            <label>Telefono</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox id="Fono_Paciente" runat="server" CssClass="form-control" Text="" required="" placeholder="123456789" TextMode="Number" MaxLength="9"></asp:TextBox>
                        </div>
                       <div class="input-group">
                            <label>Direccion</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox id="Dir_Paciente" runat="server" CssClass="form-control" required="" placeholder="Direccion del Trabajador" MaxLength="50"></asp:TextBox>
                        </div>                       
                        <div class="input-group">
                            <label>Cargo del Usuario</label>
                        </div>
                          <div class="form-group">
                              <asp:DropDownList ID="cmbCargo" runat="server" CssClass="form-control" DataSourceID="OrigenCargo" DataTextField="Nombre Cargo" DataValueField="Nombre Cargo">
                               
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="OrigenCargo" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT * FROM [Cargos] WHERE ([Id Cargo] &lt;&gt; @Id_Cargo) ORDER BY [Id Cargo]">
                                  <SelectParameters>
                                      <asp:Parameter DefaultValue="3" Name="Id_Cargo" Type="Int32" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                        </div>
                       <div class="input-group">
                            <label>E-mail</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox ID="Email_Paciente" name="" placeholder="Mail del Trabajador" cssclass="form-control" runat="server" TextMode="Email" required="" MaxLength="50"></asp:TextBox>
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
              
    </form>





      </asp:Content>
