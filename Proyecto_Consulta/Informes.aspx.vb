Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser

Public Class Informes
    Inherits System.Web.UI.Page
    Dim objcertificado As New Secrecls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "trabajador" And Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If

        If (Not Page.IsPostBack) Then
            TraerReserva(rut.Text)
            TraerReceta(rut.Text)
            TraerCertificado(rut.Text)
        End If
        'rut.Focus()
        'rut.Dispose()

    End Sub


    Protected Sub TraerReserva(ByVal Rut_Paciente As String)
        'se llena la gridview 
        Dim dtrecerva As DataTable = New Secrecls().GenerarReserva(Rut_Paciente)
        Try
            If dtrecerva.Rows.Count > 0 Then
                gridreservas.DataSource = dtrecerva
                gridreservas.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtrecerva.Rows.Add(dtrecerva.NewRow())
                Me.gridreservas.DataSource = dtrecerva
                gridreservas.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = gridreservas.Rows(0).Cells.Count
                gridreservas.Rows(0).Cells.Clear()
                gridreservas.Rows(0).Cells.Add(New TableCell())
                gridreservas.Rows(0).Cells(0).ColumnSpan = TotalColumns
                gridreservas.Rows(0).Cells(0).Style.Add("text-align", "center")
                gridreservas.Rows(0).Cells(0).Text = "El Paciente no Tiene Reservas en el Sistema"

            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try
    End Sub

    Protected Sub TraerReceta(ByVal Rut_Paciente As String)
        'se llena la gridview 
        Dim dtreceta As DataTable = New Secrecls().GenerarReceta(Rut_Paciente)
        Try
            If dtreceta.Rows.Count > 0 Then
                gridRecetas.DataSource = dtreceta
                gridRecetas.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtreceta.Rows.Add(dtreceta.NewRow())
                Me.gridRecetas.DataSource = dtreceta
                gridRecetas.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = gridRecetas.Rows(0).Cells.Count
                gridRecetas.Rows(0).Cells.Clear()
                gridRecetas.Rows(0).Cells.Add(New TableCell())
                gridRecetas.Rows(0).Cells(0).ColumnSpan = TotalColumns
                gridRecetas.Rows(0).Cells(0).Style.Add("text-align", "center")
                gridRecetas.Rows(0).Cells(0).Text = "Este Paciente no Tiene Recetas en el Sistema"

            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try
    End Sub
    Protected Sub TraerCertificado(ByVal Rut_Paciente As String)
        'se llena la gridview 
        Dim dtcertificado As DataTable = New Secrecls().GenerarCertificado(Rut_Paciente)
        Try
            If dtcertificado.Rows.Count > 0 Then
                gridcertificados.DataSource = dtcertificado
                gridcertificados.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtcertificado.Rows.Add(dtcertificado.NewRow())
                Me.gridcertificados.DataSource = dtcertificado
                gridcertificados.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = gridcertificados.Rows(0).Cells.Count
                gridcertificados.Rows(0).Cells.Clear()
                gridcertificados.Rows(0).Cells.Add(New TableCell())
                gridcertificados.Rows(0).Cells(0).ColumnSpan = TotalColumns
                gridcertificados.Rows(0).Cells(0).Style.Add("text-align", "center")
                gridcertificados.Rows(0).Cells(0).Text = "Este Paciente no Tiene Certificados en el Sistema"

            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try
    End Sub

    Protected Sub BTN_Buscar_Click(sender As Object, e As EventArgs) Handles BTN_Buscar.Click

        If rut.Text.Length = 0 Then
            Response.Write("<script>alert('Ingresa un Rut para buscar lo solicitado');</script>")
        Else
            TraerReserva(rut.Text)
            ' rut.Text = ""
        End If

    End Sub

    Protected Sub BTN_Receta_Click(sender As Object, e As EventArgs) Handles BTN_Receta.Click
        If rut.Text.Length = 0 Then
            Response.Write("<script>alert('Ingresa un Rut para buscar lo solicitado');</script>")
        Else
            TraerReceta(rut.Text)
            ' rut.Text = ""
        End If
    End Sub

    Protected Sub BTN_Certificado_Click(sender As Object, e As EventArgs) Handles BTN_Certificado.Click
        If rut.Text.Length = 0 Then
            Response.Write("<script>alert('Ingresa un Rut para buscar lo solicitado');</script>")
        Else
            TraerCertificado(rut.Text)
            ' rut.Text = ""
        End If
    End Sub

    Protected Sub gridcertificados_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridcertificados.PageIndex = e.NewPageIndex
        TraerCertificado(rut.Text)

    End Sub

    Protected Sub gridRecetas_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridRecetas.PageIndex = e.NewPageIndex
        TraerCertificado(rut.Text)
    End Sub

    Protected Sub gridreservas_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridreservas.PageIndex = e.NewPageIndex
        TraerCertificado(rut.Text)
    End Sub


    'desde este punto empiezan las funciones para crear los archivos psf´s
    Public Overloads Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        'esta funcion es indispensable para que carguen correctamente los pdf's
    End Sub
    Protected Sub PDF1_Click(sender As Object, e As EventArgs) Handles PDF1.Click
        Response.ContentType = "aplication/pdf"
        Response.AddHeader("content-disposition", "attachment;filename=Reservas.pdf")
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Dim sw = New StringWriter()
        Dim hw = New HtmlTextWriter(sw)
        Dim parrafo = New Paragraph("Listado de Horas solicitadas hasta la Fecha", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim parrafo1 = New Paragraph("Centro de Salud Concepcion", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 20, iTextSharp.text.Font.NORMAL))
        Dim parrafo2 = New Paragraph("Colo-Colo 379 - Of.513 - Fono: 41 2243882", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer = New Paragraph("Centro de Salud Concepcion", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim parrafo3 = New Paragraph("Colo-Colo 379 - Of.513 - Fono: 41 2243882", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer1 = New Paragraph(Session("Nombre"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer2 = New Paragraph(Session("Rut"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim Linea = New Paragraph("________________________________________________________________________________________________________________", FontFactory.GetFont(FontFactory.COURIER_BOLD, 8, iTextSharp.text.Font.NORMAL))

        gridreservas.RenderControl(hw)
        Dim sr = New StringReader(sw.ToString())
        Dim documentoPDF = New Document(PageSize.LETTER)
        'Hoja horizontal
        'Dim documentoPDF = New Document(PageSize.LETTER.rotate)
        Dim htmlparse = New HTMLWorker(documentoPDF)
        PdfWriter.GetInstance(documentoPDF, Response.OutputStream)

        documentoPDF.Open()
        parrafo1.SpacingBefore = 10
        parrafo.Alignment = 1 '//0-Left, 1 middle,2 Right
        parrafo1.Alignment = 1
        parrafo2.Alignment = 1
        Linea.Alignment = 1
        documentoPDF.Add(parrafo1)
        documentoPDF.Add(parrafo2)
        documentoPDF.Add(parrafo)
        parrafo.SpacingAfter = 10
        documentoPDF.Add(Linea)
        documentoPDF.Add(Chunk.NEWLINE)

        'este metodo carga el grid en el pdf
        htmlparse.Parse(sr)

        'pie de pagina improvisado
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        footer.Alignment = 1
        parrafo3.Alignment = 1
        footer1.Alignment = 1
        footer2.Alignment = 1

        documentoPDF.Add(footer)
        documentoPDF.Add(parrafo3)
        documentoPDF.Add(footer1)
        documentoPDF.Add(footer2)

        'cierre de la incorporacion de datos en el pdf
        documentoPDF.Close()
        'se escriben los datos en el pdf
        Response.Write(documentoPDF)
        Response.End()
        gridreservas.AllowPaging = True
        gridreservas.DataBind()




    End Sub

    Protected Sub PDF2_Click(sender As Object, e As EventArgs) Handles PDF2.Click
        Response.ContentType = "aplication/pdf"
        Response.AddHeader("content-disposition", "attachment;filename=Recetas.pdf")
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Dim sw = New StringWriter()
        Dim hw = New HtmlTextWriter(sw)
        Dim parrafo = New Paragraph("Listado de Recetas emitidas hasta la Fecha", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim parrafo1 = New Paragraph("Centro de Salud Concepcion", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 20, iTextSharp.text.Font.NORMAL))
        Dim parrafo2 = New Paragraph("Colo-Colo 379 - Of.513 - Fono: 41 2243882", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer = New Paragraph("Centro de Salud Concepcion", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim parrafo3 = New Paragraph("Colo-Colo 379 - Of.513 - Fono: 41 2243882", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer1 = New Paragraph(Session("Nombre"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer2 = New Paragraph(Session("Rut"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim Linea = New Paragraph("________________________________________________________________________________________________________________", FontFactory.GetFont(FontFactory.COURIER_BOLD, 8, iTextSharp.text.Font.NORMAL))

        gridRecetas.RenderControl(hw)
        Dim sr = New StringReader(sw.ToString())
        Dim documentoPDF = New Document(PageSize.LETTER)
        Dim htmlparse = New HTMLWorker(documentoPDF)
        PdfWriter.GetInstance(documentoPDF, Response.OutputStream)

        documentoPDF.Open()
        parrafo1.SpacingBefore = 10
        parrafo.Alignment = 1 '//0-Left, 1 middle,2 Right
        parrafo1.Alignment = 1
        parrafo2.Alignment = 1
        Linea.Alignment = 1
        documentoPDF.Add(parrafo1)
        documentoPDF.Add(parrafo2)
        documentoPDF.Add(parrafo)
        parrafo.SpacingAfter = 10
        documentoPDF.Add(Linea)
        documentoPDF.Add(Chunk.NEWLINE)

        'este metodo carga el grid en el pdf
        htmlparse.Parse(sr)

        'pie de pagina improvisado
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        footer.Alignment = 1
        parrafo3.Alignment = 1
        footer1.Alignment = 1
        footer2.Alignment = 1

        documentoPDF.Add(footer)
        documentoPDF.Add(parrafo3)
        documentoPDF.Add(footer1)
        documentoPDF.Add(footer2)

        'cierre de la incorporacion de datos en el pdf
        documentoPDF.Close()
        'se escriben los datos en el pdf
        Response.Write(documentoPDF)
        Response.End()
        gridRecetas.AllowPaging = True
        gridRecetas.DataBind()
    End Sub

    Protected Sub PDF3_Click(sender As Object, e As EventArgs) Handles PDF3.Click
        Response.ContentType = "aplication/pdf"
        Response.AddHeader("content-disposition", "attachment;filename=Certificados.pdf")
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Dim sw = New StringWriter()
        Dim hw = New HtmlTextWriter(sw)
        Dim parrafo = New Paragraph("Listado de Certificados emitodos hasta la Fecha", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim parrafo1 = New Paragraph("Centro de Salud Concepcion", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 20, iTextSharp.text.Font.NORMAL))
        Dim parrafo2 = New Paragraph("Colo-Colo 379 - Of.513 - Fono: 41 2243882", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer = New Paragraph("Centro de Salud Concepcion", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim parrafo3 = New Paragraph("Colo-Colo 379 - Of.513 - Fono: 41 2243882", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer1 = New Paragraph(Session("Nombre"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer2 = New Paragraph(Session("Rut"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim Linea = New Paragraph("________________________________________________________________________________________________________________", FontFactory.GetFont(FontFactory.COURIER_BOLD, 8, iTextSharp.text.Font.NORMAL))

        gridcertificados.RenderControl(hw)
        Dim sr = New StringReader(sw.ToString())
        Dim documentoPDF = New Document(PageSize.LETTER)

        Dim htmlparse = New HTMLWorker(documentoPDF)
        PdfWriter.GetInstance(documentoPDF, Response.OutputStream)

        documentoPDF.Open()
        parrafo1.SpacingBefore = 10
        parrafo.Alignment = 1 '//0-Left, 1 middle,2 Right
        parrafo1.Alignment = 1
        parrafo2.Alignment = 1
        Linea.Alignment = 1
        documentoPDF.Add(parrafo1)
        documentoPDF.Add(parrafo2)
        documentoPDF.Add(parrafo)
        parrafo.SpacingAfter = 10
        documentoPDF.Add(Linea)
        documentoPDF.Add(Chunk.NEWLINE)

        'este metodo carga el grid en el pdf
        htmlparse.Parse(sr)

        'pie de pagina improvisado
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Chunk.NEWLINE)
        footer.Alignment = 1
        parrafo3.Alignment = 1
        footer1.Alignment = 1
        footer2.Alignment = 1

        documentoPDF.Add(footer)
        documentoPDF.Add(parrafo3)
        documentoPDF.Add(footer1)
        documentoPDF.Add(footer2)

        'cierre de la incorporacion de datos en el pdf
        documentoPDF.Close()
        'se escriben los datos en el pdf
        Response.Write(documentoPDF)
        Response.End()
        gridcertificados.AllowPaging = True
        gridcertificados.DataBind()
    End Sub

    Protected Sub limpiar_Click(sender As Object, e As EventArgs) Handles limpiar.Click
        rut.Text = ""
        rut.Focus()
    End Sub
End Class