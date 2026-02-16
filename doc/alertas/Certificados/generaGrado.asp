<%
session.lcid=1034
ahora = now()
fecha = date() 
Dim sqlAlumnos, cnIndex, rsAlumnos

Set cnIndex = Server.CreateObject ("ADODB.Connection")
Set rsAlumnos = Server.CreateObject ("ADODB.Recordset")
Set rsNotaFinal = Server.CreateObject ("ADODB.Recordset")
Set rsRamos = Server.CreateObject ("ADODB.Recordset")
cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=Matricula; uid=matricula;pwd=dtb01s"

	'sqlAlumnos = "SELECT * FROM SEK_certificado_alumno WHERE RUT = '"&request("cr")&"'"
	sqlAlumnos = "SELECT MT_CLIENT.PATERNO, MT_CLIENT.MATERNO, MT_CLIENT.NOMBRE, MT_CLIENT.CODCLI, MT_CARRER.NOMBRE_C, RA_SITU.EMISION, MT_CARRER.OTORGRA FROM MT_CLIENT INNER JOIN MT_ALUMNO ON MT_CLIENT.CODCLI = MT_ALUMNO.RUT INNER JOIN MT_CARRER ON MT_ALUMNO.CODCARPR = MT_CARRER.CODCARR INNER JOIN RA_FACULTAD ON MT_CARRER.CODFAC = RA_FACULTAD.CODFAC INNER JOIN RA_SITU ON MT_ALUMNO.CODCLI = RA_SITU.CODCLI WHERE (RA_SITU.TIPOSITU = 31) AND (MT_ALUMNO.RUT = '"&request("codcli")&"') "
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
    <h3 style="font-size:17px; letter-spacing:2px; padding-top: 10px;">CERTIFICADO DE GRADO</h3></p>
 		<p></p>
    </div>
	<div id="content-center" style="font-size:16px; line-height:20px;">
    	<% if rsAlumnos.eof = false Then %>
      <% 
		   Dim Cedula, i
		   Cedula = rsAlumnos("CODCLI")
		   Cero = "0"
		   For i = 1 to 10
			if (Len(rsAlumnos("CODCLI")) < i) Then
				Cedula = Cero&Cedula
			end if 
		   Next
	   %>
      <p align="justify">La Universidad  SEK,  inscrita en el Ministerio de Educación, folio C Nº20 del 3 de Octubre de 1988, confirió a Don/Doña <b><%=rsAlumnos("NOMBRE")&" "&rsAlumnos("PATERNO")&" "&rsAlumnos("MATERNO")%></b>, Cédula de Identidad Nº <b><%=Cedula%></b>, con fecha <%= rsAlumnos("EMISION") %>, el Grado Académico de <%= rsAlumnos("OTORGRA") %>, habiendo obtenido una calificación <strong><%= request("calificacion") %></strong> (Máximo: siete, mínimo: cuatro coma cero), de acuerdo a las disposiciones legales vigentes contenidas en la ley Nº 18.962, Orgánica Constitucional de Enseñanza, Decreto Exento Nº 308 de 1991 del Ministerio de Educación Pública.</p>
      <p align="justify">Extendido para acreditar la posesión del respectivo Grado. </p>
<% else %>
        <p>No se ha encontrado al alumno</p>
        <% end if %>
    </div>
    <div id="content_table">
     
    </div>
    <div id="footer" style="font-size:16px;">
    	<div class="certif" style="font-size:16px; text-align: left;">
        <p>Santiago a <%=FormatDateTime(request("fec"),1)%></p>
    	  <p>&nbsp;</p>
    	  <p>&nbsp;</p>
    	  <div style="float: left; margin-left:100px;"><strong>Secretario General</strong></div>
          <div style="float: right; margin-right:100px;"><strong>Rector</strong></div>
          <div style="clear:both"></div>
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
%>
