Option Explicit On
Option Infer On
Option Strict Off

Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Collections
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Public Class HorasAgendadascls



    Dim ConnectionString As String
    Dim sql As String
    Dim conn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim dt As DataTable
    Dim ds As DataSet
    Dim dr As SqlDataReader



    'DAL Functions
    Public Sub New()
        ConnectionString = ConfigurationManager.AppSettings("ConnectionString").ToString()
    End Sub

    Public Sub InsertReserva(ByVal HoraReserva As String, ByVal FechaReserva As String, ByVal RutMedico As String, ByVal EstadoReserva As String)

        sql = "INSERT INTO [Reserva de Hora]([Hora Reserva], [Fecha Reserva],[Rut Medico], [Estado Reserva]) " &
                            "VALUES (@HoraReserva, @FechaReserva, @RutMedico, @EstadoReserva)"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Parameters.Add("@HoraReserva", SqlDbType.Time, 3).Value = HoraReserva
        cmd.Parameters.Add("@FechaReserva", SqlDbType.Date).Value = FechaReserva
        cmd.Parameters.Add("@RutMedico", SqlDbType.VarChar, 15).Value = RutMedico
        cmd.Parameters.Add("@EstadoReserva", SqlDbType.VarChar, 20).Value = EstadoReserva

        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    'esta funcion sirve para reservar la hora medica
    Public Sub UpdateReserva(ByVal HoraReserva As String, ByVal FechaReserva As String, ByVal RutMedico As String, ByVal RutPaciente As String, ByVal EstadoReserva As String, ByVal Contacto As String, ByVal IDReserva As Integer)

        sql = "Update [Reserva de Hora] Set [Hora Reserva]=@HoraReserva,[Fecha Reserva]=@FechaReserva,[Rut Medico]=@RutMedico,[Rut Paciente]=@RutPaciente,[Estado Reserva]=@EstadoReserva,[Telefono de Contacto]=@Contacto Where [Id Reserva]=@IDReserva"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Parameters.Add("@IDReserva", SqlDbType.Int).Value = IDReserva
        cmd.Parameters.Add("@HoraReserva", SqlDbType.Time, 3).Value = HoraReserva
        cmd.Parameters.Add("@FechaReserva", SqlDbType.Date).Value = FechaReserva
        cmd.Parameters.Add("@RutMedico", SqlDbType.VarChar, 15).Value = RutMedico
        cmd.Parameters.Add("@RutPaciente", SqlDbType.VarChar, 15).Value = RutPaciente
        cmd.Parameters.Add("@EstadoReserva", SqlDbType.VarChar, 20).Value = EstadoReserva
        cmd.Parameters.Add("@Contacto", SqlDbType.Int).Value = Contacto
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    'esta funcion sirve para devolver la hora medica
    Public Sub UpdateDevolverHora(ByVal HoraReserva As String, ByVal FechaReserva As String, ByVal RutMedico As String, ByVal EstadoReserva As String, ByVal IDReserva As Integer)

        sql = "Update [Reserva de Hora] Set [Hora Reserva]=@HoraReserva,[Fecha Reserva]=@FechaReserva,[Rut Medico]=@RutMedico,[Rut Paciente]=null,[Estado Reserva]=@EstadoReserva,[Telefono de Contacto]=null Where [Id Reserva]=@IDReserva"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Parameters.Add("@IDReserva", SqlDbType.Int).Value = IDReserva
        cmd.Parameters.Add("@HoraReserva", SqlDbType.Time, 3).Value = HoraReserva
        cmd.Parameters.Add("@FechaReserva", SqlDbType.Date).Value = FechaReserva
        cmd.Parameters.Add("@RutMedico", SqlDbType.VarChar, 15).Value = RutMedico
        cmd.Parameters.Add("@EstadoReserva", SqlDbType.VarChar, 20).Value = EstadoReserva
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Sub DeleteReserva(ByVal IDReserva As Integer)
        conn = New SqlConnection(ConnectionString)
        sql = "Delete From [Reserva de Hora] Where [Id Reserva] = @IDReserva"
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Parameters.Add("@IDReserva", SqlDbType.Int).Value = IDReserva
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    'metodo PARA ver la agenda segun la fecha seleccionada
    Public Function Fetch(ByVal Fecha_Despn As String, ByVal Medico As String) As DataTable

        sql = "select [Reserva de Hora].*,'Nombre del Medico'=isnull(e1.[Nombre Paciente],'')+' '+isnull(e1.[Apellido Paterno],'')+' '+isnull(e1.[Apellido Materno],'') 
                        from [Reserva de Hora]              
                        left join Empleado e1 on e1.[Rut Empleado]=[Reserva de Hora].[Rut Medico] 
                        where [Estado Reserva]='Disponible' and [Fecha Reserva]='" & Fecha_Despn & "' and [Rut Medico]='" & Medico & "' order by [Id Reserva]"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    'hace la consulta con la variable session del login
    Public Function Agenda(ByVal rut As String) As DataTable

        sql = "select [Reserva de Hora].*,'Nombre del Medico'=isnull(e1.[Nombre Paciente],'')+' '+isnull(e1.[Apellido Paterno],'')+' '+isnull(e1.[Apellido Materno],'') 
                        from [Reserva de Hora]              
                        inner join Empleado e1 on e1.[Rut Empleado]=[Reserva de Hora].[Rut Medico]
                        where [Rut Paciente]='" & rut & "' and ([Estado Reserva]= 'Reservada' or [Estado Reserva]= 'Confirmada')  order by [Id Reserva]"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    Public Function BuscaMedico()
        sql = "select [Rut Empleado],'nombre'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],'') 
                From Empleado e             
                Where e.[Cargo Empleado]='medico'"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function


End Class
