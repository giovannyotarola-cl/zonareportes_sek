<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="mostrarCarnet.aspx.vb" Inherits="CarnetEstudiante_Chile.mostrarCarnet" MasterPageFile="~/Carnet.Master" %>

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
                        <asp:Label ID="Cedula_Label" runat="server" Text='<%# Bind("cedula") %>' />
                    </span>
                </div>
                <div class="clear_both"></div>
                
                 <div class = "cont_campo">
                    <span class = "et_campo">
                        <asp:Label ID="CentroLabel" runat="server" Text='<%# Bind("Carrera") %>' />
                    </span>
                </div>
                <div class="clear_both"></div>
                <span style="visibility: hidden;">
                    <asp:Label runat="server" ID="ID_Label" Text='<%# Bind("RUT") %>' CssClass='<%# Bind("RUT") %>'/>
                </span>
            </div>
            <div class="clear_both"></div>
             <div class = "cod_barras">
                <%= "  *" + id_alumno+"*  "%>
            </div>
            <div class = "front_logo">
                <img src="img/logotexto.jpg" border=0 width="100%" height="100%"/>
            </div>
            <div class = "front_texto">
                <b>JUNTOS CONSTRUIMOS TU FUTURO</b>
            </div>
            <div class = "foto_cont">
                <img src="img/anverso.png" border="0"/>
            </div>
            <div class="clear_both"></div>
           
        </div>
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="origen_carnet" runat="server"        
        ConnectionString="<%$ ConnectionStrings:MatriculaConnectionString %>" 
           SelectCommand="SELECT     matricula.MT_CLIENT.NOMBRE + ' ' + matricula.MT_CLIENT.PATERNO + ' ' + matricula.MT_CLIENT.MATERNO AS Nombre, 
                                     matricula.MT_CLIENT.CODCLI AS RUT, matricula.MT_CLIENT.CODCLI + '-' + matricula.MT_CLIENT.DIG AS cedula, matricula.MT_CARRER.NOMBRE_C AS Carrera
                          FROM       matricula.MT_ALUMNO INNER JOIN
                                     matricula.MT_CARRER ON matricula.MT_ALUMNO.CODCARPR = matricula.MT_CARRER.CODCARR RIGHT OUTER JOIN
                                     matricula.MT_CLIENT ON matricula.MT_ALUMNO.RUT = matricula.MT_CLIENT.CODCLI
                          WHERE      matricula.MT_CLIENT.CODCLI = @alumno" >
        <SelectParameters>
            <asp:QueryStringParameter Name="alumno" QueryStringField="alumno" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
