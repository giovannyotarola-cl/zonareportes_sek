<!-- #include virtual="include/config.asp" -->
<%
' #include virtual="include/config.asp" -->

Dim cnIndex, sqlReporte, rsReporte, codLink

codLink = Request.QueryString("codlink")
Set cnIndex = Server.CreateObject("ADODB.Connection")
Set rsReporte = Server.CreateObject ("ADODB.Recordset")		

cnIndex.Open Conect
' Seleccionar el ultimo reporte ingresado
sqlReporte= "SELECT * FROM IF_ACCESOS_DESC WHERE CODLINK = '"&codlink&"'"
rsReporte.Open sqlReporte, cnIndex
Session("codlink") = codLink
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
            <h3>Modificación de reportes</h3>
        </div>
            <div class="descripcion">
              <form method="post" action="acceso.asp?a=editar_proyecto">
              	  <div class="nuevo_proyecto_bloque" id="div_IdProyecto">ID Proyecto: 
                   	<span style="margin-left: 15px;"><%=rsReporte("CODLINK")%></span>
                    
                  </div>	
                 
                  <div class="editar_proyecto_bloque">T&iacute;tulo: 
                    <input class="editar_proyecto_input" type="text" name="enlace" value="<%= rsReporte("ENLACE")%>">
                  </div>
                  <div class="editar_proyecto_bloque">Descripci&oacute;n: 
                    <textarea class="editar_proyecto_textarea" type="text" name="descripcion"><%= rsReporte("LINKDESC")%></textarea>
                  </div>
               
              
                  <div class="nuevo_proyecto_bloque">
                  	<input type="submit" value="Modificar proyecto">
                  </div>
              </form>
                <div class="nuevo_proyecto_bloque">
                    <a href="acceso.asp?a=admin">Volver</a>
                    <br /><br />
                </div>
      		</div>
    </div>
</div>