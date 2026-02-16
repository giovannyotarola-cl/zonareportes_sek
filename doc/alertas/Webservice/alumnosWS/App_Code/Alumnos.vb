Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports System.Data.SqlClient


' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class Alumnos
     Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function HelloWorld() As String
        Return "Hola a todos"
    End Function

    <WebMethod()> _
    Public Function Alumnos() As DataSet
        Dim con As SqlConnection = New SqlConnection
        con.ConnectionString = "server='192.168.100.226'; user id='matricula'; password='dtb01s'; database='MatriculaPruebaChile'"
        Dim da As SqlDataAdapter = New SqlDataAdapter("SELECT CODCLI AS [Código Cliente], DIG as Dv, PATERNO As [Ap. Paterno], MATERNO as [Ap. Materno], NOMBRE as Nombre, SEXO as Genero, NACIONALIDAD As Nacionalidad, FECNAC as [Fec. Nacimiento] FROM MT_CLIENT WHERE ANO = 2013", con)
        Dim ds As DataSet = New DataSet
        da.Fill(ds)
        Return ds
    End Function

End Class