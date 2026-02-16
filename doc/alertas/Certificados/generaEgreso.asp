<%
session.lcid=1034
ahora = now()
fecha = date() 
Dim sqlAlumnos, cnIndex, rsAlumnos, sqlNotaFinal, codicionCertif
Dim ns, asistencia, nes, notafinal, aprobado,estadofinal

Set cnIndex = Server.CreateObject ("ADODB.Connection")
Set rsAlumnos = Server.CreateObject ("ADODB.Recordset")
Set rsNotaFinal = Server.CreateObject ("ADODB.Recordset")
Set rsRamos = Server.CreateObject ("ADODB.Recordset")
cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=Matricula; uid=matricula;pwd=dtb01s"

	'sqlAlumnos = "SELECT * FROM SEK_certificado_alumno WHERE RUT = '"&request("cr")&"'"
	sqlAlumnos = "SELECT MT_CLIENT.PATERNO, MT_CLIENT.MATERNO, MT_CLIENT.NOMBRE, MT_CLIENT.CODCLI, MT_CARRER.NOMBRE_C, RA_FACULTAD.DESCRIPCION, MT_ALUMNO.FECREG, RA_SITU.EMISION, MT_CLIENT.DIG FROM  MT_CLIENT INNER JOIN MT_ALUMNO ON MT_CLIENT.CODCLI = MT_ALUMNO.RUT INNER JOIN MT_CARRER ON MT_ALUMNO.CODCARPR = MT_CARRER.CODCARR INNER JOIN RA_FACULTAD ON MT_CARRER.CODFAC = RA_FACULTAD.CODFAC INNER JOIN RA_SITU ON MT_ALUMNO.CODCLI = RA_SITU.CODCLI WHERE (RA_SITU.TIPOSITU = 13) AND (MT_ALUMNO.RUT = '"&request("codcli")&"') "
	'response.Write sqlAlumnos
	rsAlumnos.Open sqlAlumnos, cnIndex
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/project.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="print" />
<script type="text/javascript">
	window.print();
</script>
<%if request("logo") = "true" then%>
<div id="logo"><img src="images/logo.jpg"></div>
<%else%>
<div id="logo"></div>
<%end if%>
<div id="container" style="margin-top: 140px;">
	<div class="titulo" style="font-size:16px;">
    <h3 style="font-size:17px; letter-spacing:2px; padding-top: 10px;">CERTIFICADO</h3></p>
 		<p></p>
    </div>
	<div id="content-center" style="font-size:16px; line-height:20px;">
    	<% if rsAlumnos.eof = false Then %>
      <% 
		   Dim Cedula, i, rut
		   rut = rsAlumnos("CODCLI")&"-"&rsAlumnos("DIG")
		   Cedula = rut
		   
		   Cero = "0"
		   For i = 1 to 10
			if (Len(rut) < i) Then
				Cedula = Cero&Cedula
			end if 
		   Next
	   %>
      <p align="justify"><strong>NOLBERTO ALARCÓN CARVAJAL</strong>,Secretario General de la Universidad SEK, ubicada en Fernando Manterola N°0789, comuna de Providencia de la ciudad de Santiago, RUT 71.618.600-8, inscrita en el folio C Nº20 del 3 de Octubre de 1988 del Libro de Registro de Universidades del Ministerio de Educación, y reconocida oficialmente por esa Secretaría de Estado, <strong>CERTIFICA</strong>: </p>
		<p align="justify"> Don/Doña <b><%=rsAlumnos("NOMBRE")&" "&rsAlumnos("PATERNO")&" "&rsAlumnos("MATERNO")%></b>, Cédula de Identidad Nº <b><%=Cedula%></b> ha aprobado como alumno(a) regular todos los cursos y actividades que conforman el Programa de <%= rsAlumnos("NOMBRE_C") %>, que se imparte en la <b><%=rsAlumnos("DESCRIPCION")%></b>, teniendo, en consecuencia, la calidad de <strong>Egresado(a)</strong> desde el <%= FormatDateTime(rsAlumnos("EMISION"), 1) %>.</p>
		<p align="justify">Se extiende el presente documento a petición del(la) interesado(a) para los fines pertinentes.</p>
        
    <% else %>
        <p>No se ha encontrado al alumno</p>
        <% end if %>
    </div>
    <div id="content_table">
     
    </div>
    <div id="footer" style="font-size:16px;">
    	<div class="certif" style="font-size:16px; text-align: left;">Santiago a <%=FormatDateTime(request("fec"),1)%></div>
    </div>
</div>

<%
Function SiNull(valor,valorsinulo) 
If isnull(valor) then 
	SiNull=valorsinulo
End if
	SiNull=valor
End Function
%>
