<%
session.lcid=1034
ahora = now()
fecha = date() 
Dim sqlAlumnos, cnIndex, rsAlumnos

Set cnIndex = Server.CreateObject ("ADODB.Connection")
Set rsAlumnos = Server.CreateObject ("ADODB.Recordset")
Set rsNotaFinal = Server.CreateObject ("ADODB.Recordset")
Set rsRamos = Server.CreateObject ("ADODB.Recordset")
cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=MatriculaUmasEC; uid=sa;pwd=Sa070507"

	'sqlAlumnos = "SELECT * FROM SEK_certificado_alumno WHERE RUT = '"&request("cr")&"'"
	sqlAlumnos = "SELECT matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO, matricula.MT_CLIENT.NOMBRE, matricula.MT_CLIENT.CODCLI,  matricula.MT_CLIENT.CODCLI+'-'+matricula.MT_CLIENT.DIG AS RutAlumno, matricula.MT_CARRER.NOMBRE_C, matricula.MT_CARRER.OTORTITULO, matricula.MT_CLIENT.NACIONALIDAD, matricula.MT_CLIENT.FONOACT, matricula.MT_CLIENT.DIRACTUAL+', comuna de '+matricula.MT_CLIENT.COMUNA+', '+matricula.MT_CLIENT.CIUDADACT AS DomicilioAlumno, matricula.RA_PESTUD.NOMPESTUD FROM  matricula.MT_CLIENT INNER JOIN matricula.MT_ALUMNO ON matricula.MT_CLIENT.CODCLI = matricula.MT_ALUMNO.RUT INNER JOIN matricula.MT_CARRER ON matricula.MT_ALUMNO.CODCARPR = matricula.MT_CARRER.CODCARR INNER JOIN matricula.RA_FACULTAD ON matricula.MT_CARRER.CODFAC = matricula.RA_FACULTAD.CODFAC INNER JOIN matricula.RA_PESTUD ON matricula.MT_ALUMNO.CODPESTUD = matricula.RA_PESTUD.CODPESTUD WHERE (matricula.MT_ALUMNO.RUT = '"&request("codcli")&"') "
	'response.Write sqlAlumnos
	rsAlumnos.Open sqlAlumnos, cnIndex
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/project.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="print" />
<script type="text/javascript">
	window.print();
</script>
<div id="container" style="margin-top: 0px; width: auto;">
	<div class="titulo" style="font-size:16px;">
  <p>
  <strong>UNIVERSIDAD INTERNACIONAL SEK-ECUADOR</strong>
  <img src="images/logo.jpg" class="logo_sek"/>
  <hr class="barra_titulo">
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
      <div class = "columna">
        <div class="underline_strong">CONTRATO DE SERVICIOS EDUCACIONALES MODALIDAD SEMIPRESENCIAL
        </div>
        <p> En GUAPULO, a <%=FormatDateTime(request("fec"),1)%> comparecen a la celebración del presente contrato, por una parte, la <strong>UNIVERSIDAD INTERNACIONAL SEK-ECUADOR</strong>, institución de educación superior, legalmente representada por su Rector, Doctor Rodolfo Ceprián Molina, ecuatoriano, mayor de edad, domiciliado en Quito, Distrito Metropolitano, a quien en adelante se le denominará indistintamente como <strong>LA UNIVERSIDAD</strong>, y por otra parte Don/Doña <%= rsAlumnos("NOMBRE")&" "&rsAlumnos("PATERNO")&" "&rsAlumnos("MATERNO")%>, mayor de edad, nacionalidad <%= rsAlumnos("NACIONALIDAD") %>, portador de la cédula de ciudadanía Nº <%= rsAlumnos("RutAlumno")%>, teléfono <%= rsAlumnos("FONOACT")%>  y con domicilio en <%= rsAlumnos("DomicilioAlumno") %>, a quien en adelante se le denominará como<strong> EL CONTRATANTE</strong>. Las partes son hábiles para contratar y obligarse, por lo que libre y voluntariamente acuerdan celebrar el presente Contrato de Servicios Educacionales, al tenor de las siguientes cláusulas y condiciones:<br /><strong>PRIMERO:</strong>   La Universidad acepta e inscribe como alumno regular a <strong>EL CONTRATANTE,</strong> comprometiéndose a impartirle durante el semestre académico, los estudios correspondientes a <%= rsAlumnos("NOMPESTUD") %> de la carrera de <%= rsAlumnos("NOMBRE_C")%>, Modalidad Semipresencial, conforme a los actuales planes y programas de dicha carrera, que son conocidos por el contratante. No obstante, La Universidad, se reserva la facultad de alterar sus actuales programas de estudio de dicha carrera en el caso que sus autoridades académicas lo estimaren conveniente o así lo exigiera la autoridad pública educacional. <br /><strong>SEGUNDO:</strong>   El valor de la matrícula es de $ 0,00 , y el de los servicios educacionales que <strong>EL CONTRATANTE</strong> contrata según la cláusula anterior, es de $ 2.150,00, cuyos pagos <strong>EL CONTRATANTE</strong> se compromete a realizar al contado o en cuotas por montos y con los vencimientos indicados en el presente contrato. <br />
          <strong>TERCERO:</strong>   Para facilitar el pago de los valores indicados y sin que ello constituya novación, ha cancelado sus obligaciones económicas mediante:
          <br />
          a)Tarjeta de Crédito ( );
          <br />b)Dinero efectivo ( ); 
          <br />c)Cheque Certificado ( ), No. _____________ del Banco ______________________________ .
          
          <br />Clave de Abono: Pago garantía IECE-Cheque
          <br />Observaciones: REF EFECTIVO 1252.50 REF CK INTERNAC 2 1000 V. 15/10/11 
          <br />
          <strong>CUARTO:</strong> Los pagos deberán efectuarse directamente en cualquiera de los campus de La Universidad, la que no está obligada a notificar en cada oportunidad las fechas de pago, o en el Banco que la Universidad determine.
        <br />
        </p>
      </div>
	  <div class = "columna">
        <strong>QUINTO:</strong> Las partes convienen y aceptan que tanto el valor de la matrícula como el de los servicios educacionales son valores indivisibles durante el respectivo período académico a que se refiere la cláusula primera, de tal modo que el pago de las cantidades referidas en la cláusula segunda, constituye una obligación que permanece vigente para el contratante durante todo el período por el cual se contrata, entendiéndose única y exclusivamente las facilidades de pago conferidas por La Universidad como un beneficio de ésta hacia<strong> EL CONTRATANTE</strong>. En caso de baja académica por mora, sanción disciplinaria, expulsión, faltas de asistencia  a clases o  razones  académicas, así como si <strong>EL CONTRATANTE</strong> decide desvincularse de La Universidad por cualquier motivo, <strong>EL CONTRATANTE</strong> no tendrá derecho a exigir la devolución de todo o parte de lo pagado, sea por matrícula o por servicios educacionales. <strong>EL CONTRATANTE</strong> acepta y conoce que su modalidad de estudios es semipresencial sujetándose a lo establecido en la Ley Orgánica de Educación Superior, el Reglamento Codificado del Régimen Académico del Sistema Nacional de Educación Superior y demás leyes  del Ecuador inherentes al ámbito tratado.<strong> EL CONTRATANTE </strong>declara expresa y voluntariamente, que reconoce y acepta el derecho y prerrogativa que posee La Universidad de mantener en sus oficinas la documentación académica de<strong> EL CONTRATANTE</strong> en caso de morosidad en el pago y mientras la misma persista, por lo que autoriza de manera expresa y formal a La Universidad a retener dichos documentos en los casos planteados hasta la cancelación de todas las sumas adeudadas.
Consecuente con ello, si <strong>EL CONTRATANTE</strong> se retira de La Universidad por cualquier causa, <strong>EL CONTRATANTE</strong> no tendrá derecho alguno a exigir la devolución de todo o parte de lo pagado en virtud de este contrato, sea por matrícula o por servicios educacionales, debiendo además continuar pagando íntegramente y en su oportunidad el valor total de las cuotas pactadas, se encuentren o no documentadas. <br /><strong>SEXTO:</strong>   Solo excepcionalmente y por motivos claramente fundamentados y justificados que calificará soberana y discrecionalmente La Universidad, y que impidan absolutamente a <strong>EL CONTRATANTE</strong> continuar sus estudios, podrá devolverse hasta un 30% del valor anual documentado que esté por pagarse; o hasta el 30% del valor total de los servicios educacionales, cuando estos hayan sido pagados al contado. 
Para el caso que se disponga la devolución de alguna suma ésta será efectuada en el plazo de 30 días corridos, contados de la fecha de aprobación de la respectiva solicitud. <br /><strong>SÉPTIMO:    EL CONTRATANTE</strong> declara conocer a cabalidad los reglamentos y demás normas internas que regulan el funcionamiento de La Universidad, lo que aceptan en todas sus partes. En todo caso, <strong>EL CONTRATANTE</strong> reconoce la facultad de dicho establecimiento para establecer normas docentes, académicas y de convivencia, las cuales se compromete a acatar. En caso que <strong>EL CONTRATANTE</strong> ocasionare daño al patrimonio del establecimiento,<strong> EL CONTRATANTE</strong> deberá pagar la reparación de los daños causados, sin perjuicio de las sanciones que puedan corresponderle a <strong>EL CONTRATANTE</strong>. </div>
      <div class = "columna">
        <p><strong>OCTAVO:</strong>    La Universidad suspenderá al alumno de toda actividad comprendida dentro de sus estudios, si este no se encuentra al día en el cumplimiento de sus obligaciones de pago a que se refiere este contrato, sin perjuicio del derecho de La Universidad a exigir judicial o extrajudicialmente el pago de tales obligaciones. En consecuencia, la mora en el pago de uno o cualquiera de sus compromisos dará derecho a la Universidad entre otras   facultades,  para  suspender  de clases al alumno, como también de evaluaciones, práctica profesional, direcciones de tesis y proceso de titulación.
        <br /><strong>NOVENO:</strong>   La Universidad se reserva el derecho a: 
          <br />a) Destinar a los alumnos ingresados a cualquiera de los locales autorizados que tuvieren en uso para impartir el programa.
          <br />b) Asignar el horario que estime conveniente, dentro del rango horario definido al momento de ingreso al programa.
          <br /><strong>DÉCIMO:   EL CONTRATANTE</strong> es responsable de todas las obligaciones contraídas en virtud del presente contrato.
          <br /><strong>DÉCIMO PRIMERO:</strong>   Para todos los efectos derivados de este contrato, las partes fijan domicilio en la ciudad de Quito.
          <br /><strong>DÉCIMO SEGUNDO:</strong>   En este mismo acto, <strong>EL CONTRATANTE</strong> declara expresamente que le reconoce a La Universidad el derecho a activar los grupos o asignaturas correspondientes, siempre y cuando el número de alumnos matriculados en el programa cubra las plazas mínimas necesarias para su correcto desarrollo. En caso que el curso matriculado por <strong>EL CONTRATANTE</strong> no complete el número de estudiantes mínimo requerido, La Universidad comunicará esta situación a <strong>EL CONTRATANTE</strong> con una anticipación mínima de quince días corridos previos a la fecha de inicio fijada en el programa, para que éste declare si desea matricular otro curso o el reintegro de su dinero, todo lo cual es expresamente comprendido y aceptado por <strong>EL CONTRATANTE</strong>.
          <br /><strong>DÉCIMO TERCERO:</strong>    En todo lo no contemplado en el presente instrumento, se estará a las disposiciones del Código Civil, Ley de Educación Superior y demás leyes y reglamentos conexos, así como a lo establecido por el estatuto y normas internas de UISEK y de la Institución Internacional SEK.
          <br /><strong>DÉCIMO CUARTO:</strong>     En caso de controversia, las partes acuerdan someterse al procedimiento de mediación estipulado en la ley de Arbitraje y Mediación, en el Centro que para el efecto mantiene la Cámara de Comercio de Quito. Si en este proceso las partes no llegaren a un acuerdo renuncian a su domicilio y se someten a los jueces competentes de la ciudad de Quito y al trámite judicial correspondiente.
        <br /><strong>DÉCIMO QUINTO:</strong>     Este contrato se firma en tres ejemplares de idéntico tenor y valor probatorio, quedando dos en poder de La Universidad y otro en poder de EL CONTRATANTE.
</div>
<div class="clear_both"></div>
      <div class="firma">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>______________________________________<br />
        EL CONTRATANTE, <%= rsAlumnos("NOMBRE")&" "&rsAlumnos("PATERNO")&" "&rsAlumnos("MATERNO")%>
        </p>
      </div>
      <div class="firma">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>_______________________________________<br />
        EL REPRESENTANTE Universidad Internacional SEK
        </p>
      </div>
      <div class="clear_both"></div>
<% else %>
        <p>No se ha encontrado al alumno</p>
<% end if %>
    </div>
    <div id="content_table">
     
    </div>
    <div id="footer" style="font-size:16px;">
    	
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
