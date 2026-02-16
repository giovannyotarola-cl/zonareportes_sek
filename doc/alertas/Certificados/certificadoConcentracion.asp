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
		<h1>Certificado de Calificaciones</h1>
	</div>
    <div class="formulario">
        <form name="proyecto" id="proyecto" action="#" method="post" class="ewForm">
            <table class="ewContentTable ewContentData">
                <tr>
                	<td class="ewDataTop">Alumno <span class="obligatorio">*</span></td>
                    <td class="ewDataTop">
                        <input type="text" id="alumno" name="alumno" readonly="readonly" value="" />
                        <input type="hidden" id="codCarr" name="codCarr" />
                        <input type="hidden" id="codCli" name="codCli" />
                        <a href="buscaAlumno.asp?keepThis=true&TB_iframe=true&height=350&width=700" title="Buscar Alumno" class="thickbox">buscar</a>  
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="ewDataTop">Semestre <span class="obligatorio">*</span></td>
                    <td class="ewDataTop">
                        <table class="ewContentTable">
                          <tr>
                            <td>Desde:</td>
                            <td><table class="ewContentTable">
                              <tr>
                                <td>Año</td>
                                <td>
                                	<select name="ano_desde" id="ano_desde">
                                        <option value="2000">2000</option>
                                        <option value="2001">2001</option>
                                        <option value="2002">2002</option>
                                        <option value="2003">2003</option>
                                        <option value="2004">2004</option>
                                        <option value="2005">2005</option>
                                        <option value="2006">2006</option>
                                        <option value="2007">2007</option>
                                        <option value="2008">2008</option>
                                        <option value="2009">2009</option>
                                        <option value="2010">2010</option>
                                        <option value="2011">2011</option>
                                        <option value="2012">2012</option>
                                        <option value="2013">2013</option>
                                        <option value="2014">2014</option>
                                        <option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2000" selected="selected">2000</option>
                                	</select></td>
                                <td>Periodo</td>
                                <td><select name="periodo_desde" id="periodo_desde">
                                  <option value="1" selected="selected">1</option>
                                  <option value="2">2</option>
                                </select></td>
                              </tr>
                            </table></td>
                          </tr>
                            <tr>
                                <td>Hasta:</td>
                                <td>
                                	<table class="ewContentTable">
                                    	<tr>
                                        	<td>Año</td>
                                            <td>
                                            	<select name="ano_hasta" id="ano_hasta">
                                                      <option value="2000">2000</option>
                                                      <option value="2001">2001</option>
                                                      <option value="2002">2002</option>
                                                      <option value="2003">2003</option>
                                                      <option value="2004">2004</option>
                                                      <option value="2005">2005</option>
                                                      <option value="2006">2006</option>
                                                      <option value="2007">2007</option>
                                                      <option value="2008">2008</option>
                                                      <option value="2009">2009</option>
                                                      <option value="2010">2010</option>
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
                                            <td>Periodo</td>
                                            <td>
                                            	<select name="periodo_hasta" id="periodo_hasta">
                                                    <option value="1" selected="selected">1</option>
                                                    <option value="2">2</option>
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
                	<td class="ewDataTop">Tipo de certificado: </td>
                    <td class="ewDataTop"><table width="200">
                      <tr>
                        <td><label>
                          <input type="radio" name="tipoCertificado" value="1" id="tipoCertificado_0" checked="checked"/>
                          <span class="radio_conc">Aprobados</span></label></td>
                      </tr>
                      <tr>
                        <td><label>
                          <input type="radio" name="tipoCertificado" value="0" id="tipoCertificado_1" />
                          <span class="radio_conc">Aprobados y reprobados</span></label></td>
                      </tr>
                    </table>
                       
                    </td>
                </tr>
                <tr>
                	<td class="ewDataTop">Mostrar Media: </td>
                    <td class="ewDataTop">
                    	<input type="checkbox" name="muestraMedia" id="muestraMedia" checked="checked" />
                    </td>
                </tr>
                 <tr>
                	<td class="ewDataTop">Mostrar Logo: </td>
                    <td class="ewDataTop">
                    	<input type="checkbox" name="muestraLogo" id="muestraLogo" checked="checked" />
                    </td>
                </tr>
                <tr>
                	<td class="ewDataTop">Fecha: </td>
                    <td class="ewDataTop">
                       <input type="text" id="inputDate" name="inputDate" class="inputDate" value="<%=Date()%>" style="width: 75px;" />
                    </td>
                </tr>
               
                <tr>
                    <td colspan="2">Los campos marcados con <span class="obligatorio">*</span> deben ser completados.</td>
                </tr>
                <tr>
                    <td colspan="2"><input id="verConcentracion" type="button" value="Ver Certificado" /></td>
                </tr>
            </table>
        </form>
    </div>
</div> 