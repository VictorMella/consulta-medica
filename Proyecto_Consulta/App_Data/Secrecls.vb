Option Explicit On
Option Infer On
Option Strict Off

Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Collections
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class Secrecls
    Dim ConnectionString As String
    Dim sql As String
    Dim conn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim dt As DataTable


    Public Sub New()
        ConnectionString = ConfigurationManager.AppSettings("ConnectionString").ToString()
    End Sub   '

    Public Sub InsertFichaPaciente(ByVal Rut_paciente As String, ByVal Nom_Paciente As String, ByVal Ap_Paciente As String, ByVal Am_Paciente As String, ByVal FNAC_Paciente As String,
                                ByVal Fono_Paciente As String, ByVal Dir_Paciente As String, ByVal cmbComuna As String, ByVal cmbPrevision As String, ByVal Email_Paciente As String)
        sql = "INSERT into Paciente ([Rut Paciente],[Nombre Paciente],[Apellido Paterno],[Apellido Materno],[Fecha de Nacimiento],[Direccion Paciente],[Telefono Paciente],[Comuna],[Prevision],[Email Paciente],[Id Estado]) " & "
                VALUES ('" & Rut_paciente & "', '" & Nom_Paciente & "','" & Ap_Paciente & "','" & Am_Paciente & "','" & FNAC_Paciente & "','" & Dir_Paciente & "','" & Fono_Paciente & "','" & cmbComuna & "','" & cmbPrevision & "','" & Email_Paciente & "',1)"

        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.ExecuteNonQuery()
        conn.Close()

    End Sub


    'verificar si el paciente esta ingresado o no
    Public Function VerificarPaciente(ByVal Rut_paciente As String) As DataTable
        sql = "Select*from Paciente where [Rut Paciente]='" & Rut_paciente & "'"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    Public Function BuscarDisponibilidad(ByVal cmbMedico As String) As DataTable
        sql = "select 'Nombre del Especialista'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],''),m.Especialidad,D.[Rut Medico],D.[Nombre Dia],D.[Hora Inicio],D.[Hora Termino]
					from Disponibilidad D
					left join Empleado e on D.[Rut Medico]= e.[Rut Empleado]
					left join Medico m on D.[Rut Medico]= m.[Rut Medico]
					where D.[Rut Medico]='" & cmbMedico & "'"

        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable

        Try
            da.Fill(dt)
        Catch ex As Exception

        End Try

        Return dt
    End Function
    Public Sub InsertHora(ByVal cmbhora As String, ByVal txtfecha As String, ByVal cmbrutmedico As String, ByVal cmbEstadoReserva As String)

        sql = "INSERT INTO [Reserva de Hora]([Hora Reserva],[Fecha Reserva],[Rut Medico],[Estado Reserva]) VALUES ('" & cmbhora & "', '" & txtfecha & "','" & cmbrutmedico & "','" & cmbEstadoReserva & "')"

        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.ExecuteNonQuery()
        conn.Close()

    End Sub

    Public Function BuscaFecha(ByVal Fecha As String) As DataTable
        sql = "select 'Nombre del Especialista'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],''),m.Especialidad,h.[Rut Medico],h.[Hora Reserva],h.[Fecha Reserva],h.[Estado Reserva] 
						from [Reserva de Hora] h
						left join Empleado e on e.[Rut Empleado]= h.[Rut Medico]
						left join Medico m on m.[Rut Medico]=h.[Rut Medico]
                         where h.[Fecha Reserva]='" & Fecha & "' and h.[Estado Reserva]='Disponible' order by h.[Rut Medico],[Id Reserva] "

        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable

        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    Public Function CondirmarHora(ByVal txtFechaAtencion As String) As DataTable
        sql = "select [Reserva de Hora].*,'Nombre del Paciente'=isnull(p1.[Nombre Paciente],'')+' '+isnull(p1.[Apellido Paterno],'')+' '+isnull(p1.[Apellido Materno],'') 
                        from [Reserva de Hora]              
                        left join Paciente p1 on p1.[Rut Paciente]=[Reserva de Hora].[Rut Paciente] 
                        where ([Estado Reserva]='Reservada' or [Estado Reserva]= 'Confirmada') and [Fecha Reserva]='" & txtFechaAtencion & "'order by [Id Reserva]"

        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable

        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    'esta funcion sirve para reservar la hora medica
    Public Sub UpdateReserva(ByVal HoraReserva As String, ByVal FechaReserva As String, ByVal RutMedico As String, ByVal RutPaciente As String, ByVal EstadoReserva As String, ByRef Contacto As String, ByVal IDReserva As Integer)

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

    Public Function ListaComentarios(ByVal cmbEleccion As String) As DataTable
        sql = "select [Nombre usuario] as [Nombre del Usuario] , [Email Paciente] as [Correo Electronico], Comentario from [Comentarios Usuarios] where [Tipo Comentario]='" & cmbEleccion & "'order by [Id Comentario]"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function
    Public Function GenerarReserva(ByVal Rut_Paciente As String) As DataTable
        sql = "select 'Nombre del Medico'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],''),
                [Fecha Reserva],[Hora Reserva],[Estado Reserva],'Nombre del Paciente'=isnull(p1.[Nombre Paciente],'')+' '+isnull(p1.[Apellido Paterno],'')+' '+isnull(p1.[Apellido Materno],'')   
                from [Reserva de Hora] 
                left join Paciente p1 on p1.[Rut Paciente]=[Reserva de hora].[Rut Paciente]
				left join Empleado e on e.[Rut Empleado]=[Reserva de Hora].[Rut Medico]
                where [Reserva de hora].[Rut Paciente]= '" & Rut_Paciente & "' and [Estado Reserva] <> 'Paciente Llego' Order by [Fecha Reserva] desc"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function
    Public Function GenerarReceta(ByVal Rut_Paciente As String) As DataTable
        sql = "Select Fecha,'Nombre del Paciente'=isnull(p1.[Nombre Paciente],'')+' '+isnull(p1.[Apellido Paterno],'')+' '+isnull(p1.[Apellido Materno],''),Receta.[Rut Paciente],
                'Nombre del Medico'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],'') ,[Rut Medico], Indicaciones  
	            from [Receta] 
	            left join Paciente p1 on p1.[Rut Paciente]=Receta.[Rut Paciente]
				left join Empleado e on e.[Rut Empleado]=Receta.[Rut Medico]
                where Receta.[Rut Paciente]='" & Rut_Paciente & "' Order by [Id Receta] desc"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function
    Public Function GenerarCertificado(ByVal Rut_Paciente As String) As DataTable
        sql = "select 'Nombre del Paciente'=isnull(p1.[Nombre Paciente],'')+' '+isnull(p1.[Apellido Paterno],'')+' '+isnull(p1.[Apellido Materno],''),c.[Rut Paciente],
                'Nombre del Medico'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],'') ,[Rut Medico],[Fecha de Inicio] as 'Fecha',Dias as 'Dias de Reposo',[Observacion] 
	            from [Certificado Medico] c
	            left join Paciente p1 on p1.[Rut Paciente]=c.[Rut Paciente]
				left join Empleado e on e.[Rut Empleado]=c.[Rut Medico]
                where c.[Rut Paciente]='" & Rut_Paciente & "' order by [Id Certificado] desc"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    'Ultimo grid de la pagina Cargar Agenda y es para actualizar la disponibilidad del medico
    Public Sub Insertdispon(ByVal RutMedico As String, ByVal Dia As String, ByVal Inicio As String, ByVal Termino As String)

        sql = "INSERT INTO Disponibilidad([Rut Medico],[Nombre Dia], [Hora Inicio],[Hora termino]) VALUES ('" & RutMedico & "', '" & Dia & "', '" & Inicio & "','" & Termino & "')"

        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Sub Updatedispon(ByVal RutMedico As String, ByVal Dia As String, ByVal Inicio As String, ByVal Termino As String, ByVal IdDisponibilidad As Integer)

        sql = "Update Disponibilidad Set [Rut Medico]='" & RutMedico & "',[Nombre Dia]='" & Dia & "',[Hora Inicio]='" & Inicio & "',[Hora Termino]='" & Termino & "' Where [Id Disponibilidad]='" & IdDisponibilidad & "'"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)

        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Sub Deletedispon(ByVal IdDisponibilidad As Integer)
        conn = New SqlConnection(ConnectionString)
        sql = "Delete From Disponibilidad Where [Id Disponibilidad]='" & IdDisponibilidad & "'"
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        'cmd.Parameters.Add("@IDPaciente", SqlDbType.Int).Value = IDPaciente
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Function VerDisponibilidad(ByVal cmbdoctor As String) As DataTable

        sql = "select 'Nombre del Especialista'=isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],''),m.Especialidad,D.*
					from Disponibilidad D
					left join Empleado e on D.[Rut Medico]= e.[Rut Empleado]
					left join Medico m on D.[Rut Medico]= m.[Rut Medico]
					where D.[Rut Medico]='" & cmbdoctor & "'"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    Public Function Correo(ByVal mail As String) As DataTable

        sql = "select * from Paciente where [Email Paciente]= '" & mail & "'"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function


End Class
