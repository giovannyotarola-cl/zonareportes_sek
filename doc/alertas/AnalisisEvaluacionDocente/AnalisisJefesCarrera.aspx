<%@ Page Title="Análisis Jefes de Carrera" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AnalisisJefesCarrera.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        function validarSeleccion(sender, args) {
            if (args.Value.length < 1)

                return args.IsValid = false;

            else
                return args.IsValid = true;

        }
    </script>
    <script src="Scripts/funciones.js"></script>


    <asp:Panel ID="panelSelect" runat="server">

        <h3>SELECCIONE PREGRADO</h3>
        <table>
            <tbody>
                <tr class="inter">
                    <td>TIPO DE PREGRADO</td>
                    <td>
                        <asp:DropDownList ID="DropDownList_selectPregrado" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="-" Text=""></asp:ListItem>
                            <asp:ListItem Value="PN" Text="PREGRADO REGULAR"></asp:ListItem>
                            <asp:ListItem Value="PE" Text="PREGRADO ESPECIAL"></asp:ListItem>

                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator5" ClientValidationFunction="validarSeleccion" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                    </td>

                </tr>
            </tbody>
        </table>
    </asp:Panel>

    <asp:Panel ID="panelPN" runat="server" Visible="false">



        <h1><%: Title %> Pregrado Regular</h1>
        <h3>EVALUACIÓN DEL DESEMPEÑO DOCENTE</h3>
        <table>
            <tbody>
                <tr class="inter">
                    <td>AÑO ACADÉMICO</td>
                    <td>
                        <asp:DropDownList ID="ddlAno" runat="server">
                            <asp:ListItem Value=""></asp:ListItem>
                            <asp:ListItem Value="2014"></asp:ListItem>
                            <asp:ListItem Value="2015"></asp:ListItem>
                            <asp:ListItem Value="2016"></asp:ListItem>
                            <asp:ListItem Value="2017"></asp:ListItem>
                            <asp:ListItem Value="2018"></asp:ListItem>
                            <asp:ListItem Value="2019"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator1" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlAno" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                    </td>
                    <td>SEMESTRE</td>
                    <td>
                        <asp:DropDownList ID="ddlSemestre" runat="server">
                            <asp:ListItem Value=""></asp:ListItem>
                            <asp:ListItem Value="1"></asp:ListItem>
                            <asp:ListItem Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator2" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlSemestre" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                    </td>
                </tr>
            </tbody>
        </table>
        <h3>SISTEMA DE EVALUACIÓN DEL DESEMPEÑO DOCENTE</h3>
        <table class="autowidth">
            <tbody>
                <% If (Session("Nivel") = "0" Or Session("Nivel") = "1") Then %>
                <tr>
                    <td>FACULTAD</td>
                    <td>
                        <asp:DropDownList ID="ddlFacultades" runat="server" AutoPostBack="True">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="CJS" Text="CIENCIAS JURÍDICAS Y SOCIALES"></asp:ListItem>
                            <asp:ListItem Value="ELE" Text="ELECTIVOS"></asp:ListItem>
                            <asp:ListItem Value="EPC" Text="FACULTAD DE EDUCACIÓN Y CULTURA"></asp:ListItem>
                            <asp:ListItem Value="INA" Text="FACULTAD DE ADMINISTRACIÓN, FINANZAS Y NEGOCIOS"></asp:ListItem>
                            <asp:ListItem Value="SAF" Text="CIENCIAS DE LA SALUD"></asp:ListItem>
                            <asp:ListItem Value="LCF" Text="FORMACIÓN GENERAL"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:CustomValidator ID="CustomValidator3" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlFacultades" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                    </td>
                </tr>
                <%End If %>
                <tr class="inter">
                    <td>EVALUACIÓN DOCENTE DE ESTUDIANTES</td>
                    <td>
                        <asp:RadioButton ID="rbtnEvalEst" runat="server" GroupName="filtroEvaluacion" /></td>
                </tr>
                <tr>
                    <td>AUTOEVALUACIÓN DOCENTE</td>
                    <td>
                        <asp:RadioButton ID="rbtnAutoEval" runat="server" GroupName="filtroEvaluacion" /></td>
                </tr>
                <tr class="inter">
                    <td>EVALUACIÓN JEFES DE CARRERA</td>
                    <td>
                        <asp:RadioButton ID="rbtnEvalJefe" runat="server" GroupName="filtroEvaluacion" /></td>
                </tr>
                <tr>
                    <td>CARRERA</td>
                    <td>
                        <asp:DropDownList ID="ddlCarrerasFiltro" runat="server"></asp:DropDownList></td>
                    <asp:CustomValidator ID="CustomValidator4" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlCarrerasFiltro" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                </tr>
            </tbody>
        </table>
        <div class="btnBuscar">
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClientClick="cargarBtnBuscar()" />
        </div>
        <asp:Panel ID="estadisticasNivel3" runat="server" Visible="false">
            <h3>ESTADÍSTICAS DESCRIPTIVAS DEL PROCESO.</h3>
            <table class="tablaResultados">
                <thead>
                    <tr>
                        <td></td>
                        <th class="aligncenter" colspan="2">JORNADA</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>1. ESTADÍSTICAS DESCRIPTIVAS</th>
                        <th class="aligncenter inter">Diurno</th>
                        <th class="aligncenter inter">Verpertino</th>
                        <th class="aligncenter">FACULTAD</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>NÚMERO DE ENCUESTAS HECHAS</th>
                        <td>
                            <asp:Label ID="lblEncHechasDiur" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncHechasVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncHechasTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>
                            <asp:Label ID="lblRutMatriculados" runat="server"></asp:Label></th>
                        <td>
                            <asp:Label ID="lblTotalMatricDiur" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblTotalMatricVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblTotalMatricTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>COBERTURA DEL PROCESO</th>
                        <td>
                            <asp:Label ID="lblCoberDiur" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblCoberVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblCoberTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>RESULTADOS: PROMEDIO GENERAL</th>
                        <td>
                            <asp:Label ID="lblPromGralDiur" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromGralVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromGralTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>DESVIACIÓN ESTANDAR</th>
                        <td>
                            <asp:Label ID="lblDesvEstDiur" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesvEstVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesvEstTotal" runat="server"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
            <asp:Table ID="tablaAsignaturas" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>CÓDIGO ASIGNATURA</asp:TableHeaderCell>
                    <asp:TableHeaderCell>NOMBRE ASOCIADO</asp:TableHeaderCell>
                    <asp:TableHeaderCell>PROFESOR</asp:TableHeaderCell>
                    <asp:TableHeaderCell>PROMEDIO</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
            <table class="tablaResultados">
                <thead>
                    <tr>
                        <th class="aligncenter" colspan="2">FILTROS PARA SALIDA DE INFORME FINAL</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr class="inter">
                        <th>ASIGNATURA</th>
                        <td>
                            <asp:DropDownList ID="ddlAsignaturaInforme" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="0" Text=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:CustomValidator ID="CustomValidator6" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlAsignaturaInforme" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red" ValidationGroup="informe"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>SECCIÓN</th>
                        <td>
                            <asp:DropDownList ID="ddlSeccionInforme" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="0" Text=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:CustomValidator ID="CustomValidator8" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlSeccionInforme" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red" ValidationGroup="informe"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr class="inter">

                        <th>PROFESOR</th>
                        <td>
                            <asp:DropDownList ID="ddlProfesorInforme" runat="server"></asp:DropDownList>
                            <asp:CustomValidator ID="CustomValidator7" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlProfesorInforme" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red" ValidationGroup="informe"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <th>ENCUESTA</th>
                        <td>
                            <asp:DropDownList ID="ddlTipoEncuesta" runat="server">
                                <asp:ListItem Value="0" Text=""></asp:ListItem>
                                <asp:ListItem Value="docEst" Text="Encuesta Alumno Docente"></asp:ListItem>
                                <asp:ListItem Value="autoDoc" Text="Autoevaluación Docente"></asp:ListItem>
                                <asp:ListItem Value="jefe" Text="Encuesta Jefe de Carrera"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:CustomValidator ID="CustomValidator9" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlTipoEncuesta" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red" ValidationGroup="informe"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <asp:Button ID="btnGenerar" runat="server" Text="Generar Informe" ValidationGroup="informe" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel>
    </asp:Panel>

     <asp:Panel ID="panelPE" runat="server" Visible="false">



        <h1><%: Title %> Pregrado Especial</h1>
        <h3>EVALUACIÓN DEL DESEMPEÑO DOCENTE</h3>
        <table>
            <tbody>
                <tr class="inter">
                    <td>AÑO ACADÉMICO</td>
                    <td>
                        <asp:DropDownList ID="ddlAno_pe" runat="server">
                            <asp:ListItem Value=""></asp:ListItem>
                            <asp:ListItem Value="2019"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator1_pe" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlAno_pe" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                    </td>
                    <td>SEMESTRE</td>
                    <td>
                        <asp:DropDownList ID="ddlSemestre_pe" runat="server">
                            <asp:ListItem Value=""></asp:ListItem>
                            <asp:ListItem Value="1"></asp:ListItem>
                            <asp:ListItem Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator2_pe" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlSemestre_pe" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                    </td>
                </tr>
            </tbody>
        </table>
        <h3>SISTEMA DE EVALUACIÓN DEL DESEMPEÑO DOCENTE</h3>
        <table class="autowidth">
            <tbody>
                <% If (Session("Nivel") = "0" Or Session("Nivel") = "1") Then %>
                <tr>
                    <td>FACULTAD</td>
                    <td>
                        <asp:DropDownList ID="ddlFacultades_pe" runat="server" AutoPostBack="True">
                            <asp:ListItem></asp:ListItem>                            
                            <asp:ListItem Value="CJS" Text="CIENCIAS JURÍDICAS Y SOCIALES"></asp:ListItem>                            
                            <asp:ListItem Value="ELE" Text="ELECTIVOS"></asp:ListItem>                            
                            <asp:ListItem Value="HED" Text="FACULTAD DE EDUCACIÓN Y CULTURA"></asp:ListItem>                            
                            <asp:ListItem Value="INA" Text="FACULTAD DE ADMINISTRACIÓN, FINANZAS Y NEGOCIOS"></asp:ListItem>                            
                            <asp:ListItem Value="SAF" Text="CIENCIAS DE LA SALUD"></asp:ListItem>
                            <asp:ListItem Value="LCF" Text="FORMACIÓN GENERAL"></asp:ListItem>

                        </asp:DropDownList>
                        <asp:CustomValidator ID="CustomValidator3_pe" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlFacultades_pe" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                    </td>
                </tr>
                <%End If %>
                <tr class="inter">
                    <td>EVALUACIÓN DOCENTE DE ESTUDIANTES</td>
                    <td>
                        <asp:RadioButton ID="rbtnEvalEst_pe" runat="server" GroupName="filtroEvaluacion" /></td>
                </tr>
                <tr>
                    <td>AUTOEVALUACIÓN DOCENTE</td>
                    <td>
                        <asp:RadioButton ID="rbtnAutoEval_pe" runat="server" GroupName="filtroEvaluacion" /></td>
                </tr>
                <tr class="inter">
                    <td>EVALUACIÓN JEFES DE CARRERA</td>
                    <td>
                        <asp:RadioButton ID="rbtnEvalJefe_pe" runat="server" GroupName="filtroEvaluacion" /></td>
                </tr>
                <tr>
                    <td>CARRERA</td>
                    <td>
                        <asp:DropDownList ID="ddlCarrerasFiltro_pe" runat="server"></asp:DropDownList></td>
                    <asp:CustomValidator ID="CustomValidator4_pe" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlCarrerasFiltro_pe" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
                </tr>
            </tbody>
        </table>
        <div class="btnBuscar">
            <asp:Button ID="btnBuscar_pe" runat="server" Text="Buscar" OnClientClick="cargarBtnBuscar_pe()" />
        </div>
        <asp:Panel ID="estadisticasNivel3_pe" runat="server" Visible="false">
            <h3>ESTADÍSTICAS DESCRIPTIVAS DEL PROCESO.</h3>
            <table class="tablaResultados">
                <thead>
                    <tr>
                        <td></td>
                        <th class="aligncenter" colspan="2">JORNADA</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>1. ESTADÍSTICAS DESCRIPTIVAS</th>
                        <th class="aligncenter inter">Diurno</th>
                        <th class="aligncenter inter">Verpertino</th>
                        <th class="aligncenter">FACULTAD</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>NÚMERO DE ENCUESTAS HECHAS</th>
                        <td>
                            <asp:Label ID="lblEncHechasDiur_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncHechasVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncHechasTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>
                            <asp:Label ID="lblRutMatriculados_pe" runat="server"></asp:Label></th>
                        <td>
                            <asp:Label ID="lblTotalMatricDiur_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblTotalMatricVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblTotalMatricTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>COBERTURA DEL PROCESO</th>
                        <td>
                            <asp:Label ID="lblCoberDiur_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblCoberVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblCoberTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>RESULTADOS: PROMEDIO GENERAL</th>
                        <td>
                            <asp:Label ID="lblPromGralDiur_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromGralVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromGralTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>DESVIACIÓN ESTANDAR</th>
                        <td>
                            <asp:Label ID="lblDesvEstDiur_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesvEstVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesvEstTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
            <asp:Table ID="tablaAsignaturas_pe" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>CÓDIGO ASIGNATURA</asp:TableHeaderCell>
                    <asp:TableHeaderCell>NOMBRE ASOCIADO</asp:TableHeaderCell>
                    <asp:TableHeaderCell>PROFESOR</asp:TableHeaderCell>
                    <asp:TableHeaderCell>PROMEDIO</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
            <table class="tablaResultados">
                <thead>
                    <tr>
                        <th class="aligncenter" colspan="2">FILTROS PARA SALIDA DE INFORME FINAL</th>
                    </tr>
                </thead>
                <tbody>
                  
                    <tr class="inter">
                        <th>ASIGNATURA</th>
                        <td>
                            <asp:DropDownList ID="ddlAsignaturaInforme_pe" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="0" Text=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:CustomValidator ID="CustomValidator6_pe" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlAsignaturaInforme_pe" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red" ValidationGroup="informe"></asp:CustomValidator>
                        </td>
                    </tr>
                    
                    
                     <tr>

                        <th>PROFESOR</th>
                        <td>
                            <asp:DropDownList ID="ddlProfesorInforme_pe" runat="server" AutoPostBack="True"></asp:DropDownList>
                            <asp:CustomValidator ID="CustomValidator7_pe" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlProfesorInforme_pe" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red" ValidationGroup="informe"></asp:CustomValidator>
                        </td>


                    </tr>


                    <tr class="inter">
                        <th>SECCIÓN</th>
                        <td>
                            <asp:DropDownList ID="ddlSeccionInforme_pe" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="0" Text=""></asp:ListItem>
                            </asp:DropDownList>
                            <asp:CustomValidator ID="CustomValidator8_pe" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlSeccionInforme_pe" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red" ValidationGroup="informe"></asp:CustomValidator>
                        </td>
                    </tr>
                   
                    <tr>
                        <th>ENCUESTA</th>
                        <td>
                            <asp:DropDownList ID="ddlTipoEncuesta_pe" runat="server">
                                <asp:ListItem Value="0" Text=""></asp:ListItem>
                                <asp:ListItem Value="docEst" Text="Encuesta Alumno Docente"></asp:ListItem>
                                <asp:ListItem Value="autoDoc" Text="Autoevaluación Docente"></asp:ListItem>
                                <asp:ListItem Value="jefe" Text="Encuesta Jefe de Carrera"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:CustomValidator ID="CustomValidator9_pe" ClientValidationFunction="validarSeleccion" ControlToValidate="ddlTipoEncuesta_pe" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red" ValidationGroup="informe"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <asp:Button ID="btnGenerar_pe" runat="server" Text="Generar Informe" ValidationGroup="informe" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel>
    </asp:Panel>


</asp:Content>

