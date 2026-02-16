<%@ Language=VBScript %>
<%Option Explicit%>
<!-- #include file="include/funciones.asp" -->
<!-- #include file="include/librerias.asp" -->
<!-- #include file="include/config.asp" -->
<!-- #include file="include/head.asp" -->
<%
Dim fso
'Set fso = CreateObject("Scripting.FileSystemObject")
%>
<!-- Firebug IExplorer
<script type="text/javascript" src="https://getfirebug.com/firebug-lite.js"></script>
-->
<%
'primero asegurar que la session este activa, de lo contrario sacamos al login
If (Session("username") = False) Then
	Response.Redirect("default.asp?s=out")
	
End If
Dim url

If Request.QueryString ("a")  <> "salir" Then
	If Request.QueryString ("a")  <> "" Then 'Si pasamos el nombre de un archivo
	 url = "admin/"&Request.QueryString ("a") & ".asp"
		'if (Not fso.FileExists(url) then ' si la pagina no existe (error.asp)
		'	url = "error.asp"
		'End If	'Si no pasamos el nombre de un archivo -> asigna al archivo de la página de error (error.asp)
	Else			
		url = "error.asp"
	End If
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<!-- Make IE8 behave like IE7, necessary for charts -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		
		<title><%=Application("TituloWEB")%></title>
		
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/reset.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="css/custom-theme/jquery-ui-1.8.1.custom.css" />
		
		<!-- IE specific CSS stylesheet -->
		<!--[if IE]>
			<link rel="stylesheet" type="text/css" media="screen" href="css/ie.css" />
		<![endif]-->
		
		<!-- This stylesheet contains advanced CSS3 features that do not validate yet -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/css3.css" />
		
		<!-- JavaScript -->
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="js/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="js/excanvas.js"></script>
		<script type="text/javascript" src="js/jquery.visualize.js"></script>
		<script type="text/javascript" src="js/script.js"></script>
	</head>
<body>
<div id="bokeh"><div id="container">
    <div id="content-general">
    	<div id="header">
            <h1 id="logo">Admin Control Panel </h1>
                    
                    <div id="header_buttons">
                        
                        <!--<a href="#modal" rel="modal"><img src="images/icons/envelope.png" alt="3 Messages" />3</a>				
                        <a href="#modal2" rel="modal">modal box test</a>-->
                       	<% if (Session("username") = "admin" or Session("username") = "soporte") Then %>
				        	<a href="acceso.asp?a=admin">Administrador</a>
  						<% end if %>
                        <% if (Session("username") = "admin" or Session("username") = "adminumas") Then %>
				        	<a href="acceso.asp?a=gestionUmas">Gestor U+</a>
  						<% end if %>
                        <a href="acceso.asp?a=informes">Reportes</a>
                        <a href="acceso.asp?a=contactos">Soporte</a>
                        <a href="logout.asp">Salir</a>
                        <!--<a href="#">view website</a>-->
                        
                    </div><!-- end #header_buttons -->
        	<!-- #include file="include/content.asp" -->
            </div>
</div></div>
    <%
Else
	url = "logout.asp"
End If
%>
<!-- #include file="include/footer.asp" -->
</body>
</html>
