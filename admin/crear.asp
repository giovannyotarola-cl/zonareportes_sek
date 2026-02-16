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
                <li><a href="acceso.asp?a=contactos">Contactos</a></li>
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
				Dim cnIndex, sqlInsert
				
				sqlInsert = "insert into IF_USUARIO_INFORMES (USERNAME, USERPASS, USERDES, USERCARR, EMAIL) values ('"&Request.Form("usuario")&"', '"&Request.Form("contrasena")&"', '"&Request.Form("descripcion")&"', '"&Request.Form("carrera")&"', '"&Request.Form("email")&"');"
				Set cnIndex = Server.CreateObject("ADODB.Connection")
				cnIndex.Open Conect
				'response.Write(sqlInsert)

				cnIndex.Execute sqlInsert
				cnIndex.Close
				set cnIndex = Nothing
			%>
        	<p><b>Usuario creado</b></p><br>
            <p>Nombre: <%= Request.Form("usuario") %></p>
            <p>Pass: <%= Request.Form("contrasena") %></p>
            <p>Descripción: <%= Request.Form("descripcion") %></p>
            <p>Carrera: <%= Request.Form("carrera") %></p>
            <p>E-mail: <%= Request.Form("email") %></p>
            <p><a href="acceso.asp?a=admin">Volver</a></p>
      	</div>
    </div>
</div>