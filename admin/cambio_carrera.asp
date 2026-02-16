<!-- #include file="../include/config.asp" -->
<% 	
	Dim rut, rut_in, sqlSelectAlumno, sqlUpdate, rsSelectAlumno, sqlSelectCarrera, rsSelectCarrera, carrera_in, carrera
	rut = Request.Form("rut")
	carrera = Request.Form("carrera")
	
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	'cnIndex.Open Conect
	'TEMPORAL
	cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=MatriculaPruebaChile; uid=matricula;pwd=dtb01s"
	
	if (rut <> "") Then
		rut_in = True
	End If

	if (carrera <> "") Then
		carrera_in = True
	End if
	
	if rut_in = True Then
		sqlSelectAlumno = "SELECT MT_CLIENT.PATERNO, MT_CLIENT.MATERNO, MT_CLIENT.NOMBRE, MT_CARRER.NOMBRE_C, MT_ALUMNO.RUT FROM MT_ALUMNO INNER JOIN MT_CARRER ON MT_ALUMNO.CODCARPR = MT_CARRER.CODCARR INNER JOIN MT_CLIENT ON MT_ALUMNO.RUT = MT_CLIENT.CODCLI where MT_ALUMNO.estacad='VIGENTE' AND MT_CLIENT.CODCLI = '"&rut&"'"
		sqlSelectCarrera = "select codcarr, nombre_c from mt_carrer"
		
		'Response.Write(sqlSelectAlumno)
		Set rsSelectAlumno = Server.CreateObject ("ADODB.Recordset")
		Set rsSelectCarrera = Server.CreateObject("ADODB.Recordset")
		
		rsSelectAlumno.Open sqlSelectAlumno, cnIndex	
		rsSelectCarrera.Open sqlSelectCarrera, cnIndex
		
		Session("rut") = rut
	end if
	
	if carrera_in = True Then
		'Response.Write("Carrera es"&carrera)
		sqlUpdate = "update mt_ctadep set codcarr = '"&carrera&"' where codcli = '"&Session("rut")&"'; update mt_ctapag set codcarr = '"&carrera&"' where codcli = '"&Session("rut")&"'; update mt_ctadoc set codcarr = '"&carrera&"' where codcli = '"&Session("rut")&"'; update mt_alumno set codcarpr = '"&carrera&"' where rut = '"&Session("rut")&"'; update mt_ctadep set codcarr = '"&carrera&"' where codcli = '"&Session("rut")&"'; update mt_ctapag set codcarr = '"&carrera&"' where codcli = '"&Session("rut")&"'; update mt_ctadoc set codcarr = '"&carrera&"' where codcli = '"&Session("rut")&"'; update mt_alumno set codcarpr = '"&carrera&"' where RUT = '"&Session("rut")&"'; update mt_poscar set codcarr = '"&carrera&"' where CODPOSTUL = '"&Session("rut")&"'; update mt_poscar set codcarr = '"&carrera&"' where codpostul = '"&Session("rut")&"';"
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
            <h3>Cambio de carrera</h3>
        </div>
         <div class="form_box">
         	<% If carrera_in = True Then %>
			 	<div class='form_notice'>
                	Carrera cambiada
                </div>
			<% End if %>

           <div class ="umas_desc">Mediante este formulario es posible cambiar la carrera de un alumno.</div>
           
           <% if rut_in = false Then %>
           Introducir RUT: 
           		<form method="post" action="acceso.asp?a=cambio_carrera">
                	<div class = "editar_usuario_bloque">
                		<input type="text" name="rut">
                	</div>
                	<div>
                		<br /><br /><input type="submit" value="Enviar RUT">
                	</div>
            	</form>
            
            <% else 
            
				if rsSelectAlumno.EOF Then
					Response.Write("No se han encontrado resultados para el rut seleccionado. Introduzca otro.")
					%>
	                    <form method="post" action="acceso.asp?a=cambio_carrera">
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
                            	RUT Alumno
                           	</td>
                        	<td>
                            	Nombre
                           	</td>
                        	<td>
                            	Carrera
                           	</td>
                       </tr>
                    <%
					while not rsSelectAlumno.EOF
						Response.Write("<tr>")
						Response.Write("<td>"&rsSelectAlumno("rut")&"</td>")
						Response.Write("<td>"&rsSelectAlumno("nombre")&" "&rsSelectAlumno("paterno")&" "&rsSelectAlumno("materno")&"</td>")
						Response.Write("<td>"&rsSelectAlumno("nombre_c")&"</td>")
																										
						Response.Write("</tr>")
						rsSelectAlumno.moveNext
					Wend
					Response.Write("</table>")
					
					rsSelectAlumno.Close
					Set rsSelectAlumno = Nothing
				
				%>
					Seleccionar nueva carrera:
                     <form method="post" action="acceso.asp?a=cambio_carrera">
    		            	<div class = "editar_usuario_bloque">
           			     		<select name="carrera">
                                <% 	while not rsSelectCarrera.EOF	
										Response.Write("<option value='"&rsSelectCarrera("CODCARR")&"'>"&rsSelectCarrera("NOMBRE_C")&"</option>")
										rsSelectCarrera.moveNext
									wend
									
									rsSelectCarrera.Close
									Set rsSelectCarrera = Nothing
								%>
                                </select>
                			</div>
                			<div>
                				<br /><br /><input type="submit" value="Cambiar carrera" class = "umas_confirm">
                			</div>
            		</form>
                                
				<%
				end if
            
             end if 
			%>
         
         <a href="acceso.asp?a=gestionUmas">Volver</a>
            
         </div>   
    </div>
</div>
