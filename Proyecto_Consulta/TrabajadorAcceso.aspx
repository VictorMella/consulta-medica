<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPrincipal.Master" CodeBehind="TrabajadorAcceso.aspx.vb" Inherits="Proyecto_Consulta.TrabajadorAcceso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Registro de Medicos</h3>
    </section>
                                                                        <%--  HOJA TERMINADA NO EDITAAAAAARRR --%>
      <form id="form1" name="form1" onsubmit="return Rut(document.getElementById('ContentPlaceHolder1_rut').value);" runat="server">
    <section class="content">
        <div class="row, row justify-content-around">
            
        
            <div class="col-md-5">
                <div class="box box-primary">
                         <div class="form-header">
                <h3 style="margin-bottom: 25px; text-align: center">Crear Acceso para el Trabajador</h3>
            </div>
                    <div class="box-body">
                        <div class="input-group">
                            <label>Rut del Usuario</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox id="rut" runat="server" CssClass="form-control" MaxLength="12" required="" placeholder="11.111.111-1"></asp:TextBox>
                        </div>
                        <div class="input-group">
                            <label>Password del Usuario</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="pass1" runat="server" CssClass="form-control" Text="" required="" TextMode="Password" MaxLength="8" placeholder="password de 8 caracteres "></asp:TextBox>
                        </div>
                        <div class="input-group">
                            <label>Confirmar Password</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="pass2" runat="server" CssClass="form-control" Text="" Required="" textmode="Password" MaxLength="8" placeholder="Confirma el password "></asp:TextBox>
                        </div>
                          <div class="input-group">
                            <label>Perfil de Usuario</label>
                        </div>
                          <div class="form-group">
                            <asp:dropdownlist id="cmbPerfil" runat="server" CssClass="form-control" DataSourceID="OrigenPerfil" DataTextField="Perfil Usuario" DataValueField="Id Perfil" ></asp:dropdownlist>
                              <asp:SqlDataSource ID="OrigenPerfil" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT * FROM [Perfil Usuario] WHERE (([Id Perfil] &lt;&gt; @Id_Perfil) AND ([Id Perfil] &lt;&gt; @Id_Perfil2)) ORDER BY [Id Perfil]">
                                  <SelectParameters>
                                      <asp:Parameter DefaultValue="1" Name="Id_Perfil" Type="Int32" />
                                      <asp:Parameter DefaultValue="4" Name="Id_Perfil2" Type="Int32" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                        </div>

                         
                    </div>
                </div>
                                 <div align="center">
                <table>
                    <tr>
                        <td>
                             <asp:Button ID="BTN_GuardarAcceso" runat="server" class="btn btn-success" width="200px" Text="Guardar Registro"  />
                        </td>                      
                   
                    </tr>

                </table>
            </div>   
            </div>
              </div>        
    </section>
    
    </form>
</asp:Content>
