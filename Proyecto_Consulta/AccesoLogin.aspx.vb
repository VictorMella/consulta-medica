Public Class AccesoLogin
    Inherits System.Web.UI.Page
    Dim objadmin As New Admin
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        rut.Focus()
        If Session("User") = "" Or Session("User") <> "trabajador" And Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
        Contador()
        Me.numuser.InnerHtml = "El total de Usuarios registrados es de  " & Session("Cuentauser") & " Personas"
    End Sub

    Protected Sub GridAcceso_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridAcceso.PageIndex = e.NewPageIndex
    End Sub



    Protected Sub BTN_ListadoUsuarios_Click(sender As Object, e As EventArgs) Handles BTN_ListadoUsuarios.Click
        objadmin = New Admin
        Dim tabla As DataTable = New Admin().BuscarPass(rut.Text)
        If tabla.Rows.Count() <= 0 Then
            MsgBox("El Usuario no Existe")
        Else
            Nom.Text = tabla.Rows(0).Item("nombre")
            rutuser.Text = tabla.Rows(0).Item("Rut Usuario")
            txtpass.Text = tabla.Rows(0).Item("Pass Usuario")
            txtperfil.Text = tabla.Rows(0).Item("PerfilUsuario")
        End If
    End Sub

    Protected Sub BTN_Cancelar_Click(sender As Object, e As EventArgs) Handles BTN_Cancelar.Click
        rut.Text = ""
        Nom.Text = ""
        rutuser.Text = ""
        txtpass.Text = ""
        txtperfil.Text = ""
        rut.Focus()
    End Sub
    Protected Sub Contador()
        Dim dtcontador As DataTable = New Admin().Cuentauser()
        If dtcontador.Rows.Count() < 0 Then
            MsgBox("no hay datos")
        Else
            Session("Cuentauser") = dtcontador(0).Item(0)
        End If
    End Sub

    Protected Sub GridAcceso_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridAcceso.SelectedIndexChanged
        rut.Text = GridAcceso.SelectedRow.Cells(1).Text
    End Sub
End Class