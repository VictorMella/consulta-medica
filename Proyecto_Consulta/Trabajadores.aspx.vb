Public Class Trabajadores
    Inherits System.Web.UI.Page
    Dim objadmin As New Admin
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
        rut.Focus()
        Contador()
        Me.numtrabajador.InnerHtml = "El total de Trabajadores  es de " & Session("Cuenta") & " Personas"
        GridView1.Visible = False
        gridtrabajador.Visible = True
    End Sub
    Protected Sub gridtrabajador_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridtrabajador.PageIndex = e.NewPageIndex
    End Sub
    Protected Sub FillPacienteInGrid(ByVal RutTrabajador As String)
        'se llena la gridview 
        Dim dtPaciente As DataTable = New Admin().Fetch(RutTrabajador)
        Try

            If dtPaciente.Rows.Count > 0 Then
                GridView1.DataSource = dtPaciente
                GridView1.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtPaciente.Rows.Add(dtPaciente.NewRow())
                Me.GridView1.DataSource = dtPaciente
                GridView1.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = GridView1.Rows(0).Cells.Count
                GridView1.Rows(0).Cells.Clear()
                GridView1.Rows(0).Cells.Add(New TableCell())
                GridView1.Rows(0).Cells(0).ColumnSpan = TotalColumns
                GridView1.Rows(0).Cells(0).Style.Add("text-align", "left")
                GridView1.Rows(0).Cells(0).Text = "No hay registros del paciente"

            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try

    End Sub

    Protected Sub GridView1_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) _
        Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        FillPacienteInGrid(rut.Text)
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName.Equals("AgragarNuevo") Then

            Dim txtrutempleadonew As TextBox
            txtrutempleadonew = CType(GridView1.FooterRow.FindControl("txtNewRut"), TextBox)
            Dim txtnomnew As TextBox
            txtnomnew = CType(GridView1.FooterRow.FindControl("txtnomnew"), TextBox)

            Dim txtAppnew As TextBox
            txtAppnew = CType(GridView1.FooterRow.FindControl("txtAppnew"), TextBox)

            Dim txtApmnew As TextBox
            txtApmnew = CType(GridView1.FooterRow.FindControl("txtApmnew"), TextBox)

            Dim txtdireccionnew As TextBox
            txtdireccionnew = CType(GridView1.FooterRow.FindControl("txtdireccionnew"), TextBox)

            Dim txtfononew As TextBox
            txtfononew = CType(GridView1.FooterRow.FindControl("txtfononew"), TextBox)

            Dim cmbCargonew As DropDownList
            cmbCargonew = CType(GridView1.FooterRow.FindControl("cmbCargonew"), DropDownList)

            Dim txtemailnew As TextBox
            txtemailnew = CType(GridView1.FooterRow.FindControl("txtemailnew"), TextBox)

            Dim cmbPEstadonew As DropDownList
            cmbPEstadonew = CType(GridView1.FooterRow.FindControl("cmbPEstadonew"), DropDownList)

            objadmin = New Admin

            objadmin.Inserttrabajo(txtrutempleadonew.Text, txtnomnew.Text, txtAppnew.Text, txtApmnew.Text, txtdireccionnew.Text, txtfononew.Text,
            cmbCargonew.SelectedValue, txtemailnew.Text, cmbPEstadonew.SelectedValue)
            FillPacienteInGrid(rut.Text)
        ElseIf e.CommandName.Equals("Delete") Then
            objadmin = New Admin
            Dim index As Integer
            index = Convert.ToInt32(e.CommandArgument)
            objadmin.DeleteTrabajador(Convert.ToInt32(GridView1.DataKeys(index).Values(0).ToString()))
            FillPacienteInGrid(rut.Text)
        End If

    End Sub

    'this is the edit mode event
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                'retain value of Genero in the combobox
                Dim cmbCargo As DropDownList
                cmbCargo = CType(e.Row.FindControl("cmbCargo"), DropDownList)
                If Not cmbCargo Is Nothing Then
                    cmbCargo.SelectedValue = GridView1.DataKeys(e.Row.RowIndex).Values(1).ToString()
                End If
            End If
        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try

    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs)

    End Sub

    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs)
        GridView1.Visible = True
        gridtrabajador.Visible = False
        GridView1.EditIndex = e.NewEditIndex
        FillPacienteInGrid(rut.Text)
    End Sub

    'get values when row is updating
    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs)


        If (GridView1.EditIndex <> -1) Then

            Dim txtrutempleado As TextBox
            txtrutempleado = CType(GridView1.Rows(e.RowIndex).FindControl("txtrutempleado"), TextBox)

            Dim txtnom As TextBox
            txtnom = CType(GridView1.Rows(e.RowIndex).FindControl("txtnom"), TextBox)

            Dim txtApp As TextBox
            txtApp = CType(GridView1.Rows(e.RowIndex).FindControl("txtApp"), TextBox)

            Dim txtApm As TextBox
            txtApm = CType(GridView1.Rows(e.RowIndex).FindControl("txtApm"), TextBox)

            Dim txtdireccion As TextBox
            txtdireccion = CType(GridView1.Rows(e.RowIndex).FindControl("txtdireccion"), TextBox)

            Dim txtfono As TextBox
            txtfono = CType(GridView1.Rows(e.RowIndex).FindControl("txtfono"), TextBox)

            Dim cmbCargo As DropDownList
            cmbCargo = CType(GridView1.Rows(e.RowIndex).FindControl("cmbCargo"), DropDownList)

            Dim txtemail As TextBox
            txtemail = CType(GridView1.Rows(e.RowIndex).FindControl("txtemail"), TextBox)

            Dim cmbPEstado As DropDownList
            cmbPEstado = CType(GridView1.Rows(e.RowIndex).FindControl("cmbPEstado"), DropDownList)

            objadmin = New Admin
            If txtfono.Text.Length > 9 Then
                MsgBox("Numero de Telefono debe de ser de hasta 9 Digitos")
            Else
                objadmin.UpdateTrabajador(txtrutempleado.Text, txtnom.Text, txtApp.Text, txtApm.Text, txtdireccion.Text, txtfono.Text, cmbCargo.SelectedValue,
                txtemail.Text, cmbPEstado.SelectedValue, Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0).ToString()))
                GridView1.EditIndex = -1
                FillPacienteInGrid(rut.Text)
                Response.Write("<script>alert('Datos Actualizados de manera correcta');</script>")
                rut.Text = ""
                If cmbPEstado.SelectedValue = 2 Then
                    objadmin.UpdatePerfil(txtrutempleado.Text)
                    Response.Write("<script>alert('Usuario ya no tendra acceso al Sistema');</script>")
                ElseIf cmbPEstado.SelectedValue = 1 Then
                    objadmin.CambiarPerfil(txtrutempleado.Text)
                    Response.Write("<script>alert('Usuario ya tiene acceso al Sistema');</script>")
                End If
            End If
        End If

    End Sub
    Protected Sub Contador()
        Dim dtcontador As DataTable = New Admin().Contador()
        If dtcontador.Rows.Count() < 0 Then
            MsgBox("no hay datos")
        Else
            Session("Cuenta") = dtcontador(0).Item(0)
        End If
    End Sub
    Protected Sub BTN_BuscaTrabajador_Click(sender As Object, e As EventArgs) Handles BTN_BuscaTrabajador.Click
        GridView1.Visible = True
        gridtrabajador.Visible = False
        objadmin = New Admin
        FillPacienteInGrid(rut.Text)
    End Sub

    Protected Sub BTN_Cancela_Click(sender As Object, e As EventArgs) Handles BTN_Cancela.Click
        GridView1.Visible = False
        gridtrabajador.Visible = True
        rut.Text = ""
        rut.Focus()
    End Sub


End Class