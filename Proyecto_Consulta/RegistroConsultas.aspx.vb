Public Class RegistroConsultas
    Inherits System.Web.UI.Page
    Dim objmedico As New MedicoCls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "medico" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
        If (Not Page.IsPostBack) Then
            FillreservaInGrid(Session("Rut"), Fecha.Text)
        End If

        Me.RutDoc.Text = Session("Rut")
    End Sub



    Protected Sub FillreservaInGrid(ByVal Rut_Medico As String, ByVal Fecha As String)
        'se llena la gridview 
        Dim dtrecerva As DataTable = New MedicoCls().GenerarReserva(Session("Rut"), Fecha)

        Try
            If dtrecerva.Rows.Count > 0 Then
                Session("Medico") = dtrecerva.Rows(0).Item("Rut Medico")
                GridView1.DataSource = dtrecerva
                GridView1.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtrecerva.Rows.Add(dtrecerva.NewRow())
                Me.GridView1.DataSource = dtrecerva
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
        FillreservaInGrid(Session("Rut"), Fecha.Text)
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


            objmedico = New MedicoCls


            objmedico.InsertReserva(txtNewHora.Text, txtNewfechareserva.Text, txtNewRutMedico.Text, cmbNewEstadoResrva.SelectedValue)
            FillreservaInGrid(Session("Rut"), Fecha.Text)
        ElseIf e.CommandName.Equals("Delete") Then
            objmedico = New MedicoCls
            Dim index As Integer
            index = Convert.ToInt32(e.CommandArgument)
            objmedico.DeleteReserva(Convert.ToInt32(GridView1.DataKeys(index).Values(0).ToString()))
            FillreservaInGrid(Session("Rut"), Fecha.Text)
            'RutPac.Text = index + 1
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
        FillreservaInGrid(Session("Rut"), Fecha.Text)
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
            Dim NomPas As TextBox
            NomPas = CType(GridView1.Rows(e.RowIndex).FindControl("NomPas"), TextBox)

            objmedico = New MedicoCls


            objmedico.UpdateReserva(txtHora.Text, txtfechareserva.Text, txtRutMedico.Text, txtRut.Text,
                                    cmbEstadoResrva.SelectedValue, Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0).ToString()))
            MsgBox("Reserva Finalizada Correctamente")
            GridView1.EditIndex = -1
            FillreservaInGrid(Session("Rut"), Fecha.Text)
        End If


    End Sub
    Protected Sub BTN_Agenda_Click(sender As Object, e As EventArgs) Handles BTN_Agenda.Click

        FillreservaInGrid(Session("Rut"), Fecha.Text)

    End Sub

    Protected Sub BTN_Guardar_Paciente_Click(sender As Object, e As EventArgs) Handles BTN_Guardar_Paciente.Click
        objmedico = New MedicoCls
        IsDBNull(txtPeso.Text)
        IsDBNull(txtEstatura.Text)
        IsDBNull(txtTemperatura.Text)
        IsDBNull(Tr_Paciente.Text)
        IsDBNull(N_Receta.Text)
        IsDBNull(N_Certificado.Text)
        IsDBNull(N_Licencia.Text)

        'objeto que inserta datos a la tabla historial medico
        objmedico.InsertarHistoria(txtPeso.Text, txtEstatura.Text, txtTemperatura.Text,
        Obs_Paciente.Text, Tr_Paciente.Text, Convert.ToInt32(N_Receta.Text), Convert.ToInt32(N_Certificado.Text),
        Convert.ToInt32(N_Licencia.Text), RutPac.Text, RutDoc.Text, Fecha_HC.Text)
        MsgBox("Registro Guardado con Exito")
        Limpiar()
    End Sub
    Protected Sub Limpiar()
        txtPeso.Text = ""
        txtEstatura.Text = ""
        txtTemperatura.Text = ""
        Obs_Paciente.Text = ""
        Tr_Paciente.Text = ""
        N_Receta.Text = ""
        N_Certificado.Text = ""
        N_Licencia.Text = ""
        RutPac.Text = ""
        RutPac.Focus()

    End Sub

    Protected Sub BTN_Cancelar_Click(sender As Object, e As EventArgs) Handles BTN_Cancelar.Click
        Limpiar()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        RutPac.Text = GridView1.SelectedRow.Cells(1).Text
    End Sub
End Class