<!-- #include virtual="include/config.asp" -->
</div>
<div id="content">
	<h2><img src="images/icons/tools_32.png" alt="Manage Users" /><%=Session("nombreusuario")%></h2>
    <div class="content-box column-left sidebar">
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
				Dim cnIndex, sqlUpdate
				
				sqlUpdate = "UPDATE IF_USUARIO_INFORMES SET USERNAME ='"&Request.Form("usuario")&"', USERPASS='"&Request.Form("contrasena")&"', USERDES='"&Request.Form("descripcion")&"', USERCARR='"&Request.Form("carrera")&"', EMAIL='"&Request.Form("email")&"' WHERE USERID="&Request.Form("userid") 

				Set cnIndex = Server.CreateObject("ADODB.Connection")
				cnIndex.Open Conect

				cnIndex.Execute sqlUpdate
				cnIndex.Close
				set cnIndex = Nothing
			%>
        	<p><b>Usuario modificado</b></p><br>
            <p>Nombre: <%= Request.Form("usuario") %></p>
            <p>Pass: <%= Request.Form("contrasena") %></p>
            <p>Descripción: <%= Request.Form("descripcion") %></p>
            <p>Carrera: <%= Request.Form("carrera") %></p>
            <p>E-mail: <%= Request.Form("email") %></p>
            <p><br /><a href="acceso.asp?a=admin">Volver</a></p>
      	</div>
    </div>
</div>