Public Class Usuarios
    Inherits System.Web.UI.Page
    Dim objadmin As New Admin
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
        rut.Focus()


    End Sub


    Public Sub Limpiar()
        rut.Text = ""
        Nom_Usuario.Text = ""
        Ap_Paciente_Usuario.Text = ""
        Am_Paciente_Usuario.Text = ""
        Fono_Paciente.Text = ""
        Fono_Paciente.Text = ""
        Dir_Paciente.Text = ""
        cmbCargo.SelectedIndex = 0
        Email_Paciente.Text = ""
        rut.Focus()
    End Sub
    Protected Sub BTN_Guardar_Paciente_Click(sender As Object, e As EventArgs) Handles BTN_Guardar_Paciente.Click
        Dim dtpacienteexiste As DataTable = New Admin().VerificarTrabajador(rut.Text)
        If dtpacienteexiste.Rows.Count() > 0 Then
            MsgBox("Este paciente ya Tiene su Ficha Creada", MsgBoxStyle.Information)
            Limpiar()
        Else
            If Fono_Paciente.Text.Length > 9 Then
                MsgBox("Numero de Telefono debe de ser de 9 Digitos")
            Else
                objadmin.CrearTrabajador(rut.Text, Nom_Usuario.Text, Ap_Paciente_Usuario.Text, Am_Paciente_Usuario.Text, Fono_Paciente.Text, Dir_Paciente.Text, cmbCargo.SelectedValue, Email_Paciente.Text)

                MsgBox("Datos Creados Exitosamente", MsgBoxStyle.Information)
                Limpiar()
            End If
        End If
        Limpiar()

    End Sub

    Protected Sub BTN_Cancelar_Click(sender As Object, e As EventArgs) Handles BTN_Cancelar.Click
        Limpiar()
    End Sub


End Class