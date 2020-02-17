Option Explicit On
Option Infer On
Option Strict Off

Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Collections
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class MedicoCls
    Dim ConnectionString As String
    Dim sql As String
    Dim conn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim dt As DataTable



    Public Sub New()
        ConnectionString = ConfigurationManager.AppSettings("ConnectionString").ToString()
    End Sub
    Public Function GenerarReserva(ByVal Rut_Medico As String, ByVal Fecha As String) As DataTable
        sql = "select [Reserva de Hora].*,'Nombre del Paciente'=isnull(p1.[Nombre Paciente],'')+' '+isnull(p1.[Apellido Paterno],'')+' '+isnull(p1.[Apellido Materno],'') 
                from [Reserva de Hora]              
                left join Paciente p1 on p1.[Rut Paciente]=[Reserva de Hora].[Rut Paciente]                
                where [Reserva de Hora].[Rut Medico]='" & Rut_Medico & "' and [Fecha Reserva]='" & Fecha & "' and  [Estado Reserva]='Paciente Llego'"

        'sql = "select * from [Reserva de Hora] where [Rut Medico]='" & Rut_Medico & "'and [Fecha Reserva]='" & Fecha & "' and  [Estado Reserva]='Paciente Llego'"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function
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
    Public Sub UpdateReserva(ByVal HoraReserva As String, ByVal FechaReserva As String, ByVal RutMedico As String, ByVal RutPaciente As String, ByVal EstadoReserva As String, ByVal IDReserva As Integer)

        sql = "Update [Reserva de Hora] Set [Hora Reserva]=@HoraReserva,[Fecha Reserva]=@FechaReserva,[Rut Medico]=@RutMedico,[Rut Paciente]=@RutPaciente,[Estado Reserva]=@EstadoReserva Where [Id Reserva]=@IDReserva"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Parameters.Add("@IDReserva", SqlDbType.Int).Value = IDReserva
        cmd.Parameters.Add("@HoraReserva", SqlDbType.Time, 3).Value = HoraReserva
        cmd.Parameters.Add("@FechaReserva", SqlDbType.Date).Value = FechaReserva
        cmd.Parameters.Add("@RutMedico", SqlDbType.VarChar, 15).Value = RutMedico
        cmd.Parameters.Add("@RutPaciente", SqlDbType.VarChar, 15).Value = RutPaciente
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


    Public Sub InsertarHistoria(ByVal txtPeso As String, ByVal txtEstatura As String, ByVal txtTemperatura As String, ByVal Obs_Paciente As String, ByVal Tr_Paciente As String, ByVal N_Receta As Integer,
                                ByVal N_Certificado As Integer, ByVal N_Licencia As Integer, ByVal RutPac As String, ByVal RutDoc As String, ByVal Fecha_HC As String)
        sql = "INSERT INTO [Historial Clinico]([Peso paciente],[Estatura paciente],[Temperatura paciente],[Observaciones del dia],[Tratamiento],Id_Receta,[Id Certificado],[Id Licencia],[Rut Paciente],[Rut Medico],[Fecha HC]) VALUES 
                ('" & txtPeso & "','" & txtEstatura & "','" & txtTemperatura & "','" & Obs_Paciente & "','" & Tr_Paciente & "'," & N_Receta & "," & N_Certificado & "," & N_Licencia & ",'" & RutPac & "','" & RutDoc & "','" & Fecha_HC & "')"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Parameters.Add("@txtPeso", SqlDbType.VarChar, 10).Value = txtPeso
        cmd.Parameters.Add("@txtEstatura", SqlDbType.VarChar, 10).Value = txtEstatura
        cmd.Parameters.Add("@txtTemperatura", SqlDbType.VarChar, 10).Value = txtTemperatura
        cmd.Parameters.Add("@Obs_Paciente", SqlDbType.VarChar, 1000).Value = Obs_Paciente
        cmd.Parameters.Add("@Tr_Paciente", SqlDbType.VarChar, 500).Value = Tr_Paciente
        cmd.Parameters.Add("@N_Receta", SqlDbType.Int).Value = N_Receta
        cmd.Parameters.Add("@N_Certificado", SqlDbType.Int).Value = N_Certificado
        cmd.Parameters.Add("@N_Licencia", SqlDbType.Int).Value = N_Licencia
        cmd.Parameters.Add("@RutPac", SqlDbType.VarChar, 15).Value = RutPac
        cmd.Parameters.Add("@RutDoc", SqlDbType.VarChar, 15).Value = RutDoc
        cmd.Parameters.Add("@Fecha_HC", SqlDbType.Date).Value = Fecha_HC
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()

    End Sub

    Public Sub GuardarReceta(ByVal Fecha_Receta As String, ByVal Rut_Pac_Rec As String, ByVal Rut_Med_Receta As String, ByVal TxtTratamiento As String)
        sql = "INSERT INTO Receta([Rut Paciente],[Rut Medico],[Fecha],[Indicaciones]) VALUES ('" & Rut_Pac_Rec & "', '" & Rut_Med_Receta & "','" & Fecha_Receta & "','" & TxtTratamiento & "')"

        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Function BuscarReceta(ByVal Rut_Pac_Rec As String) As DataTable
        sql = "select [Id Receta] from Receta where [Rut Paciente]='" & Rut_Pac_Rec & "' and [Id Receta] = (select max([Id Receta]) from Receta where  [Rut Paciente]='" & Rut_Pac_Rec & "')"

        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    Public Sub GuardarCertificado(ByVal Rut_Med_Cert As String, ByVal Rut_Pac_Cert As String, ByVal Fecha_Reposo As String, ByVal Dias As String, ByVal TxtObservaciones As String)
        sql = "INSERT INTO [Certificado Medico]([Rut Medico],[Rut Paciente],[Fecha De Inicio],[Dias],[Observacion]) VALUES ('" & Rut_Pac_Cert & "', '" & Rut_Med_Cert & "','" & Fecha_Reposo & "','" & Dias & "','" & TxtObservaciones & "')"

        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Function BuscarCertificado(ByVal Rut_Pac_Cert As String) As DataTable
        sql = "select [Id Certificado] from [Certificado Medico] where [Rut Paciente]='" & Rut_Pac_Cert & "' and [Id Certificado] = (select max([Id Certificado]) from [Certificado Medico] where  [Rut Paciente]='" & Rut_Pac_Cert & "')"

        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    Public Function BuscarVisitas(ByVal Rut_Paciente As String) As DataTable
        sql = "select hc.[Fecha HC],'Nombre del Medico'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],''),
            hc.[Rut Medico],'Nombre del Paciente'=isnull(p1.[Nombre Paciente],'')+' '+isnull(p1.[Apellido Paterno],'')+' '+isnull(p1.[Apellido Materno],''),hc.[Rut Paciente]
			from [Historial Clinico] hc
			left join Paciente p1 on p1.[Rut Paciente]=hc.[Rut Paciente]
			left join Empleado e on e.[Rut Empleado]= hc.[Rut Medico]
            where hc.[Rut Paciente]='" & Rut_Paciente & "'"

        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    Public Function BuscarHistorial(ByVal Rut_Paciente As String, ByVal Rut_Medico As String, ByVal Fecha_Busqueda As String) As DataTable
        sql = "select*from [Historial Clinico] where [Rut Paciente]='" & Rut_Paciente & "' and [Rut Medico]='" & Rut_Medico & "' and [Fecha HC]='" & Fecha_Busqueda & "'"
        ' [Peso paciente],[Estatura paciente],[Temperatura paciente],[Observaciones del Dia],[Tratamiento],Id_Receta,[Id Certificado],[Id Licencia] 
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    Public Function BuscarNombre(ByVal Rut_Paciente As String) As DataTable
        sql = "select 'Nombre del Paciente'=isnull(p1.[Nombre Paciente],'')+' '+isnull(p1.[Apellido Paterno],'')+' '+isnull(p1.[Apellido Materno],'')
                from Paciente p1 where [Rut Paciente]='" & Rut_Paciente & "'"

        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    Public Function BuscaMedico(ByVal Rut_Medico As String) As DataTable
        sql = "select 'Nombre del Medico'=isnull(p1.[Nombre Paciente],'')+' '+isnull(p1.[Apellido Paterno],'')+' '+isnull(p1.[Apellido Materno],''), m.Especialidad,m.ICM,m.[Rut Medico]
                from Empleado p1 
				left join Medico m on m.[Rut Medico]=p1.[Rut Empleado]
                where [Rut Empleado]='" & Rut_Medico & "'"

        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function




    'consulta que trae el ultimo registro 
    '"select N_ORDEN from ORDEN_DE_DESPACHO where RUT_CLIENTE='" & Rut_Cliente_txt.Text _
    '            & "' and N_ORDEN = (select max(N_Orden) from ORDEN_DE_DESPACHO where RUT_CLIENTE='" & Rut_Cliente_txt.Text & "')"
End Class
