Imports iTextSharp
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports System.IO
Imports System.Web.UI

Public Class ConsultasAnteriores
    Inherits System.Web.UI.Page
    Dim objfechas As New MedicoCls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "medico" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
        TraerFechas(rut.Text)
        txtFicheroPDF.Text = System.IO.Path.Combine(System.Environment.GetFolderPath(Environment.SpecialFolder.Desktop), Session("paciente") & ";" & Fecha_Busqueda.Text & ".pdf")
    End Sub

    Protected Sub GridHoras_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        GridHoras.PageIndex = e.NewPageIndex
        'TraerCertificado()
    End Sub
    Protected Sub TraerFechas(ByVal Rut_Paciente As String)
        'se llena la gridview 
        Dim dtfechas As DataTable = New MedicoCls().BuscarVisitas(Rut_Paciente)

        Try
        If dtfechas.Rows.Count > 0 Then
                GridHoras.DataSource = dtfechas
                GridHoras.DataBind()
                Session("paciente") = dtfechas.Rows(0).Item("Nombre del Paciente")
            Else 'if no record, display no record found in a new gridview cell
                dtfechas.Rows.Add(dtfechas.NewRow())
                Me.GridHoras.DataSource = dtfechas
                GridHoras.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = GridHoras.Rows(0).Cells.Count
                GridHoras.Rows(0).Cells.Clear()
                GridHoras.Rows(0).Cells.Add(New TableCell())
                GridHoras.Rows(0).Cells(0).ColumnSpan = TotalColumns
                GridHoras.Rows(0).Cells(0).Style.Add("text-align", "center")
                GridHoras.Rows(0).Cells(0).Text = "El Paciente no cuenta con Visitas previas"

            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try
    End Sub
    Protected Sub BTN_Fechas_Click(sender As Object, e As EventArgs) Handles BTN_Fechas.Click
        objfechas = New MedicoCls
        TraerFechas(rut.Text)
    End Sub

    Protected Sub GridHoras_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridHoras.SelectedIndexChanged
        RUTMEDICO.SelectedValue = GridHoras.SelectedRow.Cells(3).Text
        ' Rut_Medico.Text = GridHoras.SelectedRow.Cells(3).Text
        Fecha_Busqueda.Text = CDate(GridHoras.SelectedRow.Cells(1).Text)
    End Sub


    Protected Sub BTN_Buscar_Click(sender As Object, e As EventArgs) Handles BTN_Buscar.Click
        objfechas = New MedicoCls
        Dim dthistorias As DataTable = New MedicoCls().BuscarHistorial(rut.Text, RUTMEDICO.SelectedValue, Fecha_Busqueda.Text)
        If dthistorias.Rows.Count() <= 0 Then
            Response.Write("<script>alert('Este Paciente no tiene Historial clinico en esta fecha');</script>")
        Else
            txtPeso.Text = dthistorias.Rows(0).Item("Peso paciente")
            txtEstatura.Text = dthistorias.Rows(0).Item("Estatura paciente")
            txtTemperatura.Text = dthistorias.Rows(0).Item("Temperatura paciente")
            N_Receta.Text = dthistorias.Rows(0).Item("Id_Receta")
            N_Certificado.Text = dthistorias.Rows(0).Item("Id Certificado")
            N_Licencia.Text = dthistorias.Rows(0).Item("Id Licencia")
            Obs_Paciente.Text = dthistorias.Rows(0).Item("Observaciones del Dia")
            Tr_Paciente.Text = dthistorias.Rows(0).Item("Tratamiento")
        End If
        objfechas = New MedicoCls
        Dim medico As DataTable = New MedicoCls().BuscaMedico(Session("Rut"))
        If medico.Rows.Count() > 0 Then
            Session("nom") = medico.Rows(0).Item("Nombre del Medico")
            Session("especialidad") = medico.Rows(0).Item("Especialidad")
            Session("icm") = medico.Rows(0).Item("ICM")
        End If

        Dim dtdatos As DataTable = New MedicoCls().BuscaMedico(RUTMEDICO.SelectedValue)
        If dtdatos.Rows.Count() > 0 Then
            Session("doc") = dtdatos.Rows(0).Item("Nombre del Medico")
            Session("esp") = dtdatos.Rows(0).Item("Especialidad")
        End If
    End Sub

    Protected Sub BTN_Imprimir_Click(sender As Object, e As EventArgs) Handles BTN_Imprimir.Click

        Try
            'Creamos el objeto documento PDF
            Dim documentoPDF As New Document(PageSize.A4)
            Dim parrafo = New Paragraph("Dr(a). " & Session("nom") & " y Cia. Ltda.", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 20, iTextSharp.text.Font.NORMAL))
            Dim parrafo1 = New Paragraph("Especialidad: " & Session("especialidad"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
            Dim parrafo3 = New Paragraph("Colo-Colo 379 - Of.513 - Concepcion; Fono: 41 2243882", FontFactory.GetFont(FontFactory.TIMES, 11, iTextSharp.text.Font.NORMAL))
            Dim parrafo4 = New Paragraph("I.C.M. " & Session("icm") & " -  RUT: " & Session("Rut"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
            'Dim parrafo5 = New Paragraph("Concepcion", FontFactory.GetFont(FontFactory.TIMES, 11, iTextSharp.text.Font.NORMAL))
            Dim footer = New Paragraph("Dr(a). " & Session("nom"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
            Dim footer1 = New Paragraph(Session("especialidad"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
            Dim footer2 = New Paragraph("ICM: " & Session("icm"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
            Dim footer3 = New Paragraph("RUT: " & Session("Rut"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
            Dim footer4 = New Paragraph("_____________________________________________", FontFactory.GetFont(FontFactory.TIMES, 11, iTextSharp.text.Font.NORMAL))
            Dim DOC = New Paragraph("Visitas Anteriores.", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 15, iTextSharp.text.Font.NORMAL))
            'se instancia el objeto para crear el documento
            PdfWriter.GetInstance(documentoPDF, New FileStream(txtFicheroPDF.Text, FileMode.Create))
            documentoPDF.Open()
            'principos del encabezado
            'parrafo.SpacingBefore = 10
            parrafo.Alignment = 1 '//0-Left, 1 middle,2 Right
            parrafo1.Alignment = 1
            '  parrafo2.Alignment = 1
            parrafo3.Alignment = 1
            parrafo4.Alignment = 1
            'parrafo5.Alignment = 1
            DOC.Alignment = 1
            documentoPDF.Add(parrafo)
            documentoPDF.Add(parrafo1)
            ' documentoPDF.Add(parrafo2)
            documentoPDF.Add(parrafo3)
            documentoPDF.Add(parrafo4)
            'documentoPDF.Add(parrafo5)
            ' documentoPDF.Add(Chunk.NEWLINE)
            'parrafo5.SpacingAfter = 5
            'fin del encabezado
            'Escribimos el texto en el objeto documento PDF
            documentoPDF.Add(New Paragraph("____________________________________________________________________________________________________________",
                    FontFactory.GetFont(FontFactory.COURIER_BOLD, 8, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(DOC)
            'linea 0
            documentoPDF.Add(New Paragraph("FECHA DE LA ATENCION", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph(Fecha_Busqueda.Text, FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)

            'linea 1
            documentoPDF.Add(New Paragraph("NOMBRE DEL MEDICO", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph(Session("doc"), FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)
            'linea 1
            documentoPDF.Add(New Paragraph("RUT DEL ESPECIALISTA", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph(RUTMEDICO.SelectedValue, FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)
            'linea 1
            documentoPDF.Add(New Paragraph("ESPECIALIDAD", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph(Session("esp"), FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)

            'linea 1
            documentoPDF.Add(New Paragraph("NOMBRE DEL PACIENTE", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph(Session("paciente"), FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)

            'linea 3
            documentoPDF.Add(New Paragraph("RUT DEL PACIENTE", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph(rut.Text, FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)

            'linea 3
            documentoPDF.Add(New Paragraph("DOCUMENTOS ASOCIADOS", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph("N° Receta " & " - " & " N° de Certificado " & " - " & " N° de Licencia ", FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph("           " & N_Receta.Text & "        -         " & N_Certificado.Text & "                  -          " & N_Licencia.Text, FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)

            'linea 2
            documentoPDF.Add(New Paragraph("PESO DEL PACIENTE", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph(txtPeso.Text & " Kg", FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)

            'linea 4
            documentoPDF.Add(New Paragraph("ESTATURA DEL PACIENTE", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph(txtEstatura.Text & " mt", FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)

            'linea 5
            documentoPDF.Add(New Paragraph("TEMPERATURA", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph(txtTemperatura.Text & " °", FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)

            'linea 5
            documentoPDF.Add(New Paragraph("OBSERVACIONES", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph(Obs_Paciente.Text, FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)

            'linea 5
            documentoPDF.Add(New Paragraph("TRATAMIENTO", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(New Paragraph(Tr_Paciente.Text, FontFactory.GetFont(FontFactory.TIMES, 9, iTextSharp.text.Font.NORMAL)))
            documentoPDF.Add(Chunk.NEWLINE)
            documentoPDF.Add(Chunk.NEWLINE)



            'linea final para iniciar el pie de pagina
            'documentoPDF.Add(New Paragraph("________________________________________________________________________________________________________________",
            'FontFactory.GetFont(FontFactory.COURIER_BOLD, 8, iTextSharp.text.Font.NORMAL)))





            'texto del footer cargados desde la BD
            footer.Alignment = 1
            footer1.Alignment = 1
            footer2.Alignment = 1
            footer3.Alignment = 1
            footer4.Alignment = 1
            documentoPDF.Add(footer4)
            documentoPDF.Add(footer)
            documentoPDF.Add(footer1)
            documentoPDF.Add(footer2)
            documentoPDF.Add(footer3)
            documentoPDF.AddCreationDate()
            'Cerramos el objeto documento, guardamos y creamos el PDF
            documentoPDF.Close()
            'Comprobamos si se ha creado el fichero PDF
            If System.IO.File.Exists(txtFicheroPDF.Text) Then
                If MsgBox("Texto convertido a fichero PDF correctamente " +
                               "¿desea abrir el fichero PDF resultante?",
                               MsgBoxStyle.Question + MsgBoxStyle.YesNo) = MsgBoxResult.Yes Then
                    'Abrimos el fichero PDF con la aplicación asociada
                    System.Diagnostics.Process.Start(txtFicheroPDF.Text)
                End If
            Else
                MsgBox("El fichero PDF no se ha generado, " +
                               "compruebe que tiene permisos en la carpeta de destino.",
                               MsgBoxStyle.Exclamation + MsgBoxStyle.OkOnly)
            End If
        Catch ex As Exception
            MsgBox("Se ha producido un error al intentar convertir el texto a PDF: " +
                        vbCrLf + vbCrLf + ex.Message,
                        MsgBoxStyle.Critical + MsgBoxStyle.OkOnly)
        End Try

    End Sub
End Class