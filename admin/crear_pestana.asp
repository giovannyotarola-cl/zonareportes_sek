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
				
				sqlInsert = "insert into IF_ACCESOS_TABS (TABSNAME) values ('"&Request.Form("nombrePestana")&"')"
				Set cnIndex = Server.CreateObject("ADODB.Connection")
				cnIndex.Open Conect

				cnIndex.Execute sqlInsert
				cnIndex.Close
				set cnIndex = Nothing
			%>
        	<p>Pestaña <b>"<%= Request.Form("nombrePestana") %>"</b> creada.</p><br>
            <p><a href="../zonareportes/acceso.asp?a=admin">Volver</a></p>
      	</div>
    </div>
</div>