Public Class ActualizarDisponibilidad
    Inherits System.Web.UI.Page
    Dim carga As New Secrecls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "trabajador" And Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
    End Sub
    Protected Sub CambiarDisponibilidad(ByVal cmbdoctor As String)
        'se llena la gridview 
        Dim dtcambio As DataTable = New Secrecls().VerDisponibilidad(cmbdoctor)
        Try

            If dtcambio.Rows.Count > 0 Then
                GridView1.DataSource = dtcambio
                GridView1.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtcambio.Rows.Add(dtcambio.NewRow())
                Me.GridView1.DataSource = dtcambio
                GridView1.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = GridView1.Rows(0).Cells.Count
                GridView1.Rows(0).Cells.Clear()
                GridView1.Rows(0).Cells.Add(New TableCell())
                GridView1.Rows(0).Cells(0).ColumnSpan = TotalColumns
                GridView1.Rows(0).Cells(0).Style.Add("text-align", "left")
                GridView1.Rows(0).Cells(0).Text = "No hay registros "

            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try

    End Sub

    Protected Sub BTN_BuscaMedico_Click(sender As Object, e As EventArgs) Handles BTN_BuscaMedico.Click
        carga = New Secrecls
        CambiarDisponibilidad(cmbdoctor.SelectedValue)
    End Sub

    Protected Sub GridView1_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) _
        Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        CambiarDisponibilidad(cmbdoctor.SelectedValue)
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName.Equals("AgragarNuevo") Then

            Dim cmbNewrut As DropDownList
            cmbNewrut = CType(GridView1.FooterRow.FindControl("cmbNewrut"), DropDownList)

            Dim cmbNewDia As DropDownList
            cmbNewDia = CType(GridView1.FooterRow.FindControl("cmbNewDia"), DropDownList)

            Dim cmbNewInicio As DropDownList
            cmbNewInicio = CType(GridView1.FooterRow.FindControl("cmbNewInicio"), DropDownList)

            Dim cmbNewTermino As DropDownList
            cmbNewTermino = CType(GridView1.FooterRow.FindControl("cmbNewTermino"), DropDownList)


            carga = New Secrecls

            carga.Insertdispon(cmbNewrut.SelectedValue, cmbNewDia.SelectedValue, cmbNewInicio.SelectedValue, cmbNewTermino.SelectedValue)
            CambiarDisponibilidad(cmbdoctor.SelectedValue)
        ElseIf e.CommandName.Equals("Delete") Then
            carga = New Secrecls
            Dim index As Integer
            index = Convert.ToInt32(e.CommandArgument)
            carga.Deletedispon(Convert.ToInt32(GridView1.DataKeys(index).Values(0).ToString()))
            CambiarDisponibilidad(cmbdoctor.SelectedValue)
        End If

    End Sub

    'this is the edit mode event
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                'retain value of Genero in the combobox
                Dim cmbDia As DropDownList
                cmbDia = CType(e.Row.FindControl("cmbDia"), DropDownList)
                If Not cmbDia Is Nothing Then
                    cmbDia.SelectedValue = GridView1.DataKeys(e.Row.RowIndex).Values(1).ToString()
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
        CambiarDisponibilidad(cmbdoctor.SelectedValue)
    End Sub

    'get values when row is updating
    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs)

        If (GridView1.EditIndex <> -1) Then

            Dim cmbrut As DropDownList
            cmbrut = CType(GridView1.Rows(e.RowIndex).FindControl("cmbrut"), DropDownList)

            Dim cmbDia As DropDownList
            cmbDia = CType(GridView1.Rows(e.RowIndex).FindControl("cmbDia"), DropDownList)
            Dim cmbInicio As DropDownList
            cmbInicio = CType(GridView1.Rows(e.RowIndex).FindControl("cmbInicio"), DropDownList)
            Dim cmbTermino As DropDownList
            cmbTermino = CType(GridView1.Rows(e.RowIndex).FindControl("cmbTermino"), DropDownList)


            carga = New Secrecls
            carga.Updatedispon(cmbrut.SelectedValue, cmbDia.SelectedValue, cmbInicio.SelectedValue, cmbTermino.SelectedValue, Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0).ToString()))
            MsgBox("La dispobilidad del Especialista de ha actualizado correctamente")
            GridView1.EditIndex = -1
            CambiarDisponibilidad(cmbdoctor.SelectedValue)
        End If

    End Sub
End Class