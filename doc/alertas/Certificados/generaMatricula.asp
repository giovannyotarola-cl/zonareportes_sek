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
	sqlAlumnos = "SELECT MT_CLIENT.PATERNO, MT_CLIENT.MATERNO, MT_CLIENT.NOMBRE, MT_ALUMNO.RUT, MT_CLIENT.codcli+'-'+MT_CLIENT.DIG AS RUT_COMPLETO, MT_ALUMNO.CODCARPR, MT_ALUMNO.CODPESTUD, MT_CARRER.NOMBRE_C, RA_FACULTAD.DESCRIPCION FROM MT_CLIENT INNER JOIN MT_ALUMNO ON MT_CLIENT.CODCLI = MT_ALUMNO.RUT INNER JOIN MT_CARRER ON MT_ALUMNO.CODCARPR = MT_CARRER.CODCARR LEFT OUTER JOIN RA_FACULTAD ON MT_CARRER.CODFAC = RA_FACULTAD.CODFAC WHERE (MT_ALUMNO.RUT = '"&request("codcli")&"') AND ESTACAD='VIGENTE'"

	'response.Write sqlAlumnos
	rsAlumnos.Open sqlAlumnos, cnIndex
	
	Dim SemestreActualTexto
	Select Case request("peD") 
		Case(1)
			SemestreActualTexto = "PRIMER"
		Case(2)
			SemestreActualTexto = "SEGUNDO"
	end select
	
	Dim CursoActualTexto
	Select Case request("curso") 
		Case(1)
			CursoActualTexto = "PRIMER"
		Case(2)
			CursoActualTexto = "SEGUNDO"
		Case(3)
			CursoActualTexto = "TERCER"
		Case(4)
			CursoActualTexto = "CUARTO"
		Case(5)
			CursoActualTexto = "QUINTO"
	end select
	
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
    	<h3 style="font-size:17px; letter-spacing:2px; padding-top: 10px;">CERTIFICADO</h3>
    	</p>
    </div>
	<div id="content-center" style="font-size:16px; line-height:20px;">
    	<% if rsAlumnos.eof = false Then %>
        <% 
		   Dim Cedula, i
		   Cedula = rsAlumnos("RUT")
		   Cero = "0"
		   For i = 1 to 10
			if (Len(rsAlumnos("RUT")) < i) Then
				Cedula = Cero&Cedula
			end if 
		   Next
	   %>
		<p align="justify"><strong>NOLBERTO ALARCÓN CARVAJAL</strong>, Secretario General de la Universidad SEK, ubicada en Fernando Manterola N°0789, comuna de Providencia de la ciudad de Santiago, RUT 71.618.600-8, inscrita en el folio C Nº20 del Libro de Registro de Universidades del Ministerio de Educación de Chile con fecha 3 de Octubre de 1988, reconocida oficialmente por esa Secretaría de Estado, y con plena Autonomía en virtud del Acuerdo N°111/2002 del Consejo Superior de Educación, <strong>CERTIFICA</strong>: </p>


	  	<p align="justify">Que Don/Doña <%= rsAlumnos("NOMBRE")&" "&rsAlumnos("PATERNO")&" "&rsAlumnos("MATERNO") %>, cédula de identidad <%= rsAlumnos("RUT_COMPLETO") %>, está matriculado(a) en calidad de alumno(a) regular del <%= semestreActualTexto %> SEMESTRE, Período Académico <%= request("anD") %> en <%= cursoActualTexto %> año de la carrera de <%= rsAlumnos("NOMBRE_C") %> impartida por la <%= rsAlumnos("DESCRIPCION") %>.</p>
		<p align="justify">Se extiende el presente documento a petición del(la) interesado(a) para los fines que estime pertinentes.
          <% else %>
	  </p>
    <p align="justify">No se ha encontrado al alumno</p>
        <% end if %>
    </div>
    <div id="content_table">
     
    </div>
    <div id="footer" style="font-size:16px;">
    	<div class="certif" style="font-size:16px; text-align: left;">
    	  <p>Santiago a <%=FormatDateTime(request("fec"),1)%></p>
    	  <p>&nbsp;</p>
    	  <p>&nbsp;</p>
    	  <p>&nbsp;</p>
<p align="center"><strong>Nolberto Alarcón Carvajal</strong></p>
    	  <p align="center"><strong>Secretario General</strong></p>
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
