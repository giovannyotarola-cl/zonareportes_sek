<%@ Page Title="Análisis Decanos" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AnalisisDecanos.aspx.vb" Inherits="_Default" %>

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
                        <asp:CustomValidator ID="CustomValidator7" ClientValidationFunction="validarSeleccion" runat="server" ErrorMessage="*" ValidateEmptyText="True" ForeColor="Red"></asp:CustomValidator>
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
        <table class="autowidth float-left">
            <tbody>
                <% If (Session("Nivel") = "0" Or Session("Nivel") = "1") Then %>
                <tr>
                    <td>FACULTAD</td>
                    <td>
                        <asp:DropDownList ID="ddlFacultades" runat="server">
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
                    <td>JORNADA</td>
                    <td>
                        <asp:DropDownList ID="ddlJornada" runat="server">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="D" Text="DIURNA"></asp:ListItem>
                            <asp:ListItem Value="V" Text="VESPERTINA"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="escalaEvaluacion float-left">
            <h3>Escala de evaluación a utilizar:</h3>
            <ul>
                <li>1. Muy en desacuerdo</li>
                <li>2. En desacuerdo</li>
                <li>3. Poco de acuerdo</li>
                <li>4. De acuerdo</li>
                <li>5. Muy de acuerdo</li>
            </ul>
        </div>
        <div class="clear-fix"></div>
        <div class="btnBuscar">
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClientClick="       cargarNivel2()" />
        </div>
        <asp:Panel ID="estadisticasNivel2" runat="server" Visible="false">
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
                        <td id="tdDiurEncHec" runat="server">
                            <asp:Label ID="lblEncHechasDiur" runat="server"></asp:Label></td>
                        <td id="tdVespEncHec" runat="server">
                            <asp:Label ID="lblEncHechasVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncHechasTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>
                            <asp:Label ID="lblRutMatriculados" runat="server"></asp:Label></th>
                        <td id="tdDiurAlumMat" runat="server">
                            <asp:Label ID="lblTotalMatricDiur" runat="server"></asp:Label></td>
                        <td id="tdVespAlumMat" runat="server">
                            <asp:Label ID="lblTotalMatricVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblTotalMatricTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>COBERTURA DEL PROCESO</th>
                        <td id="tdDiurCob" runat="server">
                            <asp:Label ID="lblCoberDiur" runat="server"></asp:Label></td>
                        <td id="tdVespCob" runat="server">
                            <asp:Label ID="lblCoberVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblCoberTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>RESULTADOS: PROMEDIO GENERAL</th>
                        <td id="tdDiurProm" runat="server">
                            <asp:Label ID="lblPromGralDiur" runat="server"></asp:Label></td>
                        <td id="tdVespProm" runat="server">
                            <asp:Label ID="lblPromGralVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromGralTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>DESVIACIÓN ESTANDAR</th>
                        <td id="tdDiurDesv" runat="server">
                            <asp:Label ID="lblDesvEstDiur" runat="server"></asp:Label></td>
                        <td id="tdVespDesv" runat="server">
                            <asp:Label ID="lblDesvEstVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesvEstTotal" runat="server"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
            <asp:Table ID="tablaResultadosCarreras" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>CARRERA</asp:TableHeaderCell>
                    <asp:TableHeaderCell>NÚMERO DE ENCUESTAS HECHAS</asp:TableHeaderCell>
                    <asp:TableHeaderCell>NÚMERO DE ENCUESTAS A REALIZAR</asp:TableHeaderCell>
                    <asp:TableHeaderCell>COBERTURA DEL PROCESO</asp:TableHeaderCell>
                    <asp:TableHeaderCell>RESULTADOS: PROMEDIO GENERAL</asp:TableHeaderCell>
                    <asp:TableHeaderCell>DESVIACIÓN ESTANDAR</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>


            <asp:Panel ID="pnlResultadosGeneralesNivel2" Visible="false" runat="server">
                <h3>RESULTADOS GENERALES</h3>
                <table class="autowidth tablaResultados">
                    <thead>
                        <tr>
                            <th>NIVEL UNIVERSIDAD</th>
                            <th class="aligncenter" colspan="2">RESULTADOS</th>
                        </tr>
                        <tr class="inter">
                            <th>DIMENSIONES</th>
                            <th class="aligncenter">Promedio</th>
                            <th class="aligncenter">Desviación
                            <br />
                                estándar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>EVALUACIÓN GENERAL</th>
                            <td>
                                <asp:Label ID="lblEvGenProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvGenDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>PLANEACIÓN DEL CURSO</th>
                            <td>
                                <asp:Label ID="lblPlanProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPlamDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>METODOLOGÍAS DE ENSEÑANZA</th>
                            <td>
                                <asp:Label ID="lblMetProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMetDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>CONTENIDOS ASIGNATURAS</th>
                            <td>
                                <asp:Label ID="lblContProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblContDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>CLIMA EDUCATIVO</th>
                            <td>
                                <asp:Label ID="lblClimProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblClimDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>EVALUACIÓN DEL CURSO</th>
                            <td>
                                <asp:Label ID="lblEvProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>DEBERES DOCENTES</th>
                            <td>
                                <asp:Label ID="lblDebProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDebDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>AYUDANTÍAS</th>
                            <td>
                                <asp:Label ID="lblAyudProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAyudDesv" runat="server"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
                <asp:Table ID="tablaResultadosGeneralesCarreras" runat="server">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>CARRERAS</asp:TableHeaderCell>
                        <asp:TableHeaderCell>EVALUACIÓN GENERAL</asp:TableHeaderCell>
                        <asp:TableHeaderCell>PLANEACIÓN DEL CURSO</asp:TableHeaderCell>
                        <asp:TableHeaderCell>METODOLOGÍAS DE ENSEÑANZA</asp:TableHeaderCell>
                        <asp:TableHeaderCell>CONTENIDOS ASIGNATURAS</asp:TableHeaderCell>
                        <asp:TableHeaderCell>CLIMA EDUCATIVO</asp:TableHeaderCell>
                        <asp:TableHeaderCell>EVALUACIÓN DEL CURSO</asp:TableHeaderCell>
                        <asp:TableHeaderCell>DEBERES DOCENTES</asp:TableHeaderCell>
                        <asp:TableHeaderCell>AYUDANTÍAS</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>
            </asp:Panel>
            <input id="btnImprimir" type="button" onclick="window.print()" value="Imprimir" />


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
        <table class="autowidth float-left">
            <tbody>
                <% If (Session("Nivel") = "0" Or Session("Nivel") = "1") Then %>
                <tr>
                    <td>FACULTAD</td>
                    <td>
                        <asp:DropDownList ID="ddlFacultades_pe" runat="server">
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
                    <!--<td>JORNADA</td>-->
                    <td>
                        <asp:DropDownList ID="ddlJornada_pe" runat="server" Visible="false">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                            <asp:ListItem Value="D" Text="DIURNA"></asp:ListItem>
                            <asp:ListItem Value="V" Text="VESPERTINA"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="escalaEvaluacion float-left">
            <h3>Escala de evaluación a utilizar:</h3>
            <ul>
                <li>1. Muy en desacuerdo</li>
                <li>2. En desacuerdo</li>
                <li>3. Poco de acuerdo</li>
                <li>4. De acuerdo</li>
                <li>5. Muy de acuerdo</li>
            </ul>
        </div>
        <div class="clear-fix"></div>
        <div class="btnBuscar">
            <asp:Button ID="btnBuscar_pe" runat="server" Text="Buscar" OnClientClick="       cargarNivel2_pe()" />
        </div>

        <asp:Panel ID="estadisticasNivel2_pe" runat="server" Visible="false">
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
                        <td id="tdDiurEncHec_pe" runat="server">
                            <asp:Label ID="lblEncHechasDiur_pe" runat="server"></asp:Label></td>
                        <td id="tdVespEncHec_pe" runat="server">
                            <asp:Label ID="lblEncHechasVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncHechasTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>
                            <asp:Label ID="lblRutMatriculados_pe" runat="server"></asp:Label></th>
                        <td id="tdDiurAlumMat_pe" runat="server">
                            <asp:Label ID="lblTotalMatricDiur_pe" runat="server"></asp:Label></td>
                        <td id="tdVespAlumMat_pe" runat="server">
                            <asp:Label ID="lblTotalMatricVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblTotalMatricTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>COBERTURA DEL PROCESO</th>
                        <td id="tdDiurCob_pe" runat="server">
                            <asp:Label ID="lblCoberDiur_pe" runat="server"></asp:Label></td>
                        <td id="tdVespCob_pe" runat="server">
                            <asp:Label ID="lblCoberVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblCoberTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>RESULTADOS: PROMEDIO GENERAL</th>
                        <td id="tdDiurProm_pe" runat="server">
                            <asp:Label ID="lblPromGralDiur_pe" runat="server"></asp:Label></td>
                        <td id="tdVespProm_pe" runat="server">
                            <asp:Label ID="lblPromGralVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromGralTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>DESVIACIÓN ESTANDAR</th>
                        <td id="tdDiurDesv_pe" runat="server">
                            <asp:Label ID="lblDesvEstDiur_pe" runat="server"></asp:Label></td>
                        <td id="tdVespDesv_pe" runat="server">
                            <asp:Label ID="lblDesvEstVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesvEstTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
            <asp:Table ID="tablaResultadosCarreras_pe" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>CARRERA</asp:TableHeaderCell>
                    <asp:TableHeaderCell>NÚMERO DE ENCUESTAS HECHAS</asp:TableHeaderCell>
                    <asp:TableHeaderCell>NÚMERO DE ENCUESTAS A REALIZAR</asp:TableHeaderCell>
                    <asp:TableHeaderCell>COBERTURA DEL PROCESO</asp:TableHeaderCell>
                    <asp:TableHeaderCell>RESULTADOS: PROMEDIO GENERAL</asp:TableHeaderCell>
                    <asp:TableHeaderCell>DESVIACIÓN ESTANDAR</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
            <asp:Panel ID="pnlResultadosGeneralesNivel2_pe" Visible="false" runat="server">
                <h3>RESULTADOS GENERALES</h3>
                <table class="autowidth tablaResultados">
                    <thead>
                        <tr>
                            <th>NIVEL UNIVERSIDAD</th>
                            <th class="aligncenter" colspan="2">RESULTADOS</th>
                        </tr>
                        <tr class="inter">
                            <th>DIMENSIONES</th>
                            <th class="aligncenter">Promedio</th>
                            <th class="aligncenter">Desviación
                                    <br />
                                estándar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>EVALUACIÓN GENERAL</th>
                            <td>
                                <asp:Label ID="lblEvGenProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvGenDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>PLANEACIÓN DEL CURSO</th>
                            <td>
                                <asp:Label ID="lblPlanProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPlamDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>METODOLOGÍAS DE ENSEÑANZA</th>
                            <td>
                                <asp:Label ID="lblMetProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMetDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>CONTENIDOS ASIGNATURAS</th>
                            <td>
                                <asp:Label ID="lblContProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblContDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>CLIMA EDUCATIVO</th>
                            <td>
                                <asp:Label ID="lblClimProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblClimDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>EVALUACIÓN DEL CURSO</th>
                            <td>
                                <asp:Label ID="lblEvProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>DEBERES DOCENTES</th>
                            <td>
                                <asp:Label ID="lblDebProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDebDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>    MOODLE</th>
                            <td>
                                <asp:Label ID="lblAyudProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAyudDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
                <asp:Table ID="tablaResultadosGeneralesCarreras_pe" runat="server">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>CARRERAS</asp:TableHeaderCell>
                        <asp:TableHeaderCell>EVALUACIÓN GENERAL</asp:TableHeaderCell>
                        <asp:TableHeaderCell>PLANEACIÓN DEL CURSO</asp:TableHeaderCell>
                        <asp:TableHeaderCell>METODOLOGÍAS DE ENSEÑANZA</asp:TableHeaderCell>
                        <asp:TableHeaderCell>CONTENIDOS ASIGNATURAS</asp:TableHeaderCell>
                        <asp:TableHeaderCell>CLIMA EDUCATIVO</asp:TableHeaderCell>
                        <asp:TableHeaderCell>EVALUACIÓN DEL CURSO</asp:TableHeaderCell>
                        <asp:TableHeaderCell>DEBERES DOCENTES</asp:TableHeaderCell>
                        <asp:TableHeaderCell>AYUDANTÍAS</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>
            </asp:Panel>
            <input id="btnImprimir_pe" type="button" onclick="window.print()" value="Imprimir" />


        </asp:Panel>
    </asp:Panel>


</asp:Content>

