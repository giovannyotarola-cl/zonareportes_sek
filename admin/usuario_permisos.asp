<!-- #include virtual="include/config.asp" -->
<%
	Dim userid
	userid = Request.QueryString ("userid")
	
	Dim cnIndex, rsUsuario, rsPestanas, rsPermisos, rsInformes, rsPermisosInformes
								
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	cnIndex.Open Conect

	Set rsUsuario = Server.CreateObject ("ADODB.Recordset")
	Set rsPestanas = Server.CreateObject("ADODB.Recordset")
	Set rsPermisos = Server.CreateObject("ADODB.Recordset")
	Set rsInformes = Server.CreateObject("ADODB.Recordset")
	Set rsPermisosInformes = Server.CreateObject("ADODB.Recordset")

	rsUsuario.Open "select * from IF_USUARIO_INFORMES where USERID ="&userid, cnIndex
	rsPestanas.Open "select * from IF_ACCESOS_TABS", cnIndex
	rsPermisos.Open "select * from IF_USUARIO_TABS where USERID ="&userid, cnIndex
	rsInformes.Open "select * from IF_ACCESOS_DESC order by enlace", cnIndex
	rsPermisosInformes.Open "select * from IF_USUARIO_ACCESO where USERID ="&userid, cnIndex
	
%>
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
                <li><a href="acceso.asp?a=contactos">Contactos</a></li>
                <li><a href="logout.asp">Salir</a></li>
            </ul>
        </div>
    </div> 
    <div class="content-box column-right main">
        <div class="content-box-header">
            <h3>Modificar permisos del usuario <b><%= rsUsuario("USERNAME") %></b></h3>
        </div>
        <div class="descripcion">
            <br />
            <h2>Permisos sobre pesta&ntilde;as</h2>
            <br />
           	<form method="post" action="acceso.asp?a=modificar_permisos">
            <% 	rsPestanas.MoveFirst
				while not rsPestanas.EOF
					
					if (rsPermisos.BOF = True) OR (rsPermisos.EOF = True) Then
						
					else
						rsPermisos.MoveFirst
					end if
					rsPermisos.Find "TABSID="&rsPestanas("TABSID"), 0, 1, 1
					
					if (rsPermisos.BOF = True) OR (rsPermisos.EOF = True) Then
						response.Write("<input class='input_permisos' type='checkbox' name='tabs' value="&rsPestanas("TABSID")&">"&rsPestanas("TABSNAME")&"<br>")
					else
						response.Write("<input class='input_permisos' type='checkbox' name='tabs' checked ='checked' value="&rsPestanas("TABSID")&">"&rsPestanas("TABSNAME")&"<br>")
					end if
					
					rsPestanas.MoveNext
				wend
            %>
            	<input type="hidden" name= "userid" value=<%= userid %> />
	            <input type="submit" value="Actualizar permisos" />
            </form>
            
            <br /><br /><br />
            <h2>Permisos sobre informes</h2>
            <br />
           	<form method="post" action="acceso.asp?a=modificar_permisos_informes">
            <% 	rsInformes.MoveFirst
				while not rsInformes.EOF
					
					if (rsPermisosInformes.BOF = True) OR (rsPermisosInformes.EOF = True) Then
						
					else
						rsPermisosInformes.MoveFirst
					end if
					rsPermisosInformes.Find "CODLINK='"&rsInformes("CODLINK")&"'", 0, 1, 1
					response.Write("<div class = 'check_informe'>")
					if (rsPermisosInformes.BOF = True) OR (rsPermisosInformes.EOF = True) Then
						response.Write("<input class='input_permisos' type='checkbox' name='informes' value='"&rsInformes("CODLINK")&"'>"&rsInformes("ENLACE")&"<br>")
					else
						response.Write("<input class='input_permisos' type='checkbox' name='informes' checked ='checked' value='"&rsInformes("CODLINK")&"'>"&rsInformes("ENLACE")&"<br>")
					end if
					response.Write("</div>")

					rsInformes.MoveNext
				wend
            %>
            	<input type="hidden" name= "userid" value=<%= userid %> />
				<div class="clear_both"></div>
	            <input type="submit" value="Actualizar permisos" />
            </form>
            <br /><br />
            <a href="acceso.asp?a=admin_usuarios">Volver</a>
      	</div>
    </div>
</div>