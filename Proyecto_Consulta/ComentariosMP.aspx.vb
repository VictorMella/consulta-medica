Public Class ComentariosMP
    Inherits System.Web.UI.Page
    Dim comentario As New Secrecls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, GridTotalComentarios.SelectedIndexChanged
        If (Not Page.IsPostBack) Then
            BuscaComentarios(cmbEleccion.SelectedValue)
        End If
        If Session("User") = "" Or Session("User") <> "trabajador" And Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
    End Sub

    Protected Sub BuscaComentarios(ByVal cmbEleccion As String)
        'se llena la gridview 
        Dim dtcomentario As DataTable = New Secrecls().ListaComentarios(cmbEleccion)

        Try
            If dtcomentario.Rows.Count > 0 Then
                GridTotalComentarios.DataSource = dtcomentario
                GridTotalComentarios.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtcomentario.Rows.Add(dtcomentario.NewRow())
                Me.GridTotalComentarios.DataSource = dtcomentario
                GridTotalComentarios.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = GridTotalComentarios.Rows(0).Cells.Count
                GridTotalComentarios.Rows(0).Cells.Clear()
                GridTotalComentarios.Rows(0).Cells.Add(New TableCell())
                GridTotalComentarios.Rows(0).Cells(0).ColumnSpan = TotalColumns
                GridTotalComentarios.Rows(0).Cells(0).Style.Add("text-align", "center")
                GridTotalComentarios.Rows(0).Cells(0).Text = ""

            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try
    End Sub

    Protected Sub BTN_BuscarComentario_Click(sender As Object, e As EventArgs) Handles BTN_BuscarComentario.Click
        comentario = New Secrecls
        Session("cmbEleccion") = cmbEleccion.SelectedValue
        Me.seleccion.InnerHtml = "Lista de comentarios de " & Session("cmbEleccion") & " de la Consulta Medica"
        BuscaComentarios(cmbEleccion.SelectedValue)
    End Sub

    Protected Sub GridTotalComentarios_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridTotalComentarios.PageIndex = e.NewPageIndex
        BuscaComentarios(cmbEleccion.SelectedValue)
    End Sub
End Class