<%@ Page Title="Análisis Directivos" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AnalisisDirectivos.aspx.vb" Inherits="_Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        function validarSeleccion(sender, args) {
            if (args.Value.length < 1) {

                return args.IsValid = false;
            }
            else {
                return args.IsValid = true;
            }
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
            <asp:Button ID="btnBuscar" CssClass="btnBuscar" runat="server" Text="Buscar" OnClientClick="cargarNivel1()" />
        </div>
        <asp:Panel ID="estadisticasNivel1" runat="server" Visible="false">
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
                        <th class="aligncenter">TOTAL UNIVERSIDAD</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>NÚMERO DE ENCUESTAS HECHAS</th>
                        <td id="tdDiurEncHec" runat="server">
                            <asp:Label ID="lblNumEncHechasDiur" runat="server"></asp:Label></td>
                        <td id="tdVespEncHec" runat="server">
                            <asp:Label ID="lblNumEncHechasVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblNumEncHechasTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>
                            <asp:Label ID="lblRutMatriculados" runat="server"></asp:Label></th>
                        <td id="tdDiurAlumMat" runat="server">
                            <asp:Label ID="lblAlumnMatriculadosDiur" runat="server"></asp:Label></td>
                        <td id="tdVespAlumMat" runat="server">
                            <asp:Label ID="lblAlumnMatriculadosVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAlumnMatriculadosTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>COBERTURA DEL PROCESO</th>
                        <td id="tdDiurCob" runat="server">
                            <asp:Label ID="lblCoberturaDiur" runat="server"></asp:Label></td>
                        <td id="tdVespCob" runat="server">
                            <asp:Label ID="lblCoberturaVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblCoberturaTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>RESULTADOS: PROMEDIO GENERAL</th>
                        <td id="tdDiurProm" runat="server">
                            <asp:Label ID="lblPromGeneralDiur" runat="server"></asp:Label></td>
                        <td id="tdVespProm" runat="server">
                            <asp:Label ID="lblPromGeneralVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromGeneralTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>DESVIACIÓN ESTANDAR</th>
                        <td id="tdDiurDesv" runat="server">
                            <asp:Label ID="lblDesviacionEstandarDiur" runat="server"></asp:Label></td>
                        <td id="tdVespDesv" runat="server">
                            <asp:Label ID="lblDesviacionEstandarVesp" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesviacionEstandarTotal" runat="server"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
            <table class="tablaResultados">
                <thead>
                    <tr>
                        <td></td>
                        <th class="aligncenter" colspan="4">FACULTADES</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>2. ESTADÍSTICAS DESCRIPTIVAS</th>
                        <th class="inter aligncenter">P. Cultural Educación</th>
                        <th class="inter aligncenter">Cs. Jurídicas</th>
                        <th class="inter aligncenter">Ingeniería</th>
                        <th class="inter aligncenter">Salud</th>
                        <th class="aligncenter">UNIVERSIDAD</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>NÚMERO DE ENCUESTAS HECHAS</th>
                        <td>
                            <asp:Label ID="lblEncuestasHechasPCultural" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncuestasHechasCSJuridicas" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncuestasHechasIngenieria" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncuestasHechasSalud" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncuestasHechasTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>NÚMERO ENCUESTAS A REALIZAR</th>
                        <td>
                            <asp:Label ID="lblAlumnosMatriculadosPCultural" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAlumnosMatriculadosCSJuridicas" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAlumnosMatriculadosIngenieria" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAlumnosMatriculadosSalud" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAlumnosMatriculadosTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>PORCENTAJE COBERTURA DEL PROCESO</th>
                        <td>
                            <asp:Label ID="lblPorcentajeCoberturaPCultural" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPorcentajeCoberturaCSJuridicas" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPorcentajeCoberturaIngenieria" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPorcentajeCoberturaSalud" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPorcentajeCoberturaTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>RESULTADOS: PROMEDIO GENERAL</th>
                        <td>
                            <asp:Label ID="lblPromedioGeneralPCultural" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromedioGeneralCSJuridicas" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromedioGeneralIngenieria" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromedioGeneralSalud" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromedioGeneralTotal" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>DESVIACIÓN ESTÁNDAR PROM. GRAL.</th>
                        <td>
                            <asp:Label ID="lblDesviacionPCultural" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesviacionCSJuridicas" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesviacionIngenieria" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesviacionSalud" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesviacionTotal" runat="server"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
            <asp:Panel ID="pnlResultadosGeneralesNivel1" runat="server">
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
                                <asp:Label ID="lblEvaluacionGeneralProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionGeneralDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th class="auto-style1">PLANEACIÓN DEL CURSO</th>
                            <td class="auto-style1">
                                <asp:Label ID="lblPlaneacionProm" runat="server"></asp:Label></td>
                            <td class="auto-style1">
                                <asp:Label ID="lblPlaneacionDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>METODOLOGÍAS DE ENSEÑANZA</th>
                            <td>
                                <asp:Label ID="lblMetodologiaProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMetodologiaDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>CONTENIDOS ASIGNATURAS</th>
                            <td>
                                <asp:Label ID="lblContenidoProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblContenidoDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>CLIMA EDUCATIVO</th>
                            <td>
                                <asp:Label ID="lblClimaProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblClimaDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>EVALUACIÓN DEL CURSO</th>
                            <td>
                                <asp:Label ID="lblEvaluacionProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>DEBERES DOCENTES</th>
                            <td>
                                <asp:Label ID="lblDeberesProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDeberesDesv" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>AYUDANTÍAS</th>
                            <td>
                                <asp:Label ID="lblAyudantiasProm" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAyudantiasDesv" runat="server"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
                <table class="tablaResultados">
                    <thead>
                        <tr>
                            <td></td>
                            <th class="aligncenter" colspan="4">FACULTADES</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>DIMENSIONES</th>
                            <th class="inter aligncenter">P. Cultural Educación</th>
                            <th class="inter aligncenter">Cs. Jurídicas y Soc</th>
                            <th class="inter aligncenter">Ingeniería y Adm.</th>
                            <th class="inter aligncenter">Salud y Cs. Act. Física</th>
                            <th class="aligncenter">UNIVERSIDAD</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>EVALUACIÓN GENERAL</th>
                            <td>
                                <asp:Label ID="lblEvaluacionPCultural" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionCSJuridicas" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionIngenieria" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionSalud" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionUniversidad" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>PLANEACIÓN DEL CURSO</th>
                            <td>
                                <asp:Label ID="lblPlaneacionPCultural" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPlaneacionCSJuridicas" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPlaneacionIngenieria" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPlaneacionSalud" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPlaneacionUniversidad" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>METODOLOGÍAS DE ENSEÑANZA</th>
                            <td>
                                <asp:Label ID="lblMetodologiaPCultural" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMetodologiaCSJuridicas" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMetodologiaIngenieria" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMetodologiaSalud" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMetodologiaUniversidad" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>CONTENIDOS ASIGNATURAS</th>
                            <td>
                                <asp:Label ID="lblContenidoPCultural" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblContenidoCSJuridicas" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblContenidoIngenieria" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblContenidoSalud" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblContenidoUniversidad" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>CLIMA EDUCATIVO</th>
                            <td>
                                <asp:Label ID="lblClimaPCultural" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblClimaCSJuridicas" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblClimaIngenieria" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblClimaSalud" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblClimaUniversidad" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>EVALUACIÓN DEL CURSO</th>
                            <td>
                                <asp:Label ID="lblEvaluacionCursoPCultural" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionCursoCSJuridicas" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionCursoIngenieria" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionCursoSalud" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionCursoUniversidad" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>DEBERES DOCENTES</th>
                            <td>
                                <asp:Label ID="lblDeberesPCultural" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDeberesCSJuridicas" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDeberesIngenieria" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDeberesSalud" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDeberesUniversidad" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>AYUDANTÍAS</th>
                            <td>
                                <asp:Label ID="lblAyudantiasPCultural" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAyudantiasCSJuridicas" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAyudantiasIngenieria" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAyudantiasSalud" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAyudantiasUniversidad" runat="server"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
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
            <asp:Button ID="btnBuscar_pe" CssClass="btnBuscar" runat="server" Text="Buscar" OnClientClick="cargarNivel1_pe()" />
        </div>
        <asp:Panel ID="estadisticasNivel1_pe" runat="server" Visible="false">
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
                        <th class="aligncenter">TOTAL UNIVERSIDAD</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>NÚMERO DE ENCUESTAS HECHAS</th>
                        <td id="tdDiurEncHec_pe" runat="server">
                            <asp:Label ID="lblNumEncHechasDiur_pe" runat="server"></asp:Label></td>
                        <td id="tdVespEncHec_pe" runat="server">
                            <asp:Label ID="lblNumEncHechasVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblNumEncHechasTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>
                            <asp:Label ID="lblRutMatriculados_pe" runat="server"></asp:Label></th>
                        <td id="tdDiurAlumMat_pe" runat="server">
                            <asp:Label ID="lblAlumnMatriculadosDiur_pe" runat="server"></asp:Label></td>
                        <td id="tdVespAlumMat_pe" runat="server">
                            <asp:Label ID="lblAlumnMatriculadosVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAlumnMatriculadosTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>COBERTURA DEL PROCESO</th>
                        <td id="tdDiurCob_pe" runat="server">
                            <asp:Label ID="lblCoberturaDiur_pe" runat="server"></asp:Label></td>
                        <td id="tdVespCob_pe" runat="server">
                            <asp:Label ID="lblCoberturaVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblCoberturaTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>RESULTADOS: PROMEDIO GENERAL</th>
                        <td id="tdDiurProm_pe" runat="server">
                            <asp:Label ID="lblPromGeneralDiur_pe" runat="server"></asp:Label></td>
                        <td id="tdVespProm_pe" runat="server">
                            <asp:Label ID="lblPromGeneralVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromGeneralTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>DESVIACIÓN ESTANDAR</th>
                        <td id="tdDiurDesv_pe" runat="server">
                            <asp:Label ID="lblDesviacionEstandarDiur_pe" runat="server"></asp:Label></td>
                        <td id="tdVespDesv_pe" runat="server">
                            <asp:Label ID="lblDesviacionEstandarVesp_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesviacionEstandarTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
            <table class="tablaResultados">
                <thead>
                    <tr>
                        <td></td>
                        <th class="aligncenter" colspan="4">FACULTADES</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>2. ESTADÍSTICAS DESCRIPTIVAS</th>
                        <th class="inter aligncenter">Cs. Jurídicas</th>
                        <th class="inter aligncenter">Electivos</th>
                        <th class="inter aligncenter">Educación y Cultura</th>
                        <th class="inter aligncenter">Administración</th>
                        <th class="inter aligncenter">Salud</th>
                        <th class="aligncenter">UNIVERSIDAD</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>NÚMERO DE ENCUESTAS HECHAS</th>
                         <td>
                            <asp:Label ID="lblEncuestasHechasCSJuridicas_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncuestasHechasElectivos_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncuestasHechasPCultural_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncuestasHechasIngenieria_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncuestasHechasSalud_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblEncuestasHechasTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr class="inter">
                        <th>NÚMERO ENCUESTAS A REALIZAR</th>
                        <td>
                                <asp:Label ID="lblAlumnosMatriculadosCSJuridicas_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAlumnosMatriculadosElectivos_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAlumnosMatriculadosPCultural_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAlumnosMatriculadosIngenieria_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAlumnosMatriculadosSalud_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAlumnosMatriculadosTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>PORCENTAJE COBERTURA DEL PROCESO</th>
                     <td>
                                <asp:Label ID="lblPorcentajeCoberturaCSJuridicas_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPorcentajeCoberturaElectivos_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPorcentajeCoberturaPCultural_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPorcentajeCoberturaIngenieria_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPorcentajeCoberturaSalud_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPorcentajeCoberturaTotal_pe" runat="server"></asp:Label></td>

                    </tr>
                    <tr class="inter">
                        <th>RESULTADOS: PROMEDIO GENERAL</th>
                       <td>
                                <asp:Label ID="lblPromedioGeneralCSJuridicas_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromedioGeneralElectivos_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromedioGeneralPCultural_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromedioGeneralIngenieria_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromedioGeneralSalud_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblPromedioGeneralTotal_pe" runat="server"></asp:Label></td>

                    </tr>
                    <tr>
                        <th>DESVIACIÓN ESTÁNDAR PROM. GRAL.</th>
                      <td>
                                <asp:Label ID="lblDesviacionCSJuridicas_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesviacionElectivos_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesviacionPCultural_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesviacionIngenieria_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesviacionSalud_pe" runat="server"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblDesviacionTotal_pe" runat="server"></asp:Label></td>
                    </tr>
                </tbody>
            </table>
            <asp:Panel ID="pnlResultadosGeneralesNivel1_pe" runat="server">
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
                                <asp:Label ID="lblEvaluacionGeneralProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionGeneralDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th class="auto-style1">PLANEACIÓN DEL CURSO</th>
                            <td class="auto-style1">
                                <asp:Label ID="lblPlaneacionProm_pe" runat="server"></asp:Label></td>
                            <td class="auto-style1">
                                <asp:Label ID="lblPlaneacionDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>METODOLOGÍAS DE ENSEÑANZA</th>
                            <td>
                                <asp:Label ID="lblMetodologiaProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMetodologiaDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>CONTENIDOS ASIGNATURAS</th>
                            <td>
                                <asp:Label ID="lblContenidoProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblContenidoDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>CLIMA EDUCATIVO</th>
                            <td>
                                <asp:Label ID="lblClimaProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblClimaDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>EVALUACIÓN DEL CURSO</th>
                            <td>
                                <asp:Label ID="lblEvaluacionProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>DEBERES DOCENTES</th>
                            <td>
                                <asp:Label ID="lblDeberesProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDeberesDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>MOODLE</th>
                            <td>
                                <asp:Label ID="lblAyudantiasProm_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAyudantiasDesv_pe" runat="server"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
                <table class="tablaResultados">
                    <thead>
                        <tr>
                            <td></td>
                            <th class="aligncenter" colspan="4">FACULTADES</th>
                            <td></td>
                        </tr>
                        <tr>
                            <th>DIMENSIONES</th>
                      <th class="inter aligncenter">Cs. Jurídicas</th>
                        <th class="inter aligncenter">Electivos</th>
                        <th class="inter aligncenter">Educación y Cultura</th>
                        <th class="inter aligncenter">Administración</th>
                        <th class="inter aligncenter">Salud</th>
                        <th class="aligncenter">UNIVERSIDAD</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>EVALUACIÓN GENERAL</th>
                             <td>                                
								<asp:Label ID="lblEvaluacionCSJuridicas_pe" runat="server"></asp:Label></td>
							<td>                                
								<asp:Label ID="lblEvaluacionElectivo_pe" runat="server"></asp:Label></td>
                            <td>                                
								<asp:Label ID="lblEvaluacionPCultural_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionIngenieria_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionSalud_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionUniversidad_pe" runat="server"></asp:Label></td>

                        <tr class="inter">
                            <th>PLANEACIÓN DEL CURSO</th>
                             <td>                                
								<asp:Label ID="lblPlaneacionCSJuridicas_pe" runat="server"></asp:Label></td>
							<td>                                
								<asp:Label ID="lblPlaneacionElectivo_pe" runat="server"></asp:Label></td>
                            <td>                                
								<asp:Label ID="lblPlaneacionPCultural_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPlaneacionIngenieria_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPlaneacionSalud_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPlaneacionUniversidad_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>METODOLOGÍAS DE ENSEÑANZA</th>
                           <td>                                
								<asp:Label ID="lblMetodologiaCSJuridicas_pe" runat="server"></asp:Label></td>
							<td>                                
								<asp:Label ID="lblMetodologiaElectivo_pe" runat="server"></asp:Label></td>
                            <td>                                
								<asp:Label ID="lblMetodologiaPCultural_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMetodologiaIngenieria_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMetodologiaSalud_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblMetodologiaUniversidad_pe" runat="server"></asp:Label></td>

                        </tr>
                        <tr class="inter">
                            <th>CONTENIDOS ASIGNATURAS</th>
                            <td>                                
								<asp:Label ID="lblContenidoCSJuridicas_pe" runat="server"></asp:Label></td>
							<td>                                
								<asp:Label ID="lblContenidoElectivo_pe" runat="server"></asp:Label></td>
                            <td>                                
								<asp:Label ID="lblContenidoPCultural_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblContenidoIngenieria_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblContenidoSalud_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblContenidoUniversidad_pe" runat="server"></asp:Label></td>
                      
                        </tr>
                        <tr>
                            <th>CLIMA EDUCATIVO</th>
                            <td>                                
								<asp:Label ID="lblClimaCSJuridicas_pe" runat="server"></asp:Label></td>
							<td>                                
								<asp:Label ID="lblClimaElectivo_pe" runat="server"></asp:Label></td>
                            <td>                                
								<asp:Label ID="lblClimaPCultural_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblClimaIngenieria_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblClimaSalud_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblClimaUniversidad_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>EVALUACIÓN DEL CURSO</th>
                                                       <td>                                
								<asp:Label ID="lblEvaluacionCursoCSJuridicas_pe" runat="server"></asp:Label></td>
							<td>                                
								<asp:Label ID="lblEvaluacionCursoElectivo_pe" runat="server"></asp:Label></td>
                            <td>                                
								<asp:Label ID="lblEvaluacionCursoPCultural_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionCursoIngenieria_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionCursoSalud_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEvaluacionCursoUniversidad_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>DEBERES DOCENTES</th>
                                    <td>                                
								<asp:Label ID="lblDeberesCSJuridicas_pe" runat="server"></asp:Label></td>
							<td>                                
								<asp:Label ID="lblDeberesElectivo_pe" runat="server"></asp:Label></td>
                            <td>                                
								<asp:Label ID="lblDeberesPCultural_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDeberesIngenieria_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDeberesSalud_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblDeberesUniversidad_pe" runat="server"></asp:Label></td>
                        </tr>
                        <tr class="inter">
                            <th>AYUDANTÍAS</th>
                            <td>                                
								<asp:Label ID="lblAyudantiasCSJuridicas_pe" runat="server"></asp:Label></td>
							<td>                                
								<asp:Label ID="lblAyudantiasElectivo_pe" runat="server"></asp:Label></td>
                            <td>                                
								<asp:Label ID="lblAyudantiasPCultural_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAyudantiasIngenieria_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAyudantiasSalud_pe" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAyudantiasUniversidad_pe" runat="server"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
            <input id="btnImprimir_pe" type="button" onclick="window.print()" value="Imprimir" />
        </asp:Panel>
    </asp:Panel>

</asp:Content>

