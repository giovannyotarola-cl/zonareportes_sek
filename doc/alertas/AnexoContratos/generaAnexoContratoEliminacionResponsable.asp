<%

Dim sqlAlumnos, cnIndex, rsAlumnos
Dim rut, valorCredito,valorArancel,cantidadCuotas,porcentajeCuota,fechaVencimiento

rut= request.QueryString("codCli")


Set cnIndex = Server.CreateObject ("ADODB.Connection")
Set rsAlumnos = Server.CreateObject ("ADODB.Recordset")
cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=Matricula; uid=sa;pwd=Sa070507"
    
	
	sqlAlumnos = "SELECT CODCLI, DIG, PATERNO, MATERNO, NOMBRE, NOMBRE_C, FEC_MAT FROM dbo.SEK_Alumnos_Matriculados_Total_Anexo_Contrato Where codCli='"& rut&"'"
  

  
	'response.Write sqlAlumnos
	rsAlumnos.Open sqlAlumnos, cnIndex

%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/project.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="print" />
<script type="text/javascript">
	window.print();
</script>
<div id="anchoPagina" style="height:700px" >
<div id="logo"><img src="images/logo.jpg"></div>

<div class="titulo"><p><b><u>ANEXO DE CONTRATO<br /> ELIMINACIÓN DE RESPONSABLE O  CODEUDOR SOLIDARIO<br /> UNIVERSIDAD INTERNACIONAL SEK</u></b></p></div>
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
    <p style="text-indent:50">En virtud de la solicitud del alumno de eliminar a quien aceptó ser el sostenedor de sus estudios y se constituyó como fiador y/o codeudor solidario de todas las obligaciones contraídas por el citado contrato, se hace necesario eliminar, mediante el presente anexo, al fiador identificado en la Cláusula Novena del Contrato de Prestación de Servicios Educacionales, celebrado entre la Universidad Internacional SEK y el alumno precedentemente individualizado.</p>
    <p style="text-indent:50">Por este mismo acto don <%=rsAlumnos("NOMBRE")&" "&rsAlumnos("PATERNO")&" "&rsAlumnos("MATERNO") %>, rut Nº <%=rsAlumnos("CODCLI")&"-"&rsAlumnos("DIG") %>,  toma conocimiento de la modificación.</p>
    <p style="text-indent:50">La Universidad, por este mismo acto, acepta el retiro del fiador y codeudor solidario antes señalado.</p>
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
