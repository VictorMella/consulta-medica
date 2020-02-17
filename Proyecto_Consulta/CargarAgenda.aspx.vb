Public Class CargarAgenda
    Inherits System.Web.UI.Page
    Dim carga As New Secrecls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "trabajador" And Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
        If (Not Page.IsPostBack) Then
            BuscaHoras(Fecha.Text)
        End If


    End Sub
    Protected Sub BuscarDisponibilidad(ByVal RutMedico As String)
        'se llena la gridview 
        Dim dtdispo As DataTable = New Secrecls().BuscarDisponibilidad(RutMedico)
        Try
            If dtdispo.Rows.Count > 0 Then
                gridDisponibilidad.DataSource = dtdispo
                gridDisponibilidad.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtdispo.Rows.Add(dtdispo.NewRow())
                Me.gridDisponibilidad.DataSource = dtdispo
                gridDisponibilidad.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = gridDisponibilidad.Rows(0).Cells.Count
                gridDisponibilidad.Rows(0).Cells.Clear()
                gridDisponibilidad.Rows(0).Cells.Add(New TableCell())
                gridDisponibilidad.Rows(0).Cells(0).ColumnSpan = TotalColumns
                gridDisponibilidad.Rows(0).Cells(0).Style.Add("text-align", "center")
                gridDisponibilidad.Rows(0).Cells(0).Text = "No se ha cargado su disponibilidad"

            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try
    End Sub

    Protected Sub BuscaHoras(ByVal Fecha As String)
        'se llena la gridview 
        Dim dthoras As DataTable = New Secrecls().BuscaFecha(Fecha)

        Try
            If dthoras.Rows.Count > 0 Then
                GridHoras.DataSource = dthoras
                GridHoras.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dthoras.Rows.Add(dthoras.NewRow())
                Me.GridHoras.DataSource = dthoras
                GridHoras.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = GridHoras.Rows(0).Cells.Count
                GridHoras.Rows(0).Cells.Clear()
                GridHoras.Rows(0).Cells.Add(New TableCell())
                GridHoras.Rows(0).Cells(0).ColumnSpan = TotalColumns
                GridHoras.Rows(0).Cells(0).Style.Add("text-align", "center")
                GridHoras.Rows(0).Cells(0).Text = ""

            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try
    End Sub

    Protected Sub BuscaDispon_Click(sender As Object, e As EventArgs) Handles BuscaDispon.Click
        carga = New Secrecls
        BuscarDisponibilidad(cmbMedico.SelectedValue)
        cmbMedico.SelectedIndex = 0
    End Sub

    Protected Sub BtnAgregar_Click(sender As Object, e As EventArgs) Handles BtnAgregar.Click
        carga = New Secrecls
        If txtfecha.Text = Nothing Then
            MsgBox("Debes ingresar una Fecha igual o mayor a la actual", MsgBoxStyle.Information)
        Else
                carga.InsertHora(cmbhora.SelectedValue, txtfecha.Text, cmbrutmedico.SelectedValue, cmbEstadoReserva.SelectedValue)
                cmbhora.SelectedIndex = 0
                cmbrutmedico.SelectedIndex = 0
                MsgBox("Hora ingresada con exito", MsgBoxStyle.Information)
            End If

    End Sub

    Protected Sub BTN_Buscar_Click(sender As Object, e As EventArgs) Handles BTN_Buscar.Click
        carga = New Secrecls
        BuscaHoras(Fecha.text)
    End Sub





End Class