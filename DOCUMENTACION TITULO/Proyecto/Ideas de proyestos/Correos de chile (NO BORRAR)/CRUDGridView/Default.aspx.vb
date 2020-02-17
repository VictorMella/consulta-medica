Option Explicit On
Option Strict On

Imports System.Data.SqlClient
Imports System.Data
Imports System.Linq
Imports System.Collections.Generic

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim objCustomer As CustomerCls

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not Page.IsPostBack) Then
            FillCustomerInGrid()
        End If
    End Sub

    Protected Sub FillCustomerInGrid()

        Dim dtCustomer As DataTable = New CustomerCls().Fetch()
        Try

            If dtCustomer.Rows.Count > 0 Then
                GridView1.DataSource = dtCustomer
                GridView1.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtCustomer.Rows.Add(dtCustomer.NewRow())
                Me.GridView1.DataSource = dtCustomer
                GridView1.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = GridView1.Rows(0).Cells.Count
                GridView1.Rows(0).Cells.Clear()
                GridView1.Rows(0).Cells.Add(New TableCell())
                GridView1.Rows(0).Cells(0).ColumnSpan = TotalColumns
                GridView1.Rows(0).Cells(0).Style.Add("text-align", "center")
                GridView1.Rows(0).Cells(0).Text = "No customer records in the database!"

            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try

    End Sub

    Protected Sub GridView1_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) _
        Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        FillCustomerInGrid()
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName.Equals("AddNew") Then
            Dim txtNewName As TextBox
            txtNewName = CType(GridView1.FooterRow.FindControl("txtNewName"), TextBox)
            Dim cmbNewGender As DropDownList
            cmbNewGender = CType(GridView1.FooterRow.FindControl("cmbNewGender"), DropDownList)
            Dim txtNewCity As TextBox
            txtNewCity = CType(GridView1.FooterRow.FindControl("txtNewCity"), TextBox)
            Dim txtNewState As TextBox
            txtNewState = CType(GridView1.FooterRow.FindControl("txtNewState"), TextBox)
            Dim cmbNewType As DropDownList
            cmbNewType = CType(GridView1.FooterRow.FindControl("cmbNewType"), DropDownList)

            objCustomer = New CustomerCls
            objCustomer.InsertCustomer(txtNewName.Text, cmbNewGender.SelectedValue, txtNewCity.Text, txtNewState.Text, cmbNewType.SelectedValue)
            FillCustomerInGrid()
        ElseIf e.CommandName.Equals("Delete") Then
            objCustomer = New CustomerCls
            Dim index As Integer
            index = Convert.ToInt32(e.CommandArgument)
            objCustomer.DeleteCustomer(Convert.ToInt32(GridView1.DataKeys(index).Values(0).ToString()))
            FillCustomerInGrid()
        End If

    End Sub

    'this is the edit mode event
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                'retain value of Type in the combobox
                Dim cmbType As DropDownList
                cmbType = CType(e.Row.FindControl("cmbType"), DropDownList)

                If Not cmbType Is Nothing Then
                    cmbType.SelectedValue = GridView1.DataKeys(e.Row.RowIndex).Values(1).ToString()
                End If

                'retain value of Gender in the combobox
                Dim cmbGender As DropDownList
                cmbGender = CType(e.Row.FindControl("cmbGender"), DropDownList)

                If Not cmbGender Is Nothing Then
                    cmbGender.SelectedValue = GridView1.DataKeys(e.Row.RowIndex).Values(2).ToString()
                End If
            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try

    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs)
       
    End Sub

    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        FillCustomerInGrid()
    End Sub

    'get values when row is updating
    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs)

        If (GridView1.EditIndex <> -1) Then

            Dim txtName As TextBox
            txtName = CType(GridView1.Rows(e.RowIndex).FindControl("txtName"), TextBox)
            Dim cmbGender As DropDownList
            cmbGender = CType(GridView1.Rows(e.RowIndex).FindControl("cmbGender"), DropDownList)
            Dim txtCity As TextBox
            txtCity = CType(GridView1.Rows(e.RowIndex).FindControl("txtCity"), TextBox)
            Dim txtState As TextBox
            txtState = CType(GridView1.Rows(e.RowIndex).FindControl("txtState"), TextBox)
            Dim cmbType As DropDownList
            cmbType = CType(GridView1.Rows(e.RowIndex).FindControl("cmbType"), DropDownList)

            objCustomer = New CustomerCls
            objCustomer.UpdateCustomer(txtName.Text, cmbGender.SelectedValue, txtCity.Text, txtState.Text, cmbType.SelectedValue, Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0).ToString()))
            GridView1.EditIndex = -1
            FillCustomerInGrid()
        End If

    End Sub

End Class
