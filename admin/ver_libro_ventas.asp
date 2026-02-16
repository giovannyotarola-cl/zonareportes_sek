<!-- #include file="../include/config.asp" -->
<% 	
	Dim sqlSelect, rsSelect
	
	Set cnIndex = Server.CreateObject("ADODB.Connection")
	'cnIndex.Open Conect
	'TEMPORAL
	cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=MatriculaPruebaChile; uid=matricula;pwd=dtb01s"
	
	sqlSelect = "select sum(c.monto) as total_detalle, l.monto as total_lvta,	sum(c.monto)-l.monto as dif, c.codcli, c.ctatrans,	c.fecha, month(c.fecha) as mes, year(c.fecha) as ano_bol, c.ano, c.ctadoc from	mt_ctadoc c, mt_lvta l where c.ano=l.ano and c.ano=2012 and c.ctatrans=l.Numero and c.num_operacion=l.num_operacion and c.ctatrans in (select Numero from mt_lvta where ano=2012) group by c.codcli, c.ctatrans, c.fecha, l.monto, c.ano, c.ctadoc having sum(c.monto) <> l.monto order by c.ctatrans, month(c.fecha), year(c.fecha)"
		
	'Response.Write(sqlSelect)
	Set rsSelect = Server.CreateObject ("ADODB.Recordset")
	rsSelect.Open sqlSelect, cnIndex	
	
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
            <h3>Verificar libro de ventas</h3>
        </div>
         <div class="form_box">

           <div class ="umas_desc">Verificaci&oacute;n del libro de ventas.</div>
           <%         
				if rsSelect.EOF Then
					Response.Write("No se han encontrado resultados.")
				else
					%>
                    <table class="umas_table">
                    	<tr>
                        	<td>
                            	C&oacute;digo de Cliente
                           	</td>
                        	<td>
                            	Fecha
                           	</td>
                        	<td>
                            	Total detalle
                           	</td>
                            <td>
                            	Total libro de ventas
                           	</td>
                            <td>
                            	Diferencia
                           	</td>
                       </tr>
                    <%
					do while not rsSelect.EOF
						Response.Write("<tr>")
							Response.Write("<td>"&rsSelect("codcli")&"</td>")
							Response.Write("<td>"&rsSelect("fecha")&"</td>")						
							Response.Write("<td>"&rsSelect("total_detalle")&"</td>")
							Response.Write("<td>"&rsSelect("total_lvta")&"</td>")
							Response.Write("<td>"&rsSelect("dif")&"</td>")																										
						Response.Write("</tr>")
						rsSelect.moveNext
					Loop
					Response.Write("</table>")
					
					'rsSelect.Close
					'Set rsSelect = Nothing
				
             end if 
			%>
         
         <a href="acceso.asp?a=gestionUmas">Volver</a>
            
         </div>   
    </div>
</div>
