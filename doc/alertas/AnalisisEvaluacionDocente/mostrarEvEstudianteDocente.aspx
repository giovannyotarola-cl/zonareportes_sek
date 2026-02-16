<%@ Page Title="Evaluación Estudiante Docente" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="mostrarEvEstudianteDocente.aspx.vb" Inherits="mostrarEvEstudianteDocente" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Evaluación Estudiante Docente</h2>
    <div class="autowidth float-left">
        <table class="datosInforme">
            <tbody>
                <tr>
                    <th><span>CARRERA</span></th>
                    <td><asp:Label ID="lblCarrera" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th><span>CÓDIGO ASIGNATURA</span></th>
                    <td><asp:Label ID="lblCodAsignatura" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th><span>NOMBRE ASIGNATURA</span></th>
                    <td><asp:Label ID="lblNomASignatura" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th><span>NOMBRE PROFESOR</span></th>
                    <td><asp:Label ID="lblNomProf" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <th><span>SECCIÓN</span></th>
                    <td><asp:Label ID="lblSeccion" runat="server"></asp:Label></td>
                </tr>
            </tbody>
        </table>
    </div>
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
    
    <table class="tablaInforme">
        <tbody>
            <tr>
                <th></th>
                <th><span>Profesor</span></th>
                <th><span>Carrera</span></th>
            </tr>
            <tr>
                <th><span>PLANEACIÓN DEL CURSO.</span></th>
                <th><asp:Label ID="lblPromPlaneacionCurso" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromPlaneacionCursoCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. Al Comenzar la asignatura, me quedaron claros los objetivos del curso y los contenidos a revisar en clase</span></td>
                <td><asp:Label ID="lblPlan1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlan1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. Considero que los contenidos desarrollados en clases me aportan al perfil de egreso.</span></td>
                <td><asp:Label ID="lblPlan2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlan2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. Al finalizar el curso, talleres, laboratorios y/o prácticas clínicas puedo visualizar la aplicación y utilidad concreta de los contenidos de la asignatura.</span></td>
                <td><asp:Label ID="lblPlan3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlan3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. Considero que la duración de la asignatura es suficiente en relación a la cantidad y dificultad de los contenidos revisados en clases.</span></td>
                <td><asp:Label ID="lblPlan4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlan4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>METODOLOGÍA.</span></th>
                <th><asp:Label ID="lblPromMetodologia" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromMetodologiaCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. El profesor nos presenta los contenidos y materias del curso de modo sistemático y claro, utilizando ejemplos y aplicando los conceptos a casos concretos y/o casos clínicos.</span></td>
                <td><asp:Label ID="lblMetodologia1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. Los recursos didácticos que utiliza el profesor en clases, me han ayudado a mejorar mis aprendizajes.</span></td>
                <td><asp:Label ID="lblMetodologia2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. El profesor se preocupa de responder las dudas e inquietudes que le planteamos los estudiantes en su clase.</span></td>
                <td><asp:Label ID="lblMetodologia3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. El profesor se preocupa que los estudiantes cumplan con sus deberes y tareas académicas.</span></td>
                <td><asp:Label ID="lblMetodologia4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>CONTENIDOS.</span></th>
                <th><asp:Label ID="lblPromContenidos" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromContenidosCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. El profesor, antes de comenzar un tema nuevo, formula preguntas para indagar el nivel de conocimiento de los estudiantes y/o experiencias previas.</span></td>
                <td><asp:Label ID="lblContenido1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblContenido1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. El nivel de profundidad de la revisión de las materias y contenidos en clases es adecuado.</span></td>
                <td><asp:Label ID="lblContenido2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblContenido2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. Considero que los aprendizajes logrados en la asignatura me facilitan comprender otras disciplinas relacionadas.</span></td>
                <td><asp:Label ID="lblContenido3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblContenido3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. El profesor establece relaciones entre los conocimientos de la asignatura y su aplicación en el quehacer profesional.</span></td>
                <td><asp:Label ID="lblContenido4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblContenido4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>CLIMA EDUCATIVO.</span></th>
                <th><asp:Label ID="lblPromClimaEd" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromClimaEdCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. El profesor estimula la participación activa de los estudiantes en clases.</span></td>
                <td><asp:Label ID="lblClima1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. El profesor mantiene una comunicación clara y empática con sus alumnos.</span></td>
                <td><asp:Label ID="lblClima2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. El profesor estimula las capacidades de sus alumnos.</span></td>
                <td><asp:Label ID="lblClima3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. El profesor muestra respeto y aceptación hacia los estudiantes.</span></td>
                <td><asp:Label ID="lblClima4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>EVALUACIÓN.</span></th>
                <th><asp:Label ID="lblPromEvaluacion" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromEvaluacionCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. Las pruebas y exámenes evalúan contenidos que están relacionados con las materias del programa.</span></td>
                <td><asp:Label ID="lblEval1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. El profesor da a conocer a todo el curso las pautas de corrección de los trabajos, pruebas o exámenes que toma.</span></td>
                <td><asp:Label ID="lblEval2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. El profesor hace una entrega oportuna de la corrección(evaluación) de los trabajos, pruebas o exámenes que toma en el ramo.</span></td>
                <td><asp:Label ID="lblEval3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. En las correcciones de los trabajos, pruebas o exámenes, el profesor nos muestra los errores que cometemos y la forma de mejorar.</span></td>
                <td><asp:Label ID="lblEval4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>DEBERES DOCENTES.</span></th>
                <th><asp:Label ID="lblPromDeberes" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromDeberesCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. El profesor asiste regularmente a clases.</span></td>
                <td><asp:Label ID="lblDeberes1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblDeberes1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. El profesor inicia sus clases puntualmente.</span></td>
                <td><asp:Label ID="lblDeberes2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblDeberes2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. El profesor finaliza sus clases puntualmente.</span></td>
                <td><asp:Label ID="lblDeberes3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblDeberes3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>AYUDANTÍAS.(en el caso que corresponda)</span></th>
                <th><asp:Label ID="lblPromAyudantias" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromAyudantiasCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. Considero que la ayudantía fue un aporte para mi aprendizaje.</span></td>
                <td><asp:Label ID="lblAyudantias1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblAyudantias1Carrera" runat="server"></asp:Label></td>
            </tr>
        </tbody>
    </table>
    <table id="tablaTotales">
        <tr>
            <th><span>CANTIDAD ENCUESTAS REALIZADAS:</span></th>
            <td><asp:Label ID="lblEncHechas" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <th><span>CANTIDAD ESTUDIANTES INSCRITOS:</span></th>
            <td><asp:Label ID="lblEncTotal" runat="server"></asp:Label></td>
        </tr>
    </table>
    <table>
        <thead>
            <tr>
                <th>COMPROMISO</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <div class="content-comentario">
                        <div id="lb_observacion" runat="server" visible="false"></div>
                        <asp:TextBox id="txt_observacion" TextMode="multiline" Columns="50" Rows="5" style="width: 100%;height: 100px;" runat="server" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnGuardarCompromiso" runat="server" class="nover" Text="Guardar Compromiso" />
                </td>
            </tr>
        </tbody>
    </table>
    <div class="firmas">
        <div class="firmaJefe">
            <hr /><br />
            <span>Firma Jefe Carrera</span>
        </div>
        <div class="firmaDocente">
            <hr /><br />
            <!--<span>Firma Jefe Docente</span> -- Modificado el 30072018 -->
            <span>Firma Docente</span>
        </div>
        <div class="clear-fix"></div>
        <div class="firmaDireccionDocencia">
            <hr /><br />
            <!--<span>Firma Dirección de Docencia</span> -- Modificado el 30072018 -->
            <span>Firma Director Docencia</span>
        </div>
    </div>
    <div style="padding: 30px; text-align: center;">
        <input id="btnImprimirEvDocente" class="nover" type="submit" value="Imprimir"/>
    </div>
    
</asp:Content>
