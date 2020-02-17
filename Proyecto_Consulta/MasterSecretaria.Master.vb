Public Class Acceso
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.mje.InnerHtml = Session("Nombre")

    End Sub

End Class