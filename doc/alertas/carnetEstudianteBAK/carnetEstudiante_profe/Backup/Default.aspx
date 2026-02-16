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
        AutoGenerateColumns="False" DataSourceID="origen_listado_alumnos" PageSize="30" DataKeyNames="RUT_alumno" CssClass="grid_alumnos" BorderWidth="0">
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
            <asp:BoundField DataField="RUT_alumno" HeaderText="Cédula" ReadOnly="True" 
                ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  >
                <HeaderStyle CssClass="notas_cab"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                ItemStyle-CssClass="escondido" HeaderStyle-CssClass="escondido"  >
                <HeaderStyle CssClass="escondido"></HeaderStyle>
                <ItemStyle CssClass="escondido"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Carrera" HeaderText="Carrera" ReadOnly="True" 
                ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab" 
                HeaderStyle-Width="290px" >
                <HeaderStyle CssClass="notas_cab" Width="290px"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" 
                ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  >
                <HeaderStyle CssClass="notas_cab"></HeaderStyle>
                <ItemStyle CssClass="notas_cel"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Fotografía">
                <ItemTemplate>
                     <%# Eval("Foto") %><br />
                     <asp:Button runat="server" Text="Tomar foto" CommandName="tomarFoto" CommandArgument='<%# Eval("No_")+";"+Eval("ID")%>' CssClass="boton_foto"/>
                </ItemTemplate>
                <ItemStyle CssClass="foto_control_cel"/>
                <HeaderStyle CssClass="notas_cab"/>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="mostrarCarnet" runat="server" Target="_blank" NavigateUrl='<%# Iif(Eval("Foto") <> "Ok","",Eval("ID", "mostrarCarnet.aspx?alumno={0}")) %>'>
                        <%# Iif(Eval("Foto") <> "Ok","Debe tomar fotografía","Mostrar Carnet") %>
                    </asp:HyperLink>
                </ItemTemplate>
                <ItemStyle CssClass="celda_link_foto" />
                <HeaderStyle CssClass="notas_cab last_cell" BorderWidth="0"/>
            </asp:TemplateField>
             <asp:BoundField DataField="No_" HeaderText="No_" ReadOnly="True" 
                ItemStyle-CssClass="escondido" HeaderStyle-CssClass="escondido">
                <HeaderStyle CssClass="escondido"></HeaderStyle>
                <ItemStyle CssClass="escondido"></ItemStyle>
            </asp:BoundField>
        </Columns>
    </asp:GridView>


    <asp:SqlDataSource ID="origen_listado_alumnos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NAV_UISEK_ECUADORConnectionString %>" 
        SelectCommand="SELECT     TOP (100) PERCENT dbo.Customer.[VAT Registration No_] AS RUT_alumno, dbo.Customer.Nombre AS NOMBRE, dbo.Customer.[Apellido 1] AS PATERNO, 
                                    dbo.Customer.[Apellido 2] AS MATERNO, dbo.[Curso escolar alumno].[CODCLIU+] AS ID, CASE WHEN dbo.[Fotos Alumnos].Picture IS NULL THEN 'Sin foto' ELSE 'Ok' END AS Foto, 
                                    dbo.[UISEK_ECUADOR$CarrerasU+].Carrera, CASE WHEN YEAR(dbo.[Curso escolar alumno].[Fecha Baja]) > 2000 THEN 'Baja en ' + CAST(dbo.[Curso escolar alumno].[Fecha Baja] AS nvarchar) ELSE ' ' END AS Estado, 
                                    dbo.Customer.No_
                      FROM         dbo.Customer INNER JOIN
                                    dbo.[Curso escolar alumno] ON dbo.Customer.No_ = dbo.[Curso escolar alumno].[Cód_ Alumno] INNER JOIN
                                    dbo.Curso ON dbo.[Curso escolar alumno].[Cód_ Curso] = dbo.Curso.[Cód_ curso] INNER JOIN
                                    dbo.[UISEK_ECUADOR$CarrerasU+] ON dbo.Curso.[CarreraU+] = dbo.[UISEK_ECUADOR$CarrerasU+].CodCarrera LEFT OUTER JOIN
                                    dbo.[Fotos Alumnos] ON dbo.Customer.No_ = dbo.[Fotos Alumnos].No_
                      WHERE     (dbo.Customer.Nombre IS NOT NULL) AND (dbo.Customer.Nombre <> '') AND (dbo.Customer.[Apellido 1] IS NOT NULL) AND (dbo.Customer.[Apellido 1] <> '') AND 
                                (dbo.Customer.[Apellido 2] IS NOT NULL) AND (dbo.Customer.[Apellido 2] <> '') AND (dbo.[Curso escolar alumno].[Cód_ Curso Escolar] = '2014-1') AND (dbo.[Curso escolar alumno].[Estado] = '2') AND 
                                    (dbo.Curso.CodCentro IN ('45', '55', '70', '75', '130'))
                      ORDER BY PATERNO, MATERNO"></asp:SqlDataSource>
</asp:Content>
