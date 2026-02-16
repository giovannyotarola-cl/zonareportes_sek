<!-- #include virtual="include/config.asp" -->
<% 	
	Dim cnIndex, rsAcceso
								
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	cnIndex.Open Conect

	Set rsAcceso = Server.CreateObject ("ADODB.Recordset")
	rsAcceso.Open "select * from IF_USUARIO_INFORMES ORDER BY USERNAME ASC", cnIndex
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
            <h3>Administración de usuarios</h3>
        </div>
            <div class="descripcion">
			<% if rsAcceso.EOF Then %>
            	<p>No hay usuarios en el sistema.</p>
            <% else %>
            <table>
            	<tr>
                	<th>
                    	<b>Usuario</b>
                    </th>
                    <th>
                    	<b>Contraseña</b>
                    </th>
                    <th>
                    	<b>Descripción</b>
                    </th>
                     <th>
                    	<b>Carrera</b>
                    </th>
                     <th>
                    	<b>Email</b>
                    </th>
                    <th>
                    	<b>Acciones</b>
                    </th>
                </tr>
             	<% while not rsAcceso.EOF
					response.Write("<tr>")
						response.Write("<td class='admin_usuario_nombre'>")
							response.Write(rsAcceso("USERNAME"))
						response.Write("</td>")
						response.Write("<td class='admin_usuario_nombre'>")
							response.Write(rsAcceso("USERPASS"))
						response.Write("</td>")
						response.Write("<td class='admin_usuario_desc'>")
							response.Write(rsAcceso("USERDES"))
						response.Write("</td>")
						response.Write("<td class='admin_usuario_desc'>")
							response.Write(rsAcceso("USERCARR"))
						response.Write("</td>")
						response.Write("<td class='admin_usuario_nombre'>")
							response.Write(rsAcceso("EMAIL"))
						response.Write("</td>")
						response.Write("<td>")
							response.Write("<a href='acceso.asp?a=usuario_permisos&userid="&rsAcceso("USERID")&"'><img src='images/candado.png' border=0 title='Modificar permisos'></img></a><a href='acceso.asp?a=modificar_usuario&userid="&rsAcceso("USERID")&"'><img src='images/usuario.gif' border=0 title='Modificar usuario'></img></a>")
						response.Write("</td>")
					response.Write("</tr>")
					rsAcceso.MoveNext
					wend
				end if
				%>
            </table>
            <br /><br />
            <a href="acceso.asp?a=admin">Volver</a>
      		</div>
    </div>
</div>
