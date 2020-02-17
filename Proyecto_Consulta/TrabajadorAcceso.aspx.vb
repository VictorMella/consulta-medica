Public Class TrabajadorAcceso
    Inherits System.Web.UI.Page
    Dim objadmin As New Admin
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
    End Sub

    Protected Sub BTN_GuardarAcceso_Click(sender As Object, e As EventArgs) Handles BTN_GuardarAcceso.Click
        objadmin = New Admin

        Dim dtbusca As DataTable = New Admin().Verificaruser(rut.Text)
        If dtbusca.Rows.Count() > 0 Then
            Response.Write("<script>alert('Usuario ya existe');</script>")
        Else
            If rut.Text.Length <= 0 Or pass1.Text.Length <= 0 Or pass2.Text.Length <= 0 Then
                MsgBox(" Debes Completar Todos los datos para terminar el registro")
            Else
                objadmin = New Admin
                If pass1.Text = pass2.Text Then
                    objadmin.InsertUser(rut.Text, pass2.Text, cmbPerfil.SelectedValue)
                    MsgBox("Usuario creado con Exito")
                Else
                    Response.Write("<script>alert('Las contraseñas no son iguales');</script>")
                End If
                rut.Text = ""
                pass1.Text = ""
                pass2.Text = ""
                cmbPerfil.SelectedIndex = 0
            End If
        End If
    End Sub

End Class