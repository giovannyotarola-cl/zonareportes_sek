<%
'primero asegurar que la session este activa, de lo contrario sacamos al login
If (Session("username") = False) Then
	Response.Redirect("default.asp?s=out")
End If
dir = Request.QueryString ("x") & ".asp"
Set fs=Server.CreateObject("Scripting.FileSystemObject")
If Request.QueryString ("x")  <> "" Then
	If (fs.FileExists(Server.MapPath(dir)) = True) Then
		'Response.Write dir
		Server.Execute(dir)
	End If
End If
%>
<script type="text/javascript" src="js/admin.js"></script>
<ul class="tabs"> 
    <li><a href="#tab1">Nuevo</a></li>
    <li><a href="#tab2">Roles</a></li>
</ul>
<div id="form-usuario">
    <div id="tab1" class="tab_content"> 
        <div id="titulo">
            <h2>Nuevo Usuario</h2>
        </div>
        <form name="formUsuario" id="formUsuario">
            <div class="titulo-form">Informaci&oacute;n Personal</div>
            <div id="getcontent"></div>
            <div id="campo">
                <div class="campo-usuario">Nombre :</div>
                <div><input type="text" name="nombre" id="nombre" /></div>
            </div>
            <div id="campo">
                <div class="campo-usuario">Apellido :</div>
                <div><input type="text" name="apellido" id="apellido" /></div>
            </div>
            <hr />
            <div class="titulo-form">Informaci&oacute;n Cuenta</div>
            <div id="campo">
                <div class="campo-usuario">Nombre de usuario :</div>
                <div><input type="text" name="nusuario" id="nusuario" /></div>
            </div>
            <div id="campo">
                <div class="campo-usuario">Clave acceso :</div>
                <div><input type="text" name="clave" id="clave" /></div>
            </div>
            <hr />
            <div id="campo">
                <div class="input"><input id="grabaUsuario" type="button" value="Grabar" /></div>
            </div>
            <input type="hidden" id="user_exixt" />
        </form>
    </div>
    <div id="tab2" class="tab_content"> 
    	<div id="titulo">
            <h2>Asignaci&oacute;n de Roles</h2>
        </div>
    </div>
</div>