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

function verContratoClick(){
	$("#verContrato").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		switch($("input[name='tipoContrato']:checked").val())
		{
		case "maestria":
			window.open("generaMaestria.asp?codcli="+$("#alumno").val()+"&cli="+$("#codCli").val()+"&fec="+$("#inputDate").val()+"&valMat="+$("#valorMatricula").val()+"&valSem="+$("#valorSemestre").val()+"&semCont="+$("#semestreContrato").val()+"","Certificado de Matricula","location=1,status=1,scrollbars=1, width=1000,height=700");	
			break;
		case "crPresencial":
			window.open("generaCrPresencial.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&anD="+$("#mesSemestreD").val()+"&peD="+$("#perSemestreD").val()+"&curso="+$("#perCursoD").val()+"&fec="+$("#inputDate").val(),"Certificado de Matricula","location=1,status=1,scrollbars=1, width=700,height=700");
			break;
		case "crSemiPresencial":
			window.open("generaCrSemiPresencial.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&anD="+$("#mesSemestreD").val()+"&peD="+$("#perSemestreD").val()+"&curso="+$("#perCursoD").val()+"&fec="+$("#inputDate").val(),"Certificado de Matricula","location=1,status=1,scrollbars=1, width=700,height=700");
			break;
		case "modPresencial":
			window.open("generaModPresencial.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&anD="+$("#mesSemestreD").val()+"&peD="+$("#perSemestreD").val()+"&curso="+$("#perCursoD").val()+"&fec="+$("#inputDate").val(),"Certificado de Matricula","location=1,status=1,scrollbars=1, width=700,height=700");
			break;
		case "modSemiPresencial":
			window.open("generaModSemiPresencial.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&anD="+$("#mesSemestreD").val()+"&peD="+$("#perSemestreD").val()+"&curso="+$("#perCursoD").val()+"&fec="+$("#inputDate").val(),"Certificado de Matricula","location=1,status=1,scrollbars=1, width=700,height=700");
			break;
		}
	});	
}

$(document).ready(function(){
	verContratoClick();
});
