<head>
    <title></title>
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
    <style type="text/css">
        .auto-style1
        {
            background: #EBEBE4;
            border: 1px solid #ccc;
            height: 26px;
        }
    </style>
</head>
<div id="ewLayout">
    <div id="underline">
	</div>
    <div class="formulario">
        <form name="proyecto" id="proyecto" action="#" method="post" class="ewForm">
            <table class="ewContentTable ewContentData">
                <tr>
                	<td class="auto-style1">Alumno <span class="obligatorio">*</span></td>
                    <td class="auto-style1">
                        <input type="text" id="alumno" name="alumno" readonly="readonly" value="" />
                        <input type="hidden" id="codCarr" name="codCarr" />
                        <input type="hidden" id="codCli" name="codCli" />
                        <a href="buscaAlumno.asp?keepThis=true&TB_iframe=true&height=350&width=750" title="Buscar Alumno" class="thickbox">buscar</a>  
                    </td>
                </tr>
               <!-- <tr>
                    <td valign="top" class="ewDataTop">Semestre <span class="obligatorio">*</span></td>
                    <td class="ewDataTop">
                        <table class="ewContentTable">
                            <tr>
                                <td>Desde:</td>
                                <td>
                                	<table class="ewContentTable">
                                    	<tr>
                                        	<td>
                                        	<select name="periodo" id="periodo">
                                                    <option value="2010-1">2010-1 (OC09)</option>
                                                    <option value="2010-2">2010-2 (MR10)</option>                                                    
                                                    <option value="2011-1">2011-1 (OC10)</option>
                                                    <option value="2011-2">2011-2 (MR11)</option>
                                                    <option value="2012-1">2012-1 (OC11)</option>
                                                    <option value="2012-2">2012-2 (MR12)</option>
				                                    <option value="2013-1">2013-1 (OC12)</option>
                                                    <option value="2013-2">2013-2 (MR13)</option>   
                                               </select>
                                             <td>
                                        </tr>
                                    </table> 
                                </td>
                            </tr>
                    	</table>
                    </td>
                </tr>-->
                <!--<tr>
                <td height="23" class="ewDataTop">Semestre actual: </td>
                    <td class="ewDataTop"><select name="semestreActual" id="semestreActual">
                      <option value="1" selected="selected">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                    </select></td>
                </tr>-->
                
                 <tr>
                	<td class="ewDataTop">Tipo Beca </td>
                    <td class="ewDataTop">
                        <select id="tipoBeca">
                            <option></option>
                            <option>Beca Juan Gomez Milla</option>
                            <option>Beca Puntaje PSU</option>
                            <option>Beca Excelencia Academica</option>
                            <option>Beca hijos de profesionales de la Educacion</option>
                            <option>Beca Reparacion (Valech)</option>
                            <option>Beca Articulacion</option>

                        </select>
                    </td>
                </tr>
                 <tr>
                	<td class="ewDataTop">Monto Beca</td>
                    <td class="ewDataTop">
                    	<input type="text" name="montoBeca" id="montoBeca" value=""/>
                    </td>
                </tr>
                <tr>
                	<td class="ewDataTop">Arancel Carrera</td>
                    <td class="ewDataTop">
                    	<input type="text" name="valorArancel" id="valorArancel" value=""/>
                    </td>
                </tr>
                <tr>
                	<td class="ewDataTop">Cantidad Cuotas</td>
                    <td class="ewDataTop">
                    	<input type="text" name="cantidadCuotas" id="cantidadCuotas" value=""/>
                    </td>
                </tr>
                <tr>
                	<td class="ewDataTop">Fecha Vencimiento</td>
                    <td class="ewDataTop">
                       <input type="text" id="inputDate" name="inputDate" class="inputDate" value="<%=Date()%>" style="width: 75px;" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">Los campos marcados con <span class="obligatorio">*</span> deben ser completados.</td>
                </tr>
                <tr>
                    <td colspan="2"><input id="verAnexoBecados" type="button" value="Ver Anexo" /></td>
                </tr>
            </table>
        </form>
    </div>
</div> 