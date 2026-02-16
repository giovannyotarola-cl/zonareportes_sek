<%
session.lcid=1034
ahora = now()
fecha = date() 
Dim sqlAlumnos, cnIndex, rsAlumnos, sqlAsistencia

Set cnIndex = Server.CreateObject ("ADODB.Connection")
Set rsAlumnos = Server.CreateObject ("ADODB.Recordset")
Set rsAsistencia = Server.CreateObject ("ADODB.Recordset")
cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=Matricula; uid=matricula;pwd=dtb01s"

	'sqlAlumnos = "SELECT * FROM SEK_certificado_alumno WHERE RUT = '"&request("cr")&"'"
	sqlAlumnos = "SELECT MT_CLIENT.PATERNO, MT_CLIENT.MATERNO, MT_CLIENT.NOMBRE, MT_ALUMNO.RUT, MT_CLIENT.codcli+'-'+MT_CLIENT.DIG AS RUT_COMPLETO, MT_ALUMNO.CODCARPR, MT_ALUMNO.CODPESTUD, MT_CARRER.NOMBRE_C, RA_FACULTAD.DESCRIPCION FROM MT_CLIENT INNER JOIN MT_ALUMNO ON MT_CLIENT.CODCLI = MT_ALUMNO.RUT INNER JOIN MT_CARRER ON MT_ALUMNO.CODCARPR = MT_CARRER.CODCARR LEFT OUTER JOIN RA_FACULTAD ON MT_CARRER.CODFAC = RA_FACULTAD.CODFAC WHERE (MT_ALUMNO.RUT = '"&request("codcli")&"')"
	
	sqlAsistencia = "SELECT RA_RAMO.NOMBRE, RA_CARGA.ANO, RA_CARGA.PERIODO, MAX(RA_NOTA.ASISTENCIA) AS ASISTENCIA,                       RA_CARGA.CODRAMO, MT_ALUMNO.CODCLI FROM RA_RAMO INNER JOIN RA_CARGA INNER JOIN RA_NOTA INNER JOIN MT_ALUMNO ON RA_NOTA.CODCLI = MT_ALUMNO.CODCLI ON RA_CARGA.CODCLI = MT_ALUMNO.CODCLI ON RA_RAMO.CODRAMO = RA_CARGA.CODRAMO WHERE     (RA_CARGA.ANO = '"&request("ano")&"') AND (MT_ALUMNO.CODCLI = '"&request("cli")&"') AND (RA_NOTA.ASISTENCIA <> 0) GROUP BY RA_RAMO.NOMBRE, RA_CARGA.ANO, RA_CARGA.PERIODO, RA_NOTA.ASISTENCIA, RA_CARGA.CODRAMO, MT_ALUMNO.CODCLI "
	'response.Write sqlAlumnos
	'response.Write sqlAsistencia
	rsAlumnos.Open sqlAlumnos, cnIndex
	rsAsistencia.Open sqlAsistencia, cnIndex
	
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
<div id="container" style="margin-top: 40px;">
	<div class="titulo" style="font-size:16px;">
    	<h3 style="font-size:17px; letter-spacing:2px; padding-top: 10px;">CERTIFICADO</h3>
    	</p>
    </div>
	<div id="content-center" style="font-size:16px; line-height:20px;">
    	<% if rsAlumnos.eof = false Then %>
       
		<p align="justify"><strong>NOLBERTO ALARCÓN CARVAJAL</strong>,Secretario General de la Universidad SEK, ubicada en Fernando Manterola N°0789, comuna de Providencia de la ciudad de Santiago, RUT 71.618.600-8, inscrita en el folio C Nº20 del 3 de Octubre de 1988 del Libro de Registro de Universidades del Ministerio de Educación, y reconocida oficialmente por esa Secretaría de Estado, <strong>CERTIFICA</strong>: </p>
	  <p align="justify">Que Don/Doña <%= rsAlumnos("NOMBRE")&" "&rsAlumnos("PATERNO")&" "&rsAlumnos("MATERNO") %>, cédula de identidad <%= rsAlumnos("RUT_COMPLETO") %>, es alumno regular del Período Académico <%= request("ano") %> en <%= cursoActualTexto %> año de la carrera de <%= rsAlumnos("NOMBRE_C") %> impartida por la <%= rsAlumnos("DESCRIPCION") %>.</p>
      	<% if rsAsistencia.eof Then %>
        	<p align="justify">El alumno indicado no tiene asistencias registradas.</p>
        <% else %>
        
            <p align="justify">Dejo constancia que la asistencia del alumno(a) durante dicho Periodo Académico es la siguiente: </p>
            
            <div align="center">
                <table class="tabla_asistencia">
                    <tr>
                        <th class = "asist_head">
                            NOMBRE ASIGNATURA
                        </th>
                        <th class = "asist_head">
                            AÑO/SEM
                        </th>
                        <th class = "asist_head">
                            % ASISTENCIA
                        </th>
                    </tr>
                    <% Do while not rsAsistencia.eof %>
                    <tr>
                        <td class = "asist_cell">
                            <%= rsAsistencia("CODRAMO")&" "&rsAsistencia("NOMBRE") %>
                        </td>
                        <td class = "asist_cell" align="center">
                            <%= rsAsistencia("ANO")&"/"&rsAsistencia("PERIODO") %>
                        </td>
                        <td class = "asist_cell" align="center">
                            <%= rsAsistencia("ASISTENCIA")&"%" %>
                        </td>
                    </tr>         
                    
                    <% rsAsistencia.moveNext
                       Loop %>
                </table>
             </div>
		<% End If %>        
        <p align="justify">Se extiende el presente documento a petición del(la) interesado(a) para los fines que estime pertinentes.</p>
          <% else %>
	 
    <p align="justify">No se ha encontrado al alumno</p>
        <% end if %>
    </div>
    <div id="content_table">
     
    </div>
    <div id="footer" style="font-size:16px;">
    	<div class="certif" style="font-size:16px; text-align: left;">Santiago a <%=FormatDateTime(request("fec"),1)%></div>
    </div>
</div>

