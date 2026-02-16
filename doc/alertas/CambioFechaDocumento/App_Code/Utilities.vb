Imports Microsoft.VisualBasic
Imports System.Web.UI
Imports System
Imports System.Data
Imports System.Data.SqlClient

Public Class Utilities
    Public Shared Sub CreateMessageAlert(ByRef aspxPage As System.Web.UI.Page, ByVal strMessage As String, ByVal strKey As String)
        Dim strScript As String = "<script language=JavaScript>alert('" & strMessage & "')</script>"

        If (Not aspxPage.ClientScript.IsStartupScriptRegistered(strKey)) Then
            aspxPage.ClientScript.RegisterStartupScript(aspxPage.GetType, strKey, strScript)
        End If
    End Sub

    Public Shared Sub CreateConfirmBox(ByRef btn As WebControls.Button, ByVal strMessage As String)

        'MODO DE USAR
        'Utilities.CreateConfirmBox(Me.BtnDeleteUtil, "Are you sure you want to delete (this uses the Utilities Class)?")
        btn.Attributes.Add("onclick", "return confirm('" & strMessage & "');")
    End Sub

    Public Shared Function validarRut(ByVal Rut As String) As Boolean
        Dim rutLimpio As String
        Dim digitoVerificador As String
        Dim suma As Integer
        Dim contador As Integer = 2
        Dim valida As Boolean = True

        validarRut = False

        rutLimpio = Rut.Replace(".", "")
        rutLimpio = rutLimpio.Replace("-", "")
        rutLimpio = rutLimpio.Replace(" ", "")
        rutLimpio = rutLimpio.Substring(0, rutLimpio.Length - 1)
        digitoVerificador = Rut.Substring(Rut.Length - 1, 1)

        Dim i As Integer
        For i = rutLimpio.Length - 1 To 0 Step -1
            If contador > 7 Then
                contador = 2
            End If

            Try
                suma += Integer.Parse(rutLimpio(i).ToString()) * contador
                contador += 1
            Catch ex As Exception
                valida = False
            End Try
        Next

        If valida Then
            Dim dv As Integer = 11 - (suma Mod 11)
            Dim DigVer As String = dv.ToString()

            If DigVer = "10″ Then" Then
                DigVer = "K"
            End If

            If DigVer = "11″ Then" Then
                DigVer = "0″"
            End If

            If DigVer = digitoVerificador.ToUpper Then
                validarRut = True
            Else
                validarRut = False
            End If
        End If
    End Function

    Public Shared Function devMES(ByVal mes As Integer) As String
        devMES = ""
        If System.Web.HttpContext.Current.Session("idioma") = "es" Then
            Select Case mes
                Case 1 : devMES = ("ENERO")
                Case 2 : devMES = ("FEBRERO")
                Case 3 : devMES = ("MARZO")
                Case 4 : devMES = ("ABRIL")
                Case 5 : devMES = ("MAYO")
                Case 6 : devMES = ("JUNIO")
                Case 7 : devMES = ("JULIO")
                Case 8 : devMES = ("AGOSTO")
                Case 9 : devMES = ("SEPTIEMBRE")
                Case 10 : devMES = ("OCTUBRE")
                Case 11 : devMES = ("NOVIEMBRE")
                Case 12 : devMES = ("DICIEMBRE")
                Case Else
                    devMES = ("ENERO")
            End Select
        ElseIf System.Web.HttpContext.Current.Session("idioma") = "en" Then
            Select Case mes
                Case 1 : devMES = ("JANUARY")
                Case 2 : devMES = ("FEBRUARY")
                Case 3 : devMES = ("MARCH")
                Case 4 : devMES = ("APRIL")
                Case 5 : devMES = ("MAY")
                Case 6 : devMES = ("JUNE")
                Case 7 : devMES = ("JULY")
                Case 8 : devMES = ("AUGUST")
                Case 9 : devMES = ("SEPTEMBER")
                Case 10 : devMES = ("OCTOBER")
                Case 11 : devMES = ("NOVEMBER")
                Case 12 : devMES = ("DECEMBER")
                Case Else
                    devMES = ("JANUARY")
            End Select
        End If
    End Function

    Public Shared Function eliminaBasura(ByVal Texto As String) As String
        Dim NuevoStr As String
        Dim i As Integer

        Dim Eliminar As String() = New String() {"select", "drop", ";", "delete", "insert", "update", "xp_"}
        NuevoStr = Texto

        For i = 1 To UBound(Eliminar)
            NuevoStr = Replace(NuevoStr, Eliminar(i), "")
        Next

        NuevoStr = Replace(NuevoStr, "'", "´")
        NuevoStr = Replace(NuevoStr, "select", "")
        NuevoStr = Replace(NuevoStr, "drop", "")
        NuevoStr = Replace(NuevoStr, ";", "")
        NuevoStr = Replace(NuevoStr, "delete", "")
        NuevoStr = Replace(NuevoStr, "insert", "")
        NuevoStr = Replace(NuevoStr, "update", "")
        NuevoStr = Replace(NuevoStr, "xp_", "")

        Return "" + NuevoStr
    End Function

   
End Class
