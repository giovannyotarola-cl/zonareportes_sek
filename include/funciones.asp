<%
'Devuelve 1 si la cadena pasada como parametro es nula o vacía y 0 en caso contrario
Function valorNulo (cadena)
	If (IsNull(cadena) OR IsEmpty(cadena) OR cadena = "") Then
		valorNulo = 1
	Else
		valorNulo = 0
	End If
End Function
'Si el primer parámetro es nulo o vacio devuelve el contenido del segundo parámetro
'Si el primer parámetro NO es nulo o vacio devuelve este primer parámetro
Function CambiarValorNulo (Texto, Cambio)
	If (IsNull(Texto) OR IsEmpty(Texto) OR Texto = "") Then
		CambiarValorNulo = Cambio
	Else
	 If asc(Texto) = 13 Then
	  CambiarValorNulo = Cambio
	 Else
		 CambiarValorNulo = Texto
		End If
	End If
End Function
'Comprobar si los archivos existen en el servidor
Function IsFileExists(byVal FileName)

 If FileName = ""  Then
  IsFileExists = False
  Exit Function
 End If
 
 Dim objFSO
    
 Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
    
 If (objFSO.FileExists( FileName ) = True)  Then
  IsFileExists = True
 Else
  IsFileExists = False
 End If
  
 Set objFSO = Nothing   
End Function
%>