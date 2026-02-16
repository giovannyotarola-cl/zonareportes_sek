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
            <h3>Añadir pestaña</h3>
        </div>
        <div class="descripcion">
        	<form method="post" action="acceso.asp?a=crear_pestana">
            	<div class = "nuevo_usuario_bloque">
                	Nombre: <input type="text" name="nombrePestana" class="nuevo_usuario_input">
                </div>
                <div class = "nuevo_usuario_bloque">
	                <input type="submit" value="Crear pestaña">
                </div>
            </form>
            <div class = "nuevo_usuario_bloque">
	            <a href="acceso.asp?a=admin">Volver</a>
                <br /><br />
           	</div>
      	</div>
    </div>
</div>
