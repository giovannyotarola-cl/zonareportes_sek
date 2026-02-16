<!-- #include virtual="include/config.asp" -->
</div>
<div id="content">
	<h2><img src="images/icons/tools_32.png" alt="Manage Users" /><%=Session("nombreusuario")%></h2>
    <div class="content-box column-left sidebar"><!-- use the class .sidebar in combination with .column-left to create a sidebar --><!-- using .closed makes sure the content box is closed by default -->
        <div class="content-box-header">
            <h3><%=Session("nombreusuario")%></h3>
        </div>
        
        <div class="content-box-content">
            <ul>
                <li><a href="acceso.asp?a=admin">Admin</a></li>
                <li><a href="acceso.asp?a=informes">Reportes</a></li>
                <li><a href="acceso.asp?a=contactos">Soporte</a></li>
                <li><a href="logout.asp">Salir</a></li>
            </ul>
        </div>
    </div> 
    <div class="content-box column-right main">
        <div class="content-box-header">
            <h3>Datos recibidos</h3>
        </div>
        <div class="descripcion">
        	<% 	
				Dim cnIndex, sqlInsert, sqlCodLink, rsCodLink
				
				Set cnIndex = Server.CreateObject("ADODB.Connection")
				Set rsCodLink = Server.CreateObject ("ADODB.Recordset")
				cnIndex.Open Conect
				
				rsCodLink.Open "SELECT * FROM IF_ACCESOS_DESC WHERE CODLINK = '"&Request.Form("codigo")&"'", cnIndex
				' Verificar que el proyecto no exista
				' Si existe envia un mensaje de error
				If (rsCodLink.Eof = False) Then
					cnIndex.close
					Set cnIndex = Nothing
					%>
						<p>Error al crear el proyecto <b>"<%= Request.Form("link") %>"</b>, el c&oacute;digo de proyecto <b>"<%= Request.Form("codigo") %>"</b> ya existe.</p><br>
					<%	' Si no existe el nuevo proyecto es almacenado
				Else
					sqlInsert = "INSERT INTO IF_ACCESOS_DESC (CODLINK,PROYECTO,LINK,ENLACE,LINKDESC,EXTENCION,ORDEN) values ('"&Request.Form("codigo")&"','"&Request.Form("directorio")&"','"&Request.Form("link")&"','"&Request.Form("enlace")&"','"&Request.Form("descripcion")&"','"&Request.Form("extencion")&"',NULL)"
					'response.Write(sqlInsert)
					cnIndex.Execute sqlInsert
					
					sqlInserTabs = "INSERT INTO IF_INFORME_TABS (CODLINK,TABSID) VALUES('"&Request.Form("codigo")&"','"&Request.Form("pestania")&"')"
					'response.write(sqlInserTabs)
					cnIndex.Execute sqlInserTabs
					
					cnIndex.Close
					set cnIndex = Nothing
					%>
						<p>Proyecto <b>"<%= Request.Form("link") %>"</b> creado.</p><br>
					<%
				End If
			%>
            <p><a href="acceso.asp?a=nuevo_proyecto">Volver</a></p>
      	</div>
    </div>
</div>