Public Class MenuPrincipal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load, menu.SelectedIndexChanged
        If Session("User") = "" Or Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
    End Sub

    Protected Sub menu_SelectedIndexChanged(sender As Object, e As EventArgs)
        Response.Redirect(menu.SelectedValue)
    End Sub
End Class