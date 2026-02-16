<!-- #include virtual="include/config.asp" -->
<% 	
	Dim cnIndex, rsInforme
								
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	cnIndex.Open Conect

	Set rsInforme = Server.CreateObject ("ADODB.Recordset")
	rsInforme.Open "select * from IF_ACCESOS_DESC WHERE CODLINK = '"&Request("codlink")&"'", cnIndex
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
                <li><a href="acceso.asp?a=contactos">Soporte</a></li>
                <li><a href="logout.asp">Salir</a></li>
            </ul>
        </div>
    </div> 
    <div class="content-box column-right main">
        <div class="content-box-header">
            <h3>Administración de proyectos</h3>
        </div>
        <div class="content-box-content">
            <div class="descripcion">
                <form method="post" action="acceso.asp?a=elimina_proyecto">
                    <p>&iquest;Esta seguro de eliminar el informe <b>"<%=rsInforme("ENLACE")%>"</b>?</p>
                <div>
                    <input type="submit" value="Eliminar">
                </div>
                </form>
                <br /><br />
            	<a href="acceso.asp?a=admin">Volver</a>
      		</div>
        </div>
    </div>
</div>