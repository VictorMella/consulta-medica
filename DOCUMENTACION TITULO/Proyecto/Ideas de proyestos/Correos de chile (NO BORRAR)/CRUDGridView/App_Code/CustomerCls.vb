Option Explicit On
Option Infer On
Option Strict On

Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Collections
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class CustomerCls

    Dim customercode As Integer
    Dim customername As String
    Dim customergender As String
    Dim customercity As String
    Dim customerstate As String
    Dim customertype As String
    Dim ConnectionString As String
    Dim sql As String
    Dim conn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim dt As DataTable

    Public Property CustomersCode() As Integer
        Get
            Return customercode
        End Get
        Set(ByVal value As Integer)
            customercode = value
        End Set
    End Property

    Public Property CustomersName() As String
        Get
            Return customername
        End Get
        Set(ByVal value As String)
            customername = value
        End Set
    End Property

    Public Property CustomersGender() As String
        Get
            Return customergender
        End Get
        Set(ByVal value As String)
            customergender = value
        End Set
    End Property

    Public Property CustomersCity() As String
        Get
            Return customercity
        End Get
        Set(ByVal value As String)
            customercity = value
        End Set
    End Property

    Public Property CustomersState() As String
        Get
            Return customerstate
        End Get
        Set(ByVal value As String)
            customerstate = value
        End Set
    End Property

    Public Property CustomersType() As String
        Get
            Return customertype

        End Get
        Set(ByVal value As String)
            customertype = value
        End Set
    End Property

    'DAL Functions
    Public Sub New()
        ConnectionString = ConfigurationManager.AppSettings("ConnectionString").ToString()
    End Sub

    Public Sub InsertCustomer(ByVal CustomerName As String, ByVal CustomerGender As String, ByVal CustomerCity As String, ByVal CustomerState As String, _
                              ByVal CustomerType As String)

        sql = "INSERT INTO Customer(Name, Gender, City, State, Type) " & _
                            "VALUES (@CustomerName, @CustomerGender, @CustomerCity, @CustomerState, @CustomerType)"

        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Parameters.Add("@CustomerName", SqlDbType.VarChar, 50).Value = CustomerName
        cmd.Parameters.Add("@CustomerGender", SqlDbType.VarChar, 50).Value = CustomerGender
        cmd.Parameters.Add("@CustomerCity", SqlDbType.VarChar, 50).Value = CustomerCity
        cmd.Parameters.Add("@CustomerState", SqlDbType.VarChar, 50).Value = CustomerState
        cmd.Parameters.Add("@CustomerType", SqlDbType.VarChar, 50).Value = CustomerType
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Sub UpdateCustomer(ByVal CustomerName As String, ByVal CustomerGender As String, ByVal CustomerCity As String, ByVal CustomerState As String,
                              ByVal CustomerType As String, ByVal CustomerCode As Integer)

        sql = "Update Customer Set Name=@CustomerName, Gender=@CustomerGender, City=@CustomerCity, " &
                            " State=@CustomerState, Type=@CustomerType Where Code=@CustomerCode"
        conn = New SqlConnection(ConnectionString)
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Parameters.Add("@CustomerCode", SqlDbType.Int).Value = CustomerCode
        cmd.Parameters.Add("@CustomerName", SqlDbType.VarChar, 50).Value = CustomerName
        cmd.Parameters.Add("@CustomerGender", SqlDbType.VarChar, 50).Value = CustomerGender
        cmd.Parameters.Add("@CustomerCity", SqlDbType.VarChar, 50).Value = CustomerCity
        cmd.Parameters.Add("@CustomerState", SqlDbType.VarChar, 50).Value = CustomerState
        cmd.Parameters.Add("@CustomerType", SqlDbType.VarChar, 50).Value = CustomerType
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Sub DeleteCustomer(ByVal CustomerCode As Integer)
        conn = New SqlConnection(ConnectionString)
        sql = "Delete From Customer Where Code=@CustomerCode"
        conn.Open()
        cmd = New SqlCommand(sql, conn)
        cmd.Parameters.Add("@CustomerCode", SqlDbType.Int).Value = CustomerCode
        cmd.Prepare()
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Public Function Fetch() As DataTable

        sql = "Select * from Customer Order by Name"
        Dim da As New SqlDataAdapter(sql, ConnectionString)
        dt = New DataTable

        Try
            da.Fill(dt)
        Catch ex As Exception

        End Try

        Return dt
    End Function

End Class
