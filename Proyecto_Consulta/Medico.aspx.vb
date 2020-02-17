Public Class Medico
    Inherits System.Web.UI.Page
    Dim objdoctor As New Admin
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
    End Sub

    Protected Sub BTN_GuardarMedico_Click(sender As Object, e As EventArgs) Handles BTN_GuardarMedico.Click
        objdoctor = New Admin
        Dim dtdoctor As DataTable = New Admin().VerificarMedico(rut.Text)
        Dim dtempleo As DataTable = New Admin().Empleo(rut.Text)

        If dtempleo.Rows.Count() <= 0 Then
            MsgBox("Debes Crear al Trabajador Antes")
            Response.Redirect("Usuarios.aspx")
        Else
            If dtdoctor.Rows.Count() > 0 Then
                MsgBox("Este Rut ya ha sido ingresado")
            Else
                objdoctor.InsertMedico(rut.Text, cmbEspecialidad.SelectedValue, ICM.Text)
                MsgBox("Registro creado con Exito")
                Response.Redirect("Usuarios.aspx")
                rut.Text = ""
                cmbEspecialidad.SelectedIndex = 0
                ICM.Text = ""
            End If
        End If
    End Sub


End Class