<%

Dim sqlAlumnos, cnIndex, rsAlumnos
Dim rut, valorCredito,valorArancel,cantidadCuotas,porcentajeCuota,fechaVencimiento

rut= request.QueryString("codCli")
valorMatricula=request.QueryString("valorMatricula")
valorExamen=request.QueryString("valorExamen")
cantidadCuotas=request.QueryString("cantCuotas")
fechaVencimiento=FormatDateTime(request.QueryString("fechaVenc"),2)


Set cnIndex = Server.CreateObject ("ADODB.Connection")
Set rsAlumnos = Server.CreateObject ("ADODB.Recordset")
cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=Matricula; uid=sa;pwd=Sa070507"
    
	
	sqlAlumnos = "SELECT CODCLI, DIG, PATERNO, MATERNO, NOMBRE, NOMBRE_C, FEC_MAT, NOMBREAVAL, RUTAVAL, DIGAVAL, PATERNOAVAL, MATERNOAVAL FROM dbo.SEK_Alumnos_Matriculados_Total_Anexo_Contrato Where codCli='"& rut&"'"
  

  
	'response.Write sqlAlumnos
	rsAlumnos.Open sqlAlumnos, cnIndex

%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/project.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="print" />
<script type="text/javascript">
	window.print();
</script>
<div id="anchoPagina" >
<div id="logo"><img src="images/logo.jpg"></div>

<div class="titulo">
    <p>
        <b>
            <u>
                ANEXO DE CONTRATO<br /> 
                ALUMNOS QUE PAGAN EXAMEN FINAL DE TITULO Y/O GRADO ACADÉMICO<br />
                EN CONVOCATORIA EXTRAORDINARIA <br /> 
                UNIVERSIDAD INTERNACIONAL SEK
            </u>
        </b>
    </p>
</div>
<div class="informacion">
    <table class="informacion">
        <tr>
            <td>Nombre del Alumno:</td>
            <td><%=rsAlumnos("NOMBRE")&" "&rsAlumnos("PATERNO")&" "&rsAlumnos("MATERNO") %></td>
        </tr>
        <tr>
            <td>RUN:</td>
            <td><%=rsAlumnos("CODCLI")&"-"&rsAlumnos("DIG") %></td>
        </tr>
        <tr>
            <td>Carrera:</td>
            <td><%=rsAlumnos("NOMBRE_C") %></td>
        </tr>
        <tr>
            <td>Fecha de Matricula:</td>
            <td><%=FormatDateTime(rsAlumnos("FEC_MAT"),2) %></td>
        </tr>
    </table>
</div>
<div id="container">
	<p style="text-indent:50">En Santiago a <%=Day(date()) %> de <%=MonthName(Month(Date()))  %> de <%=Year(Date()) %>, entre la Universidad Internacional SEK, rut 71.618.600-8, y el alumno don <%=rsAlumnos("NOMBRE")&" "&rsAlumnos("PATERNO")&" "&rsAlumnos("MATERNO") %> , rut Nº <%=rsAlumnos("CODCLI")&"-"&rsAlumnos("DIG") %> , se ha convenido el siguiente Anexo al Contrato de Prestación de Servicos Educacionales de fecha <%=FormatDateTime(rsAlumnos("FEC_MAT"),2) %>, suscrito entre las mismas partes: </p>
    <p style="text-indent:50">En virtud de la autorización, por razones estrictamente académicas, para la presentación de su Examen Final de Título y/o Grado Académico en convocatoria extraordinaria, es que se hace hace necesario establecer los valores que el alumno debe cancelar por este concepto, los cuales se encuentran fijados por Decreto de Rectoría vigente, a través de este anexo, el cual se integra al Contrato de Prestación de Servicios Educacionales celebrado con fecha <%=Day(FormatDateTime(rsAlumnos("FEC_MAT"),2)) %> de <%=MonthName(Month(FormatDateTime(rsAlumnos("FEC_MAT"),2))) %> de <%=Year(FormatDateTime(rsAlumnos("FEC_MAT"),2)) %> entre la Universidad Internacional Sek y el alumno precedentemente individualizado, de conformidad a las siguientes estipulaciones.</p>
    <p style="text-indent:50">El valor del Examen Final de Título y/o Grado Académico es de $<%=valorExamen %>, pago que se efectuará en <%=cantidadCuotas %> cuotas mensuales, iguales y sucesivas, de $<%=Int(valorExamen/cantidadCuotas) %> cada una, venciendo la primera cuota el día <%=Day(fechaVencimiento)%> del mes de <%=MonthName(Month(fechaVencimiento))%>  del año <%=Year(fechaVencimiento) %></p>
    <p style="text-indent:50">El valor indicado no será susceptible de aplicación de beneficio por los convenios que la Universidad determine.</p>
    <p style="text-indent:50">Por este mismo acto el alumno declara aceptar que para poder rendir el Examen Final de Título y/o Grado Académico, los valores antes descritos deben estar pagados íntegramente.</p>
    <p style="text-indent:50">Suscribe también este Anexo don <%=rsAlumnos("NOMBREAVAL")&" "&rsAlumnos("PATERNOAVAL")&" "&rsAlumnos("MATERNOAVAL") %>, rut Nº <%=rsAlumnos("RUTAVAL")&"-"&rsAlumnos("DIGAVAL") %>, su calidad de fiador y codeudor solidario del alumno, conforme se establece en la cláusula octava del Contrato de Prestación de Servicos Educacionales antes referido.</p>
</div>
<div class="firmas">
    <div class="firma">
        <hr />
        <p>Alumno Regular</p>
    </div>
    <div class="firma">
        <hr />
        <p>Fiador y/o codeudor solidario</p>
    </div>
    <div class="firma_rector">
        <img alt="" src="images/firma_rec.jpg" width="150" />
        <hr />
        <p>Universidad</p>

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
</div>
