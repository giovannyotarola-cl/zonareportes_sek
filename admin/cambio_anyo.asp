<!-- #include file="../include/config.asp" -->
<% 	
	Dim rut, rut_in, sqlSelect, sqlUpdate, rsSelect, anyo, anyo_in
	rut = Request.Form("rut")
	anyo = Request.Form("anyo")
	
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	'cnIndex.Open Conect
	'TEMPORAL
	cnIndex.Open "driver={SQL Server};server=192.168.30.250; database=Matricula01; uid=matricula;pwd=dtb01s"
	
	if (rut <> "") Then
		rut_in = True
	End If
	if (anyo <> "") Then
		anyo_in = True
	End If
	
	if rut_in = True Then
		sqlSelect = "select codpostul, codcarr, ano, periodo, usuario, estado, matriculado, observacion, jornada from mt_poscar where codpostul='"&rut&"' order by codpostul"
		Set rsSelect = Server.CreateObject ("ADODB.Recordset")
		rsSelect.Open sqlSelect, cnIndex	
		Session("rut") = rut
	end if
	
	if anyo_in = True Then
		sqlUpdate = "update mt_poscar set ano = '"&anyo&"' where codpostul = '"&Session("rut")&"'"
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
            <h3>Cambio de año</h3>
        </div>
         <div class="form_box">
         	<% If anyo_in = True Then %>
			 	<div class='form_notice'>
                	Año cambiado
                </div>
			<% End if %>

           <div class ="umas_desc">Mediante este formulario es posible cambiar el año de la operación seleccionada.</div>
           
           <% if rut_in = false Then %>
           Introducir RUT: 
           		<form method="post" action="acceso.asp?a=cambio_anyo">
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
	                    <form method="post" action="acceso.asp?a=cambio_anyo">
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
                            	RUT Postulante
                           	</td>
                        	<td>
                            	Año
                           	</td>
                        	<td>
                            	Estado
                           	</td>
                        	<td>
                            	Matriculado
                           	</td>
                        	<td>
                            	Observación
                           	</td>                                                                                                                
                        </tr>
                    <%
					while not rsSelect.EOF
						Response.Write("<tr>")
						Response.Write("<td>"&rsSelect("codpostul")&"</td>")
						Response.Write("<td>"&rsSelect("ano")&"</td>")
						Response.Write("<td>"&rsSelect("estado")&"</td>")
						Response.Write("<td>"&rsSelect("matriculado")&"</td>")
						Response.Write("<td>"&rsSelect("observacion")&"</td>")																							
						Response.Write("</tr>")
						rsSelect.moveNext
					Wend
					Response.Write("</table>")
				
				%>
					Introducir nuevo año:
                     <form method="post" action="acceso.asp?a=cambio_anyo">
    		            	<div class = "editar_usuario_bloque">
           			     		Año:<input type="text" name="anyo">
                			</div>
                			<div>
                				<br /><br /><input type="submit" value="Cambiar año" class = "umas_confirm">
                			</div>
            		</form>
                                
				<%
				end if
            
             end if 
			 
			 Set rsUpdate = Nothing
			 Set rsSelect = Nothing
			 cnIndex.Close
			%>
         
         
         <a href="acceso.asp?a=gestionUmas">Volver</a>
            
         </div>   
    </div>
</div>
