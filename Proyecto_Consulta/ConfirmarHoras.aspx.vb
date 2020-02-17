Public Class ConfirmarHoras
    Inherits System.Web.UI.Page
    Dim objconfirma As New Secrecls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not Page.IsPostBack) Then
            FillconfirmaGrid(txtFechaAtencion.Text)
        End If
        If Session("User") = "" Or Session("User") <> "trabajador" And Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
    End Sub
    Protected Sub FillconfirmaGrid(ByVal txtFechaAtencion As String)
        'se llena la gridview 
        Dim dtconfirma As DataTable = New Secrecls().CondirmarHora(txtFechaAtencion)
        Try

            If dtconfirma.Rows.Count > 0 Then
                GridView1.DataSource = dtconfirma
                GridView1.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtconfirma.Rows.Add(dtconfirma.NewRow())
                Me.GridView1.DataSource = dtconfirma
                GridView1.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = GridView1.Rows(0).Cells.Count
                GridView1.Rows(0).Cells.Clear()
                GridView1.Rows(0).Cells.Add(New TableCell())
                GridView1.Rows(0).Cells(0).ColumnSpan = TotalColumns
                GridView1.Rows(0).Cells(0).Style.Add("text-align", "left")
                GridView1.Rows(0).Cells(0).Text = "No hay Horas disponibles para este dia"
            End If
        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try
    End Sub


    Protected Sub GridView1_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) _
        Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        FillconfirmaGrid(txtFechaAtencion.Text)
    End Sub
    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName.Equals("AgragarNuevo") Then

            Dim txtNewHora As TextBox
            txtNewHora = CType(GridView1.FooterRow.FindControl("txtNewHora"), TextBox)

            Dim txtNewfechareserva As TextBox
            txtNewfechareserva = CType(GridView1.FooterRow.FindControl("txtNewfechareserva"), TextBox)

            Dim txtNewRutMedico As TextBox
            txtNewRutMedico = CType(GridView1.FooterRow.FindControl("txtNewRutMedico"), TextBox)

            Dim cmbNewEstadoResrva As DropDownList
            cmbNewEstadoResrva = CType(GridView1.FooterRow.FindControl("cmbNewEstadoResrva"), DropDownList)

            objconfirma = New Secrecls

            objconfirma.InsertReserva(txtNewHora.Text, txtNewfechareserva.Text, txtNewRutMedico.Text, cmbNewEstadoResrva.SelectedValue)
            FillconfirmaGrid(txtFechaAtencion.Text)
        ElseIf e.CommandName.Equals("Delete") Then
            objconfirma = New Secrecls
            Dim index As Integer
            index = Convert.ToInt32(e.CommandArgument)
            objconfirma.DeleteReserva(Convert.ToInt32(GridView1.DataKeys(index).Values(0).ToString()))
            FillconfirmaGrid(txtFechaAtencion.Text)
        End If
    End Sub



    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                'retain value of Genero in the combobox
                Dim cmbEstadoReserva As DropDownList
                cmbEstadoReserva = CType(e.Row.FindControl("cmbEstadoReserva"), DropDownList)
                If Not cmbEstadoReserva Is Nothing Then
                    cmbEstadoReserva.SelectedValue = GridView1.DataKeys(e.Row.RowIndex).Values(1).ToString()
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
        FillconfirmaGrid(txtFechaAtencion.Text)
    End Sub

    'sirve para reservar la hora
    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs)

        If (GridView1.EditIndex <> -1) Then

            Dim txtHora As TextBox
            txtHora = CType(GridView1.Rows(e.RowIndex).FindControl("txtHora"), TextBox)

            Dim txtfechareserva As TextBox
            txtfechareserva = CType(GridView1.Rows(e.RowIndex).FindControl("txtfechareserva"), TextBox)

            Dim txtRutMedico As TextBox
            txtRutMedico = CType(GridView1.Rows(e.RowIndex).FindControl("txtRutMedico"), TextBox)
            Dim txtRut As TextBox
            txtRut = CType(GridView1.Rows(e.RowIndex).FindControl("txtRut"), TextBox)

            Dim cmbEstadoReserva As DropDownList
            cmbEstadoReserva = CType(GridView1.Rows(e.RowIndex).FindControl("cmbEstadoReserva"), DropDownList)

            Dim txtfono As TextBox
            txtfono = CType(GridView1.Rows(e.RowIndex).FindControl("txtfono"), TextBox)

            If (cmbEstadoReserva.SelectedValue = "Confirmada" Or cmbEstadoReserva.SelectedValue = "Paciente Llego") Then
                objconfirma.UpdateReserva(txtHora.Text, txtfechareserva.Text, txtRutMedico.Text, txtRut.Text, cmbEstadoReserva.SelectedValue, txtfono.Text, Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0).ToString()))
                MsgBox("Estado de la Reserva Actualizado")
                GridView1.EditIndex = -1
                FillconfirmaGrid(txtFechaAtencion.Text)
            Else
                objconfirma.UpdateDevolverHora(txtHora.Text, txtfechareserva.Text, txtRutMedico.Text, cmbEstadoReserva.SelectedValue, Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0).ToString()))
                MsgBox("Estado de la Reserva Actualizado")
                GridView1.EditIndex = -1
                FillconfirmaGrid(txtFechaAtencion.Text)
            End If
        End If

    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        objconfirma = New Secrecls
        FillconfirmaGrid(txtFechaAtencion.Text)
    End Sub
End Class