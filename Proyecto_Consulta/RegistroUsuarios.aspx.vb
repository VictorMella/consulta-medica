Public Class RegistroUsuarios
    Inherits System.Web.UI.Page
    Dim objinsertuser As Usuariocls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Rut.Focus()
    End Sub

    Protected Sub RegistrarUser_Click(sender As Object, e As EventArgs) Handles RegistrarUser.Click
        objinsertuser = New Usuariocls


        Dim dtbusca As DataTable = New Usuariocls().Verificaruser(rut.Text)
        If dtbusca.Rows.Count() > 0 Then
                Response.Write("<script>alert('Usuario ya existe');</script>")
            Else
                objinsertuser = New Usuariocls
                If Pass1.Text = Pass2.Text Then
                objinsertuser.InsertUser(rut.Text, Pass2.Text)
                MsgBox("Usuario Creado con Exito")
                Response.Redirect("LoginPrincipal.aspx")
                Else
                    Response.Write("<script>alert('Las contraseñas no son iguales');</script>")
                End If
            End If

    End Sub
End Class