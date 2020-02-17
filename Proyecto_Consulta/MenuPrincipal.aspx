<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPrincipal.Master" CodeBehind="MenuPrincipal.aspx.vb" Inherits="Proyecto_Consulta.MenuPrincipal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <section class="align-content-center">
        <h3 style="margin-bottom: 25px; text-align: center">Seleciona la Pagina a la que necesitas acceder </h3>
    </section>
    <br />

                                            
   <form runat="server">
        <section class="content">
            <div class="row, row justify-content-around">
                <!-- Columna 1 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>Rut Paciente</label>
                            </div>
                            <div class="form-group">
                               <asp:DropDownList ID="menu" runat="server" DataSourceID="origenMenus" DataTextField="Nombre Menu" DataValueField="Nombre Menu" AutoPostBack="True" OnSelectedIndexChanged="menu_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="origenMenus" runat="server" ConnectionString="Data Source=EQUIPAZO\EQUIPO;Initial Catalog=Proyecto_Titulo;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Menu Usuario] ORDER BY [Id Menu]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Columna 2 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>Rut Médico</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="RutDoc" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<!-- Columna 3 -->
                <div class="col-md-2">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="input-group">
                                <label>N° de Receta</label>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="N_Receta" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>--%>
              
              
            </div>
        </section>
    </form>
       

</asp:Content>
