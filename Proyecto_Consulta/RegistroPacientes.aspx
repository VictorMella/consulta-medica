<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSecretaria.Master" CodeBehind="RegistroPacientes.aspx.vb" Inherits="Proyecto_Consulta.RegistroPacientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Registro de Pacientes</h3>
    </section>
    
         
    <form id="form1" name="form1" onsubmit="return Rut(document.getElementById('ContentPlaceHolder1_rut').value);" runat="server">
    <section class="content">
        <div class="row, row justify-content-around">
            <div class="col-md-5">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="Input-group">
                            <label>Rut Paciente</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox id="rut" name="Rut" runat="server" CssClass="form-control" MaxLength="12" required="" Placeholder="11.111.111-1"></asp:TextBox>
                        </div>
                        <div class="Input-group">
                            <label>Nombre</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="Nom_Paciente" runat="server" CssClass="form-control" Text="" required="" MaxLength="30" placeholder="Nombre del paciente"></asp:TextBox>
                        </div>
                          <div class="Input-group">
                            <label>Apellido Paterno</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="Ap_Paciente" runat="server" CssClass="form-control" Text="" required="" MaxLength="20" placeholder="Apellido del paciente"></asp:TextBox>
                        </div>
                          <div class="Input-group">
                            <label>Apellido Materno</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="Am_Paciente" runat="server" CssClass="form-control" Text="" required="" MaxLength="20" placeholder="Apellido del paciente"></asp:TextBox>
                        </div>
                          <div class="Input-group">
                            <label>Fecha de Nacimiento</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="FNAC_Paciente" runat="server" CssClass="form-control" Text="" TextMode="Date" required=""></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="box box-primary">
                    <div class="box-body">
                         <div class="Input-group">
                            <label>Telefono</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="Fono_Paciente" runat="server" CssClass="form-control"  required="" textmode="number" MaxLength="9" placeholder="123456789"></asp:TextBox>
                        </div>
                
                        <div class="Input-group">
                            <label>Direccion</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox id="Dir_Paciente" runat="server" CssClass="form-control" required="" MaxLength="50" placeholder="Direccion del paciente"></asp:TextBox>
                        </div>                       
                          <div class="Input-group">
                            <label>Comuna</label>
                        </div>
                          <div class="form-group">
                              <asp:DropDownList ID="cmbComuna" runat="server" CssClass="form-control" DataSourceID="OrigenComuna" DataTextField="Comuna" DataValueField="Comuna" required="">                              
                                  
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="OrigenComuna" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Comunas] ORDER BY [Id Comun]"></asp:SqlDataSource>
                        </div>
                          <div class="Input-group">
                            <label>Prevision</label>
                        </div>
                          <div class="form-group">
                            <asp:DropDownList ID="cmbPrevision" runat="server" CssClass="form-control" DataSourceID="OrigenPrevision" DataTextField="Prevision" DataValueField="Prevision" required="">                                                          
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="OrigenPrevision" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Prevision] ORDER BY [Id Prevision]"></asp:SqlDataSource>
                        </div>
                          <div class="Input-group">
                            <label>E-mail</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox ID="Email_Paciente" name="" placeholder="Mail del paciente" cssclass="form-control" runat="server" TextMode="Email" required="" MaxLength="50" ></asp:TextBox>
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
                             <asp:Button ID="BTN_Guardar_Paciente" runat="server" cssclass="btn btn-success" width="200px" Text="Guardar Registro" />
                        </td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                     
                        <td>&nbsp;&nbsp;&nbsp;</td>
                         <td>
                             <asp:Button ID="BTN_Cancelar" runat="server" Cssclass="btn btn-danger" width="200px" Text="Cancelar Registro"  />
                        </td>
                    </tr>

                </table>
            </div>        
    </section>
        <br />
         <br />
     

    
    </form>
 
</asp:Content>

 