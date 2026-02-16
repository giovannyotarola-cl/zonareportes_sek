<!-- #include file="../include/config.asp" -->
<% 	
	Dim sqlSelect, rsSelect, paterno, paterno_in, materno, materno_in, filled
	paterno = Request.Form("paterno")
	materno = Request.Form("materno")
	
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	'cnIndex.Open Conect
	'TEMPORAL
	cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=MatriculaPruebaChile; uid=matricula;pwd=dtb01s"
	
	if (paterno <> "") Then
		paterno_in = True
	End If
	
	if (materno <> "") Then
		materno_in = True
	End If
	
	if (paterno_in = True Or materno_in = True) Then 
		filled = True
	End If
	
	if filled = True Then
		sqlSelect = "SELECT	MT_APODER.PATERNO AS apod_paterno, MT_APODER.MATERNO AS apod_materno, MT_APODER.NOMBRE AS apoder_nombre, MT_APODER.RUT AS apoder_rut, MT_CLIENT.CODCLI, MT_CLIENT.DIG, MT_CLIENT.PATERNO, MT_CLIENT.MATERNO, MT_CLIENT.NOMBRE, MT_CLIENT.CODAVAL, MT_ALUMNO.RUT FROM	MT_CLIENT INNER JOIN MT_ALUMNO ON MT_CLIENT.CODCLI = MT_ALUMNO.RUT INNER JOIN MT_APODER ON MT_CLIENT.CODAVAL = MT_APODER.CODAPOD WHERE "
		if paterno_in = True Then
			sqlSelect = sqlSelect&" MT_APODER.PATERNO like '%"&paterno&"%'"
		end if
		
		if (paterno_in = True And materno_in = True) Then 
			sqlSelect = sqlSelect&" AND "
		End If
		
		if materno_in = True Then
			sqlSelect = sqlSelect&" MT_APODER.MATERNO like '%"&materno&"%'"
		end if
		
		sqlSelect = sqlSelect&" ORDER BY mt_apoder.paterno"
		Set rsSelect = Server.CreateObject ("ADODB.Recordset")
		rsSelect.Open sqlSelect, cnIndex	
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
            <h3>Avalistas</h3>
        </div>
         <div class="form_box">
           <div class ="umas_desc">Listado de avalistas filtrados por apellidos (del avalista).</div>
           
           <% if (paterno_in = false and materno_in = false) Then %>
           Introducir Apellidos: 
           		<form method="post" action="acceso.asp?a=mostrar_avalistas">
                	<div class = "editar_usuario_bloque">
                		Paterno: <input type="text" name="paterno">
                	</div>
                    <div class = "editar_usuario_bloque">
                		Materno: <input type="text" name="materno">
                	</div>
                    <div class = "clear_both"></div>
                	<div>
                		<br /><br /><input type="submit" value="Buscar">
                	</div>
            	</form>
            
            <% else 
            
				if rsSelect.EOF Then
					Response.Write("No se han encontrado resultados para los apellidos introducidos.")
					%>
	                    <form method="post" action="acceso.asp?a=mostrar_avalistas">
    		            	<div class = "editar_usuario_bloque">
                				Paterno: <input type="text" name="paterno">
                			</div>
                    		<div class = "editar_usuario_bloque">
                				Materno: <input type="text" name="materno">
                			</div>
                            <div class = "clear_both"></div>
                			<div>
                				<br /><br /><input type="submit" value="Buscar" class ="umas_confirm">
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
                            	Alumno
                           	</td>
                        	<td>
                            	RUT Avalista
                           	</td>                        
                            <td>
                            	Avalista
                           	</td>
                        </tr>
                    <%
					while not rsSelect.EOF
						Response.Write("<tr>")
						Response.Write("<td>"&rsSelect("codcli")&"</td>")
						Response.Write("<td>"&rsSelect("nombre")&" "&rsSelect("paterno")&" "&rsSelect("materno")&"</td>")
						Response.Write("<td>"&rsSelect("apoder_rut")&"</td>")
						Response.Write("<td>"&rsSelect("apoder_nombre")&" "&rsSelect("apod_paterno")&" "&rsSelect("apod_materno")&"</td>")
						Response.Write("</tr>")
						rsSelect.moveNext
					Wend
					Response.Write("</table>")
					
					 rsSelect.Close
					 Set rsSelect = Nothing
				
				end if
            
             end if 		 
			%>
         <br /><br /><a href="acceso.asp?a=gestionUmas">Volver</a>
            
         </div>   
    </div>
</div>
