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
		sqlSelect = "SELECT p.CODPOSTUL, p.CODCARR, p.ANO, p.PERIODO, p.USUARIO, p.FECMOD, p.ESTADO, p.MATRICULADO, m.CODCLI, m.CODCARPR, m.ESTACAD, m.USUARIO, m.TIPOSITU, MT_CARRER.NOMBRE_C, MT_CLIENT.PATERNO, MT_CLIENT.MATERNO, MT_CLIENT.NOMBRE FROM MT_POSCAR AS p INNER JOIN MT_ALUMNO AS m ON p.ANO = m.ANO AND p.CODPOSTUL = m.RUT AND p.CODCARR = m.CODCARPR INNER JOIN MT_CARRER ON p.CODCARR = MT_CARRER.CODCARR INNER JOIN MT_CLIENT ON m.RUT = MT_CLIENT.CODCLI WHERE m.TIPOSITU = 1 AND (p.MATRICULADO = 'S') AND (p.ESTADO = 'A') AND codpostul='"&rut&"'"
		'Response.Write(sqlSelect)
		Set rsSelect = Server.CreateObject ("ADODB.Recordset")
		rsSelect.Open sqlSelect, cnIndex	
		Session("rut") = rut
	end if
	
	if cambiar = True Then
		sqlUpdate = "update mt_poscar set estado = 'E' where rut = '"&Session("rut")&"'"
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
            <h3>Actualizar estado</h3>
        </div>
         <div class="form_box">
         	<% If cambiar = True Then %>
			 	<div class='form_notice'>
                	Alumno actualizado
                </div>
			<% End if %>

           <div class ="umas_desc">Mediante este formulario es posible actualizar el estado de los alumnos eliminados y matriculados.</div>
           
           <% if rut_in = false Then %>
           Introducir RUT: 
           		<form method="post" action="acceso.asp?a=modificar_eliminado">
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
	                    <form method="post" action="acceso.asp?a=modificar_eliminado">
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
                            	Estado
                            </td>
                            <td>
                            	Matriculado
                            </td>
                        </tr>
                    <%
					while not rsSelect.EOF
						Response.Write("<tr>")
						Response.Write("<td>"&rsSelect("codpostul")&"</td>")
						Response.Write("<td>"&rsSelect("nombre")&" "&rsSelect("paterno")&" "&rsSelect("materno")&"</td>")
						Response.Write("<td>"&rsSelect("estado")&"</td>")
						Response.Write("<td>"&rsSelect("matriculado")&"</td>")
						Response.Write("</tr>")
						rsSelect.moveNext
					Wend
					Response.Write("</table>")
				
				%>
					¿Cambiar estado?
                     <form method="post" action="acceso.asp?a=modificar_eliminado">
    		           	<input type="hidden" name="cambiar" value="True">
                		<br /><br /><input type="submit" value="Actualizar estado" class = "umas_confirm">
                	</form>
                                
				<%
				 rsSelect.Close
				 Set rsSelect = Nothing
				
				end if
            
             end if 		 
			%>
         <a href="acceso.asp?a=gestionUmas">Volver</a>
            
         </div>   
    </div>
</div>
