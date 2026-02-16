<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" media="all" href="css/titles.css"/>
<link href="css/project.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="js/jquery-thickbox.js"></script>
<script type="text/javascript" src="js/function.js"></script>
<%
Dim sqlAlumnos, cnIndex, rsAlumnos

Set cnIndex = Server.CreateObject ("ADODB.Connection")
Set rsAlumnos = Server.CreateObject ("ADODB.Recordset")

cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=Matricula; uid=matricula;pwd=dtb01s"

sqlAlumnos = "SELECT TOP 50 MT_CLIENT.PATERNO, MT_CLIENT.MATERNO, MT_CLIENT.NOMBRE, MT_ALUMNO.RUT, CODCARPR, MT_ALUMNO.CODCLI, MT_ALUMNO.CODPESTUD, MT_CARRER.NOMBRE_C FROM MT_CLIENT INNER JOIN MT_ALUMNO ON MT_CLIENT.CODCLI = MT_ALUMNO.RUT INNER JOIN MT_CARRER ON MT_ALUMNO.CODCARPR = MT_CARRER.CODCARR "

If request("cedula") <> "" Then
	sqlAlumnos = sqlAlumnos & " WHERE RUT LIKE '%"& request("cedula") &"%'"
End If

If request("paterno") <> "" Then
	sqlAlumnos = sqlAlumnos & " AND PATERNO LIKE '%"& request("paterno") &"%'"
End If

If request("materno") <> "" Then
	sqlAlumnos = sqlAlumnos & " AND MATERNO LIKE '%"& request("materno") &"%'"
End If

If request("nombre") <> "" Then
	sqlAlumnos = sqlAlumnos & " AND NOMBRE LIKE '%"& request("nombre") &"%'"
End If
	sqlAlumnos = sqlAlumnos & " ORDER BY MT_CLIENT.PATERNO "

'response.Write sqlAlumnos
rsAlumnos.Open sqlAlumnos, cnIndex

%>
<table class="ewContentTable">
<form name="data" method="post" action="#">
<tr>
	<td>Cédula</td>
	<td>Paterno</td>
    <td>Materno</td>
    <td>Nombre</td>
    <td></td>
    <td></td>
</tr>
<tr>
	<td><input type="text" name="cedula" id="cedula" value="<%=request("cedula")%>"/></td>
	<td><input type="text" name="paterno" id="paterno" value="<%=request("paterno")%>"/></td>
    <td><input type="text" name="materno" id="materno" value="<%=request("materno")%>" /></td>
    <td><input type="text" name="nombre" id="nombre" value="<%=request("nombre")%>" /></td>
    <td></td>
    <td></td>
</tr>
<tr>
	<td colspan="6"><input type="submit" name="filtrar" id="filtrar" value="Buscar"/></td>
</tr>
<tr>
	<td colspan="6"><hr /></td>
</tr>
<tr class="buscaAlumno buscaHead">
	<th>C&eacute;dula</th>
	<th>Paterno</th>
    <th>Materno</th>
    <th>Nombre</th>
    <th>Carrera</th>
    <th>Acci&oacute;n</th>
</tr>
<% Do While not rsAlumnos.eof %>
<tr class="buscaAlumno">
	<td><%=rsAlumnos("RUT")%></td>
	<td><%=rsAlumnos("PATERNO")%></td>
    <td><%=rsAlumnos("MATERNO")%></td>
    <td><%=rsAlumnos("NOMBRE")%></td>
    <td><%=rsAlumnos("NOMBRE_C")%></td>
    <td><a onclick="javascript:selAlumno(<%=rsAlumnos("RUT")%>,'<%=rsAlumnos("CODCARPR")%>','<%=rsAlumnos("CODCLI")%>')" style="cursor:pointer; color:#03F;">seleccionar</a>
</tr>
<%
rsAlumnos.movenext
Loop				  
%>
</form>
</table>
