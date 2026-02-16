<!-- #include virtual="/include/config.asp" -->
<%
	Function generaCodLink(numero)
		if numero < 10 then
			generaCodLink = "EN000"&CStr(numero)
		else if numero < 100 then
				generaCodLink = "EN00"&CStr(numero)
			else if numero < 1000 then
					generaCodLink = "EN0"&CStr(numero)
				else
					generaCodLink = "EN"&CStr(numero)
				end if
			end if
		end if

	End Function
    
	Function codLinkToInt(codlink)
		Dim recorte
		recorte = ""
		recorte = mid(trim(codlink), 3)
		codLinkToInt = CInt(recorte)
	End Function
	
	Dim userid, i, numeroInformes
	userid = Request.Form("userid")
	
	Dim cnIndex, rsUsuario, rsInformes, rsPermisosInformes, rsContador, permisosForm, sqlDelete, sqlInsert
								
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	cnIndex.Open Conect

	Set rsPermisosInformes = Server.CreateObject("ADODB.Recordset")
	Set rsContador = Server.CreateObject("ADODB.Recordset")

	rsPermisosInformes.Open "select * from IF_USUARIO_ACCESO where USERID ="&userid, cnIndex
	rsContador.Open "select count(*) from IF_ACCESOS_DESC", cnIndex
	
	permisosForm = Request.Form("informes")
	permisosForm = Split(permisosForm, ",")
	
	'Array con una celda por cada pestaña, para mapear los permisos (1 o 0)
	Dim arrayPermisos()
	ReDim arrayPermisos(rsContador.Fields(0))
	'Poblar el array con 0
	For i=0 to Ubound(arrayPermisos)
		arrayPermisos(i) = 0
	Next
		
	'Obtener array con los permisos marcados en el form	
	permisosForm = Request.Form("informes")
	permisosForm = Split(permisosForm, ",")
	
	'Marcar en el array de permisos aquellos que se pusieron a 1
	For i=0 to (Ubound(permisosForm))
		arrayPermisos(codLinkToInt(permisosForm(i))-1) = 1
	Next
		
	For i = 0 to Ubound(arrayPermisos)
	
		if arrayPermisos(i) = 0 then
		
			'Poner el rs en la posición inicial, se hace esto para que no dé
			'error si el rs no tiene registros.
			if  (rsPermisosInformes.BOF = True) OR (rsPermisosInformes.EOF = True) then
			else
				rsPermisosInformes.MoveFirst
			end if
		
			rsPermisosInformes.Find "CODLINK='"&generaCodLink(i+1)&"'", 0, 1, 1	
			
			if  (rsPermisosInformes.BOF = True) OR (rsPermisosInformes.EOF = True) then
				'No hacemos nada porque no se ha marcado el darle
				'permiso y no tiene permisos
			else
				'Hay que borrar el permiso existente
				sqlDelete = "DELETE FROM IF_USUARIO_ACCESO where USERID='"&userid&"' AND CODLINK='"&generaCodLink(i+1)&"';"
				cnIndex.Execute sqlDelete	
			end if
		
		else 'arrayPermisos(i) = 1
		
			'Poner el rs en la posición inicial, se hace esto para que no dé
			'error si el rs no tiene registros.
			if  (rsPermisosInformes.BOF = True) OR (rsPermisosInformes.EOF = True) then
			else
				rsPermisosInformes.MoveFirst
			end if
			'Buscar en el recordSet	
			rsPermisosInformes.Find "CODLINK='"&generaCodLink(i+1)&"'", 0, 1, 1	
			
			if  (rsPermisosInformes.BOF = True) OR (rsPermisosInformes.EOF = True) then
				sqlInsert = "INSERT INTO IF_USUARIO_ACCESO (USERID, CODLINK) values ('"&userid&"', '"&generaCodLink(i+1)&"');"
				'Response.Write(sqlInsert)
				cnIndex.Execute sqlInsert
			else
				'No hacemos nada porque tiene permisos y 
				'en el form se ha marcado que lo tenga
			end if
		end if
	Next
	
	'Cuando termina volvemos a la zona de administración
	response.Redirect("acceso.asp?a=admin_usuarios")
%>