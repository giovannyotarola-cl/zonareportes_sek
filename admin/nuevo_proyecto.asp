<!-- #include virtual="include/config.asp" -->
<%
Dim cnIndex, sqlUltimo, UltimoRegistro, NuevoRegistro, rsUltimo, sqlTabs, rsTabs

Set cnIndex = Server.CreateObject("ADODB.Connection")
Set rsUltimo = Server.CreateObject ("ADODB.Recordset")		
Set rsTabs = Server.CreateObject ("ADODB.Recordset")		

cnIndex.Open Conect
' Seleccionar el ultimo reporte ingresado
sqlUltimo= "SELECT MAX(CODLINK) AS ULTIMO FROM IF_ACCESOS_DESC"
rsUltimo.Open sqlUltimo, cnIndex

' Solo dejar los cararcteres numericos y luego sumarle 1
UltimoRegistro = right(rsUltimo("ULTIMO"),4)
NuevoRegistro = UltimoRegistro + 1

' Comprobar el largo de la cadena y luego armar el CODLINK del muevo reporte
Select Case len(NuevoRegistro)

	case(1)
		NuevoRegistro = "EN000"&NuevoRegistro
	case(2)
		NuevoRegistro = "EN00"&NuevoRegistro
	case(3)
		NuevoRegistro = "EN0"&NuevoRegistro
	case(4)
		NuevoRegistro = "EN"&NuevoRegistro
		
End Select

sqlTabs = "SELECT * FROM IF_ACCESOS_TABS"
rsTabs.Open sqlTabs, cnIndex

rsUltimo.close	
Set rsUltimo = Nothing

%>
</div>
<div id="content">
	<h2><img src="images/icons/tools_32.png" alt="Manage Users" /><%=Session("nombreusuario")%></h2>
    <div class="content-box column-left sidebar"><!-- use the class .sidebar in combination with .column-left to create a sidebar --><!-- using .closed makes sure the content box is closed by default -->
        <div class="content-box-header">
            <h3><%=Session("nombreusuario")%></h3>
        </div>
        
        <div class="content-box-content">
            <ul>
                <li><a href="acceso.asp?a=admin">Admin</a></li>
                <li><a href="acceso.asp?a=informes">Reportes</a></li>
                <li><a href="acceso.asp?a=contactos">Soporte</a></li>
                <li><a href="logout.asp">Salir</a></li>
            </ul>
        </div>
    </div> 
    <div class="content-box column-right main">
        <div class="content-box-header">
            <h3>Creación de proyectos</h3>
        </div>
            <div class="descripcion">
              <form method="post" action="acceso.asp?a=crear_proyecto">
              	  <div class="nuevo_proyecto_bloque" id="div_IdProyecto">ID Proyecto: 
                   	<span style="margin-left: 15px;"><%=NuevoRegistro%></span>
                    <input class="nuevo_proyecto_input" type="hidden" name="codigo" value="<%=NuevoRegistro%>">
                  </div>	
                  <div class="nuevo_proyecto_bloque">Directorio: 
                    <input class="nuevo_proyecto_input" type="text" name="directorio">
                  </div>
                  <div class="nuevo_proyecto_bloque">Archivo: 
                    <input class="nuevo_proyecto_input" type="text" name="link">
                  </div>
                  <div class="nuevo_proyecto_bloque">T&iacute;tulo: 
                    <input class="nuevo_proyecto_input" type="text" name="enlace">
                  </div>
                  <div class="nuevo_proyecto_bloque">Descripci&oacute;n: 
                    <input class="nuevo_proyecto_input" type="text" name="descripcion">
                  </div>
                  <div class="nuevo_proyecto_bloque" style="width: 400px;"><span style="padding-right: 31px;">Pesta&ntilde;a:</span> 
                  	<select class="nuevo_proyecto_input" name="pestania">
                    <%
					Do While Not rsTabs.Eof
					%>
                    	<option value="<%=rsTabs("TABSID")%>"><%=rsTabs("TABSNAME")%></option>
                    <%	
					rsTabs.movenext
					Loop
					%>
                    </select>
                  </div>
                  <div class="nuevo_proyecto_bloque">Extensi&oacute;n: 
                  	<span style="margin-left: 15px;">
                        <input type="radio" name="extencion" value="asp" /> .asp
                        <input type="radio" name="extencion" value="aspx" /> .aspx
                    </span>
                  </div>
                  <div class="nuevo_proyecto_bloque">
                  	<input type="submit" value="Crear proyecto">
                  </div>
              </form>
                <div class="nuevo_proyecto_bloque">
                    <a href="acceso.asp?a=admin">Volver</a>
                    <br /><br />
                </div>
      		</div>
    </div>
</div>