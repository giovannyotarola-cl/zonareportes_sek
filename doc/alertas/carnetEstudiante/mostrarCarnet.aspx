<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="mostrarCarnet.aspx.vb" Inherits="carnetEstudiante.mostrarCarnet" MasterPageFile="~/Carnet.Master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="Main_Carnet">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="origen_carnet">
        <ItemTemplate>
        <div class="carnet_div">
            <div class = "div_foto">
                <asp:Image runat="server" ID="foto_alumno" ImageUrl='<%# "~/image_handler.aspx?alumno="+Eval("RUT") %>' AlternateText="." Height="120" Width="110"/>
            </div>
            <div class = "carnet_campos">
                <div class = "cont_campo">
                    <span class = "div_nombre">
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' />
                    </span>
                </div>
                <div class="clear_both"></div>
                <div class = "cont_campo">
                    <span class = "div_cedula">
                        <asp:Label ID="Cedula_Label" runat="server" Text='<%# Bind("cedula")%>' />
                    </span>
                </div>
                <div class="clear_both"></div>
                <div class = "cont_campo">
                    <span class = "div_carrera">
                        <asp:Label ID="CarreraLabel" runat="server" Text='<%# Bind("Carrera") %>' />
                        <!--<asp:Label ID="CarreraLabel2" runat="server" Text='ESTUDIANTE' />-->
                    </span>
                </div>
               
                <span style="visibility: hidden;">
                    <asp:Label runat="server" ID="ID_Label" Text='<%# Bind("RUT")%>' CssClass='<%# Bind("RUT") %>'/>
                </span>
                <span style="visibility: hidden;">
                    <asp:Label runat="server" ID="RUT_COD_BARRA" Text='<%# Bind("RUT_COD")%>'/>
                </span>
            </div>
            <div class="clear_both"></div>

            <div class = "cod_barras">
                <%= cedula %>
            </div>
            <div class = "foto_cont">
                <img src="img/anverso.png" width="330" height="205" border="0"/>
            </div>
            <div class="clear_both"></div>
           
        </div>
            
        </div>
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="origen_carnet" runat="server"        
        ConnectionString="<%$ ConnectionStrings:Matricula %>" 
           SelectCommand="SELECT TOP(1) MT_CLIENT.NOMBRE + ' ' + MT_CLIENT.PATERNO + ' ' + MT_CLIENT.MATERNO AS Nombre,
                                     MT_CLIENT.CODCLI AS RUT, MT_CLIENT.CODCLI + '-' + MT_CLIENT.DIG AS cedula,MT_CLIENT.CODCLI + MT_CLIENT.DIG AS RUT_COD, SUBSTRING(MT_CARRER.NOMBRE_C,1,40) AS Carrera
                          FROM       MT_POSCAR INNER JOIN  MT_ALUMNO ON MT_ALUMNO.RUT = MT_POSCAR.CODPOSTUL
									 INNER JOIN
                                     MT_CARRER ON MT_ALUMNO.CODCARPR = MT_CARRER.CODCARR RIGHT OUTER JOIN
                                     MT_CLIENT ON MT_ALUMNO.RUT = MT_CLIENT.CODCLI
                          WHERE      MT_POSCAR.CODPOSTUL= @alumno AND MT_ALUMNO.ESTACAD in ('VIGENTE','EGRESADO','TITULADO') AND MT_POSCAR.MATRICULADO='S' order by ano_mat desc,periodo_mat desc,mt_alumno.fec_mat asc">
        <SelectParameters>
            <asp:QueryStringParameter Name="alumno" QueryStringField="alumno" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
