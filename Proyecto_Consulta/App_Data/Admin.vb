Option Explicit On
Option Infer On
Option Strict Off

Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Collections
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class Admin
    Dim ConnectionString As String
    Dim sql As String
    Dim conn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim dt As DataTable

    Public Sub New()
        ConnectionString = ConfigurationManager.AppSettings("ConnectionString").ToString()
    End Sub   '
    Public Sub CrearTrabajador(ByVal Rut_Usuario As String, ByVal Nom_Usuario As String, ByVal Ap_Paciente_Usuario As String, ByVal Am_Paciente_Usuario As String, ByVal Fono_Paciente As String,
                               ByVal Dir_Paciente As String, ByVal cmbCargo As String, ByVal Email_Paciente As String)
        sql = "INSERT into Empleado ([Rut Empleado],[Nombre Paciente],[Apellido Paterno],[Apellido Materno],[Direccion Empleado],[Telefono Paciente],[Cargo Empleado],[Email Empleado],[Id Estado]) " & "
                VALUES ('" & Rut_Usuario & "', '" & Nom_Usuario & "','" & Ap_Paciente_Usuario & "','" & Am_Paciente_Usuario & "','" & Dir_Paciente & "','" & Fono_Paciente & "','" & cmbCargo & "','" & Email_Paciente & "',1)"

        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.ExecuteNonQuery()
        conn.Close()

    End Sub
    Public Function VerificarTrabajador(ByVal Rut_Usuario As String) As DataTable
        sql = "Select*from Empleado where [Rut Empleado]='" & Rut_Usuario & "'"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    'buscamos en la bd si ya existe un usuario para evitar usuarios con igual rut en pagina de crar usuarios
    Public Function Verificaruser(ByVal txtuser As String) As DataTable
        sql = "Select*from Acceso where [Rut Usuario]='" & txtuser & "'"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    'crear usuarios tipo trabajador o medico
    Public Sub InsertUser(ByVal Rut As String, ByVal Pass2 As String, ByVal cmbPerfil As String)
        sql = "INSERT INTO Acceso([Rut Usuario],[Pass Usuario],[Id Perfil]) VALUES ('" & Rut & "', '" & Pass2 & "','" & cmbPerfil & "')"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.ExecuteNonQuery()
        conn.Close()

    End Sub
    'esta funcion no se ocupa y es para crear empleados
    Public Sub Inserttrabajo(ByVal txtrutempleadonew As String, ByVal txtnomnew As String, ByVal txtAppnew As String, ByVal txtApmnew As String, ByVal txtdireccionnew As String, ByVal txtfononew As String,
                             ByVal cmbCargonew As String, ByVal txtemailnew As String, ByVal cmbPEstadonew As String)

        sql = "INSERT into Empleado ([Rut Empleado],[Nombre Paciente],[Apellido Paterno],[Apellido Materno],[Direccion Paciente],[Telefono Paciente],[Cargo Empleado],[Email Empleado],[Id Estado]) " & "
                VALUES ('" & txtrutempleadonew & "','" & txtnomnew & "','" & txtAppnew & "','" & txtApmnew & "','" & txtdireccionnew & "','" & txtfononew & "','" & cmbCargonew & "','" & txtemailnew & "','" & cmbPEstadonew & "', )"

        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)

        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    'actualizar empleados
    Public Sub UpdateTrabajador(ByVal txtrutempleado As String, ByVal txtnom As String, ByVal txtApp As String, ByVal txtApm As String, ByVal txtdireccion As String, ByVal txtfono As String,
                             ByVal cmbCargo As String, ByVal txtemail As String, ByVal cmbPEstado As String, ByVal IdEstado As Integer)

        sql = "Update Empleado Set [Rut Empleado]='" & txtrutempleado & "',[Nombre Paciente]='" & txtnom & "',[Apellido Paterno]='" & txtApp & "',[Apellido Materno]='" & txtApm & "',[Direccion Empleado]='" & txtdireccion & "', " &
            " [Telefono Paciente]='" & txtfono & "',[Cargo Empleado]='" & cmbCargo & "',[Email Empleado]='" & txtemail & "',[Id Estado]='" & cmbPEstado & "' Where [Id Empleado]='" & IdEstado & "'"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)

        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    'eliminar empleados y tampoco se ocupa
    Public Sub DeleteTrabajador(ByVal IdEstado As Integer)
        conn = New SqlConnection(ConnectionString)
        sql = "Delete From Empleado Where [Id Empleado]='" & IdEstado & "'"
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    'buscar datos de los empleados
    Public Function Fetch(ByVal RutTrabajador As String) As DataTable
        sql = "Select * from Empleado where [Rut Empleado] = '" & RutTrabajador & "'  Order by [Id Empleado]"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    'crear un medico nuevo
    Public Sub InsertMedico(ByVal Rut_Medico As String, ByVal cmbEspecialidad As String, ByVal ICM As String)
        sql = "INSERT INTO Medico([Rut Medico],[Especialidad],[ICM]) VALUES ('" & Rut_Medico & "', '" & cmbEspecialidad & "','" & ICM & "')"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    'verifica si el medico esta creado o no
    Public Function VerificarMedico(ByVal Rut_Medico As String) As DataTable
        sql = "Select*from Medico where [Rut Medico]='" & Rut_Medico & "'"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    'funcion para ver si el medico esta creado o no como trabajador
    Public Function Empleo(ByVal Rut_Medico As String) As DataTable
        sql = "Select * from Empleado where [Rut Empleado] = '" & Rut_Medico & "'  Order by [Id Empleado]"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    'funcion para recuperar la contraseña de los usuarios
    Public Function BuscarPass(ByVal rut As String) As DataTable
        ' sql = "Select*from Acceso where [Rut Usuario]='" & Rut & "' and [Pass Usuario] = '" & Password & "' and [Id Perfil]=1"
        sql = "select Acceso.*,'PerfilUsuario'=p.[Perfil Usuario],'nombre'=isnull(p1.[Nombre Paciente],'')+' '+isnull(p1.[Apellido Paterno],'')+' '+isnull(p1.[Apellido Materno],'')+isnull(e.[Nombre Paciente],'')+' '+isnull(e.[Apellido Paterno],'')+' '+isnull(e.[Apellido Materno],'') 
                from Acceso 
                inner join [Perfil Usuario] p on p.[Id Perfil]=Acceso.[Id Perfil] 
                left join Paciente p1 on p1.[Rut Paciente]=Acceso.[Rut Usuario]
                left join Empleado e on e.[Rut Empleado]=Acceso.[Rut Usuario] 
                where [Rut Usuario]='" & rut & "'"

        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    'contador de trabajadores
    Public Function Contador() As DataTable       '

        sql = "Select * from [Contador de Trabajadores]"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function
    'Contador de usuarios
    Public Function Cuentauser() As DataTable       '

        sql = "Select * from [Contador de Usuarios]"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable
        Try
            da.Fill(dt)
        Catch ex As Exception
        End Try
        Return dt
    End Function

    'cancelar el acceso del usuario
    Public Sub UpdatePerfil(ByVal Rut As String)
        sql = "Update Acceso set Estado=2 where [Rut usuario]= '" & Rut & "' "
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)

        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    'permitir acceso del usuario
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
