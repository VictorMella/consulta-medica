<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterDoc.Master" CodeBehind="Certificado.aspx.vb" Inherits="Proyecto_Consulta.Certificado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Certificado Medico</h3>
    </section>
                                                     <!--LISTOO NO BORRAR -->
     <div class="container">
        <div class="col-md-5">
            <div class="form-area">
                   <form runat="server" id="form1" name="form1" onsubmit="return Rut(document.getElementById('ContentPlaceHolder1_rut').value);">   
                    <h3 style="margin-bottom: 25px; text-align: center">Completa los campos para llenar el Certificado</h3>
                    <br />
                   <h4 id="certificado" runat="server"/>
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
                        <asp:TextBox ID="Rut_Med_Cert" name="" placeholder="" class="form-control" runat="server" TextMode="SingleLine" MaxLength="12"></asp:TextBox>
                    </div>
                    <label class="control-label">Fecha de Inicio del Reposo</label>
                    <div class="form-group">
                        <asp:TextBox ID="Fecha_Reposo" name="" placeholder="" class="form-control" runat="server" TextMode="date"></asp:TextBox>
                    </div>
                    <label class="control-label">Dias de Reposo</label>
                    <div class="form-group">
                       <asp:TextBox ID="Dias" name="" placeholder="" class="form-control" runat="server" TextMode="number"></asp:TextBox>
                    </div>

                    <label class="control-label">Obsrvacion</label>
                    <div class="form-group">

                        <asp:TextBox ID="TxtObservaciones" runat="server" class="form-control" placeholder="Ingresa el Tratamiento" Height="200px" Width="430px" Columns="40" Rows="12" TextMode="MultiLine" MaxLength="500"></asp:TextBox>

                    </div>
                    <div align="center">
                        <asp:Button ID="BTN_Certificado" runat="server" class="btn btn-success" Text="Guardar Certificado" />&nbsp; &nbsp;
                        <asp:Button ID="Btn_Imprimir" runat="server" class="btn btn-success" Text="Generar Certificado" />
                    </div>
                        <div align="center">
                    <asp:TextBox ID="txtFicheroPDF" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
                </div>
          
</form>
            </div>
        </div>
    </div>
                  
</asp:Content>
