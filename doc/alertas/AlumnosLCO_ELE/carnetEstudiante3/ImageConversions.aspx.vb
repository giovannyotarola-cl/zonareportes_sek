Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.IO
Imports System.Data.SqlClient
Imports System.Drawing.Imaging

Public Class ImageConversions
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CreatePhoto()
    End Sub

    Protected Sub CreatePhoto()

        Try
            'Get the image from flash file
            Dim strPhoto As String = Request.Form("imageData")

            'Convertir la imagen en formato imagen
            Dim photo As Byte() = Convert.FromBase64String(strPhoto)
            Dim file_foto As String = TimeOfDay.Ticks.ToString
            Dim fs As FileStream = New FileStream("C:\\Temp\\" + file_foto + ".bmp", FileMode.OpenOrCreate, FileAccess.Write)
            Dim bw As BinaryWriter = New BinaryWriter(fs)

            bw.Write(photo)
            bw.Flush()
            bw.Close()
            fs.Close()

            'Obtener la imagen transformada
            Dim image1 As System.Drawing.Image = System.Drawing.Image.FromFile("C:\\Temp\\" + file_foto + ".bmp")

            'Clonar imagen y cambiar el tamaño
            Dim foto_guardar As New System.Drawing.Bitmap(image1, 100, 150)
            store_pic_Sql(foto_guardar)

        Catch e As Exception

        End Try

    End Sub

    Private Sub store_pic_Sql(ByVal img As System.Drawing.Image)

        Dim alumno As String = Session("alumno")
        Dim ds As New DataSet
        Dim da As New SqlDataAdapter
        Dim sqlInsertar As String

        'Lee el identificador de alumno de la BBDD
        'Dim alumno As String = My.Application.CommandLineArgs(0)

        'Conexión
        Dim conn As SqlConnection = New SqlConnection()
        conn.ConnectionString = "Data Source=192.168.100.226;Initial Catalog=Matricula;Persist Security Info=True;User ID=sa;Password=Sa070507"

        'Comprobar si el alumno está en la tabla de fotos o no para hacer insert o update
        Dim sqlCheck As String = "select CODCLI from dbo.[Foto_Alumno] where CODCLI = '" + alumno + "'"
        da = New SqlDataAdapter(sqlCheck, conn)
        da.Fill(ds)

        If ds.Tables(0).Rows.Count > 0 Then
            sqlInsertar = "update dbo.[Foto_Alumno] set FOTO = @imgData where CODCLI = '" + alumno + "'"
        Else
            sqlInsertar = "insert dbo.[Foto_Alumno] (CODCLI, FOTO) values ('" + alumno + "', @imgData)"
        End If
        'System.Diagnostics.Debug.WriteLine(sqlInsertar)

        'Ejecutar comando de inserción o actualización
        Dim command1 As SqlCommand = New SqlCommand(sqlInsertar, conn)

        Dim sqlpara As New SqlParameter("imgData", SqlDbType.Image)
        Dim mStream As MemoryStream = New MemoryStream()

        img.Save(mStream, ImageFormat.Bmp)
        sqlpara.SqlValue = mStream.GetBuffer

        command1.Parameters.Add(sqlpara)
        conn.Open()
        command1.ExecuteNonQuery()
        conn.Close()
    End Sub


End Class
