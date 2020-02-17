Option Explicit On
Option Infer On
Option Strict Off

Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Collections
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class ActualizarPacientesCls

    Dim ConnectionString As String
    Dim sql As String
    Dim conn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim dt As DataTable



    'DAL Functions
    Public Sub New()
        ConnectionString = ConfigurationManager.AppSettings("ConnectionString").ToString()
    End Sub

    Public Sub InsertPaciente(ByVal RutPaciente As String, ByVal NombrePaciente As String, ByVal ApellidoPaterno As String, ByVal ApellidoMaterno As String, ByVal Fnac As String, ByVal DireccionPaciente As String,
                             ByVal FonoContacto As String, ByVal ComunaPaciente As String, ByVal PrevisionPaciente As String, ByVal EmailPaciente As String, ByVal Estado As String)

        sql = "INSERT into Paciente ([Rut Paciente],[Nombre Paciente],[Apellido Paterno],[Apellido Materno],[Fecha de Nacimiento],[Direccion Paciente],[Telefono Paciente],[Comuna],[Prevision],[Email Paciente],[Id Estado]) " & "
                VALUES (@RutPaciente, @NombrePaciente, @ApellidoPaterno, @ApellidoMaterno, @Fnac, @DireccionPaciente, @FonoContacto, @ComunaPaciente,@PrevisionPaciente,@EmailPaciente,@Estado)"

        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)

        cmd.Parameters.Add("@RutPaciente", SqlDbType.VarChar, 15).Value = RutPaciente
        cmd.Parameters.Add("@NombrePaciente", SqlDbType.VarChar, 30).Value = NombrePaciente
        cmd.Parameters.Add("@ApellidoPaterno", SqlDbType.VarChar, 20).Value = ApellidoPaterno
        cmd.Parameters.Add("@ApellidoMaterno", SqlDbType.VarChar, 20).Value = ApellidoMaterno
        cmd.Parameters.Add("@Fnac", SqlDbType.Date).Value = Fnac
        cmd.Parameters.Add("@DireccionPaciente", SqlDbType.VarChar, 50).Value = DireccionPaciente
        cmd.Parameters.Add("@FonoContacto", SqlDbType.Int).Value = FonoContacto
        cmd.Parameters.Add("@ComunaPaciente", SqlDbType.VarChar, 20).Value = ComunaPaciente
        cmd.Parameters.Add("@PrevisionPaciente", SqlDbType.VarChar, 12).Value = PrevisionPaciente
        cmd.Parameters.Add("@EmailPaciente", SqlDbType.VarChar, 50).Value = EmailPaciente
        cmd.Parameters.Add("@Estado", SqlDbType.Int).Value = Estado
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Sub UpdatePaciente(ByVal RutPaciente As String, ByVal NombrePaciente As String, ByVal ApellidoPaterno As String, ByVal ApellidoMaterno As String, ByVal Fnac As String, ByVal DireccionPaciente As String,
                             ByVal FonoContacto As String, ByVal ComunaPaciente As String, ByVal PrevisionPaciente As String, ByVal EmailPaciente As String, ByVal Estado As String, ByVal IDPaciente As Integer)

        sql = "Update Paciente Set [Rut Paciente]=@RutPaciente,[Nombre Paciente]=@NombrePaciente,[Apellido Paterno]=@ApellidoPaterno,[Apellido Materno]=@ApellidoMaterno,[Fecha de nacimiento]=@Fnac,[Direccion Paciente]=@DireccionPaciente, " &
            " [Telefono Paciente]=@FonoContacto,Comuna=@ComunaPaciente,Prevision=@PrevisionPaciente,[Email Paciente]=@EmailPaciente,[Id Estado]=@Estado Where [Id Paciente]=@IDPaciente"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Parameters.Add("@IDPaciente", SqlDbType.Int).Value = IDPaciente
        cmd.Parameters.Add("@RutPaciente", SqlDbType.VarChar, 15).Value = RutPaciente
        cmd.Parameters.Add("@NombrePaciente", SqlDbType.VarChar, 30).Value = NombrePaciente
        cmd.Parameters.Add("@ApellidoPaterno", SqlDbType.VarChar, 20).Value = ApellidoPaterno
        cmd.Parameters.Add("@ApellidoMaterno", SqlDbType.VarChar, 20).Value = ApellidoMaterno
        cmd.Parameters.Add("@Fnac", SqlDbType.Date).Value = Fnac
        cmd.Parameters.Add("@DireccionPaciente", SqlDbType.VarChar, 50).Value = DireccionPaciente
        cmd.Parameters.Add("@FonoContacto", SqlDbType.Int).Value = FonoContacto
        cmd.Parameters.Add("@ComunaPaciente", SqlDbType.VarChar, 20).Value = ComunaPaciente
        cmd.Parameters.Add("@PrevisionPaciente", SqlDbType.VarChar, 12).Value = PrevisionPaciente
        cmd.Parameters.Add("@EmailPaciente", SqlDbType.VarChar, 50).Value = EmailPaciente
        cmd.Parameters.Add("@Estado", SqlDbType.Int).Value = Estado
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Sub DeletePaciente(ByVal IDPaciente As Integer)
        conn = New SqlConnection(ConnectionString)
        sql = "Delete From Paciente Where [Id Paciente]=@IDPaciente"
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Parameters.Add("@IDPaciente", SqlDbType.Int).Value = IDPaciente
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Function Fetch(ByVal RutPaciente As String) As DataTable
        '

        sql = "Select * from Paciente where [Rut Paciente] = '" & RutPaciente & "'  Order by [Id Paciente]"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    Public Function Contador() As DataTable       '

        sql = "Select * from [Contador de Pacientes]"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function
    Public Sub UpdatePerfil(ByVal Rut As String)
        sql = "Update Acceso set Estado=2 where [Rut usuario]= '" & Rut & "' "
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)

        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Sub CambiarPerfil(ByVal Rut As String)
        sql = "Update Acceso set Estado=1 where [Rut usuario]= '" & Rut & "' "
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)

        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub



End Class
