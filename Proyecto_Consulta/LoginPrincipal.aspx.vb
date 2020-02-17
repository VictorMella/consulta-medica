Imports System.Data.SqlClient
Imports System.Web.Security

Public Class LoginPrincipal
    Inherits System.Web.UI.Page
    Dim objuser As Usuariocls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Session("Rut") = Request.Form("Rut")
        'Response.Redirect("MisHoras.aspx")
        rut.Focus()
    End Sub

    Protected Sub Login_Click(sender As Object, e As EventArgs) Handles Login.Click
        objuser = New Usuariocls
        'Dim validacion As Boolean
        'validacion = objuser.RUTValid(Rut.Text)
        'If validacion = False Then
        '    Response.Write("<script>alert('Rut no Valido');</script>")
        'Else
        'sesion del paciente
        Dim tabla As DataTable = New Usuariocls().BuscarUser1(rut.Text, Password.Text)
        If tabla.Rows.Count() > 0 Then
            Session.Add("User", tabla.Rows(0).Item("PerfilUsuario"))
            Session("Nombre") = tabla.Rows(0).Item("nombre")
            Session("Rut") = tabla.Rows(0).Item("Rut Usuario")

            Select Case tabla.Rows(0).Item("Id Perfil")
                Case 1 'Paciente
                    Response.Redirect("AgendarHora.aspx")
                Case 2 'empleado'
                    Response.Redirect("RegistroPacientes.aspx")
                Case 3 'medico'
                    Response.Redirect("RegistroConsultas.aspx")
                Case 4 'admin'
                    Response.Redirect("Usuarios.aspx")
                Case Else
                    MsgBox("Usuario o Contraseña Incorrectos", MsgBoxStyle.Critical)
            End Select
        Else
            MsgBox("Usuario no Existe", MsgBoxStyle.Critical)
            Response.Redirect("RegistroUsuarios.aspx")
        End If
        'End If
        ''session de la secretaria
        'Dim tabla1 As DataTable = New Usuariocls().BuscarUser2(Rut.Text, Password.Text)
        'If tabla1.Rows.Count() > 0 Then
        '    Session.Add("User1", "trabajo")
        'End If
        ''session del medico
        'Dim tabla2 As DataTable = New Usuariocls().BuscarUser3(Rut.Text, Password.Text)
        'If tabla2.Rows.Count() > 0 Then
        '    Session.Add("User2", "medico")
        'End If
        'Dim tabla3 As DataTable = New Usuariocls().BuscarUser4(Rut.Text, Password.Text)
        'If tabla3.Rows.Count() > 0 Then
        '    Session.Add("User2", "medico")
        'End If

        'busca el nombre del usuario y lo pone en la masterpage
        'Dim dtpaciente As DataTable = New Usuariocls().Paciente(Rut.Text)
        'If dtpaciente.Rows.Count() > 0 Then
        '    Session("Paciente") = dtpaciente(0).Item(0)
        'Else
        '    Dim dtempleado As DataTable = New Usuariocls().Empleado(Rut.Text)
        '    If dtempleado.Rows.Count() > 0 Then
        '        Session("Empleado") = dtempleado(0).Item(0)
        '    End If
        'End If

        'Dim validacion As Boolean
        'validacion = objuser.RUTValid(Rut.Text)
        'If validacion = False Then
        '    Response.Write("<script>alert('Rut no Valido');</script>")
        'Else
        '    Dim dtlogin As DataTable = New Usuariocls().BuscarUser1(Rut.Text, Password.Text)
        '    If dtlogin.Rows.Count() > 0 Then
        '        Session("Rut") = dtlogin(0).Item(1)
        '        Response.Redirect("AgendarHora.aspx")
        '    Else
        '        Dim dtlogin1 As DataTable = New Usuariocls().BuscarUser2(Rut.Text, Password.Text)
        '        If dtlogin1.Rows.Count() > 0 Then
        '            Response.Redirect("RegistroPacientes.aspx")
        '        Else
        '            Dim dtlogin2 As DataTable = New Usuariocls().BuscarUser3(Rut.Text, Password.Text)
        '            If dtlogin2.Rows.Count() > 0 Then
        '                Response.Redirect("RegistroConsultas.aspx")
        '            Else
        '                Dim dtlogin3 As DataTable = New Usuariocls().BuscarUser4(Rut.Text, Password.Text)
        '                If dtlogin3.Rows.Count() > 0 Then
        '                    Response.Redirect("MenuPrincipal.aspx")
        '                Else
        '                    MsgBox("Usuario o Contraseña Incorrectos", MsgBoxStyle.Critical)
        '                    Response.Redirect("RegistroUsuarios.aspx")
        '                End If
        '            End If
        '        End If
        '    End If
        'End If




    End Sub

End Class