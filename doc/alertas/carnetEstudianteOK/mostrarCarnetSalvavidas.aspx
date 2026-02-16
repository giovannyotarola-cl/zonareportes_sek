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
           SelectCommand="SELECT TOP(1) dbo.MT_CLIENT.NOMBRE + ' ' + dbo.MT_CLIENT.PATERNO + ' ' + dbo.MT_CLIENT.MATERNO AS Nombre,
                                     dbo.MT_CLIENT.CODCLI AS RUT, dbo.MT_CLIENT.CODCLI + '-' + dbo.MT_CLIENT.DIG AS cedula, SUBSTRING(dbo.MT_CARRER.NOMBRE_C,1,40) AS Carrera
                          FROM       dbo.MT_POSCAR INNER JOIN  dbo.MT_ALUMNO ON dbo.MT_ALUMNO.RUT = dbo.MT_POSCAR.CODPOSTUL
									 INNER JOIN
                                     dbo.MT_CARRER ON dbo.MT_ALUMNO.CODCARPR = dbo.MT_CARRER.CODCARR RIGHT OUTER JOIN
                                     dbo.MT_CLIENT ON dbo.MT_ALUMNO.RUT = dbo.MT_CLIENT.CODCLI
                          WHERE      dbo.MT_POSCAR.CODPOSTUL= @alumno AND dbo.MT_ALUMNO.ESTACAD in ('VIGENTE','EGRESADO','TITULADO')">
        <SelectParameters>
            <asp:QueryStringParameter Name="alumno" QueryStringField="alumno" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
