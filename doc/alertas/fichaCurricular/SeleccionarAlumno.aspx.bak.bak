<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SeleccionarAlumno.aspx.vb" Inherits="fichaCurricular.SeleccionarAlumno" MasterPageFile="~/Site.Master" %>

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
                    Paterno
                </asp:TableCell>
                <asp:TableCell>
                    Materno
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
        <br />
        <asp:Button ID="boton_busca_alumno" runat="server" Text="Buscar" />
    &nbsp;<asp:Button ID="reset_busqueda" runat="server" Text="Reiniciar búsqueda" />
    </div>

    <asp:GridView ID="listado_alumnos" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="origen_listado_alumnos" PageSize="30" DataKeyNames="CodCliente">
        <Columns>
            <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab" />
            <asp:BoundField DataField="PATERNO" HeaderText="Paterno" SortExpression="PATERNO" ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab" />
            <asp:BoundField DataField="MATERNO" HeaderText="Materno" SortExpression="MATERNO" ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  />
            <asp:BoundField DataField="RUT_alumno" HeaderText="Cédula" ReadOnly="True" ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  />
            <asp:BoundField DataField="CODCARR" HeaderText="Cód. Carrera" ReadOnly="True" ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  />
            <asp:BoundField DataField="NOMBRE_C" HeaderText="Carrera" ReadOnly="True" ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  />
            <asp:BoundField DataField="ingreso" HeaderText="Ingreso" ReadOnly="True" ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  />
            <asp:BoundField DataField="ultima_matricula" HeaderText="Últ. Matr." ReadOnly="True" ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  />
            <asp:CommandField ShowSelectButton="True" ItemStyle-CssClass="notas_cel" HeaderStyle-CssClass="notas_cab"  />
            <asp:BoundField DataField="CodCliente" HeaderText="CodCliente" Visible="True" ItemStyle-CssClass="rut_escondido" HeaderStyle-CssClass="rut_escondido" />
        </Columns>
        <PagerSettings Position="TopAndBottom" />
    </asp:GridView>

    <asp:SqlDataSource ID="origen_listado_alumnos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MatriculaConnectionString %>" 
        SelectCommand="SELECT matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO, matricula.MT_CLIENT.NOMBRE, matricula.MT_CLIENT.CODCLI + '-' + matricula.MT_CLIENT.DIG AS RUT_alumno, matricula.MT_ALUMNO.CODCLI AS CodCliente, matricula.MT_CARRER.NOMBRE_C, matricula.MT_CARRER.CODCARR, CAST(matricula.MT_ALUMNO.ANO AS nvarchar(6)) + '-' + CAST(matricula.MT_ALUMNO.PERIODO AS nvarchar(2)) AS ingreso, CAST(matricula.MT_ALUMNO.ANO_MAT AS nvarchar(6)) + '-' + CAST(matricula.MT_ALUMNO.PERIODO_MAT AS nvarchar(2)) AS ultima_matricula FROM matricula.MT_CLIENT INNER JOIN matricula.MT_ALUMNO ON matricula.MT_CLIENT.CODCLI = matricula.MT_ALUMNO.RUT INNER JOIN matricula.MT_CARRER ON matricula.MT_ALUMNO.CODCARPR = matricula.MT_CARRER.CODCARR ORDER BY matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO">
    </asp:SqlDataSource>

</asp:Content>
