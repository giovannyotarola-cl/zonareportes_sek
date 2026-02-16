<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="mostrarCarnetSalvavidas.aspx.vb" Inherits="carnetEstudiante.mostrarCarnetSalvavidas" MasterPageFile="~/Carnet.Master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="Main_Carnet">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="origen_carnet">
        <ItemTemplate>
        <div class="carnet_div">
            <div class = "carnet_campos_salvavidas">
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
               
                <span style="visibility: hidden;">
                    <asp:Label runat="server" ID="ID_Label" Text='<%# Bind("RUT")%>' CssClass='<%# Bind("RUT") %>'/>
                </span>
                <span style="visibility: hidden;">
                    <asp:Label runat="server" ID="RUT_COD_BARRA" Text='<%# Bind("RUT")%>'/>
                </span>
            </div>
            <div class="clear_both"></div>

            <div class = "foto_cont">
                <img src="img/anversoEdFisica.png" width="330" height="205" border="0"/>
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
       (SELECT TOP 1 NOMBRE_C FROM MT_CARRER WHERE CODCARR IN (
       (SELECT TOP 1 CODCARR AS CODCARR FROM RA_HORPROF
        WHERE CODPROF = A.CODPROF
        AND ANO IN (SELECT MAX(VALOR) 
                    FROM MT_PARAME_DET WHERE IDPARAMETRO='ANO')))) AS Carrera

FROM dbo.foto_alumno B RIGHT OUTER JOIN
     dbo.RA_PROFES A ON B.CODCLI = A.CODPROF
WHERE A.CODPROF IN (SELECT PROFES FROM SEK_PROFES_FCSALU)
AND  A.CODPROF = @alumno">
        <SelectParameters>
            <asp:QueryStringParameter Name="alumno" QueryStringField="alumno" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
