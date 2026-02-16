<!--#Include file ="includes/conn.asp" -->
<%
   Set cnIndex = Server.CreateObject ("ADODB.Connection")
   Set rsCodcli = Server.CreateObject ("ADODB.Recordset")
   Set rsSemestre = Server.CreateObject ("ADODB.Recordset")
   Set rsAlumno = Server.CreateObject ("ADODB.Recordset")
   Set rsUpdate = Server.CreateObject ("ADODB.Recordset")
   cnIndex.Open Conect
   		
   'SqlCodcli = "SELECT * FROM SEK_Alertas WHERE (Fecha >= '"&Date()&"') AND (Enviado = 0)"
   SqlCodcli = "SELECT * FROM SEK_Alertas WHERE (Enviado = 0)"
   rsCodcli.Open SqlCodcli, cnIndex
   
   SqlSemestre = "SELECT ANO, PERIODO FROM MT_PARAME"
   rsSemestre.Open SqlSemestre, cnIndex
   Semestre = rsSemestre("ANO")&"-"&rsSemestre("PERIODO")
   
   While Not rsCodcli.eof
   	CodCli = rsCodcli("CODCLI")
	Id = rsCodcli("id")
	Correo = rsCodcli("email")
	Alumno = rsCodcli("NombreAlumno")
	CodRamo = rsCodcli("CodAsignatura")
	Asignatura = rsCodcli("NombreAsignatura")
	Seccion = rsCodcli("Seccion")
	Profesor = rsCodcli("NombreProfesor")
	CodCarr = rsCodcli("CODCARRERA")
	Carrera = rsCodcli("NOMBRECARRERA")
	
	If(rsCodcli("TipoAlerta") = 1) Then
		'Response.Write("Falta a clases")
		Call EnviaCorreosInasistencia(Id, Profesor, CodCli, Correo, Alumno, CodRamo, Asignatura, CodCarr, Carrera, Inasistencias)
	End If
	
	If(rsCodcli("TipoAlerta") = 2) Then
		'Response.Write("Falta a examen")
		Call EnviaCorreosExamen(Id, Profesor, CodCli, Correo, Alumno, CodRamo, Asignatura, CodCarr, Carrera, Inasistencias)
	End If
   rsCodcli.movenext
   Wend
   
   'Funcion para el envio de correo por falta de Asistencia
   Function EnviaCorreosInasistencia(Id, Profesor, CodCli, Correo, Alumno, CodRamo, Asignatura, CodCarr, Carrera, Inasistencias)
   
	SqlAlumno = "SELECT RUT FROM MT_ALUMNO WHERE CODCLI = '"&CodCli&"'"
	rsAlumno.Open SqlAlumno, cnIndex
	
   	contenido = ""
	contenido = contenido & "<div id='mail_content' style='position:absolute; padding:15px; border:1px solid #cccccc; left:40%; background:#FFFFFF;'>"
	contenido = contenido & "<div class='tabla' style='font-family:Tahoma, Geneva, sans-serif'>"
	contenido = contenido & "<table>"
	contenido = contenido & "<tr><th style='font-size:13px;'>Alerta de Inasistencias Reiteradas.</th></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Estimado Jefe de Carrera.</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Este correo se le ha enviado con el objetivo de informar las inasistencias reiteradas del alumno <b>"&Alumno&"</b></td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Informaci&oacute;n del Alumno</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Rut: "&rsAlumno("RUT")&"</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Carrera: "&CodCarr&" - "&Carrera&"</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Asignatura: "&CodRamo&" - "&Asignatura&"</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Secci&oacute;n: "&Seccion&"</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Profesor: "&Profesor&"</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Universidad Internacional SEK Chile</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Direcci&oacute;n de Educaci&oacute;n.</td></tr>"
	contenido = contenido & "</table>"
	contenido = contenido & "</div>"
	contenido = contenido & "</div>"
	
	On Error Resume Next
	Dim ObjSendMail
	Set ObjSendMail = CreateObject("CDO.Message")
		
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") ="smtp.gmail.com"
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True 
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") ="alertas@zonavirtual.uisek.cl"
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") ="1l2rt1s2k"
	
	ObjSendMail.Configuration.Fields.Update
	
	ObjSendMail.From = "alertas@uisek.cl"	
	ObjSendMail.To = Correo
	'ObjSendMail.To = "pablo.santibanez@uisek.cl"

	ObjSendMail.Subject = "Alerta de Inasistencias Reiteradas."
	
	ObjSendMail.HTMLBody = Contenido
	'ObjSendMail.TextBody = "this is the body"
	ObjSendMail.Send

	If Err.Number <> 0 Then
		SqlUpdate = "UPDATE SEK_Alertas SET Enviado = 0 WHERE (Id= "&Id&")"
		rsUpdate.Open SqlUpdate, cnIndex
		Estado = "Error "&Err.Number
	Else
		SqlUpdate = "UPDATE SEK_Alertas SET Enviado = 1 WHERE (Id= "&Id&")"
		rsUpdate.Open SqlUpdate, cnIndex
		Estado = "Enviado"
	End If
	Set ObjSendMail = Nothing
	rsAlumno.Close
	'Response.Write(contenido)
	'Response.write("Enviado Correo a: <b>"&Correo&"</b> Por alumno: <b>"&Alumno&"</b> con <b>reiteradas</b> inasistencias. Estado del envio: "&Estado&"<br>")
   End Function 
   
   'Funcion para el envio de correo por falta de Examenes
   Function EnviaCorreosExamen(Id, Profesor, CodCli, Correo, Alumno, CodRamo, Asignatura, CodCarr, Carrera, Inasistencias)
   
	SqlAlumno = "SELECT RUT FROM MT_ALUMNO WHERE CODCLI = '"&CodCli&"'"
	rsAlumno.Open SqlAlumno, cnIndex
	
   	contenido = ""
	contenido = contenido & "<div id='mail_content' style='position:absolute; padding:15px; border:1px solid #cccccc; left:40%; background:#FFFFFF;'>"
	contenido = contenido & "<div class='tabla' style='font-family:Tahoma, Geneva, sans-serif'>"
	contenido = contenido & "<table>"
	contenido = contenido & "<tr><th style='font-size:13px;'>No Presentaci&oacute;n a Examen</th></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Estimado Jefe de Carrera.</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Este correo se le ha enviado con el objetivo de informar que el alumno <b>"&Alumno&"</b> no se ha presentado a rendir un Examen</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Informaci&oacute;n del Alumno</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Rut: "&rsAlumno("RUT")&"</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Carrera: "&CodCarr&" - "&Carrera&"</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Asignatura: "&CodRamo&" - "&Asignatura&"</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Secci&oacute;n: "&Seccion&"</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Profesor: "&Profesor&"</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>&nbsp;</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Universidad Internacional SEK Chile</td></tr>"
	contenido = contenido & "<tr><td style='font-size:12px; font-weight:bold;'>Direcci&oacute;n de Educaci&oacute;n.</td></tr>"
	contenido = contenido & "</table>"
	contenido = contenido & "</div>"
	contenido = contenido & "</div>"
	
	On Error Resume Next
	Dim ObjSendMail
	Set ObjSendMail = CreateObject("CDO.Message")
		
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") ="smtp.gmail.com"
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True 
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") ="alertas@zonavirtual.uisek.cl"
	ObjSendMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") ="1l2rt1s2k"
	
	ObjSendMail.Configuration.Fields.Update
	
	ObjSendMail.From = "alertas@uisek.cl"	
	ObjSendMail.To = Correo
	'ObjSendMail.To = "pablo.santibanez@uisek.cl"

	ObjSendMail.Subject = "Alerta de Inasistencias Reiteradas."
	
	ObjSendMail.HTMLBody = Contenido
	'ObjSendMail.TextBody = "this is the body"
	ObjSendMail.Send

	If Err.Number <> 0 Then
		SqlUpdate = "UPDATE SEK_Alertas SET Enviado = 0 WHERE (Id= "&Id&")"
		rsUpdate.Open SqlUpdate, cnIndex
		Estado = "Error "&Err.Number
	Else
		SqlUpdate = "UPDATE SEK_Alertas SET Enviado = 1 WHERE (Id= "&Id&")"
		rsUpdate.Open SqlUpdate, cnIndex
		Estado = "Enviado"
	End If
	Set ObjSendMail = Nothing
	rsAlumno.Close
	'Response.Write(contenido)
	'Response.write("Enviado Correo a: <b>"&Correo&"</b> Por alumno: <b>"&Alumno&"</b> con <b>reiteradas</b> inasistencias. Estado del envio: "&Estado&"<br>")
   End Function 
   
%>
