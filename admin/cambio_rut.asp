<!-- #include file="../include/config.asp" -->
<% 	
	Dim rut, rut_in, sqlSelect, sqlUpdate, rsSelect, nuevo_rut, nuevo_rut_in
	rut = Request.Form("rut")
	nuevo_rut = Request.Form("nuevo_rut")
	
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	'cnIndex.Open Conect
	'TEMPORAL
	cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=MatriculaPruebaChile; uid=matricula;pwd=dtb01s"
	
	if (rut <> "") Then
		rut_in = True
	End If
	if (nuevo_rut <> "") Then
		nuevo_rut_in = True
	End If
	
	if rut_in = True Then
		sqlSelect = "select nombre, paterno, materno, codcli from mt_client where codcli='"&rut&"'"
		Set rsSelect = Server.CreateObject ("ADODB.Recordset")
		rsSelect.Open sqlSelect, cnIndex	
		Session("rut") = rut
	end if
	
	if nuevo_rut_in = True Then
		sqlUpdate = "update mt_poscar set codpostul = '"&nuevo_rut&"' where codpostul = '"&Session("rut")&"'; update mt_postul set codpostul = '"&nuevo_rut&"' where codpostul = '"&Session("rut")&"'; update mt_ctadoc set codapod = '"&nuevo_rut&"' where codapod = '"&Session("rut")&"'; update mt_ctadoc set codcli = '"&nuevo_rut&"' where codcli = '"&Session("rut")&"'; update mt_ctadep set codcli = '"&nuevo_rut&"' where codcli = '"&Session("rut")&"'; update mt_client set rutcli = '"&nuevo_rut&"' where rutcli = '"&Session("rut")&"'; update mt_client set codcli = '"&nuevo_rut&"' , dig = 'K'  where codcli = '"&Session("rut")&"'; update mt_ctapag set codcli = '"&nuevo_rut&"' where codcli = '"&Session("rut")&"'; update mt_docitem set codcli = '"&nuevo_rut&"' where codcli = '"&Session("rut")&"'; update mt_lvta set rut = '"&nuevo_rut&"' where rut='"&Session("rut")&"'; update mt_posben set codcli = '"&nuevo_rut&"' where codcli = '"&Session("rut")&"'; update mt_alumno set rut = '"&nuevo_rut&"' where rut = '"&Session("rut")&"';"
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
            <h3>Cambio de RUT</h3>
        </div>
         <div class="form_box">
         	<% If nuevo_rut_in = True Then %>
			 	<div class='form_notice'>
                	Rut cambiado
                </div>
			<% End if %>

           <div class ="umas_desc">Mediante este formulario es posible cambiar el rut del alumno seleccionado.</div>
           
           <% if rut_in = false Then %>
           Introducir RUT: 
           		<form method="post" action="acceso.asp?a=cambio_rut">
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
	                    <form method="post" action="acceso.asp?a=cambio_rut">
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
                        </tr>
                    <%
					while not rsSelect.EOF
						Response.Write("<tr>")
						Response.Write("<td>"&rsSelect("codcli")&"</td>")
						Response.Write("<td>"&rsSelect("nombre")&" "&rsSelect("paterno")&" "&rsSelect("materno")&"</td>")
						Response.Write("</tr>")
						rsSelect.moveNext
					Wend
					Response.Write("</table>")
					
					 rsSelect.Close
					 Set rsSelect = Nothing
				
				%>
					Introducir nuevo RUT:
                     <form method="post" action="acceso.asp?a=cambio_rut">
    		            	<div class = "editar_usuario_bloque">
           			     		RUT:<input type="text" name="nuevo_rut">
                			</div>
                			<div>
                				<br /><br /><input type="submit" value="Cambiar RUT" class = "umas_confirm">
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
