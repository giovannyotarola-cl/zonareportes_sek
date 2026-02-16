<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="mostrarCarnet.aspx.vb" Inherits="carnetEstudiante.mostrarCarnet" MasterPageFile="~/Carnet.Master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="Main_Carnet">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="origen_carnet">
        <ItemTemplate>
        <div class="carnet_div">
            <div class = "div_foto">
                <asp:Image runat="server" ID="foto_alumno" ImageUrl='<%# "~/image_handler.aspx?alumno="+Eval("identificador") %>' AlternateText="." Height="120" Width="110"/>
            </div>
            <div class = "carnet_campos">
                <div class = "cont_campo">
                    <span class = "et_campo">
                        NOMBRE:
                    </span>
                    <span class = "div_nombre">
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("nombre_alumno") %>' />
                    </span>
                </div>
                <div class="clear_both"></div>
                <div class = "cont_campo">
                    <span class = "et_cedula">
                        CÉDULA:
                    </span>
                    <span class = "div_cedula">
                        <asp:Label ID="Cedula_Label" runat="server" Text='<%# Bind("[VAT Registration No_]") %>' />
                    </span>
                </div>
                <div class="clear_both"></div>
                <div class = "cont_campo">
                    <span class = "et_campo">
                        FACULTAD:
                    </span>
                    <span class = "div_centro">
                        <asp:Label ID="CentroLabel" runat="server" Text='<%# Bind("Centro") %>' />
                    </span>
                </div>
                <div class="clear_both"></div>
                <div class = "cont_campo">
                    <span class = "et_campo">
                        CARRERA:
                    </span>
                    <span class = "div_carrera">
                        <asp:Label ID="CarreraLabel" runat="server" Text='<%# Bind("Carrera") %>' />
                    </span>
                </div>
                <div class = "cont_campo">
                    <span class = "et_campo">
                        NIVEL:
                    </span>
                    <span class = "div_nivel">
                        <asp:Label ID="NivelLabel" runat="server" Text='<%# Bind("Nivel") %>' />
                    </span>
                </div>
                <span style="visibility: hidden;">
                    <asp:Label runat="server" ID="ID_Label" Text='<%# Bind("identificador") %>' CssClass='<%# Bind("identificador") %>'/>
                </span>
            </div>
            <div class = "foto_cont">
                <img src="img/anverso.png" width="339px" border="0"/>
            </div>
            <div class="clear_both"></div>
            <div class = "cod_barras">
                <%= cedula %>
            </div>
        </div>
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="origen_carnet" runat="server"        
        ConnectionString="<%$ ConnectionStrings:NAV_UISEK_ECUADORConnectionString %>" 
           SelectCommand="SELECT     TOP 1 dbo.Customer.[VAT Registration No_], dbo.Customer.Nombre + ' ' + dbo.Customer.[Apellido 1] + ' ' + dbo.Customer.[Apellido 2] AS nombre_alumno, 
                                    dbo.Curso.Descripción AS Nivel, dbo.Etapa.Descripción AS Centro, dbo.[UISEK_ECUADOR$CarrerasU+].Carrera AS Carrera, dbo.Customer.No_ AS identificador
                            FROM         dbo.[UISEK_ECUADOR$CarrerasU+] RIGHT OUTER JOIN
                                      dbo.Etapa RIGHT OUTER JOIN
                                      dbo.Customer LEFT OUTER JOIN
                                      dbo.Curso RIGHT OUTER JOIN
                                      dbo.[Curso escolar alumno] ON dbo.Curso.[Cód_ curso] = dbo.[Curso escolar alumno].[Cód_ Curso] ON 
                                      dbo.Customer.No_ = dbo.[Curso escolar alumno].[Cód_ Alumno] ON dbo.Etapa.[Cód_ Etapa] = dbo.Curso.Etapa ON 
                                      dbo.[UISEK_ECUADOR$CarrerasU+].CodCarrera = dbo.Curso.[CarreraU+]
                            WHERE     (dbo.[Curso escolar alumno].[Cód_ Curso Escolar] = '2014-1') AND dbo.[Curso escolar alumno].[CODCLIU+] = @alumno">
        <SelectParameters>
            <asp:QueryStringParameter Name="alumno" QueryStringField="alumno" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
