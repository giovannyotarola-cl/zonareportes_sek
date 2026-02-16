<%@ Page Title="Página principal" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeBehind="Default.aspx.vb" Inherits="CarnetEstudiante_Chile._Default" %>

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
        AutoGenerateColumns="False" DataSourceID="origen_listado_alumnos" PageSize="30" DataKeyNames="RUT" CssClass="grid_alumnos" BorderWidth="0">
        <Columns>
            <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" >
                <HeaderStyle CssClass="notas_cab first_cell" BorderWidth="0"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="PATERNO" HeaderText="Apellido 1" 
                SortExpression="PATERNO">
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
            <asp:BoundField DataField="ANO_MAT" HeaderText="Año matrícula" ReadOnly="True" 
                ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  >
                <HeaderStyle CssClass="notas_cab"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="P_MAT" HeaderText="Período" ReadOnly="True" 
                ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  >
                <HeaderStyle CssClass="notas_cab"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
             <asp:BoundField DataField="C_MAT" HeaderText="Código carrera" ReadOnly="True" 
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
                     <asp:HyperLink ID="mostrarCarnet" runat="server" Target="_blank" NavigateUrl='<%# IIf(Eval("Foto") <> "Ok", "", "mostrarCarnet.aspx?alumno=" & DataBinder.Eval(Container.DataItem, "RUT").ToString & "&mat=" & DataBinder.Eval(Container.DataItem, "c_mat").ToString)%>'>
                        <%# Iif(Eval("Foto") <> "Ok","Debe tomar fotografía","Mostrar Carnet") %>
                    </asp:HyperLink>
                </ItemTemplate>
                <ItemStyle CssClass="celda_link_foto" />
                <HeaderStyle CssClass="notas_cab last_cell" BorderWidth="0"/>
            </asp:TemplateField>
        </Columns>
        <PagerSettings Position="TopAndBottom" />
    </asp:GridView>


    <asp:SqlDataSource ID="origen_listado_alumnos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MatriculaConnectionString %>" 
        SelectCommand="SELECT  matricula.MT_CLIENT.NOMBRE, matricula.MT_CLIENT.PATERNO, 
                               matricula.MT_CLIENT.MATERNO, matricula.MT_CLIENT.CODCLI AS RUT,  matricula.MT_ALUMNO.ANO_MAT AS ANO_MAT,  
                               matricula.MT_ALUMNO.PERIODO_MAT AS P_MAT,  matricula.MT_ALUMNO.CODCARPR AS C_MAT, 
                               matricula.MT_ALUMNO.CODCLI AS CODCLI, 
                               CASE WHEN Matricula.Foto_alumno.FOTO IS NULL THEN 'Sin Foto' ELSE 'Ok' END AS Foto
                      FROM         matricula.foto_alumno RIGHT OUTER JOIN
                                   matricula.MT_CLIENT ON matricula.foto_alumno.CODCLI COLLATE Modern_Spanish_CI_AS = matricula.MT_CLIENT.CODCLI LEFT OUTER JOIN
                                   matricula.MT_ALUMNO ON matricula.MT_CLIENT.CODCLI = matricula.MT_ALUMNO.RUT 
                       ORDER BY matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO "></asp:SqlDataSource>
</asp:Content>