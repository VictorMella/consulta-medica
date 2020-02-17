Public Class RegistroPacientes
    Inherits System.Web.UI.Page
    Dim objnewPaciente As New Secrecls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "trabajador" And Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
        rut.Focus()
    End Sub




    Protected Sub BTN_Guardar_Paciente_Click(sender As Object, e As EventArgs) Handles BTN_Guardar_Paciente.Click
        objnewPaciente = New Secrecls
        Dim dtpacienteexiste As DataTable = New Secrecls().VerificarPaciente(rut.Text)
        Dim correo As DataTable = New Secrecls().Correo(Email_Paciente.Text)
        If dtpacienteexiste.Rows.Count() > 0 Then
            MsgBox("Este paciente ya Tiene su Ficha Creada", MsgBoxStyle.Information)
            Limpiar()
        Else
            Dim literal As String = FNAC_Paciente.Text
            Dim fecha As String = literal.Substring(0, 4)
            Dim año As Integer = CInt(fecha)
            'MsgBox(+año + 5000)
            If año <= (Year(Now) - 18) Then
                MsgBox("Paciente ya es mayor de edad")
            Else
                If Fono_Paciente.Text.Length > 9 Then
                    MsgBox("Numero de Telefono debe de ser de 9 Digitos")
                Else
                    If correo.Rows.Count() > 0 Then
                        MsgBox("Este Correo ya ha sido ingresado")
                    Else
                        objnewPaciente.InsertFichaPaciente(rut.Text, Nom_Paciente.Text, Ap_Paciente.Text, Am_Paciente.Text, FNAC_Paciente.Text, Fono_Paciente.Text, Dir_Paciente.Text, cmbComuna.SelectedValue, cmbPrevision.SelectedValue, Email_Paciente.Text)
                        Limpiar()
                        MsgBox("Datos Creados Exitosamente", MsgBoxStyle.Information)
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub BTN_Cancelar_Click(sender As Object, e As EventArgs) Handles BTN_Cancelar.Click
        Limpiar()
    End Sub
    Public Sub Limpiar()
        rut.Text = ""
        Nom_Paciente.Text = ""
        Ap_Paciente.Text = ""
        Am_Paciente.Text = ""
        FNAC_Paciente.Text = ""
        Fono_Paciente.Text = ""
        Dir_Paciente.Text = ""
        cmbComuna.SelectedIndex = 23
        cmbPrevision.SelectedIndex = 1
        Email_Paciente.Text = ""

    End Sub
End Class