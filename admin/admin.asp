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
            <h3>Panel de administraci&oacute;n</h3>
        </div>
        <div class="content-box-content">
            <div class="descripcion">
                <div class="campo-informe"><strong><b>Usuarios</b></strong></div>
                <ul class="lista_admin">
                    <li class="lista_admin_elem"><a href="acceso.asp?a=nuevo_usuario">Nuevo usuario</a></li>
                    <li class="lista_admin_elem"><a href="acceso.asp?a=admin_usuarios">Administración de usuarios</a></li>
                </ul>
            </div>
            
            <div class="descripcion">
                <div class="campo-informe"><strong><b>Pestañas</b></strong></div>
                <ul class="lista_admin">
                    <li class="lista_admin_elem" style="color:#333">Administración de pestaña</li>
                    <li class="lista_admin_elem"><a href="acceso.asp?a=nueva_pestana">Nueva pestaña</a></li>
                </ul>
            </div>
            
            <div class="descripcion">
                <div class="campo-informe"><strong><b>Reportes</b></strong></div>
                <ul class="lista_admin">
                    <li class="lista_admin_elem"><a href="acceso.asp?a=admin_proyecto">Administración de reportes</a></li>
                    <li class="lista_admin_elem"><a href="acceso.asp?a=nuevo_proyecto">Nuevo reporte</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>