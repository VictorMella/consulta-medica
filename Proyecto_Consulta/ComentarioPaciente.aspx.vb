Imports System.Data.SqlClient
Imports System.Data
Imports System.Linq
Imports System.Collections.Generic

Public Class ComentarioPaciente
    Inherits System.Web.UI.Page
    Dim objcomentrios As Usuariocls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub RegistrarComentario_Click(sender As Object, e As EventArgs) Handles RegistrarComentario.Click
        objcomentrios = New Usuariocls
        'If Pass1.Text = Pass2.Text Then

        objcomentrios.InsertComentariosoutlogin(Nom.Text, Mail.Text, cmbTipoComentario.SelectedValue, Txtcomentarios.Text)
        Nom.Text = ""
        Mail.Text = ""
        cmbTipoComentario.SelectedIndex = 0
        Txtcomentarios.Text = ""
        MsgBox("Tu comentario fue ingresado sin problemas", MsgBoxStyle.Information)

        ' Response.Write("Tu comentario fue ingresado sin problemas")



        '    Response.Redirect("LoginPrincipal.aspx")
        'Else
        '    Response.Write("<script>alert('Las contraseñas no son iguales');</script>")
        'End If

    End Sub
End Class