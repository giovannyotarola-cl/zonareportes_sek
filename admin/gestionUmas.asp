</div>

<div id="content">
	<h2><img src="images/icons/tools_32.png" alt="Manage Users" /><%=Session("nombreusuario")%></h2>
    <div class="content-box column-left sidebar"><!-- use the class .sidebar in combination with .column-left to create a sidebar --><!-- using .closed makes sure the content box is closed by default -->
        <div class="content-box-header">
            <h3><%=Session("nombreusuario")%></h3>
        </div>
        
        <div class="content-box-content">
            <ul>
                <li><a href="acceso.asp?a=informes">Reportes</a></li>
                <li><a href="acceso.asp?a=contactos">Soporte</a></li>
                <li><a href="logout.asp">Salir</a></li>
            </ul>
        </div>
    </div> 
    <div class="content-box column-right main">
        <div class="content-box-header">
            <h3>Panel de administraci&oacute;n U+</h3>
        </div>
        <div class="content-box-content">
            <div class="descripcion">
                <div class="campo-informe"><b>Modificación de datos</b></div>
                <ul class="lista_admin">
                    <li class="lista_admin_elem"><a href="acceso.asp?a=cambio_anyo">Cambio de año en postulación</a></li>
                    <li class="lista_admin_elem"><a href="acceso.asp?a=cambio_carrera">Cambio de carrera</a></li>
                    <li class="lista_admin_elem"><a href="acceso.asp?a=cambio_rut">Cambio de RUT de alumno</a></li>
                    <li class="lista_admin_elem"><a href="acceso.asp?a=modificar_eliminado">Alumno eliminado</a></li>
                    <li class="lista_admin_elem"><a href="acceso.asp?a=eliminar_posben">Eliminar registro mt_posben</a></li>
                </ul>
            </div>
            
            <div class="descripcion">
                <div class="campo-informe"><strong><b>Listados</b></strong></div>
                <ul class="lista_admin">
                    <li class="lista_admin_elem"><a href="acceso.asp?a=mostrar_avalistas">Mostrar avalistas</a></li>
                    <li class="lista_admin_elem"><a href="acceso.asp?a=ver_libro_ventas">Verificar libro de ventas</a></li>
                </ul>
            </div>
            <div class="descripcion"> </div>
        </div>
    </div>
</div>