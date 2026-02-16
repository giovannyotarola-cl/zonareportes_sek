<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!-- Make IE8 behave like IE7, necessary for charts -->
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		
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
			
			<div id="header">
				<h1 id="logo">Admin Control Panel</h1>
			</div><!-- end #header -->
			
			<div id="content">
			
				<h2><img src="images/icons/user_32.png" alt="Login" /><%=Application ("TituloCajaLogin")%></h2>
			
				<div id="login">
					
					<div class="content-box">
						<div class="content-box-header">
							<h3><%=Application ("TituloCajaLogin")%></h3>
						</div>
					
						<div class="content-box-content">
						
							<div class="notification information">Usuario y Contraseña para Ingresar.</div>
						
							<form method="post" name="forms-login" action="control.asp">
								<p>
									<label>Username</label>
									<input name="Username" id="username" type="text"/>
								</p>
						
								<p>
									<label>Password</label>
									<input name="Pass" id="password" type="password"/>
								</p>
						
								<input type="submit" value="Ingresar" />
							</form>
						</div>
					</div><!-- end .content-box -->
				</div><!-- end #login -->
											
			</div><!-- end #content -->
			
			<div id="push"></div><!-- push footer down -->
			
		</div></div><!-- end #container -->
		
		<div id="footer">
			Zona de Reportes UISEK | Departamento Tecnol&oacute;gico Universidad <a href="http://www.uisek.cl/"> UISEK </a> 2018
		</div><!-- end #footer and #bokeh -->
		
	</body>
</html>