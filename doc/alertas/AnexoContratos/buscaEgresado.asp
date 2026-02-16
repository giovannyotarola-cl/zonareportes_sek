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

cnIndex.Open "driver={SQL Server};server=192.168.100.226; database=NAV_UISEK_ECUADOR; uid=sa;pwd=Sa070507"

sqlAlumnos = "SELECT TOP 15 CAST(dbo.Customer.[VAT Registration No_]AS numeric(18,0)) AS RUT, dbo.Customer.[Apellido 1] AS PATERNO, dbo.Customer.[Apellido 2] AS MATERNO," _ 
            & "  dbo.Customer.Nombre AS NOMBRE, dbo.Egresados._Carrera AS CODCARPR, dbo.Egresados.[CodCliU+] AS CODCLI, " _
			& " dbo.Egresados._PlanEstudios AS CODPESTUD, dbo.[UISEK_ECUADOR$CarrerasU+].Carrera AS NOMBRE_C, " _
			& " dbo.FechaEgresamiento(dbo.Egresados._Centro,dbo.Egresados._PlanEstudios, dbo.Egresados.[Pasantia Final], dbo.Egresados.Ingles, " _
			& " dbo.Egresados.[Fecha Cumplimiento],  dbo.Egresados.[Comunidad Final]) AS [Fecha Egresamiento]			" _
			& " FROM dbo.Egresados LEFT OUTER JOIN dbo.[UISEK_ECUADOR$CarrerasU+] ON dbo.Egresados._Carrera = dbo.[UISEK_ECUADOR$CarrerasU+].CodCarrera " _
			& " LEFT OUTER JOIN dbo.Customer ON dbo.Egresados.CodAlumno = dbo.Customer.No_ WHERE dbo.Customer.[VAT Registration No_]<>'' " _
			& " AND dbo.FechaEgresamiento(dbo.Egresados._Centro,dbo.Egresados._PlanEstudios, dbo.Egresados.[Pasantia Final], dbo.Egresados.Ingles, " _
			& " dbo.Egresados.[Fecha Cumplimiento],  dbo.Egresados.[Comunidad Final]) >'1-1-1900' "

If request("cedula") <> "" Then
	sqlAlumnos = sqlAlumnos & "AND [VAT Registration No_] LIKE '%"& request("cedula") &"%'"
End If

If request("paterno") <> "" Then
	sqlAlumnos = sqlAlumnos & " AND [Apellido 1]  LIKE '%"& request("paterno") &"%'"
End If

If request("materno") <> "" Then
	sqlAlumnos = sqlAlumnos & " AND [Apellido 2]  LIKE '%"& request("materno") &"%'"
End If

If request("nombre") <> "" Then
	sqlAlumnos = sqlAlumnos & " AND NOMBRE LIKE '%"& request("nombre") &"%'"
End If
	sqlAlumnos = sqlAlumnos & " ORDER BY [Apellido 1]  "

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
    <td></td>
</tr>
<tr>
	<td><input type="text" name="cedula" id="cedula" value="<%=request("cedula")%>"/></td>
	<td><input type="text" name="paterno" id="paterno" value="<%=request("paterno")%>"/></td>
    <td><input type="text" name="materno" id="materno" value="<%=request("materno")%>" /></td>
    <td><input type="text" name="nombre" id="nombre" value="<%=request("nombre")%>" /></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
	<td colspan="7"><input type="submit" name="filtrar" id="filtrar" value="Buscar"/></td>
</tr>
<tr>
	<td colspan="7"><hr /></td>
</tr>
<tr class="buscaAlumno buscaHead">
	<th>C&eacute;dula</th>
	<th>Paterno</th>
    <th>Materno</th>
    <th>Nombre</th>
    <th>Carrera</th>
    <th>F. Egreso</th>
    <th>Acci&oacute;n</th>
</tr>
<% Do While not rsAlumnos.eof %>
<tr class="buscaAlumno">
	<td><%=rsAlumnos("RUT")%></td>
	<td><%=rsAlumnos("PATERNO")%></td>
    <td><%=rsAlumnos("MATERNO")%></td>
    <td><%=rsAlumnos("NOMBRE")%></td>
    <td><%=rsAlumnos("NOMBRE_C")%></td>
    <td><%=rsAlumnos("Fecha Egresamiento")%></td>	
    <td><a onclick="javascript:selAlumno(<%=rsAlumnos("RUT")%>,'<%=rsAlumnos("CODCARPR")%>','<%=rsAlumnos("CODCLI")%>')" style="cursor:pointer; color:#03F;">seleccionar</a>
</tr>
<%
rsAlumnos.movenext
Loop				  
%>
</form>
</table>