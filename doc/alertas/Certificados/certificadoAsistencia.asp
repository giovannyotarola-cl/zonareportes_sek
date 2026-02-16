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
		<h1>Certificado de Asistencia</h1>
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
                    <td valign="top" class="ewDataTop">Año<span class="obligatorio">*</span></td>
                    <td class="ewDataTop">
                        <table class="ewContentTable">
                            <tr>
                                <td>
                                	<table class="ewContentTable">
                                    	<tr>
                                        	<td>Año</td>
                                            <td>
                                            	<select name="ano" id="ano">
                                                    <option value="2011">2011</option>
                                                    <option value="2012">2012</option>
                                                    <option value="2013">2013</option>
                                                    <option value="2014">2014</option>
													<option value="2015">2015</option>
													<option value="2016">2016</option>
													<option value="2017">2017</option>
													<option value="2018">2018</option>
													<option value="2019">2019</option>
                                                    <option value="2020" selected="selected">2020</option>
													
                                                </select>
                                            </td>
                                        </tr>
                                    </table> 
                                </td>
                            </tr>
                    	</table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="ewDataTop">Curso<span class="obligatorio">*</span></td>
                    <td class="ewDataTop">
                        <table class="ewContentTable">
                            <tr>
                                <td>
                                	<table class="ewContentTable">
                                    	<tr>
                                        	<td>Curso</td>
                                            <td>
                                            	<select name="curso" id="curso">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table> 
                                </td>
                            </tr>
                    	</table>
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
                    <td colspan="2"><input id="verAsistencia" type="button" value="ver certificado" /></td>
                </tr>
            </table>
        </form>
    </div>
</div> 