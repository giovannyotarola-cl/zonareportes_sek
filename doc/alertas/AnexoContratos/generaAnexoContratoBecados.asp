<%

Dim sqlAlumnos, cnIndex, rsAlumnos
Dim rut, tipoBeca,montoBeca,valorCancelar,cantidadCuotas,porcentajeCuota,fechaVencimiento,valorArancel

rut= request.QueryString("codCli")
tipoBeca=request.QueryString("tipoBeca")
montoBeca=request.QueryString("montoBeca")
valorArancel=request.QueryString("valorArancel")
valorCancelar=valorArancel-montoBeca
cantidadCuotas=request.QueryString("cantidadCuotas")
porcentajeCuota=((montoBeca)*100)/valorArancel


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
<body>
<div id="anchoPagina">
<div id="logo"><img src="images/logo.jpg"></div>

<div class="titulo">
    <p>
        <b>
            <u>
                ANEXO DE CONTRATO ALUMNOS<br /> 
                BECADOS DECRETO 116 O REGLAMENTO INTERNO DE BECAS<br /> 
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
        <tr>
            <td>Tipo de Beca:</td>
            <td><%=tipoBeca %></td>
        </tr>
    </table>
</div>
<div id="container">
	<p style="text-indent:50">En Santiago a <%=Day(date()) %> de <%=MonthName(Month(Date()))  %> de <%=Year(Date()) %>, entre la Universidad Internacional SEK, rut 71.618.600-8, y el alumno don <%=rsAlumnos("NOMBRE")&" "&rsAlumnos("PATERNO")&" "&rsAlumnos("MATERNO") %> , rut Nº <%=rsAlumnos("CODCLI")&"-"&rsAlumnos("DIG") %>  , se ha convenido el siguiente Anexo al Contrato de Prestación de Servicos Educacionales de fecha <%=Date()%>, suscrito entre las mismas partes.</p>
    <p style="text-indent:50">En virtud de haber sido beneficiado el alumno con Beca de Arancel, de acuerdo a lo normado en el Decreto Nº 116/2012 del Ministerio de Educación que  reglamenta el programa de Becas de Educación Superior, o al Reglamento Interno de Becas Decreto de Rectoría vigente, se hace necesario modificar las condiciones de pagos establecidas en la Cláusula Cuarta del Contrato de Prestación de Servicios Educacionales, celebrado entre la Universidad Internacional SEK y el alumno precedentemente individualizado, de conformidad a las siguientes estipulaciones</p>
    <p style="padding-left:50px">Las nuevas condiciones de pago de la colegiatura que reemplazaran a las ya pactadas serán:</p>
    <p style="padding-left:50px">En el caso de Las Becas de Arancel normadas por el Decreto Nº 116/2012:</p>
    <p style="padding-left:50px; text-indent:-15">a)  Una cuota por el monto de la Beca otorgada correspondiente al 100% de lo fijado por Decreto que equivale a $<%=montoBeca %>.</p>
    <p style="padding-left:50px; text-indent:-15">b)  El diferencial que se produzca entre la cantidad otorgada según Decreto y el arancel contado fijado por la institución, por la carrera ya individualizada, para el presente año equivalente a $<%=valorCancelar %>,  deberá ser pagado por el alumno y/o el codeudor solidario del alumno, ya identificado en el Contrato de Prestación de Servicios Educacionales, pago que se efectuará en <%=cantidadCuotas %> cuotas mensuales, iguales y sucesivas, de <%=Int(request.QueryString("valorCancelar")/request.QueryString("cantidadCuotas"))%>  cada una, venciendo la primera cuota el día <%=Day(fechaVencimiento)%> del mes de <%=MonthName(Month(fechaVencimiento)) %>  del año <%=Year(fechaVencimiento) %>.</p>
    <p style="padding-left:50px">En el caso de Las Becas de Arancel normada por Reglamento Interno de Becas, Decreto Rectoría vigente:</p>
    <p style="padding-left:50px; text-indent:-15">a)  Descuento del porcentaje otorgado equivalente a un <%=porcentajeCuota %>%, aplicado a la forma de pago por pactar</p>
    <p style="padding-left:50px; text-indent:-15">b)  El diferencial que se produzca entre el porcentaje otorgado y el arancel fijado por la Institución, para la carrera ya individualizada, para el presente año equivalente a $<%=valorCancelar %>, deberá ser pagado por el alumno y/o el codeudor solidario del alumno, ya identificado en el Contrato de Prestación de Servicios Educacionales, pago que se efectuará en <%=cantidadCuotas %> cuotas mensuales, iguales y sucesivas, de $<%=Int(valorCancelar/cantidadCuotas)%> cada una, venciendo la primera cuota el día <%=Day(fechaVencimiento)%> del mes de <%=MonthName(Month(fechaVencimiento)) %> del año <%=Year(fechaVencimiento) %>.</p>
    <p style="text-indent:50">Suscribe también este Anexo don <%=rsAlumnos("NOMBREAVAL")&" "&rsAlumnos("PATERNOAVAL")&" "&rsAlumnos("MATERNOAVAL") %>, rut Nº <%=rsAlumnos("RUTAVAL")&"-"&rsAlumnos("DIGAVAL") %>, en su calidad de fiador y codeudor solidario del alumno, conforme se establece en la cláusula octava del Contrato de Prestación de Servicos Educacionales antes referido.</p>
    <div id="content_table">
     
    </div>
</div>
    <div class="firmas">
    <div class="firma">
        <hr />
        <p >Alumno Regular</p>
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
</div>
</body>
