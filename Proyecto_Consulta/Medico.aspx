<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPrincipal.Master" CodeBehind="Medico.aspx.vb" Inherits="Proyecto_Consulta.Medico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Registro de Medicos</h3>
    </section>
              <br />                                                          <%--  HOJA TERMINADA NO EDITAAAAAARRR --%>
      <form id="form1" name="form1" onsubmit="return Rut(document.getElementById('ContentPlaceHolder1_rut').value);" runat="server">
    <section class="content">
        <div class="row, row justify-content-around">
             <div class="col-md-5">
                <div class="box box-primary">
                    <div class="form-header">
                <h3 style="margin-bottom: 25px; text-align: center">Crear Medico</h3>
            </div>
                    <div class="box-body">
                        <div class="input-group">
                            <label>Rut del Profesional</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox id="rut" runat="server" CssClass="form-control" MaxLength="12" placeholder="Ingresa el Rut del Medico" required=""></asp:TextBox>
                        </div>                       
                       
                          <div class="input-group">
                            <label>Especialidad del profesional</label>
                        </div>
                          <div class="form-group">
                            <asp:dropdownlist id="cmbEspecialidad" runat="server" CssClass="form-control" DataSourceID="OrigenEspecialidad" DataTextField="Especialidad" DataValueField="Especialidad" ></asp:dropdownlist>
                              <asp:SqlDataSource ID="OrigenEspecialidad" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT * FROM [Especialidad Medico] ORDER BY [Especialidad]"></asp:SqlDataSource>
                        </div>
                         <div class="input-group">
                            <label>ICM del Profesional</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="ICM" runat="server" CssClass="form-control" Text="" required="Ingresa el IMC del Medico" TextMode="Number"></asp:TextBox>
                        </div>                         
                    </div>
                </div>
                 <div align="center">
                <table>
                    <tr>
                        <td>
                             <asp:Button ID="BTN_GuardarMedico" runat="server" class="btn btn-success" width="200px" Text="Guardar Registro" formnovaliditie="" />
                        </td>                      
                   
                    </tr>

                </table>
            </div>   
            </div>
      
            </div>        
    </section>
        <br />
         <br />      
    
    </form>
</asp:Content>
