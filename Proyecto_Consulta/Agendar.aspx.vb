Option Explicit On
Option Strict Off

Public Class Agendar
    Inherits System.Web.UI.Page
    Dim objagenda As HorasAgendadascls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "trabajador" And Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
    End Sub
    'este metodo llena el grid despues de ingresar una fecha
    Protected Sub FillreservaInGrid(ByVal Fecha_Dispn As String, ByVal Medico As String)
        'se llena la gridview 
        Dim dtagenda As DataTable = New HorasAgendadascls().Fetch(Fecha_Dispn, Medico)
        Try

            If dtagenda.Rows.Count > 0 Then
                GridView1.DataSource = dtagenda
                GridView1.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtagenda.Rows.Add(dtagenda.NewRow())
                Me.GridView1.DataSource = dtagenda
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
        FillreservaInGrid(Fecha_Dispn.Text, Medico.SelectedValue)
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

            objagenda = New HorasAgendadascls

            objagenda.InsertReserva(txtNewHora.Text, txtNewfechareserva.Text, txtNewRutMedico.Text, cmbNewEstadoResrva.SelectedValue)
            FillreservaInGrid(Fecha_Dispn.Text, Medico.SelectedValue)
        ElseIf e.CommandName.Equals("Delete") Then
            objagenda = New HorasAgendadascls
            Dim index As Integer
            index = Convert.ToInt32(e.CommandArgument)
            objagenda.DeleteReserva(Convert.ToInt32(GridView1.DataKeys(index).Values(0).ToString()))
            FillreservaInGrid(Fecha_Dispn.Text, Medico.SelectedValue)
        End If
    End Sub


    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                'retain value of Genero in the combobox
                Dim cmbEstadoResrva As DropDownList
                cmbEstadoResrva = CType(e.Row.FindControl("cmbEstadoResrva"), DropDownList)
                If Not cmbEstadoResrva Is Nothing Then
                    cmbEstadoResrva.SelectedValue = GridView1.DataKeys(e.Row.RowIndex).Values(1).ToString()
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
        FillreservaInGrid(Fecha_Dispn.Text, Medico.SelectedValue)
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

            Dim cmbEstadoResrva As DropDownList
            cmbEstadoResrva = CType(GridView1.Rows(e.RowIndex).FindControl("cmbEstadoResrva"), DropDownList)
            Dim txtfono As TextBox
            txtfono = CType(GridView1.Rows(e.RowIndex).FindControl("txtfono"), TextBox)


            objagenda = New HorasAgendadascls


            If txtRut.Text.Length = 0 Or txtfono.Text.Length = 0 Then
                MsgBox("Debes completar todos los datos", MsgBoxStyle.Critical)
            Else
                If txtfono.Text.Length > 9 Then
                    MsgBox("Numero de Telefono debe de ser de 9 Digitos")
                Else
                    objagenda.UpdateReserva(txtHora.Text, txtfechareserva.Text, txtRutMedico.Text, txtRut.Text, cmbEstadoResrva.SelectedValue, txtfono.text, Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0).ToString()))
                    MsgBox("Hora Agendada Correctamente")
                    GridView1.EditIndex = -1
                    FillreservaInGrid(Fecha_Dispn.Text, Medico.SelectedValue)
                End If
            End If
        End If
    End Sub

    'llamo a la funcion para llenar el grid
    Protected Sub BTN_Buscar_Click(sender As Object, e As EventArgs) Handles BTN_Buscar.Click
        objagenda = New HorasAgendadascls
        FillreservaInGrid(Fecha_Dispn.Text, Medico.SelectedValue)
    End Sub

End Class