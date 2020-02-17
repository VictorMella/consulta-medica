Option Explicit On
Option Infer On
Option Strict Off

Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Collections
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Public Class Usuariocls
    Dim ConnectionString As String
    Dim sql As String
    Dim conn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim dt As DataTable


    Public Sub New()
        ConnectionString = ConfigurationManager.AppSettings("ConnectionString").ToString()
    End Sub

    '3 funciones para validar a usuarios
    Public Function BuscarUser1(ByVal rut As String, ByVal Password As String) As DataTable
        ' sql = "Select*from Acceso where [Rut Usuario]='" & Rut & "' and [Pass Usuario] = '" & Password & "' and [Id Perfil]=1"
        sql = "select Acceso.*,'PerfilUsuario'=p.[Perfil Usuario],'nombre'=isnull(p1.[Nombre Paciente],'')+' '+isnull(p1.[Apellido Paterno],'')+' '+isnull(p1.[Apellido Materno],'')+isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],'') 
                from Acceso 
                inner join [Perfil Usuario] p on p.[Id Perfil]=Acceso.[Id Perfil] 
                left join Paciente p1 on p1.[Rut Paciente]=Acceso.[Rut Usuario]
                left join Empleado e on e.[Rut Empleado]=Acceso.[Rut Usuario]
                where [Rut Usuario]='" & rut & "' and [Pass Usuario]='" & Password & "' and Estado=1"

        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function
    '_____________________________________________________________________________________________________________________________________________________

    'buscamos en la bd si ya existe un usuario para evitar usuarios con igual rut en pagina de crar usuarios
    Public Function Verificaruser(ByVal rut As String) As DataTable
        sql = "Select*from Acceso where [Rut Usuario]='" & rut & "'"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function


    'metodo de insercion de nuevos usuarios en la bd
    Public Sub InsertUser(ByVal rut As String, ByVal Pass2 As String)
        sql = "INSERT INTO Acceso([Rut Usuario],[Pass Usuario],[Id Perfil]) VALUES ('" & rut & "', '" & Pass2 & "',1)"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.ExecuteNonQuery()
        conn.Close()

    End Sub

    ''no Borrar, esta funcion funciona bien...solo hay que validar los menus
    'Public Function Login(ByVal Rut As String, ByVal Password As String) As DataTable
    '    sql = "Select*from Acceso where [Rut Usuario]='" & Rut & "' and [Pass Usuario] = '" & Password & "' "

    '    Dim da As New SqlDataAdapter(sql, ConnectionString)
    '    dt = New DataTable
    '    Try
    '        da.Fill(dt)
    '    Catch ex As Exception
    '    End Try
    '    Return dt
    'End Function



    'metodo de insercion de comentarios
    Public Sub InsertComentariosoutlogin(ByVal Nom As String, ByVal Mail As String, ByVal cmbTipoComentario As String, ByVal Txtcomentarios As String)
        sql = "INSERT INTO [Comentarios Usuarios]([Nombre Usuario],[Email Paciente],[Tipo Comentario],[Comentario]) VALUES ('" & Nom & "', '" & Mail & "','" & cmbTipoComentario & "','" & Txtcomentarios & "')"

        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.ExecuteNonQuery()
        conn.Close()

    End Sub

    Public Sub InsertComentariosinLogin(ByVal Nombre_Paciente As String, ByVal Email_Paciente As String, ByVal cmbEleccion As String, ByVal txtComentario As String)
        sql = "INSERT INTO [Comentarios Usuarios]([Nombre Usuario],[Email Paciente],[Tipo Comentario],[Comentario]) VALUES ('" & Nombre_Paciente & "', '" & Email_Paciente & "','" & cmbEleccion & "','" & txtComentario & "')"

        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.ExecuteNonQuery()
        conn.Close()

    End Sub

End Class
