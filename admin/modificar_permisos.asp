<!-- #include virtual="include/config.asp" -->
<%
	Dim userid, i, numeroTabs
	userid = Request.Form("userid")
	
	Dim cnIndex, rsUsuario, rsPestanas, rsPermisos, rsContador, permisosForm, sqlDelete, sqlInsert
								
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	cnIndex.Open Conect

	Set rsPermisos = Server.CreateObject("ADODB.Recordset")
	Set rsContador = Server.CreateObject("ADODB.Recordset")

	rsPermisos.Open "select * from IF_USUARIO_TABS where USERID ="&userid, cnIndex
	rsContador.Open "select count(*) from IF_ACCESOS_TABS", cnIndex
	
	permisosForm = Request.Form("tabs")
	permisosForm = Split(permisosForm, ",")
	
	'Array con una celda por cada pestaña, para mapear los permisos (1 o 0)
	Dim arrayPermisos()
	ReDim arrayPermisos(rsContador.Fields(0))
	'Poblar el array con 0
	For i=0 to Ubound(arrayPermisos)
		arrayPermisos(i) = 0
	Next
		
	'Obtener array con los permisos marcados en el form	
	permisosForm = Request.Form("tabs")
	permisosForm = Split(permisosForm, ",")
	
	'Marcar en el array de permisos aquellos que se pusieron a 1
	For i=0 to Ubound(permisosForm)
		arrayPermisos(permisosForm(i)-1) = 1
	Next
		
	For i = 0 to Ubound(arrayPermisos)
	
		if arrayPermisos(i) = 0 then
		
			'Poner el rs en la posición inicial, se hace esto para que no dé
			'error si el rs no tiene registros.
			if  (rsPermisos.BOF = True) OR (rsPermisos.EOF = True) then
			else
				rsPermisos.MoveFirst
			end if
			
			rsPermisos.Find "TABSID="&(i+1), 0, 1, 1	
			
			if  (rsPermisos.BOF = True) OR (rsPermisos.EOF = True) then
				'No hacemos nada porque no se ha marcado el darle
				'permiso y no tiene permisos
			else
				'Hay que borrar el permiso existente
				sqlDelete = "DELETE FROM IF_USUARIO_TABS where USERID="&userid&" AND TABSID="&i+1
				cnIndex.Execute sqlDelete	
			end if
		
		else 'arrayPermisos(i) = 1
		
			'Poner el rs en la posición inicial, se hace esto para que no dé
			'error si el rs no tiene registros.
			if  (rsPermisos.BOF = True) OR (rsPermisos.EOF = True) then
			else
				rsPermisos.MoveFirst
			end if
			'Buscar en el recordSet	
			rsPermisos.Find "TABSID="&(i+1), 0, 1, 1	
			
			if  (rsPermisos.BOF = True) OR (rsPermisos.EOF = True) then
				sqlInsert = "INSERT INTO IF_USUARIO_TABS (USERID, TABSID) values ("&userid&", "&(i+1)&");"
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