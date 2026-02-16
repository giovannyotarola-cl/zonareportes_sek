function openDir(){
	/*$("a.Popup").open({
	  fullscreen: true,				  
      scrollbars: false
   });*/
}

function historySend(reporte, codigo, tipo){
	
		$.post('include/grabaHistorial.asp',{reporte:reporte, codigo:codigo, tipo:tipo});
}

function enviaInforme(){
	
	$("a.Popup").mouseover(function(){
		var dir = $(this).attr("page");	
		
		$.post('doc/default.asp',{dir:dir},
		function(data) {
			var content = $(data).find( '#getInforme' );
          	$("#getInforme" ).html(content);
		});
		$(this).attr("href","doc/default.asp?acc="+dir);
		//md5 = $.md5(dir);
		
	});
}

function cargaTabs(){
	//Al cargar la pagina
	$(".tab_content").hide(); //Ocultar Todos los Tabs
	$("ul.tabs li:first").addClass("active").show(); //Activar primer tabs con la clase ative
	var tabs = $("ul.tabs li:first").find("a").attr("href");
	$(".tabs-name-id").html("<b>Academia</b>"); //Por defecto el Tabs al cargar es Academia
	$(".tab_content:"+tabs+"").show(); //Mostrar el promer tabs encontrado

	//En el evento cick de los tabs
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		var tabname = $(this).find("a").attr("name"); //Buscamos en el link el atributo name para saber el nombre del Tabs
		$(".tabs-name-id").html("<b>"+tabname+"</b>");
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});	
}

$(document).ready(function(){ 				   
	cargaTabs();
	//openDir();
	enviaInforme();	
});