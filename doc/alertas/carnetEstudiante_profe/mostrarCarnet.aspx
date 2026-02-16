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
           SelectCommand="SELECT TOP(1) A.NOMBRES + ' ' + A.AP_PATER + ' ' + A.AP_MATER    AS Nombre,
       A.RUT AS RUT,
       A.RUT + '-' + A.DV AS cedula,
       A.RUT +A.DV AS RUT_COD,
       (SELECT TOP 1 NOMBRE_C FROM MT_CARRER WHERE CODCARR IN (
       (SELECT TOP 1 CODCARR AS CODCARR FROM RA_HORPROF
        WHERE CODPROF = A.CODPROF
        AND ANO IN (SELECT MAX(VALOR) 
                    FROM MT_PARAME_DET WHERE IDPARAMETRO='ANO')))) AS Carrera

FROM dbo.foto_alumno B RIGHT OUTER JOIN
     dbo.RA_PROFES A ON B.CODCLI = A.CODPROF
WHERE A.CODPROF IN (SELECT CODPROF FROM RA_SECCIO)
AND  A.CODPROF = @alumno
        UNION 
SELECT (CR.NOMBRE +' ' + CR.PATERNO + ' ' +CR.MATERNO) AS NOMBRE ,CR.RUT,CR.RUT AS cedula , cr.rut as RUT_COD , case when cr.C_MAT= 'SCOBSD' then 'OBSTETRICIA Y NEONATOLOGIA' when cr.C_MAT= 'SCKIND' then 'KINESIOLOGIA'  when cr.C_MAT= 'SCFOND' then 'FONOAUDILOGÍA'  END as Carrera FROM SEK_CREDENCIALES CR WHERE RUT=@alumno">
        <SelectParameters>
            <asp:QueryStringParameter Name="alumno" QueryStringField="alumno" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
