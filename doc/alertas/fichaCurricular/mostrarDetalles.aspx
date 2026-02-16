<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="mostrarDetalles.aspx.vb" Inherits="fichaCurricular.mostrarDetalles" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="boton_imprimir">
        <asp:Button ID="boton_imprimir" runat="server" Text="Vista de impresión" CssClass="bot_impr" />
    </div>
    <div class="tit_uni">
        UNIVERSIDAD INTERNACIONAL SEK CHILE
    </div>
    <div style="text-align: center" class="tit_ficha_c">
    Ficha Curricular Histórica<br />
    <i>(Documento de uso interno de la institución)</i>
    </div>
    <br />
    <asp:FormView ID="vista_alumno" runat="server" DataKeyNames="CODCLI" 
        DataSourceID="origen_detalle_alumno">
        <ItemTemplate>
             <asp:Table ID="Table1" runat="server" CssClass="tabla_alumno">
                <asp:TableRow>
                    <asp:TableCell CssClass="desc_cab">
                        <b>Sede:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_sede" Text="<%# Bind('DESCRIPCION') %>" CssClass="desc_cont"/>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="desc_cab">
                        <b>Carrera:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_carrera" Text="<%# Bind('NOMBRE_C') %>" CssClass="desc_cont"/>
                    <asp:TableCell>
                    </asp:TableCell>
                    <asp:TableCell>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell CssClass="desc_cab">
                        <b>Estado académico:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_estacad" Text="<%# Bind('ESTACAD') %>" CssClass="desc_cont"/>
                    <asp:TableCell>
                    </asp:TableCell>
                    <asp:TableCell>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="desc_cab">
                        <b>Mención:</b>
                    </asp:TableCell>
                    <asp:TableCell>
                 
                    </asp:TableCell>
                     <asp:TableCell CssClass="desc_cab">
                        <b>Jornada:</b>
                    </asp:TableCell>
                    <asp:TableCell>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="desc_cab">
                        <b>Matrícula:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_codcli" Text="<%# Bind('CODCLI') %>"  CssClass="desc_cont"/>
                     <asp:TableCell CssClass="desc_cab">
                        <b>Plan de Estudio:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_pestud" Text="<%# Bind('NOMPESTUD') %>" CssClass="desc_cont"/>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="desc_cab">
                        <b>Nombre:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_nombre" Text="<%# Bind('nombre_completo') %>" CssClass="desc_cont">
                    </asp:TableCell>
                     <asp:TableCell CssClass="desc_cab">
                        <b>RUT:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_rut" Text="<%# Bind('RUT') %>" CssClass="desc_cont"/>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell CssClass="desc_cab">
                        <b>Domicilio Alumno:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_direccion" Text="<%# Bind('DIRACTUAL') %>" CssClass="desc_cont"/>
                     <asp:TableCell CssClass="desc_cab">
                        <b>Fecha Nacimiento:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_nac" Text="<%# Bind('nac_alumno') %>" CssClass="desc_cont"/>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell CssClass="desc_cab">
                        <b>Ciudad Alumno:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_ciudad" Text="<%# Bind('ciudad_alumno') %>" CssClass="desc_cont"/>
                     <asp:TableCell CssClass="desc_cab">
                        <b>Fecha última matrícula:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_ult_mat" Text="<%# Bind('sem_ult_mat') %>" CssClass="desc_cont"/>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell CssClass="desc_cab">
                        <b>Teléfono Alumno:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_fono" Text="<%# Bind('FONOACT') %>" CssClass="desc_cont"/>
                     <asp:TableCell CssClass="desc_cab">
                        <b>Estado Otras Carreras:</b>
                    </asp:TableCell>
                    <asp:TableCell>

                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell CssClass="desc_cab">
                        <b>Otras carreras:</b>
                    </asp:TableCell>
                    <asp:TableCell>
                 
                    </asp:TableCell>
                     <asp:TableCell CssClass="desc_cab">
                        <b>e-Mail:</b>
                    </asp:TableCell>
                    <asp:TableCell ID="cell_mail" Text="<%# Bind('MAIL') %>"  CssClass="desc_cont"/>
                </asp:TableRow>
            </asp:Table>
        </ItemTemplate>
    </asp:FormView>

    <div class="cuadro_estado">
       Estados<br />
       A: Aprobado  R: Reprobado  H: Homologado  C: Convalidado
    </div>

    <asp:GridView ID="listado_asignaturas" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="codramo" DataSourceID="origen_listado_asignaturas" 
        AllowPaging="True" PageSize="30">
        <Columns>
            <asp:BoundField DataField="codramo" HeaderText="Cód. Asign." ReadOnly="True" SortExpression="codramo" >
            <HeaderStyle CssClass="notas_cab" />
            <ItemStyle CssClass="notas_cel" Width="74px"/>
            </asp:BoundField>
            <asp:BoundField DataField="NombreAsignatura" HeaderText="Asignatura">
                <HeaderStyle CssClass="notas_cab" />
                <ItemStyle CssClass="notas_cel" Width="240px" />
            </asp:BoundField>
            <asp:BoundField DataField="nivel" HeaderText="Nivel" SortExpression="nivel" >
                <HeaderStyle CssClass="notas_cab" />
                <ItemStyle CssClass="notas_cent" Width="25px" />
            </asp:BoundField>
            <asp:BoundField DataField="Creditos" HeaderText="Créds.">
                <HeaderStyle CssClass="notas_cab" />
                <ItemStyle CssClass="notas_cent" Width="25px" />
            </asp:BoundField>
             <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Convocatoria 1<br><span style='font-size: 9px;'>Sec.|Sem.|Nota|Est.|Asist.</span>">
                <ItemTemplate>
                    <asp:Label ID="Conv_1" runat="server" Text='<%# Iif(Eval("seccion1").ToString = "", String.Format("-"), String.Format("{0} | {1}-{2} | {3} | {4} | {5}%", Eval("seccion1"), Eval("ano1"), Eval("periodo1"), Eval("nota1"), Eval("estado1"), Eval("asistencia1"))) %>'></asp:Label>
                </ItemTemplate>
                 <HeaderStyle CssClass="notas_cab notas_conv" />
                 <ItemStyle CssClass="notas_cent"/>
            </asp:TemplateField>
             <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Convocatoria 2<br><span style='font-size: 9px;'>Sec.|Sem.|Nota|Est.|Asist.</span>">
                <ItemTemplate>
                    <asp:Label ID="Conv_2" runat="server" Text='<%# Iif(Eval("seccion2").ToString = "", String.Format("-"), String.Format("{0} | {1}-{2} | {3} | {4} | {5}%", Eval("seccion2"), Eval("ano2"), Eval("periodo2"), Eval("nota2"), Eval("estado2"), Eval("asistencia2"))) %>'></asp:Label>
                </ItemTemplate>
                 <HeaderStyle CssClass="notas_cab notas_conv" />
                 <ItemStyle CssClass="notas_cent" />
            </asp:TemplateField>
              <asp:TemplateField  HeaderStyle-HorizontalAlign="Center" HeaderText="Convocatoria 3<br><span style='font-size: 9px;'>Sec.|Sem.|Nota|Est.|Asist.</span>">
                <ItemTemplate>
                    <asp:Label ID="Conv_3" runat="server" Text='<%# Iif(Eval("seccion3").ToString = "", String.Format("-"), String.Format("{0} | {1}-{2} | {3} | {4} | {5}%", Eval("seccion3"), Eval("ano3"), Eval("periodo3"), Eval("nota3"), Eval("estado3"), Eval("asistencia3"))) %>'></asp:Label>
                </ItemTemplate>
                 <HeaderStyle CssClass="notas_cab notas_cab conv" />
                 <ItemStyle CssClass="notas_cent" />
            </asp:TemplateField>
              <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Convocatoria 4<br><span style='font-size: 9px;'>Sec.|Sem.|Nota|Est.|Asist.</span>">
                <ItemTemplate>
                    <asp:Label ID="Conv_4" runat="server" Text='<%# Iif(Eval("seccion4").ToString = "", String.Format("-"), String.Format("{0} | {1}-{2} | {3} | {4} | {5}%", Eval("seccion4"), Eval("ano4"), Eval("periodo4"), Eval("nota4"), Eval("estado4"), Eval("asistencia4"))) %>'></asp:Label>
                </ItemTemplate>
                 <HeaderStyle CssClass="notas_cab notas_conv" />
                 <ItemStyle CssClass="notas_cent" />
            </asp:TemplateField>
              <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Convocatoria 5<br><span style='font-size: 9px;'>Sec.|Sem.|Nota|Est.|Asist.</span>">
                <ItemTemplate>
                    <asp:Label ID="Conv_5" runat="server" Text='<%# Iif(Eval("seccion5").ToString = "", String.Format("-"), String.Format("{0} | {1}-{2} | {3} | {4} | {5}%", Eval("seccion5"), Eval("ano5"), Eval("periodo5"), Eval("nota5"), Eval("estado5"), Eval("asistencia5"))) %>'></asp:Label>
                </ItemTemplate>
                 <HeaderStyle CssClass="notas_cab notas_conv" />
                 <ItemStyle CssClass="notas_cent" />
            </asp:TemplateField>
            <asp:BoundField DataField="periodo1" HeaderText="periodo1" Visible="false"/>
            <asp:BoundField DataField="seccion1" HeaderText="seccion1" Visible="false" />
            <asp:BoundField DataField="nota1" HeaderText="nota1" Visible="false" />
            <asp:BoundField DataField="asistencia1" HeaderText="asistencia1" Visible="false" />
            <asp:BoundField DataField="estado1" HeaderText="estado1" Visible="false" />
            <asp:BoundField DataField="ano2" HeaderText="ano2" Visible="false" />
            <asp:BoundField DataField="periodo2" HeaderText="periodo2" Visible="false" />
            <asp:BoundField DataField="seccion2" HeaderText="seccion2" Visible="false" />
            <asp:BoundField DataField="nota2" HeaderText="nota2" Visible="false" />
            <asp:BoundField DataField="asistencia2" HeaderText="asistencia2" Visible="false" />
            <asp:BoundField DataField="estado2" HeaderText="estado2" Visible="false" />
            <asp:BoundField DataField="ano3" HeaderText="ano3" Visible="false" />
            <asp:BoundField DataField="periodo3" HeaderText="periodo3" Visible="false" />
            <asp:BoundField DataField="seccion3" HeaderText="seccion3" Visible="false" />
            <asp:BoundField DataField="nota3" HeaderText="nota3" Visible="false" />
            <asp:BoundField DataField="asistencia3" HeaderText="asistencia3" Visible="false" />
            <asp:BoundField DataField="estado3" HeaderText="estado3" Visible="false" />
            <asp:BoundField DataField="ano4" HeaderText="ano4" Visible="false" />
            <asp:BoundField DataField="periodo4" HeaderText="periodo4" Visible="false" />
            <asp:BoundField DataField="seccion4" HeaderText="seccion4" Visible="false" />
            <asp:BoundField DataField="nota4" HeaderText="nota4" Visible="false" />
            <asp:BoundField DataField="asistencia4" HeaderText="asistencia4" Visible="false" />
            <asp:BoundField DataField="estado4" HeaderText="estado4" Visible="false" />
            <asp:BoundField DataField="ano5" HeaderText="ano5" Visible="false" />
            <asp:BoundField DataField="periodo5" HeaderText="periodo5" Visible="false" />
            <asp:BoundField DataField="seccion5" HeaderText="seccion5" Visible="false" />
            <asp:BoundField DataField="nota5" HeaderText="nota5" Visible="false" />
            <asp:BoundField DataField="asistencia5" HeaderText="asistencia5" Visible="false" />
            <asp:BoundField DataField="estado5" HeaderText="estado5" Visible="false" />
        </Columns>
        <PagerSettings PageButtonCount="30" Position="TopAndBottom" />
    </asp:GridView>
    <br />
    <asp:HyperLink ID="enlaceVolver" runat="server" NavigateUrl="~/SeleccionarAlumno.aspx">Volver</asp:HyperLink>
    <br />
    <asp:SqlDataSource ID="origen_listado_asignaturas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MatriculaConnectionString %>" 
        SelectCommand="SELECT * FROM dbo.GetDatosAlumno(@CODCLI)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CODCLI" QueryStringField="alumno" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />


    <asp:SqlDataSource ID="origen_detalle_alumno" runat="server" 
        ConnectionString="<%$ ConnectionStrings:MatriculaConnectionString %>" 
        SelectCommand="SELECT * FROM dbo.SEK_Ficha_Curricular_Alumno WHERE codcli = @codcli">
        <SelectParameters>
            <asp:QueryStringParameter Name="codcli" QueryStringField="alumno" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>