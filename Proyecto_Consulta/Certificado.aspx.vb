Imports iTextSharp
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports System.IO
Imports System.Web.UI

Public Class Certificado
    Inherits System.Web.UI.Page
    Dim objmedico As New MedicoCls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = "" Or Session("User") <> "medico" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
        Me.Rut_Med_Cert.Text = Session("Rut")
        txtFicheroPDF.Text = System.IO.Path.Combine(System.Environment.GetFolderPath(Environment.SpecialFolder.Desktop), Session("Certificado") & ";" & nom.Text & ".pdf")
    End Sub


    Protected Sub BTN_Certificado_Click(sender As Object, e As EventArgs) Handles BTN_Certificado.Click
        objmedico = New MedicoCls
        Dim dtnombre As DataTable = New MedicoCls().BuscarNombre(rut.Text)
        If dtnombre.Rows.Count() > 0 Then
            nom.Text = dtnombre.Rows(0).Item("Nombre del Paciente")
        End If

        objmedico.GuardarCertificado(rut.Text, Rut_Med_Cert.Text, Fecha_Reposo.Text, Dias.Text, TxtObservaciones.Text)
        MsgBox("El Certificado se ha Guardado Correctamente")
        Dim dtcertificado As DataTable = New MedicoCls().BuscarCertificado(rut.Text)
        If dtcertificado.Rows.Count() > 0 Then
            Session("Certificado") = dtcertificado(0).Item("Id Certificado")
        End If
        Me.certificado.InnerHtml = "Tu numero de Certificado es el " & Session("Certificado")
        'buscar datos del medico
        objmedico = New MedicoCls
        Dim medico As DataTable = New MedicoCls().BuscaMedico(Session("Rut"))
        If medico.Rows.Count() > 0 Then
            Session("nom") = medico.Rows(0).Item("Nombre del Medico")
            Session("especialidad") = medico.Rows(0).Item("Especialidad")
            Session("icm") = medico.Rows(0).Item("ICM")
        End If


    End Sub

    Protected Sub Btn_Imprimir_Click(sender As Object, e As EventArgs) Handles Btn_Imprimir.Click

        If nom.Text = "" Then
            MsgBox("Debe introducir el nombre del paciente.",
                       MsgBoxStyle.Exclamation + MsgBoxStyle.OkOnly)
            'txtFicheroPDF.Focus()
        Else
            Try
                'Creamos el objeto documento PDF
                Dim documentoPDF As New Document(PageSize.LETTER)
                Dim parrafo = New Paragraph("Dr(a). " & Session("nom") & " y Cia. Ltda.", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 20, iTextSharp.text.Font.NORMAL))
                Dim parrafo1 = New Paragraph("Especialidad: " & Session("especialidad"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
                'Dim parrafo2 = New Paragraph("Enfermedades Respiratorias", FontFactory.GetFont(FontFactory.TIMES, 11, iTextSharp.text.Font.NORMAL))
                Dim parrafo3 = New Paragraph("Colo-Colo 379 - Of.513 - Fono: 41 2243882", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
                Dim parrafo4 = New Paragraph("I.C.M. " & Session("icm") & " -  RUT: " & Rut_Med_Cert.Text, FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
                Dim parrafo5 = New Paragraph("Concepcion", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
                Dim footer = New Paragraph("Dr(a). " & Session("nom"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
                Dim footer1 = New Paragraph(Session("especialidad"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
                Dim footer2 = New Paragraph("ICM: " & Session("icm"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
                Dim footer3 = New Paragraph("RUT: " & Rut_Med_Cert.Text, FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
                Dim footer4 = New Paragraph("_____________________________________________", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
                Dim DOC = New Paragraph("Certificado Medico.", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 15, iTextSharp.text.Font.NORMAL))
                'se instancia el objeto para crear el documento
                PdfWriter.GetInstance(documentoPDF, New FileStream(txtFicheroPDF.Text, FileMode.Create))
                documentoPDF.Open()
                'principos del encabezado
                parrafo.SpacingBefore = 10
                parrafo.Alignment = 1 '//0-Left, 1 middle,2 Right
                parrafo1.Alignment = 1
                ' parrafo2.Alignment = 1
                parrafo3.Alignment = 1
                parrafo4.Alignment = 1
                parrafo5.Alignment = 1
                DOC.Alignment = 1
                documentoPDF.Add(parrafo)
                documentoPDF.Add(parrafo1)
                'documentoPDF.Add(parrafo2)
                documentoPDF.Add(parrafo3)
                documentoPDF.Add(parrafo4)
                documentoPDF.Add(parrafo5)
                'documentoPDF.Add(Chunk.NEWLINE)
                parrafo5.SpacingAfter = 5
                'fin del encabezado
                'Escribimos el texto en el objeto documento PDF
                documentoPDF.Add(New Paragraph("________________________________________________________________________________________________________________",
                FontFactory.GetFont(FontFactory.COURIER_BOLD, 8, iTextSharp.text.Font.NORMAL)))
                'documentoPDF.Add(Chunk.NEWLINE)

                documentoPDF.Add(DOC)
                'linea 0
                documentoPDF.Add(New Paragraph("N° de Certificado " & Session("Certificado"), FontFactory.GetFont(FontFactory.TIMES, 14, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(Chunk.NEWLINE)

                'linea 1
                documentoPDF.Add(New Paragraph("Nombre del Paciente:", FontFactory.GetFont(FontFactory.TIMES, 14, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(New Paragraph(nom.Text, FontFactory.GetFont(FontFactory.TIMES, 11, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(Chunk.NEWLINE)

                'linea 2
                documentoPDF.Add(New Paragraph("Rut del Paciente:", FontFactory.GetFont(FontFactory.TIMES, 14, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(New Paragraph(rut.Text, FontFactory.GetFont(FontFactory.TIMES, 11, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(Chunk.NEWLINE)

                'linea 3
                documentoPDF.Add(New Paragraph("Inicio del Reposo:", FontFactory.GetFont(FontFactory.TIMES, 14, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(New Paragraph(Fecha_Reposo.Text, FontFactory.GetFont(FontFactory.TIMES, 11, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(Chunk.NEWLINE)

                'linea 4
                documentoPDF.Add(New Paragraph("Dias de Reposo:", FontFactory.GetFont(FontFactory.TIMES, 14, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(New Paragraph(Dias.Text, FontFactory.GetFont(FontFactory.TIMES, 11, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(Chunk.NEWLINE)



                'linea 4
                'documentoPDF.Add(New Paragraph("Rut del Medico:", FontFactory.GetFont(FontFactory.TIMES, 14, iTextSharp.text.Font.NORMAL)))
                'documentoPDF.Add(New Paragraph(Rut_Med_Receta.Text, FontFactory.GetFont(FontFactory.TIMES, 11, iTextSharp.text.Font.NORMAL)))
                'documentoPDF.Add(Chunk.NEWLINE)



                'linea 5
                documentoPDF.Add(New Paragraph("Onservacion:", FontFactory.GetFont(FontFactory.TIMES, 14, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(New Paragraph(TxtObservaciones.Text, FontFactory.GetFont(FontFactory.TIMES, 11, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(Chunk.NEWLINE)
                documentoPDF.Add(Chunk.NEWLINE)
                documentoPDF.Add(Chunk.NEWLINE)
                documentoPDF.Add(Chunk.NEWLINE)

                'linea final para iniciar el pie de pagina
                'documentoPDF.Add(New Paragraph("________________________________________________________________________________________________________________",
                'FontFactory.GetFont(FontFactory.COURIER_BOLD, 8, iTextSharp.text.Font.NORMAL)))
                documentoPDF.Add(Chunk.NEWLINE)
                documentoPDF.Add(Chunk.NEWLINE)
                documentoPDF.Add(Chunk.NEWLINE)
                documentoPDF.Add(Chunk.NEWLINE)
                documentoPDF.Add(Chunk.NEWLINE)
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
        End If
    End Sub






End Class