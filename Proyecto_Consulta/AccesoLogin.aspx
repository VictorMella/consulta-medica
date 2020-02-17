<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSecretaria.Master" CodeBehind="AccesoLogin.aspx.vb" Inherits="Proyecto_Consulta.AccesoLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Listado de Usuarios</h3>
    </section>
    <form runat="server">
        <section class="content">
            <div class="row, row justify-content-around">
                <div class="col-md-4">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h5 class="box-title" style="text-align:center">Selecciona el Rut del Usuario</h5>
                        </div>
                        <br />
                        <div class="box-body">
                            <div class="input-group" >
                                <asp:TextBox ID="rut" runat="server" CssClass="form-control" TextMode="SingleLine" MaxLength="12" Enabled="false" placeholder="11.111.111-1"></asp:TextBox>&nbsp;&nbsp;
                            <span class="input-group-btn">
                                <asp:Button ID="BTN_ListadoUsuarios" CssClass="btn btn-success" runat="server" Text="Buscar Usuario"  TabIndex="0" Width="150px" />&nbsp;&nbsp;
                            </span>
                                   <span class="input-group-btn">
                                <asp:Button ID="BTN_Cancelar" CssClass="btn btn-danger" runat="server" Text="Limpiar Busqueda" TabIndex="0" Width="150px" />
                            </span>
                            </div>
                            <br />
                            <h5 class="box-title" id="numuser" style="text-align:center" runat="server"></h5>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <br />
        <br />
            <section class="content">
        <div class="row, row justify-content-around">
               <div class="col-md-1">
                <div class="box box-primary">
                    <div class="box-body">
  </div>
                </div>
            </div>

            <!-- Columna 1 -->
            <div class="col-md-4">
                <div class="box box-primary">
                    <div class="box-body">
                       <div class="Input-group">
                            <h4>Datos del Usuario</h4>
                        </div>
                          <div class="input-group">
                            <label>&nbsp;&nbsp;</label>
                        </div>
                        <div class="table table-responsive">
                            <asp:GridView ID="GridAcceso" runat="server"   
                                CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed" AutoGenerateColumns="False"  
                                AllowPaging="True" OnPageIndexChanging="GridAcceso_PageIndexChanging" PageSize="5" DataSourceID="OrigenAcceso" EnableTheming="True">
                                <Columns>
                                    <asp:CommandField HeaderText="Selecciona Rut" ShowSelectButton="True" />
                                    <asp:BoundField DataField="Rut_Usuario" HeaderText="Rut Usuario" SortExpression="Rut_Usuario" />
                                    <asp:BoundField DataField="Pass_Usuario" HeaderText="Password Usuario" SortExpression="Pass_Usuario" DataFormatString="&quot;********&quot;" HtmlEncode="False"/>
                                    <asp:BoundField DataField="Id_Perfil" HeaderText="Perfil" SortExpression="Id_Perfil" />
                                </Columns>
                            </asp:GridView>                        
                    
                         
                            <asp:SqlDataSource ID="OrigenAcceso" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto_TituloConnectionString %>" SelectCommand="SELECT [Rut Usuario] AS Rut_Usuario, [Pass Usuario] AS Pass_Usuario, [Id Perfil] AS Id_Perfil FROM [Acceso] ORDER BY [Id usuario]"></asp:SqlDataSource>
                    
                         
                        </div>
                    </div>
                </div>
            </div>  
             <div class="col-md-3">
                <div class="box box-primary">
                    <div class="box-body">
                         <div class="Input-group">
                            <h4>Verificacion de Datos</h4>
                        </div>
                          <div class="input-group">
                            <label>Nombre Usuario</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox id="Nom" runat="server" CssClass="form-control"  enabled="false"></asp:TextBox>
                        </div>
                        <div class="input-group">
                            <label>Rut Usuario</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox id="rutuser" runat="server" CssClass="form-control" MaxLength="12" enabled="false"></asp:TextBox>
                        </div>
                        <div class="input-group">
                            <label>Password</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="txtpass" runat="server" CssClass="form-control" Text="" maxlength="8" enabled="false"></asp:TextBox>
                        </div>
                          <div class="input-group">
                            <label>Perfil</label>
                        </div>
                          <div class="form-group">
                            <asp:TextBox id="txtperfil" runat="server" CssClass="form-control" Text="" enabled="false"></asp:TextBox>
                        </div>                  
                    </div>
                </div>
            </div>
             <div class="col-md-1">
                <div class="box box-primary">
                    <div class="box-body">
  </div>
                </div>
            </div>


             </div>
                </section>
    </form>
</asp:Content>
