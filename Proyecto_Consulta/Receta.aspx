<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterDoc.Master" CodeBehind="Receta.aspx.vb" Inherits="Proyecto_Consulta.Receta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Receta Medica</h3>
    </section>
                                                            <!--LISTOO NO BORRAR -->
     <form runat="server" id="form1" name="form1" onsubmit="return Rut(document.getElementById('ContentPlaceHolder1_rut').value);">
      <div class="container">
        <div class="col-md-5">
            <div class="form-area">
               
                    <h3 style="margin-bottom: 25px; text-align: center">Completa los campos para llenar la Receta</h3>
                    <br />
                   <h4 id="receta" runat="server"/>
                    <br/>
                  <label class="control-label">Nombre del Paciente</label>
                    <div class="form-group">
                        <asp:TextBox ID="nom" name="" placeholder="" CssClass="form-control" runat="server" TextMode="SingleLine" Enabled="false"></asp:TextBox>
                    </div>  
                   
                    <label class="control-label">Rut Paciente</label>
                    <div class="form-group">
                        <asp:TextBox ID="rut" name="" placeholder="" CssClass="form-control" runat="server" TextMode="SingleLine" MaxLength="12"></asp:TextBox>
                    </div>
                    <label class="control-label">Rut Medico</label>
                    <div class="form-group">
                        <asp:TextBox ID="Rut_Med_Receta" name="" placeholder="" class="form-control" runat="server" TextMode="SingleLine" MaxLength="12"></asp:TextBox>
                    </div>
                    <label class="control-label">Fecha de Atencion</label>
                    <div class="form-group">
                        <asp:TextBox ID="Fecha_Receta" name="" placeholder="" CssClass="form-control" runat="server" TextMode="date"></asp:TextBox>
                    </div>
                    <label class="control-label">Vademecum</label>
                    <div class="form-group">
                        <asp:DropDownList ID="cmbRemedio" runat="server" CssClass="form-control" DataSourceID="OrigenRemedios" DataTextField="Nombre Medicamento" DataValueField="Nombre Medicamento">
                          
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="OrigenRemedios" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [medicamentos] ORDER BY [Id Medicamento]"></asp:SqlDataSource>
                    </div>

                    <label class="control-label">Indicaciones del tratamiento</label>
                    <div class="form-group">

                        <asp:TextBox ID="TxtTratamiento" runat="server" class="form-control" placeholder="Ingresa el Tratamiento" Height="200px" Width="430px" Columns="40" Rows="12" TextMode="MultiLine" MaxLength="500"></asp:TextBox>

                    </div>
                <div align="center">
                    <asp:Button ID="BTN_GuardarReceta" runat="server" class="btn btn-success" Text="Guardar Receta" />&nbsp; &nbsp; 
                       <asp:Button ID="Btn_Imprimir" runat="server" class="btn btn-success" Text="Generar Receta" />


                </div>
                <br />
                <div align="center">
                    <asp:TextBox ID="txtFicheroPDF" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                </div>
            </div>
        </div>
      </div>
    
       </form>
</asp:Content>
