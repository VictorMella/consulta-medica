Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.html
Imports iTextSharp.text.html.simpleparser

Public Class Pacientesdiarios
    Inherits System.Web.UI.Page
    Dim objpaciente As New ActualizarPacientesCls
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        GridView1.Visible = False
        gridpacientes.Visible = True
        BTN_Imprimir.Visible = True

        Contador()
        Me.numpaciente.InnerHtml = "El total de pacientes ingresados es de " & Session("Contador") & " niños"
        'If (Not Page.IsPostBack) Then
        '    FillPacienteInGrid(RutPaciente.Text)
        'End If
        If Session("User") = "" Or Session("User") <> "trabajador" And Session("User") <> "administrador" Then
            Response.Redirect("LoginPrincipal.aspx")
        End If
        ' rut.Focus()


    End Sub
    Protected Sub FillPacienteInGrid(ByVal RutPaciente As String)
        'se llena la gridview 
        Dim dtPaciente As DataTable = New ActualizarPacientesCls().Fetch(RutPaciente)
        Try

            If dtPaciente.Rows.Count > 0 Then
                GridView1.DataSource = dtPaciente
                GridView1.DataBind()
            Else 'if no record, display no record found in a new gridview cell
                dtPaciente.Rows.Add(dtPaciente.NewRow())
                Me.GridView1.DataSource = dtPaciente
                GridView1.DataBind()

                'create a new row/table and display a status message
                'on the gridview row
                Dim TotalColumns As Integer
                TotalColumns = GridView1.Rows(0).Cells.Count
                GridView1.Rows(0).Cells.Clear()
                GridView1.Rows(0).Cells.Add(New TableCell())
                GridView1.Rows(0).Cells(0).ColumnSpan = TotalColumns
                GridView1.Rows(0).Cells(0).Style.Add("text-align", "left")
                GridView1.Rows(0).Cells(0).Text = "No hay registros del paciente"

            End If

        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try

    End Sub

    Protected Sub GridView1_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) _
        Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        FillPacienteInGrid(rut.Text)
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        If e.CommandName.Equals("AgragarNuevo") Then

            Dim txtNewRut As TextBox
            txtNewRut = CType(GridView1.FooterRow.FindControl("txtNewRut"), TextBox)
            Dim txtNewPaciente As TextBox
            txtNewPaciente = CType(GridView1.FooterRow.FindControl("txtNewPaciente"), TextBox)
            Dim txtnewpaterno As TextBox
            txtnewpaterno = CType(GridView1.FooterRow.FindControl("txtnewpaterno"), TextBox)
            Dim txtnewmaterno As TextBox
            txtnewmaterno = CType(GridView1.FooterRow.FindControl("txtnewmaterno"), TextBox)
            Dim txtnewfecha As TextBox
            txtnewfecha = CType(GridView1.FooterRow.FindControl("txtnewfecha"), TextBox)
            Dim txtnewdireccion As TextBox
            txtnewdireccion = CType(GridView1.FooterRow.FindControl("txtnewdireccion"), TextBox)
            Dim txtnewfono As TextBox
            txtnewfono = CType(GridView1.FooterRow.FindControl("txtnewfono"), TextBox)
            Dim cmbnewComuna As DropDownList
            cmbnewComuna = CType(GridView1.FooterRow.FindControl("cmbnewComuna"), DropDownList)
            Dim cmbnewPrevision As DropDownList
            cmbnewPrevision = CType(GridView1.FooterRow.FindControl("cmbnewPrevision"), DropDownList)
            Dim txtnewcorreo As TextBox
            txtnewcorreo = CType(GridView1.FooterRow.FindControl("txtnewcorreo"), TextBox)
            Dim cmbnewestado As DropDownList
            cmbnewestado = CType(GridView1.FooterRow.FindControl("cmbnewestado"), DropDownList)

            objpaciente = New ActualizarPacientesCls

            objpaciente.InsertPaciente(txtNewRut.Text, txtNewPaciente.Text, txtNewPaciente.Text, txtnewmaterno.Text, txtnewfecha.Text, txtnewdireccion.Text, txtnewfono.Text,
                cmbnewComuna.SelectedValue, cmbnewPrevision.SelectedValue, txtnewcorreo.Text, cmbnewestado.SelectedValue)
            FillPacienteInGrid(rut.Text)
        ElseIf e.CommandName.Equals("Delete") Then
            objpaciente = New ActualizarPacientesCls
            Dim index As Integer
            index = Convert.ToInt32(e.CommandArgument)
            objpaciente.DeletePaciente(Convert.ToInt32(GridView1.DataKeys(index).Values(0).ToString()))
            FillPacienteInGrid(rut.Text)
        End If

    End Sub

    'this is the edit mode event
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)

        Try
            If e.Row.RowType = DataControlRowType.DataRow Then
                'retain value of Genero in the combobox
                Dim cmbSexo As DropDownList
                cmbSexo = CType(e.Row.FindControl("cmbSexo"), DropDownList)
                If Not cmbSexo Is Nothing Then
                    cmbSexo.SelectedValue = GridView1.DataKeys(e.Row.RowIndex).Values(1).ToString()
                End If
            End If
        Catch ex As Exception
            Throw New Exception(ex.Message.ToString(), ex)
        End Try

    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs)

    End Sub

    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs)
        GridView1.Visible = True
        gridpacientes.Visible = False
        BTN_Imprimir.Visible = False
        GridView1.EditIndex = e.NewEditIndex
        FillPacienteInGrid(rut.Text)
    End Sub

    'get values when row is updating
    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs)


        If (GridView1.EditIndex <> -1) Then

            Dim txtrutpaciente As TextBox
            txtrutpaciente = CType(GridView1.Rows(e.RowIndex).FindControl("txtrutpaciente"), TextBox)
            Dim txtnompaciente As TextBox
            txtnompaciente = CType(GridView1.Rows(e.RowIndex).FindControl("txtnompaciente"), TextBox)
            Dim txtAppaciente As TextBox
            txtAppaciente = CType(GridView1.Rows(e.RowIndex).FindControl("txtAppaciente"), TextBox)
            Dim txtAmpaciente As TextBox
            txtAmpaciente = CType(GridView1.Rows(e.RowIndex).FindControl("txtAmpaciente"), TextBox)
            Dim txtfecha As TextBox
            txtfecha = CType(GridView1.Rows(e.RowIndex).FindControl("txtfecha"), TextBox)
            Dim txtdireccion As TextBox
            txtdireccion = CType(GridView1.Rows(e.RowIndex).FindControl("txtdireccion"), TextBox)
            Dim txtfono As TextBox
            txtfono = CType(GridView1.Rows(e.RowIndex).FindControl("txtfono"), TextBox)
            Dim cmbComuna As DropDownList
            cmbComuna = CType(GridView1.Rows(e.RowIndex).FindControl("cmbComuna"), DropDownList)
            Dim cmbPrevision As DropDownList
            cmbPrevision = CType(GridView1.Rows(e.RowIndex).FindControl("cmbPrevision"), DropDownList)
            Dim txtemail As TextBox
            txtemail = CType(GridView1.Rows(e.RowIndex).FindControl("txtemail"), TextBox)
            Dim cmbPEstado As DropDownList
            cmbPEstado = CType(GridView1.Rows(e.RowIndex).FindControl("cmbPEstado"), DropDownList)

            objpaciente = New ActualizarPacientesCls
            If txtfono.Text.Length > 9 Then
                MsgBox("Numero de Telefono debe de ser de hasta 9 Digitos")
            Else
                objpaciente.UpdatePaciente(txtrutpaciente.Text, txtnompaciente.Text, txtAppaciente.Text, txtAmpaciente.Text, txtfecha.Text, txtdireccion.Text, txtfono.Text, cmbComuna.SelectedValue,
            cmbPrevision.SelectedValue, txtemail.Text, cmbPEstado.SelectedValue, Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0).ToString()))
                GridView1.EditIndex = -1
                FillPacienteInGrid(rut.Text)
                Response.Write("<script>alert('Datos Actualizados de manera correcta');</script>")
                rut.Text = ""
                If cmbPEstado.SelectedValue = 2 Then
                    objpaciente.UpdatePerfil(txtrutpaciente.Text)
                    Response.Write("<script>alert('Usuario ya no tendra acceso al Sistema');</script>")
                ElseIf cmbPEstado.SelectedValue = 1 Then
                    objpaciente.CambiarPerfil(txtrutpaciente.Text)
                    Response.Write("<script>alert('Usuario ya tiene acceso al Sistema');</script>")
                End If
            End If
        End If

    End Sub

    'llamo a la funcion para llenar el grid

    Protected Sub BTN_ListadoPacientes_Click(sender As Object, e As EventArgs) Handles BTN_ListadoPacientes.Click
        GridView1.Visible = True
        gridpacientes.Visible = False
        BTN_Imprimir.Visible = False
        objpaciente = New ActualizarPacientesCls
        FillPacienteInGrid(rut.Text)

    End Sub
    Protected Sub Contador()
        Dim dtcontador As DataTable = New ActualizarPacientesCls().Contador()
        If dtcontador.Rows.Count() < 0 Then
            MsgBox("no hay datos")
        Else
            Session("Contador") = dtcontador(0).Item(0)
        End If
    End Sub



    Protected Sub BTN_Cancelar_Click(sender As Object, e As EventArgs) Handles BTN_Cancelar.Click
        GridView1.Visible = False
        gridpacientes.Visible = True
        BTN_Imprimir.Visible = True
        rut.Text = ""
        rut.Focus()
    End Sub

    Protected Sub gridpacientes_PageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gridpacientes.PageIndex = e.NewPageIndex
    End Sub

    'desde este punto empiezan las funciones para crear los archivos psf´s
    Public Overloads Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        'esta funcion es indispensable para que carguen correctamente los pdf's
    End Sub
    Protected Sub BTN_Imprimir_Click(sender As Object, e As EventArgs) Handles BTN_Imprimir.Click
        Response.ContentType = "aplication/pdf"
        Response.AddHeader("content-disposition", "attachment;filename=Pacientes.pdf")
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Dim sw = New StringWriter()
        Dim hw = New HtmlTextWriter(sw)
        Dim parrafo = New Paragraph("Listado de Pacientes Activos hasta la Fecha", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim parrafo1 = New Paragraph("Centro de Salud Concepcion", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 20, iTextSharp.text.Font.NORMAL))
        Dim parrafo2 = New Paragraph("Colo-Colo 379 - Of.513 - Fono: 41 2243882", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer = New Paragraph("Centro de Salud Concepcion", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))

        Dim parrafo3 = New Paragraph("Colo-Colo 379 - Of.513 - Fono: 41 2243882", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer1 = New Paragraph(Session("Nombre"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim footer2 = New Paragraph(Session("Rut"), FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        Dim Linea = New Paragraph("________________________________________________________________________________________________________________", FontFactory.GetFont(FontFactory.COURIER_BOLD, 8, iTextSharp.text.Font.NORMAL))
        Dim Contador = New Paragraph("El total de Pacientes Activos es de " & Session("Contador") & " Niños", FontFactory.GetFont(FontFactory.TIMES_ITALIC, 11, iTextSharp.text.Font.NORMAL))
        gridpacientes.RenderControl(hw)
        Dim sr = New StringReader(sw.ToString())
        Dim documentoPDF = New Document(PageSize.LETTER.Rotate)
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
        Contador.Alignment = 1
        documentoPDF.Add(parrafo1)
        documentoPDF.Add(parrafo2)
        documentoPDF.Add(parrafo)
        parrafo.SpacingAfter = 5
        documentoPDF.Add(Linea)
        documentoPDF.Add(Chunk.NEWLINE)
        documentoPDF.Add(Contador)
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
        gridpacientes.AllowPaging = True
        gridpacientes.DataBind()

    End Sub



End Class