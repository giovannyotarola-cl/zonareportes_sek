<%@ Page Title="Página principal" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="carnetEstudiante._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="busca_div">
        <h2>Buscar alumno</h2>

        <asp:Table ID="Table1" runat="server">
            <asp:TableHeaderRow>
                <asp:TableCell>
                    Nombre
                </asp:TableCell>
                <asp:TableCell>
                    Apellido 1
                </asp:TableCell>
                <asp:TableCell>
                    Apellido 2
                </asp:TableCell>
                 <asp:TableCell>
                    Cédula
                </asp:TableCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox runat="server" ID="busca_nombre">
                    </asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ID="busca_paterno">
                    </asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ID="busca_materno">
                    </asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                <asp:TextBox runat="server" ID="busca_cedula">
                    </asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Button ID="boton_busca_alumno" runat="server" Text="Buscar" CssClass="boton_foto"/>
    &nbsp;<asp:Button ID="reset_busqueda" runat="server" Text="Reiniciar búsqueda" CssClass="boton_foto"  />

    <asp:Button ID="bot_reverso" runat="server" Text="Mostrar reverso" CssClass="boton_reverso"  />
    </div>

    <br />
    <asp:GridView ID="listado_alumnos" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="origen_listado_alumnos" PageSize="30" DataKeyNames="RUT" CssClass="grid_alumnos" BorderWidth="0px">
        <Columns>
            <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" >
                <HeaderStyle CssClass="notas_cab first_cell" BorderWidth="0"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="PATERNO" HeaderText="Apellido 1" 
                SortExpression="PATERNO" >
                <HeaderStyle CssClass="notas_cab"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="MATERNO" HeaderText="Apellido 2" 
                SortExpression="MATERNO" ItemStyle-CssClass="notas_cel" 
                HeaderStyle-CssClass="notas_cab"  >
                <HeaderStyle CssClass="notas_cab"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="RUT" HeaderText="Cédula" ReadOnly="True" 
                ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  >
                <HeaderStyle CssClass="notas_cab"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="ANO_MAT" HeaderText="ID" ReadOnly="True" 
                ItemStyle-CssClass="escondido" HeaderStyle-CssClass="escondido"  >
                <HeaderStyle CssClass="escondido"></HeaderStyle>
                <ItemStyle CssClass="escondido"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="C_MAT" HeaderText="Código Carrera" ReadOnly="True" 
                ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab" >
                <HeaderStyle CssClass="notas_cab"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="P_MAT" HeaderText="Periodo" ReadOnly="True" 
                ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  >
                <HeaderStyle CssClass="notas_cab"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Fotografía">
                <ItemTemplate>
                     <%# Eval("Foto") %><br />
                     <asp:Button ID="Button1" runat="server" Text="Tomar foto" CommandName="tomarFoto" CommandArgument='<%# Eval("RUT")%>' CssClass="boton_foto"/>
                </ItemTemplate>
                <ItemStyle CssClass="foto_control_cel"/>
                <HeaderStyle CssClass="notas_cab"/>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="mostrarCarnet" runat="server" Target="_blank" NavigateUrl='<%# IIf(Eval("Foto") <> "Ok", "", Eval("RUT", "mostrarCarnet.aspx?alumno={0}"))%>'>
                        <%# Iif(Eval("Foto") <> "Ok","Debe tomar fotografía","Mostrar Carnet") %>
                    </asp:HyperLink>
                </ItemTemplate>
                <ItemStyle CssClass="celda_link_foto" />
                <HeaderStyle CssClass="notas_cab last_cell" BorderWidth="0"/>
            </asp:TemplateField>

            <asp:TemplateField Visible="true">
                <ItemTemplate>
                    <asp:HyperLink ID="mostrarCarnetSalvavidas" runat="server" Target="_blank" NavigateUrl='<%# Eval("RUT", "mostrarCarnetSalvavidas.aspx?alumno={0}")%>'>
                        <%# "Carnet Salvavidas" %>
                    </asp:HyperLink>
                </ItemTemplate>
                <ItemStyle CssClass="celda_link_foto" />
                <HeaderStyle CssClass="notas_cab last_cell" BorderWidth="0"/>
            </asp:TemplateField>
            
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="origen_listado_alumnos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Matricula %>" 
        SelectCommand="SELECT * FROM (SELECT A.NOMBRES AS NOMBRE, A.AP_PATER AS PATERNO, A.AP_MATER AS MATERNO, A.RUT, (SELECT MAX(VALOR) FROM MT_PARAME_DET WHERE IDPARAMETRO='ANO') AS ANO_MAT, '1' AS  P_MAT, (SELECT TOP 1 CODCARR AS CODCARR FROM RA_HORPROF WHERE CODPROF = A.CODPROF AND ANO IN (SELECT MAX(VALOR) FROM MT_PARAME_DET WHERE IDPARAMETRO='ANO')) AS C_MAT, CASE WHEN B.FOTO IS NULL THEN 'Sin Foto' ELSE 'Ok' END AS Foto FROM dbo.foto_alumno B RIGHT OUTER JOIN dbo.RA_PROFES A ON B.CODCLI = A.CODPROF WHERE A.CODPROF IN (SELECT codprof FROM ra_seccio where ANO=(SELECT MAX(VALOR) FROM MT_PARAME_DET WHERE IDPARAMETRO='ANO'))) T UNION SELECT SEK_CREDENCIALES.NOMBRE, SEK_CREDENCIALES.PATERNO, SEK_CREDENCIALES.MATERNO, SEK_CREDENCIALES.RUT, SEK_CREDENCIALES.ANO_MAT, SEK_CREDENCIALES.P_MAT, SEK_CREDENCIALES.C_MAT, CASE WHEN FOTO_ALUMNO.FOTO IS NULL THEN 'Sin Foto' ELSE 'Ok' END AS Foto FROM  FOTO_ALUMNO RIGHT OUTER JOIN SEK_CREDENCIALES ON FOTO_ALUMNO.CODCLI =  SEK_CREDENCIALES.RUT WHERE 1=1"></asp:SqlDataSource>
</asp:Content>
