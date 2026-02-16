<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" media="all" href="css/titles.css"/>
<link href="css/project.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="all" href="css/thickbox.css"/>
<link rel="stylesheet" href="css/datepicker.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="js/jquery-thickbox.js"></script>
<script type="text/javascript" src="js/datepicker.js"></script>
<script type="text/javascript" src="js/eye.js"></script>
<script type="text/javascript" src="js/layout.js?ver=1.0.2"></script>
<script type="text/javascript" src="js/function.js"></script>
<div id="ewLayout">
    <div id="underline">
		<h1>Certificado de Grado</h1>
	</div>
    <div class="formulario">
        <form name="proyecto" id="proyecto" action="#" method="post" class="ewForm">
            <table class="ewContentTable ewContentData">
                <tr>
                	<td class="ewDataTop">Alumno <span class="obligatorio">*</span></td>
                    <td class="ewDataTop">
                        <input type="text" id="alumno" name="alumno" readonly="readonly" value="" />
                        <input type="hidden" id="codCarr" name="cosCarr" />
                        <input type="hidden" id="codCli" name="codCli" />
                        <a href="buscaAlumno.asp?keepThis=true&TB_iframe=true&height=350&width=700" title="Buscar Alumno" class="thickbox">buscar</a>  
                    </td>
                </tr>
                 <tr>
                	<td class="ewDataTop">Calificación: </td>
                    <td class="ewDataTop">
                       <input type="text" id="inputCalificacion" name="inputCalificacion" style="width: 75px;" />
                    </td>
                </tr>
                <tr>
                	<td class="ewDataTop">Fecha: </td>
                    <td class="ewDataTop">
                       <input type="text" id="inputDate" name="inputDate" class="inputDate" value="<%=Date()%>" style="width: 75px;" />
                    </td>
                </tr>
                <tr>
                	<td class="ewDataTop">Mostrar Logo: </td>
                    <td class="ewDataTop">
                    	<input type="checkbox" name="muestraLogo" id="muestraLogo" checked="checked" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">Los campos marcados con <span class="obligatorio">*</span> deben ser completados.</td>
                </tr>
                <tr>
                    <td colspan="2"><input id="verGrado" type="button" value="ver certificado" /></td>
                </tr>
            </table>
        </form>
    </div>
</div> 