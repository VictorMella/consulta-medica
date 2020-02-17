Public Class MasterPaciente
    Inherits System.Web.UI.MasterPage
    Dim objleer As New Usuariocls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.mje.InnerHtml = Session("nombre")
    End Sub

End Class