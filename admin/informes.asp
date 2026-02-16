<!--#include virtual="include/config.asp"-->
<%
'primero asegurar que la session este activa, de lo contrario sacamos al login
Session.CodePage = 65001
Dim page
If (Session("username") = False) Then
	Response.Redirect("default.asp?s=out")
End If

Dim cnIndex, rsInfAcad, rsInfFina, rsInfAuto, rsInfOtro, rsTabs, rsRecob, rsSistemas, rsCerti
Set cnIndex = Server.CreateObject ("ADODB.Connection")
Set rsInfAcad = Server.CreateObject ("ADODB.Recordset")
Set rsInfFina = Server.CreateObject ("ADODB.Recordset")
Set rsInfAuto = Server.CreateObject ("ADODB.Recordset")
Set rsInfOtro = Server.CreateObject ("ADODB.Recordset")
Set rsInfCerti = Server.CreateObject ("ADODB.Recordset")
Set rsTabs = Server.CreateObject ("ADODB.Recordset")
Set rsRecob = Server.CreateObject ("ADODB.Recordset")
Set rsSistemas = Server.CreateObject("ADODB.Recordset")

cnIndex.Open Conect

rsTabs.Open "SELECT a.TABSID, a.TABSNAME, b.USERID FROM IF_ACCESOS_TABS a INNER JOIN IF_USUARIO_TABS b ON a.TABSID = b.TABSID WHERE (b.USERID = '" & Session("idusuario") & "')", cnIndex

rsInfAcad.Open "SELECT a.LINK, a.ENLACE, a.LINKDESC, a.CODLINK, b.CODLINK AS Expr1, b.TABSID, c.USERID FROM IF_INFORME_TABS AS b INNER JOIN IF_ACCESOS_DESC AS a ON b.CODLINK = a.CODLINK INNER JOIN IF_USUARIO_ACCESO AS c ON a.CODLINK = c.CODLINK WHERE (b.TABSID = 1) AND (c.USERID = '" & Session("idusuario") & "')", cnIndex

rsInfFina.Open "SELECT a.LINK, a.ENLACE, a.LINKDESC, a.CODLINK, b.CODLINK AS Expr1, b.TABSID, c.USERID FROM IF_INFORME_TABS AS b INNER JOIN IF_ACCESOS_DESC AS a ON b.CODLINK = a.CODLINK INNER JOIN IF_USUARIO_ACCESO AS c ON a.CODLINK = c.CODLINK WHERE (b.TABSID = 2) AND (c.USERID = '" & Session("idusuario") & "')", cnIndex

rsInfAuto.Open "SELECT a.LINK, a.ENLACE, a.LINKDESC, a.CODLINK, b.CODLINK AS Expr1, b.TABSID, c.USERID FROM IF_INFORME_TABS AS b INNER JOIN IF_ACCESOS_DESC AS a ON b.CODLINK = a.CODLINK INNER JOIN IF_USUARIO_ACCESO AS c ON a.CODLINK = c.CODLINK WHERE (b.TABSID = 3) AND (c.USERID = '" & Session("idusuario") & "')", cnIndex

rsInfOtro.Open "SELECT a.LINK, a.ENLACE, a.LINKDESC, a.CODLINK, b.CODLINK AS Expr1, b.TABSID, c.USERID FROM IF_INFORME_TABS AS b INNER JOIN IF_ACCESOS_DESC AS a ON b.CODLINK = a.CODLINK INNER JOIN IF_USUARIO_ACCESO AS c ON a.CODLINK = c.CODLINK WHERE (b.TABSID = 4) AND (c.USERID = '" & Session("idusuario") & "')", cnIndex

rsRecob.Open "SELECT a.LINK, a.ENLACE, a.LINKDESC, a.CODLINK, b.CODLINK AS Expr1, b.TABSID, c.USERID FROM IF_INFORME_TABS AS b INNER JOIN IF_ACCESOS_DESC AS a ON b.CODLINK = a.CODLINK INNER JOIN IF_USUARIO_ACCESO AS c ON a.CODLINK = c.CODLINK WHERE (b.TABSID = 5) AND (c.USERID = '" & Session("idusuario") & "')", cnIndex

rsSistemas.Open "SELECT a.LINK, a.ENLACE, a.LINKDESC, a.CODLINK, b.CODLINK AS Expr1, b.TABSID, c.USERID FROM IF_INFORME_TABS AS b INNER JOIN IF_ACCESOS_DESC AS a ON b.CODLINK = a.CODLINK INNER JOIN IF_USUARIO_ACCESO AS c ON a.CODLINK = c.CODLINK WHERE (b.TABSID = 12) AND (c.USERID = '" & Session("idusuario") & "')", cnIndex

rsInfCerti.Open "SELECT a.LINK, a.ENLACE, a.LINKDESC, a.CODLINK, b.CODLINK AS Expr1, b.TABSID, c.USERID FROM IF_INFORME_TABS AS b INNER JOIN IF_ACCESOS_DESC AS a ON b.CODLINK = a.CODLINK INNER JOIN IF_USUARIO_ACCESO AS c ON a.CODLINK = c.CODLINK WHERE (b.TABSID = 9) AND (c.USERID = '" & Session("idusuario") & "')", cnIndex
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<div class="main-nav">
        <ul id="main-nav" class="tabs"> 
            <%
            Do While not rsTabs.eof%>
            <li><a href="#tab<%=rsTabs.Fields("TABSID")%>" name="<%=rsTabs.Fields("TABSNAME")%>"><%=rsTabs.Fields("TABSNAME")%></a></li>
            <%rsTabs.movenext
            Loop
			rsTabs.close
			Set rsTabs = Nothing
            %>
        </ul>
    </div>
</div><!-- end #header -->
<div id="content">
	<h2><img src="images/icons/tools_32.png" alt="Manage Users" /><%=Session("nombreusuario")%></h2>
    
<div class="content-box column-left sidebar"><!-- use the class .sidebar in combination with .column-left to create a sidebar --><!-- using .closed makes sure the content box is closed by default -->
    <div class="content-box-header">
        <h3><%=Session("nombreusuario")%></h3>
    </div>
    
    <div class="content-box-content">
        <ul>
            <li><a href="acceso.asp?a=informes">Reportes</a></li>
            <li><a href="acceso.asp?a=contactos">Soporte</a></li>
            <li><a href="logout.asp">Salir</a></li>
        </ul>
    </div>
</div>

<div class="content-box column-right main">
    <div class="content-box-header">
        <h3>Reportes Disponibles para <span class="tabs-name-id"></span></h3>
    </div>
        <div id="tab1" class="tab_content">  
            <div id="campo">
             <% 
				i = 1
				a = ""
                Do While not rsInfAcad.eof%>
                <%
				float = ""
				if (i MOD 2) <> 0 Then
					response.write "<div style='height: 90px;'>"
					float = "style='float:left; width: 365px;'"
				end if
				%>
                <div id="content-campo" <%=float%>>
                    <div class="campo-informe"><h3><%=a&i&") "%><a href="" title="<%=rsInfAcad.Fields("ENLACE")%>" class="Popup" page="<%=rsInfAcad.Fields("CODLINK")%>" target="_blank" onclick="historySend('<%=rsInfAcad.Fields("ENLACE")%>','<%=rsInfAcad.Fields("CODLINK")%>','a');"><%=rsInfAcad.Fields("ENLACE")%></a></h3></div>
                    <div class="separador"></div>
                    <div class="descripcion"><p><%=rsInfAcad.Fields("LINKDESC")%></p></div>
                    <div class="separador"></div>
                </div>
                <%
				if (i MOD 2) = 0 Then
					response.write "</div><div class='linea'></div>"
				end if
				rsInfAcad.movenext
				i = i + 1
                Loop
				if (i MOD 2) = 0 Then
					response.Write("</div>")
				end if
                %>
            </div>  
        </div> 
        <div id="tab2" class="tab_content">  
            <div id="campo">
             <% 
				i = 1
				a = ""
                Do While not rsInfFina.eof%>
                <%
                if (i > 8) Then
					a = "<font color='red'>*</font>" 		
				end if
				float = ""
				if (i MOD 2) <> 0 Then
					response.write "<div style='height: 100px;'>"
					float = "style='float:left; width: 365px;'"
				end if
				%>
                <div id="content-campo" <%=float%>>
                    <div class="campo-informe"><h3><%=a&i&") "%><a href="" title="<%=rsInfFina.Fields("ENLACE")%>" class="Popup" page="<%=rsInfFina.Fields("CODLINK")%>" target="_blank" onclick="historySend('<%=rsInfFina.Fields("ENLACE")%>','<%=rsInfFina.Fields("CODLINK")%>','a');"><%=rsInfFina.Fields("ENLACE")%></a></h3></div>
                    <div class="separador"></div>
                    <div class="descripcion"><p><%=rsInfFina.Fields("LINKDESC")%></p></div>
                    <div class="separador"></div>
                </div>
                <%
				if (i MOD 2) = 0 Then
					response.write "</div><div class='linea'></div>"
				end if
				rsInfFina.movenext
				i = i + 1
                Loop
				if (i MOD 2) = 0 Then
					response.Write("</div>")
				end if
                %>
            </div>  
        </div>  
        <div id="tab3" class="tab_content">  
            <div id="campo">
                <%
				i = 1 
				a = ""
                Do While not rsInfAuto.eof%>
                <%
				if (i > 8) Then
					a = "<font color='red'>*</font>" 		
				end if
				float = ""
				if (i MOD 2) <> 0 Then
					response.write "<div style='height: 100px;'>"
					float = "style='float:left; width: 365px;'"
				end if
				%>
                <div id="content-campo" <%=float%>>
                    <div class="campo-informe"><h3><%=a&i&") "%><a href="" title="<%=rsInfAuto.Fields("ENLACE")%>" class="Popup titulo-link" page="<%=rsInfAuto.Fields("CODLINK")%>" target="_blank" onclick="historySend('<%=rsInfAuto.Fields("ENLACE")%>','<%=rsInfAuto.Fields("CODLINK")%>','a');"><%=rsInfAuto.Fields("ENLACE")%></a></h3></div>
                    <div class="separador"></div>
                    <div class="descripcion"><p><%=rsInfAuto.Fields("LINKDESC")%></p></div>
                    <div class="separador"></div>
                </div>
                <%
				if (i MOD 2) = 0 Then
					response.write "</div><div class='linea'></div>"
				end if
				rsInfAuto.movenext
				i = i + 1
                Loop
				if (i MOD 2) = 0 Then
					response.Write("</div>")
				end if
                %>
            </div> 
        </div>
        <div id="tab4" class="tab_content">  
            <div id="campo">
                <% 
                Do While not rsInfOtro.eof%>
                <div class="campo-informe"><h3><a href="" title="<%=rsInfOtro.Fields("ENLACE")%>" class="Popup titulo-link" page="<%=rsInfOtro.Fields("CODLINK")%>" target="_blank" onclick="historySend('<%=rsInfOtro.Fields("ENLACE")%>','<%=rsInfOtro.Fields("CODLINK")%>','a');"><%=rsInfOtro.Fields("ENLACE")%></a></h3></div>
                <div class="separador"></div>
                <div class="descripcion"><p><%=rsInfOtro.Fields("LINKDESC")%></p></div>
                <div class="separador"></div>
                <div class="link-informe"><a href="" title="<%=rsInfOtro.Fields("ENLACE")%>" class="Popup titulo-link" page="<%=rsInfOtro.Fields("CODLINK")%>" target="_blank">ver informe</a></div>
                <div class="linea"></div>
                <%rsInfOtro.movenext
                Loop
                %>
            </div>  
        </div>
        <div id="tab5" class="tab_content">  
            <div id="campo">
                <% 
                Do While not rsRecob.eof%>
                <div class="campo-informe"><h3><a href="" title="<%=rsRecob.Fields("ENLACE")%>" class="Popup titulo-link" page="<%=rsRecob.Fields("CODLINK")%>" target="_blank" onclick="historySend('<%=rsRecob.Fields("ENLACE")%>','<%=rsRecob.Fields("CODLINK")%>','a');"><%=rsRecob.Fields("ENLACE")%></a></h3></div>
                <div class="separador"></div>
                <div class="descripcion"><p><%=rsRecob.Fields("LINKDESC")%></p></div>
                <div class="separador"></div>
                <div class="link-informe"><a href="" title="<%=rsRecob.Fields("ENLACE")%>" class="Popup titulo-link" page="<%=rsRecob.Fields("CODLINK")%>" target="_blank">ver informe</a></div>
                <div class="linea"></div>
                <%rsRecob.movenext
                Loop
                %>
            </div>  
        </div>
		 <div id="tab8" class="tab_content">
        	<div id="campo">
        		<ul class="lista_admin">
           	     <li class="lista_admin_elem"><a href="acceso.asp?a=nuevo_usuario">Nuevo usuario</a></li>
           	     <li class="lista_admin_elem"><a href="acceso.asp?a=admin_usuarios">Administración de usuarios</a></li>
                 <li class="lista_admin_elem"><a href="acceso.asp?a=nueva_pestana">Agregar pestaña</a></li>
                 <li class="lista_admin_elem"><a href="acceso.asp?a=nuevo_proyecto">Nuevo Proyecto</a></li>
           		</ul>
        	</div>
        </div>
         <div id="tab9" class="tab_content">  
            <div id="campo">
                <% 
				i = 1
				a =""
                Do While not rsInfCerti.eof%>
                <%
				if (i > 8) Then
					a = "<font color='red'>*</font>" 		
				end if
				float = ""
				if (i MOD 2) <> 0 Then
					response.write "<div style='height: 100px;'>"
					float = "style='float:left; width: 365px;'"
				end if
				%>
                <div id="content-campo" <%=float%>>
                    <div class="campo-informe"><h3><%=i&") "%><a href="" title="<%=rsInfCerti.Fields("ENLACE")%>" class="Popup titulo-link" page="<%=rsInfCerti.Fields("CODLINK")%>" target="_blank" onclick="historySend('<%=rsInfCerti.Fields("ENLACE")%>','<%=rsInfCerti.Fields("CODLINK")%>','a');"><%=rsInfCerti.Fields("ENLACE")%></a></h3></div>
                    <div class="separador"></div>
                    <div class="descripcion"><p><%=rsInfCerti.Fields("LINKDESC")%></p></div>
                    <div class="separador"></div>
                </div>
                <%
				if (i MOD 2) = 0 Then
					response.write "</div><div class='linea'></div>"
				end if
				rsInfCerti.movenext
                i = i + 1
				Loop
				if (i MOD 2) = 0 Then
					response.Write("</div>")
				end if
                %>
            </div>  
        </div>
		<div id="tab12" class="tab_content"> 
        	<div id="campo">
                <% 
				i = 1
				a = ""
                Do While not rsSistemas.eof%>
                <%
                if (i > 8) Then
					a = "<font color='red'>*</font>" 		
				end if
				float = ""
				if (i MOD 2) <> 0 Then
					response.write "<div style='height: 80px;'>"
					float = "style='float:left; width: 365px;'"
				end if
				%>
                <div id="content-campo" <%=float%>>
                    <div class="campo-informe"><h3><%=a&i&") "%><a href="" title="<%=rsSistemas.Fields("ENLACE")%>" class="Popup" page="<%=rsSistemas.Fields("CODLINK")%>" target="_blank" onclick="historySend('<%=rsSistemas.Fields("ENLACE")%>','<%=rsSistemas.Fields("CODLINK")%>','a');"><%=rsSistemas.Fields("ENLACE")%></a></h3></div>
                    <div class="separador"></div>
                    <div class="descripcion"><p><%=rsSistemas.Fields("LINKDESC")%></p></div>
                    <div class="separador"></div>
                    <!--<div class="link-informe"><a href="" title="<%=rsSistemas.Fields("ENLACE")%>" class="Popup" page="<%=rsSistemas.Fields("CODLINK")%>" target="_blank">ver informe</a></div>-->
                </div>
                <%
				if (i MOD 2) = 0 Then
					response.write "</div><div class='linea'></div>"
				end if
				rsSistemas.movenext
				i = i + 1
                Loop
                %>
            </div>  
        </div>		
		
    </div>  
</div>

