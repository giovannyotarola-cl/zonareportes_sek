function filtro(){
	$("#paterno").blur(function(){
		$.post('buscaAlumno.asp', { paterno: $("#paterno").val()}, function(data) {
			 location.reload(data);
		});
	});	
}
function selAlumno(rut,codcar,codcli){
	parent.$("#alumno").val(rut);
	parent.$("#codCarr").val(codcar);
	parent.$("#codCli").val(codcli);
	if (parent.$("#alumno") != "") {
		parent.tb_remove();
	}
}

function verMatriculaClick(){
	$("#verMatricula").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		
		window.open("generaMatricula.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&anD="+$("#mesSemestreD").val()+"&peD="+$("#perSemestreD").val()+"&curso="+$("#perCursoD").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"","Certificado de Matricula","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}

function verEgresoClick(){
	$("#verEgreso").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		
		window.open("generaEgreso.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"","Certificado de Egreso","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}
function verTituloClick(){
	$("#verTitulo").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		
		window.open("generaTitulo.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&calificacion="+$("#inputCalificacion").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"","Certificado de Egreso","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}
function verGradoClick(){
	$("#verGrado").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		
		window.open("generaGrado.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&calificacion="+$("#inputCalificacion").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"","Certificado de Egreso","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}

function verConcentracionClick(){
	$("#verConcentracion").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		var media = $("#muestraMedia").attr('checked');
		
		window.open("generaConcentracion.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&anoDesde="+$("#ano_desde").val()+"&periodoDesde="+$("#periodo_desde").val()+"&anoHasta="+$("#ano_hasta").val()+"&periodoHasta="+$("#periodo_hasta").val()+"&tipo="+$("input[name=tipoCertificado]:checked").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"&media="+media+"","Certificado de Egreso","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}

function verAsignacionFamiliarClick(){
	$("#verAsignacionFamiliar").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		
		window.open("generaAsignacionFamiliar.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&anD="+$("#mesSemestreD").val()+"&peD="+$("#perSemestreD").val()+"&curso="+$("#perCursoD").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"","Certificado de Matricula","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}

function verAsistenciaClick(){
	$("#verAsistencia").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		
		window.open("generaAsistencia.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&curso="+$("#curso").val()+"&ano="+$("#ano").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"","Certificado de Asistencia","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}

$(document).ready(function(){
	verMatriculaClick();
	verEgresoClick();
	verTituloClick();
	verGradoClick();
	verConcentracionClick();
	verAsignacionFamiliarClick();
	verAsistenciaClick();
	//$("#inputDate").datepicker();
	//closetb();
});