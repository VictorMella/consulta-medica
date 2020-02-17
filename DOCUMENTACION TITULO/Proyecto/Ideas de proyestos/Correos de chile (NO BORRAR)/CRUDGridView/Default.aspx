<%@ Page Language="VB" AutoEventWireup="FALSE" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRUD Operations in GridView</title>   
    <script src="Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Content/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        #GridContainer
        {
            margin-top:5em;
            margin-left:auto;
            margin-right:auto;
            width:50%;            
        }

        #LabelContainer
        {
            text-align:center;
        }

        #lblHeading
        {
            margin-left:auto;
            margin-right:auto;
            font-weight:bold;
            font-size:1.5em;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Container">
        <div id="GridContainer">
            <div id="LabelContainer">
                <asp:Label ID="lblHeading" runat="server" Text="ASP.NET GridView CRUD with Bootstrap (VB.NET)" >
                </asp:Label>
            </div>           
            <br />
               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Code,Type,Gender" 
                ShowFooter="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound" 
                OnRowDeleting="GridView1_RowDeleting"
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCommand="GridView1_RowCommand" 
                CellPadding="0" ForeColor="#333333" CssClass="table table-striped table-bordered table-condensed">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <EditItemTemplate>
                                <asp:TextBox id="txtName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label id="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtNewName" runat="server" ></asp:TextBox>
                            </FooterTemplate>
                            <ItemStyle Wrap="True" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Gender">
                            <EditItemTemplate>
                                &nbsp;           
                                <asp:DropDownList ID="cmbGender" runat="server">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Gender")%>' id="Label2"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="cmbNewGender" runat="server" >
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="City">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Eval("City")%>' id="txtCity"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("City")%>' id="Label3"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtNewCity" runat="server" ></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="State">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Eval("State")%>' id="txtState"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("State")%>' id="Label4"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtNewState" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Type">
                            <EditItemTemplate>
                                &nbsp;
                            <asp:DropDownList ID="cmbType" runat="server">
                                    <asp:ListItem>Retail</asp:ListItem>
                                    <asp:ListItem>Wholesale</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Type") %>' id="Label5"></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="cmbNewType" runat="server">
                                     <asp:ListItem>Retail</asp:ListItem>
                                     <asp:ListItem>Wholesale</asp:ListItem>
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                <ItemTemplate>                                    
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary" Text="Edit"></asp:LinkButton>  
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="True" CssClass="btn btn-info" CommandName="Update" Text="Update"></asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-info"  CommandName="Cancel" Text="Cancel"></asp:LinkButton> 
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="lnkAddNew" CssClass="btn btn-primary" runat="server" CommandName="AddNew">Add</asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>
    
                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                            <ItemTemplate>        
                                <span onclick="return confirm('Are you sure to Delete the record?')">
                                    
                                    <asp:LinkButton ID="lnkB" runat="Server" CssClass="btn btn-primary"  Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' CommandName="Delete"></asp:LinkButton>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
            </asp:GridView>                      
        </div>    
    </div>
    </form>
</body>
</html>
