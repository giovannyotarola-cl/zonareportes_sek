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
            <h3>Creación de usuarios</h3>
            <br />
        </div>
            <div class="descripcion">
              <form method="post" action="acceso.asp?a=crear">
                <div class = "nuevo_usuario_bloque">
                	Usuario: <input type="text" name="usuario" class = "nuevo_usuario_input">
                </div>
                <div class="nuevo_usuario_bloque">
                	Contraseña: <input type="text" name="contrasena" class = "nuevo_usuario_input">
                </div>
                <div class = "nuevo_usuario_bloque">
                	Descripción: <input type="text" name="descripcion" class = "nuevo_usuario_input">
                </div>
                 <div class = "nuevo_usuario_bloque">
                	Carrera: <input type="text" name="carrera" class = "nuevo_usuario_input">
                </div>
                 <div class = "nuevo_usuario_bloque">
                	Email: <input type="text" name="email" class = "nuevo_usuario_input">
                </div>
                <div class = "nuevo_usuario_bloque">
                	<input type="submit" value="Crear usuario">
                </div>
              </form>
			  <div class = "nuevo_usuario_bloque">
	              <a href="acceso.asp?a=admin">Volver</a>
	              <br /><br />
              </div>

      		</div>
    </div>
</div>
