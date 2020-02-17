Option Explicit On
Option Strict Off

Public Class MisHoras
    Inherits System.Web.UI.Page
    Dim objhora As HorasAgendadascls

    'aqui carga la agenda en el load
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "paciente" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
        Me.rut.InnerHtml = "Bienvenido, esta es la Lista de Horas asociados a al Rut " & Session("Rut") & " de don  " & Session("nombre")

        If (Not Page.IsPostBack) Then
            HorasTomadas1(rut.InnerText)
        End If
    End Sub


    'hace la consulta con la variable session del login
    Protected Sub HorasTomadas1(ByVal rut As String)
        'se llena la gridview 
        Dim dthora As DataTable = New HorasAgendadascls().Agenda(Session("Rut"))
        Try

            If dthora.Rows.Count > 0 Then
                HorasAgendadas.DataSource = dthora
                HorasAgendadas.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dthora.Rows.Add(dthora.NewRow())
                Me.HorasAgendadas.DataSource = dthora
                HorasAgendadas.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = HorasAgendadas.Rows(0).Cells.Count
                HorasAgendadas.Rows(0).Cells.Clear()
                HorasAgendadas.Rows(0).Cells.Add(New TableCell())
                HorasAgendadas.Rows(0).Cells(0).ColumnSpan = TotalColumns
                HorasAgendadas.Rows(0).Cells(0).Style.Add("text-align", "left")
                HorasAgendadas.Rows(0).Cells(0).Text = "No Tienes Horas Agendadas"
            End If
        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try

    End Sub
    Protected Sub HorasTomadas_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) _
        Handles HorasAgendadas.RowCancelingEdit
        HorasAgendadas.EditIndex = -1
        HorasTomadas1(rut.InnerText)
    End Sub

    Protected Sub HorasTomadas_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName.Equals("AgragarNuevo") Then

            Dim txtNewHora As TextBox
            txtNewHora = CType(HorasAgendadas.FooterRow.FindControl("txtNewHora"), TextBox)

            Dim txtNewfechareserva As TextBox
            txtNewfechareserva = CType(HorasAgendadas.FooterRow.FindControl("txtNewfechareserva"), TextBox)

            Dim txtNewRutMedico As TextBox
            txtNewRutMedico = CType(HorasAgendadas.FooterRow.FindControl("txtNewRutMedico"), TextBox)

            Dim cmbNewEstadoResrva As DropDownList
            cmbNewEstadoResrva = CType(HorasAgendadas.FooterRow.FindControl("cmbNewEstadoResrva"), DropDownList)

            objhora = New HorasAgendadascls

            objhora.InsertReserva(txtNewHora.Text, txtNewfechareserva.Text, txtNewRutMedico.Text, cmbNewEstadoResrva.SelectedValue)
            HorasTomadas1(rut.InnerText)
        ElseIf e.CommandName.Equals("Delete") Then
            objhora = New HorasAgendadascls
            Dim index As Integer
            index = Convert.ToInt32(e.CommandArgument)
            objhora.DeleteReserva(Convert.ToInt32(HorasAgendadas.DataKeys(index).Values(0).ToString()))
            HorasTomadas1(rut.InnerText)
        End If

    End Sub

    'this is the edit mode event
    Protected Sub HorasTomadas_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                'retain value of Genero in the combobox
                Dim cmbEstadoResrva As DropDownList
                cmbEstadoResrva = CType(e.Row.FindControl("cmbEstadoResrva"), DropDownList)
                If Not cmbEstadoResrva Is Nothing Then
                    cmbEstadoResrva.SelectedValue = HorasAgendadas.DataKeys(e.Row.RowIndex).Values(1).ToString()
                End If
            End If
        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try
    End Sub

    Protected Sub HorasTomadas_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs)

    End Sub

    Protected Sub HorasTomadas_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs)
        HorasAgendadas.EditIndex = e.NewEditIndex
        HorasTomadas1(rut.InnerText)
    End Sub

    'este metodo es para actualizar y devolver la hora
    Protected Sub HorasTomadas_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs)

        If (HorasAgendadas.EditIndex <> -1) Then

            Dim txtHora As TextBox
            txtHora = CType(HorasAgendadas.Rows(e.RowIndex).FindControl("txtHora"), TextBox)

            Dim txtfechareserva As TextBox
            txtfechareserva = CType(HorasAgendadas.Rows(e.RowIndex).FindControl("txtfechareserva"), TextBox)

            Dim txtRutMedico As TextBox
            txtRutMedico = CType(HorasAgendadas.Rows(e.RowIndex).FindControl("txtRutMedico"), TextBox)

            Dim cmbEstadoResrva As DropDownList
            cmbEstadoResrva = CType(HorasAgendadas.Rows(e.RowIndex).FindControl("cmbEstadoResrva"), DropDownList)


            objhora = New HorasAgendadascls
            objhora.UpdateDevolverHora(txtHora.Text, txtfechareserva.Text, txtRutMedico.Text, cmbEstadoResrva.SelectedValue, Convert.ToInt32(HorasAgendadas.DataKeys(e.RowIndex).Values(0).ToString()))
            MsgBox("Has cancelado la hora")
            HorasAgendadas.EditIndex = -1
            HorasTomadas1(rut.InnerText)
        End If
    End Sub
End Class