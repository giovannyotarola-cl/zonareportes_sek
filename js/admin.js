function formUsuario(){
	
	var dirimgerror;
	
	$("#grabaUsuario").click(function(){
		
		if ($("#nombre").val() == ""){
			$("#nombre").addClass("campo-error");
			return false
		}else{
			$("#nombre").addClass("campo-correcto");	
		}
		if ($("#apellido").val() == ""){
			$("#apellido").addClass("campo-error");
			return false
		}else{
			$("#apellido").addClass("campo-correcto");	
		}
		if ($("#nusuario").val() != ""){
			if ($("#user_exixt").val() == "True"){
				$("#nusuario").addClass("campo-error");
					$("#getcontent" ).fadeIn(1000);
				  	$("#getcontent" ).html("El nombre de usuario " +$("#nusuario").val()+ " ya existe");
				  	$("#getcontent" ).delay(3000).fadeOut(1000);
				return false
			}else{
				$("#nusuario").addClass("campo-correcto");	
			}
		}else{
			$("#nusuario").addClass("campo-error");
			return false
		}
		if ($("#nusuario").val() == ""){
			$("#nusuario").addClass("campo-error");
			return false
		}else{
			$("#nusuario").addClass("campo-correcto");	
		}
		if ($("#clave").val() == ""){
			$("#clave").addClass("campo-error");
			return false
		}else{
			$("#clave").addClass("campo-correcto");		
		}
		
		var nombre = $("#nombre").val();
		var apellido = $("#apellido").val();
		var nusuario = $("#nusuario").val();
		var clave = $("#clave").val();
		
		$.post('admin/grabausuario.asp', {nombre: nombre, apellido: apellido, nusuario: nusuario, clave: clave },
			function(data){
			$.post('acceso.asp',{ name: "" },
				function( data ) {
				  var content = $(data).find("#getcontent");
				  $("#getcontent" ).fadeIn(1000);
				  $("#getcontent" ).html(nombre+ " " +apellido+ " a Ingresado con exito. Puede asignarle un Rol!!");
				  $("#getcontent" ).delay(3000).fadeOut(1000);
				  $("#user_exixt").val("True");
					}
				);
			}
		);
	});	
}
function existeUser(){
	
	$("#nusuario").focusout(function(){
		var nusuario = $("#nusuario").val();
		
		$.post('admin/verusuario.asp', {nusuario: nusuario },
			function(data){
				//var content = $(data).find("#user_exixt");
				$("#user_exixt").val(data);
		});												
	});
}
function formRol(){
	
	$("#grabaRoles").click(function(){
		
		if ($("#selusuario").val() == "0"){
			$("#selusuario").addClass("campo-error");
			return false
		}else{
			$("#selusuario").addClass("campo-correcto");	
		}
		if ($("#selrol").val() == "0"){
			$("#selrol").addClass("campo-error");
			return false
		}else{
			$("#selrol").addClass("campo-correcto");	
		}
		
		var selusuario = $("#selusuario").val();
		var selrol = $("#selrol").val();
		
		$.post('admin/grabarol.asp', {selusuario: selusuario, selrol: selrol},
			function(data){
			$.post('acceso.asp',{ name: "" },
				function( data ) {
				  var content = $(data).find("#getcontent");
				  $("#getcontent" ).fadeIn(1000);
				  $("#getcontent" ).html("Rol aisgnado exitosamente..");
				  $("#getcontent" ).delay(3000).fadeOut(1000);
					}
				);
			}
		);
	});
}
$(document).ready(function(){ 
	formUsuario();					   
	existeUser();
	//formRol();
});