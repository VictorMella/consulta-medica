Public Class Comentarios
    Inherits System.Web.UI.Page
    Dim objcomentrios As Usuariocls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "paciente" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
    End Sub

    Protected Sub BTN_Comentario_Click(sender As Object, e As EventArgs) Handles BTN_Comentario.Click
        objcomentrios = New Usuariocls
        'If Pass1.Text = Pass2.Text Then
        objcomentrios.InsertComentariosinLogin(Nombre_Paciente.Text, Email_Paciente.Text, cmbEleccion.SelectedValue, txtComentario.Text)
        Nombre_Paciente.Text = ""
        Email_Paciente.Text = ""
        cmbEleccion.SelectedIndex = 0
        txtComentario.Text = ""
        MsgBox("Tu comentario fue ingresado sin problemas", MsgBoxStyle.Information)
    End Sub
End Class