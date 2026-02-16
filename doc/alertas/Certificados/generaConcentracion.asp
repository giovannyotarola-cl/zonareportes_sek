<%
session.lcid=1034
ahora = now()
fecha = date() 
Dim sqlAlumnos, sqlNotas, sqlMedia, sqlRut, rsRut, cnIndex, rsAlumnos, rsNotas, rsMedia, tipoNotas
Dim i, j, cadenaPeriodo, cadenaMedia

Set cnIndex = Server.CreateObject ("ADODB.Connection")
Set rsAlumnos = Server.CreateObject ("ADODB.Recordset")
Set rsNotas = Server.CreateObject ("ADODB.Recordset")
Set rsMedia = Server.CreateObject ("ADODB.Recordset")
Set rsRut = Server.CreateObject("ADODB.Recordset")

'cnIndex.Open "Provider=SQLOLEDB;Persist Security Info=False;Data Source=192.168.100.226;Initial Catalog=matricula;User Id=matricula;Password=dtb01s"
cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=Matricula; uid=matricula;pwd=dtb01s"

	if request("tipo") = "1" Then
		tipoNotas = " AND estado = 'A'"
	else 
		tipoNotas = " AND (estado = 'A' OR estado = 'R')"
	end if
	
	i = request("anoDesde")
	j = request("periodoDesde")
	cadenaPeriodo = " AND ("
	cadenaMedia = " AND ("
	
	'Si año fin menor que año origen, cadena vacía y genera todos los resultados
	if (cInt(request("anoDesde")) > cInt(request("anoHasta"))) then
		cadenaPeriodo = ""
		cadenaMedia = ""
	else
		Do
			cadenaPeriodo = cadenaPeriodo&" (anoPeriodo = '"&cStr(i)&"/"&cStr(j)&"')"
			cadenaMedia = cadenaMedia&" (ano = '"&cStr(i)&"' AND periodo = '"&cStr(j)&"')"
			if j = 1 Then
				j = 2
			else
				i = i + 1
				j = 1
			end if
			if not(i = cInt(request("anoHasta")) AND j = cInt(request("periodoHasta"))) Then
				cadenaPeriodo = cadenaPeriodo&" OR "
				cadenaMedia = cadenaMedia&" OR "
			end if
		Loop until (i = cInt(request("anoHasta")) AND j = cInt(request("periodoHasta")))
		cadenaPeriodo = cadenaPeriodo&")"
		cadenaMedia = cadenaMedia&")"
	End If
	'Response.Write("anoDesde -> "&request("anoDesde")&"; anoHasta -> "&request("anoHasta")&"; periodoDesde -> "&request("periodoDesde")&"; periodoHasta -> "&request("periodoHasta")&"<br>")
	'Response.Write("cadenaPeriodo -> "&cadenaPeriodo&"")
	'response.End()
	sqlAlumnos = "SELECT * from SEK_Alumno_Matriculado where codcli = '"&request("cli")&"'"
	sqlRut = "SELECT MT_CLIENT.CODCLI + '-' + MT_CLIENT.DIG AS Rut FROM MT_CLIENT INNER JOIN MT_ALUMNO ON MT_CLIENT.CODCLI = MT_ALUMNO.RUT where MT_ALUMNO.codcli = '"&request("cli")&"'"
	sqlNotas = "SELECT * from SEK_Nota_Concentracion where codcli = '"&request("cli")&"'"&cadenaPeriodo&tipoNotas
	sqlMedia = "SELECT ISNULL(AVG(RA_NOTA.NF),0) AS Media FROM SEK_Alumno_Matriculado INNER JOIN RA_NOTA ON SEK_Alumno_Matriculado.CODCLI = RA_NOTA.CODCLI WHERE SEK_Alumno_Matriculado.CODCLI = '"&request("cli")&"'"&cadenaMedia&tipoNotas
	
	'response.Write(sqlAlumnos)
	
	'response.Write sqlAlumnos
	'response.Write sqlRut
	'response.Write(sqlAlumnos+"<br/>")
	'response.Write(sqlRut+"<br/>")
	'response.Write(sqlNotas+"<br/>")
	'response.Write(sqlMedia+"<br/>")
	
	rsRut.Open sqlRut, cnIndex
	rsAlumnos.Open sqlAlumnos, cnIndex
	rsNotas.Open sqlNotas, cnIndex
	rsMedia.Open sqlMedia, cnIndex

%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/project.css" type="text/css" rel="stylesheet">
<link href="css/titles.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="print" />
<script type="text/javascript">
	window.print();
</script>
<%if request("logo") = "true" then%>
<div id="logo"><img src="images/logo.jpg"></div>
<%end if%>
<div id="container" style="margin-top: 40px;">
	<div class="titulo" style="font-size:16px;">
    	<p><h3 style="font-size:20px; letter-spacing:8px;">CERTIFICADO DE ESTUDIOS</h3></p>
	</div>
	<div id="content-center" style="font-size:16px; line-height:20px;">
    	<% if rsAlumnos.eof = false Then %>
      <p align="justify"> de la Universidad SEK, ubicada en Fernando Manterola N°0789, comuna de Providencia de la ciudad de Santiago, RUT 71.618.600-8, inscrita en el folio C Nº20 del 3 de Octubre de 1988 del Libro de Registro de Universidades del Ministerio de Educación, y reconocida oficialmente por esa Secretaría de Estado, <strong>CERTIFICA</strong>:</p>
		<p align="justify"> Don/Doña <b><%=rsAlumnos("NOMBRE")&" "&rsAlumnos("PATERNO")&" "&rsAlumnos("MATERNO")%></b>, cédula de identidad <%= rsRut("RUT")%>, es alumno(a) regular del Programa de  <%= rsAlumnos("NOMBRE_C") %>, impartido por la <b><%=rsAlumnos("DESCRIPCION")%></b>, cursando y aprobando los ramos que se detallan, según consta en actas finales, obteniendo las siguientes calificaciones:</p>
        <% if rsNotas.eof Then %>
        	<p>El alumno no tiene notas para el periodo seleccionado.</p>
        <% else %>
        <br />
        <table class = "tablaNotas">
        	<tr>
            	<th class = "cabNotas">Asignatura</th>
                <th class = "cabNotas">Año/Periodo</th>
                <th class = "cabNotas">Calificación</th>
           </tr>
           <% Do while not rsNotas.eof 
           
		   		Response.Write("<tr>")
           			Response.Write("<td class = 'notas_nombre'>"&rsNotas("NOMBRE")&"</td>")
					Response.Write("<td class = 'notas_celda'>"&rsNotas("anoPeriodo")&"</td>")
           			Response.Write("<td class = 'notas_celda'>"&rsNotas("NF")&"</td>")
           		Response.Write("</tr>")
            
		   rsNotas.MoveNext
		   Loop 
		  
		   'Mostrar media
		   if request("media") = "true" then
				Response.Write("<tr>")
           			Response.Write("<td class = 'notas_nombre_dcha'>Promedio</td>")
					Response.Write("<td class = 'notas_pie'></td>")
           			Response.Write("<td class = 'notas_pie'>"&left(rsMedia("Media"), 4)&"</td>")
           		Response.Write("</tr>")
			else 
				Response.Write("<tr>")
           			Response.Write("<td class = 'notas_nombre_dcha'></td>")
					Response.Write("<td class = 'notas_pie'></td>")
           			Response.Write("<td class = 'notas_pie'></td>")
           		Response.Write("</tr>")
			end if
			%>
        </table>
		<% end if %>
        
    <% else %>
        <p>No se ha encontrado al alumno</p>
        <% end if %>
    </div>
    <div id="content_table">
     
    </div>
    <div id="footer" style="font-size:16px;">
    	<br />
    	<div class="certif" style="font-size:14px; text-align: center;">
    	  <p><strong>Nolberto Alarcón Carvajal </strong></p>
<p><strong>Secretario General</strong></p>
<p>&nbsp;</p>
      </div>
<div class="certif" style="font-size:14px; text-align: left;">
    	  <p><strong>Santiago a <%=FormatDateTime(request("fec"),1)%></strong></p>
    	  <p>&nbsp;</p>
	  </div>
    </div>
</div>

<%
Function SiNull(valor,valorsinulo) 
If isnull(valor) then 
	SiNull=valorsinulo
End if
	SiNull=valor
End Function

rsRut.Close
rsAlumnos.Close
rsNotas.Close
rsMedia.Close
%>
