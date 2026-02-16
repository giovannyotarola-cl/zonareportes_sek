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

function verCertificadoClick(){
	$("#verCertificado").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		if ($("#periodoDesde").val() == "0"){
			$("#periodoDesde").css("border-color", "#FD0003");
			return false;
		}
		
		if ($("#periodoHasta").val() == "0"){
			$("#periodoHasta").css("border-color", "#FD0003");
			return false;
		}
		
		var estA = $("#aprobado").attr('checked');
		var estR = $("#reprobado").attr('checked');
		var estC = $("#convalidado").attr('checked');
		var estH = $("#homologado").attr('checked');
		var estECR = $("#examencr").attr('checked');
		var sinNotas = $("#sinNotas").attr('checked');
		
		window.open("generaCertificado.asp?cr="+$("#alumno").val()+"&periodoDesde="+$("#periodoDesde").val()+"&periodoHasta="+$("#periodoHasta").val()+"&estA="+estA+"&estR="+estR+"&estC="+estC+"&estECR="+estECR+"&estH="+estH+"&sinNotas="+sinNotas+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&firma="+$("#firma").val()+"&cargo="+$("#cargo").val(),"Certificado Alumno","location=1,status=1,scrollbars=1, width=700,height=700");
	});
}

function verCalificacionesClick(){
	$("#verCalificaciones").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		window.open("generaNotas.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&firma="+$("#firma").val()+"&cargo="+$("#cargo").val()+"","Notas Alumno","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}

function verMatriculaClick(){
	$("#verMatricula").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		
		window.open("generaMatricula.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&periodo="+$("#periodo").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"&semestreActual="+$("#semestreActual").val()+"&firma="+$("#firma").val()+"&cargo="+$("#cargo").val()+"","Certificado de Matricula","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}

function verEgresadosClick() {
  
    $("#verEgresados").click(function () {
        if ($("#alumno").val() == "") {
            $("#alumno").css('border-color', '#FD0003');
            return false;
        }

        var logo = $("#muestraLogo").attr('checked');

        window.open("generaEgresados.asp?codcli=" + $("#alumno").val() + "&carr=" + $("#codCarr").val() + "&cli=" + $("#codCli").val() + "&periodo=" + $("#periodo").val() + "&fec=" + $("#inputDate").val() + "&logo=" + logo + "&semestreActual=" + $("#semestreActual").val() + "&firma=" + $("#firma").val() + "&cargo=" + $("#cargo").val() + "", "Certificado de Matricula", "location=1,status=1,scrollbars=1, width=700,height=700");
    });
}



function verTercerNivelClick(){
	$("#verTercerNivel").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		
		window.open("generaTercerNivel.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&anD="+$("#mesSemestreD").val()+"&peD="+$("#perSemestreD").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"&firma="+$("#firma").val()+"&cargo="+$("#cargo").val()+"","Certificado de Tercer Nivel","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}
function verConductaClick(){
	$("#verConducta").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		
		window.open("generaConducta.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&anD="+$("#mesSemestreD").val()+"&peD="+$("#perSemestreD").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"&firma="+$("#firma").val()+"&cargo="+$("#cargo").val()+"","Certificado de Conducta","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}

function noTerceraClick(){
	$("#noTercera").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		
		window.open("generaNoTercera.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&anD="+$("#mesSemestreD").val()+"&peD="+$("#perSemestreD").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"&firma="+$("#firma").val()+"&cargo="+$("#cargo").val()+"","No Tercera Matrícula","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}

function IECEClick(){
	$("#iece").click(function(){
		if ($("#alumno").val() == "" ){
			$("#alumno").css('border-color','#FD0003');
			return false;
		}
		
		var logo = $("#muestraLogo").attr('checked');
		
		window.open("generaIECE.asp?codcli="+$("#alumno").val()+"&carr="+$("#codCarr").val()+"&cli="+$("#codCli").val()+"&periodo="+$("#periodo").val()+"&fec="+$("#inputDate").val()+"&logo="+logo+"&semestreActual="+$("#semestreActual").val()+"&anoLectivo="+$("#inputlectivo").val()+"&carga="+$("#cargaHoraria").val()+"&costoSemestre="+$("#costoSemestre").val()+"&costoMatricula="+$("#costoMatricula").val()+"&costoAsesoria="+$("#costoAsesoria").val()+"&firma="+$("#firma").val()+"&cargo="+$("#cargo").val(),"Certificado IECE","location=1,status=1,scrollbars=1, width=700,height=700");
	});	
}
function verAnexoBecadosClick() {
    $("#verAnexoBecados").click(function () {
        window.open("generaAnexoContratoBecados.asp?codCli=" + $("#alumno").val() + "&tipoBeca=" + $("#tipoBeca").val() + "&montoBeca=" + $("#montoBeca").val() + "&valorArancel=" + $("#valorArancel").val() + "&cantidadCuotas=" + $("#cantidadCuotas").val() + "&porcentajeCuota=" + $("#porcentajeCuota").val() + "&fechaVenc=" + $("#inputDate").val(), "Anexo Contrato Becados", "location=1,status=1,scrollbars=1, width=800,height=700");
       
    });
}
function verAnexoCAEClick() {
    $("#verAnexoCAE").click(function () {
        window.open("generaAnexoContratoCAE.asp?codCli=" + $("#alumno").val() + "&valorCredito=" + $("#valorCredito").val() + "&valorArancel=" + $("#valorArancel").val() + "&cantidadCuotas=" + $("#cantidadCuotas").val() +  "&fechaVenc=" + $("#inputDate").val(), "Anexo Contrato CAE", "location=1,status=1,scrollbars=1, width=800,height=700");

    });
}
function verAnexoEliminacionResponsableClick() {
    $("#verAnexoEliminacionResponsable").click(function () {
        window.open("generaAnexoContratoEliminacionResponsable.asp?codCli=" + $("#alumno").val(), "Anexo Contrato Eliminacion Responsable", "location=1,status=1,scrollbars=1, width=800,height=700");

    });
}
function verAnexoPagarExamenFinalClick() {
    $("#verAnexoPagarExamenFinal").click(function () {
        window.open("generaAnexoContratoPagarExamenFinal.asp?codCli=" + $("#alumno").val()+"&valorMatricula="+$("#valorMatricula").val() + "&valorExamen=" + $("#valorExamenFinal").val() + "&cantCuotas=" + $("#cantidadCuotas").val() + "&fechaVenc=" + $("#inputDate").val(), "Anexo Contrato Eliminacion Responsable", "location=1,status=1,scrollbars=1, width=800,height=700");

    });
}
function verAnexoNuevoResponsableClick() {
    $("#verAnexoCambioResponsable").click(function () {
        window.open("generaAnexoContratoCambioResponsable.asp?codCli=" + $("#alumno").val() + "&nombreResponsable=" + $("#nombreResponsable").val() + "&apellidosResponsable=" + $("#apellidosResponsable").val() + "&rutResponsable=" + $("#rutResponsable").val(), "Anexo Contrato Cambio Responsable", "location=1,status=1,scrollbars=1, width=800,height=700");

    });
}

$(document).ready(function () {
    verAnexoNuevoResponsableClick();
    verAnexoPagarExamenFinalClick();
    verAnexoEliminacionResponsableClick();
    verAnexoCAEClick();
	verCertificadoClick();
	verCalificacionesClick();
	verEgresadosClick()
	verMatriculaClick();
	verTercerNivelClick();
	verConductaClick();
	noTerceraClick();
	IECEClick();
	verAnexoBecadosClick();
	//$("#inputDate").datepicker();
	//closetb();
});