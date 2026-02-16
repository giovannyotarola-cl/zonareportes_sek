<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="seleccionarAlumno.aspx.vb" Inherits="Homologaciones.seleccionarAlumno" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <div class="busca_div" runat="server" id="div_busca">
        <h2>
            Buscar alumno
        </h2>

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

    <div runat="server" id="div_listado_alumnos">

         <div class="tit_princ">
            Proceso de homologación. Paso 1.
         </div>
        <div class="text_aclarativo">
            Seleccionar plan origen de un alumno. Este es el plan desde el que se transferirán
            los ramos a homologar.
        </div>

        <asp:GridView ID="listadoAlumnos" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="CODCLI" DataSourceID="origen_alumnos" AllowPaging="True" 
               PageSize="15">
            <Columns>
                <asp:BoundField DataField="rut_alumno" HeaderText="RUT" ReadOnly="True" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado" />
                <asp:BoundField DataField="CODCLI" HeaderText="Cód. Cliente" ReadOnly="True" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado" />
                <asp:BoundField DataField="NOMBRE" HeaderText="Nombre" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado" />
                <asp:BoundField DataField="PATERNO" HeaderText="Paterno" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado" />
                <asp:BoundField DataField="MATERNO" HeaderText="Materno" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado" />
                <asp:BoundField DataField="NOMBRE_C" HeaderText="Carrera" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado" ItemStyle-Width="120px" />
                <asp:BoundField DataField="NOMPESTUD" HeaderText="Plan de Estudios" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado"  ItemStyle-Width="120px" />
                <asp:BoundField DataField="CODPESTUD" HeaderText="Cód. Plan E." HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado" />
                <asp:BoundField DataField="cedula" HeaderText="Cédula" ReadOnly="True" ItemStyle-CssClass="codcli_escondido" HeaderStyle-CssClass="codcli_escondido" />
                <asp:CommandField ShowSelectButton="True" ItemStyle-CssClass="cel_listado"/>
            </Columns>
            <PagerSettings Position="TopAndBottom" />
        </asp:GridView>
        <br />
        <br />
        <asp:SqlDataSource ID="origen_alumnos" runat="server" ConnectionString="<%$ ConnectionStrings:MatriculaConnectionString %>" 
            SelectCommand="SELECT matricula.MT_CLIENT.CODCLI + '-' + matricula.MT_CLIENT.DIG AS rut_alumno, matricula.MT_CLIENT.CODCLI as cedula, matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO, matricula.MT_CLIENT.NOMBRE, matricula.MT_CARRER.NOMBRE_C, matricula.MT_ALUMNO.CODCLI, matricula.RA_PESTUD.NOMPESTUD, matricula.RA_PESTUD.CODPESTUD FROM matricula.MT_ALUMNO INNER JOIN matricula.MT_CARRER ON matricula.MT_ALUMNO.CODCARPR = matricula.MT_CARRER.CODCARR INNER JOIN matricula.MT_CLIENT ON matricula.MT_ALUMNO.RUT = matricula.MT_CLIENT.CODCLI INNER JOIN matricula.RA_PESTUD ON matricula.MT_ALUMNO.CODPESTUD = matricula.RA_PESTUD.CODPESTUD ORDER BY matricula.MT_CLIENT.PATERNO, matricula.MT_CLIENT.MATERNO">
        </asp:SqlDataSource>
    </div>

    <div runat="server" id="seleccionar_destino_div" visible="false">
        
        <div class="tit_princ">
            Proceso de homologación. Paso 2.
         </div>
        
        <div class="alumno_elegido">
            Ha seleccionado la carrera <b><%= carreraElegida%></b> del alumno <b><%= alumno%></b>.
        </div><br /><br />

        <div class="text_aclarativo">
            Seleccionar expediente destino.
        </div>

        <div class="text_sub">
            Los ramos del plan seleccionado en el paso anterior serán transferidos al plan que seleccione ahora. No olvide marcar la casilla "Incluir ramos reprobados" si 
            desea incluirlos en el nuevo expediente.
        </div>
        <div class="checkbox_div">
            <asp:CheckBox ID="sel_repr" runat="server" Text="Incluir ramos reprobados" />
        </div>
        <br /><br />
        <asp:GridView ID="lista_carreras" runat="server" 
            DataSourceID="origen_lista_carreras" AutoGenerateColumns="false">
             <Columns>
                <asp:BoundField DataField="rut_alumno" HeaderText="RUT" ReadOnly="True" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado"  />
                <asp:BoundField DataField="CODCLI" HeaderText="CODCLI" ReadOnly="True" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado"  />
                <asp:BoundField DataField="alumno" HeaderText="Alumno" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado"  />
                <asp:BoundField DataField="NOMBRE_C" HeaderText="Carrera" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado"  />
                <asp:CommandField ShowSelectButton="True" SelectText="Lanzar homologación" HeaderStyle-CssClass="cel_listado" ItemStyle-CssClass ="cel_listado" />
            </Columns>
        </asp:GridView>
    
    
        <asp:SqlDataSource ID="origen_lista_carreras" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MatriculaConnectionString %>"></asp:SqlDataSource>
    
        <br /><br />
        <asp:Button ID="reset_proceso" runat="server" Text="Reiniciar" />
    
    </div>

        
</asp:Content>