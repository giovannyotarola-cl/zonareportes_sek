<!-- #include virtual="include/config.asp" -->
<%
	Dim userid
	userid = Request.QueryString ("userid")
	
	Dim cnIndex, rsUsuario, rsPestanas, rsPermisos
								
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	cnIndex.Open Conect

	Set rsUsuario = Server.CreateObject ("ADODB.Recordset")

	rsUsuario.Open "select * from IF_USUARIO_INFORMES where USERID ="&userid, cnIndex
%>
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
            <h3>Modificar información del usuario <b><%= rsUsuario("USERNAME") %></b></h3>
        </div>
        <div class="descripcion">         
            <form method="post" action="acceso.asp?a=modificar">
                <div class = "editar_usuario_bloque">
                	Usuario:<input type="text" name="usuario" value='<%=rsUsuario("USERNAME")%>' class="editar_usuario_input">
                </div>
                <div class = "editar_usuario_bloque">
                	Contraseña: <input type="text" name="contrasena" value='<%=rsUsuario("USERPASS")%>' class="editar_usuario_input">
                </div>
                <div class = "editar_usuario_bloque">
                	Descripción: <input type="text" name="descripcion" value='<%=rsUsuario("USERDES")%>' class="editar_usuario_input">
                </div>
                <div class = "editar_usuario_bloque">
                	Carrera: <input type="text" name="carrera" value='<%=rsUsuario("USERCARR")%>' class="editar_usuario_input">
                </div>
                <div class = "editar_usuario_bloque">
                	E-mail: <input type="text" name="email" value='<%=rsUsuario("EMAIL")%>' class="editar_usuario_input">
                			<input type="hidden" name="userid" value='<%=rsUsuario("USERID") %>'>
                </div>
                <div class = "editar_usuario_bloque">
                	<input type="submit" value="Actualizar usuario">
                </div>
              </form>
              <div class = "editar_usuario_bloque">
              	<a href="acceso.asp?a=admin_usuarios">Volver</a>
                <br /><br />
              </div>
      	</div>
    </div>
</div>