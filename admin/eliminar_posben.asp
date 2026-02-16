<!-- #include file="../include/config.asp" -->
<% 	
	Dim rut, rut_in, sqlSelect, sqlUpdate, rsSelect, cambiar
	rut = Request.Form("rut")
	cambiar = Request.Form("cambiar")
	
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	'cnIndex.Open Conect
	'TEMPORAL
	cnIndex.Open "driver={SQL Server};server=192.168.30.250; database=Matricula01; uid=matricula;pwd=dtb01s"
	
	if (rut <> "") Then
		rut_in = True
	End If
		
	if rut_in = True Then
		sqlSelect = "SELECT MT_BENEFICIO.DESCRIPCION, MT_POSBEN.CODCLI, MT_CARRER.NOMBRE_C, MT_POSBEN.ANO, MT_POSBEN.PERIODO, MT_CLIENT.PATERNO, MT_CLIENT.MATERNO, MT_CLIENT.NOMBRE FROM MT_POSBEN INNER JOIN MT_BENEFICIO ON MT_POSBEN.CODBEN = MT_BENEFICIO.CODBEN INNER JOIN MT_CARRER ON MT_POSBEN.CODCARR = MT_CARRER.CODCARR INNER JOIN MT_CLIENT ON MT_POSBEN.CODCLI = MT_CLIENT.CODCLI WHERE MT_POSBEN.CODCLI = '"&rut&"'"
		Set rsSelect = Server.CreateObject ("ADODB.Recordset")
		rsSelect.Open sqlSelect, cnIndex	
		Session("rut") = rut
	end if
	
	if cambiar = True Then
		sqlUpdate = "delete from MT_POSBEN WHERE CODCLI = '"&rut&"'"
		'Response.Write(sqlUpdate)
		cnIndex.Execute sqlUpdate	
	end if
	
	
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
            <h3>Eliminaci&oacute;n registro</h3>
        </div>
         <div class="form_box">
         	<% If nuevo_rut_in = True Then %>
			 	<div class='form_notice'>
                	Registro eliminado
                </div>
			<% End if %>

           <div class ="umas_desc">Mediante este formulario se eliminan registros en la tabla MT_POSBEN.</div>
           
           <% if rut_in = false Then %>
           Introducir RUT: 
           		<form method="post" action="acceso.asp?a=eliminar_posben">
                	<div class = "editar_usuario_bloque">
                		<input type="text" name="rut">
                	</div>
                	<div>
                		<br /><br /><input type="submit" value="Enviar RUT">
                	</div>
            	</form>
            
            <% else 
            
				if rsSelect.EOF Then
					Response.Write("No se han encontrado resultados para el rut seleccionado. Introduzca otro.")
					%>
	                    <form method="post" action="acceso.asp?a=eliminar_posben">
    		            	<div class = "editar_usuario_bloque">
           			     		<input type="text" name="rut">
                			</div>
                			<div>
                				<br /><br /><input type="submit" value="Enviar RUT" class ="umas_confirm">
                			</div>
            			</form>
                    <%
				else
					%>
                    <table class="umas_table">
                    	<tr>
                        	<td>
                            	RUT 
                           	</td>
                        	<td>
                            	Alumno
                           	</td>
                            <td>
                            	Carrera
                           	</td>
                            <td>
                            	A&ntilde;o - Periodo
                           	</td>
                            <td>
                            	Descripci&oacute;n
                           	</td>
                        </tr>
                    <%
					while not rsSelect.EOF
						Response.Write("<tr>")
						Response.Write("<td>"&rsSelect("codcli")&"</td>")
						Response.Write("<td>"&rsSelect("nombre")&" "&rsSelect("paterno")&" "&rsSelect("materno")&"</td>")
						Response.Write("<td>"&rsSelect("nombre_c")&"</td>")
						Response.Write("<td>"&rsSelect("ano")&" - "&rsSelect("periodo")&"</td>")
						Response.Write("<td>"&rsSelect("descripcion")&"</td>")
						Response.Write("</tr>")
						rsSelect.moveNext
					Wend
					Response.Write("</table>")
					
					 rsSelect.Close
					 Set rsSelect = Nothing
				
				%>
					&#191;Eliminar registro?
                     <form method="post" action="acceso.asp?a=eliminar_posben">
    		           	<input type="hidden" name="cambiar" value="True">
                		<br /><br /><input type="submit" value="Eliminar" class = "umas_confirm">
                	</form>
                                
				<%
				end if
            
             end if 		 
			%>
         <br /><br /><a href="acceso.asp?a=gestionUmas">Volver</a>
            
         </div>   
    </div>
</div>
