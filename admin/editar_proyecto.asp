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
                <li><a href="acceso.asp?a=contactos">Soporte</a></li>
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
				
				Set cnIndex = Server.CreateObject("ADODB.Connection")
				cnIndex.Open Conect
				
				sqlInsert= "UPDATE IF_ACCESOS_DESC SET ENLACE = '"&Request.Form("enlace")&"', LINKDESC = '"&Request.Form("descripcion")&"' WHERE CODLINK = '"&Session("codlink")&"'"
				cnIndex.Execute sqlInsert
				%>
			<p>Proyecto <b>"<%= Session("codlink") %>"</b> modificado.</p><br>
			<p><a href="acceso.asp?a=admin_proyecto">Volver</a></p>
      	</div>
    </div>
</div>
