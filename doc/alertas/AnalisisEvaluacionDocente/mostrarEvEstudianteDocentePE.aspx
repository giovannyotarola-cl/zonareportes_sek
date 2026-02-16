<%@ Page Title="Evaluación Estudiante Docente" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="mostrarEvEstudianteDocentePE.aspx.vb" Inherits="mostrarEvEstudianteDocentePE" %>

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
                <td><span>1. Al comenzar la asignatura, se presentó el programa, objetivos y contenidos, y las fechas y/o procesos de evaluaciones.</span></td>
                <td><asp:Label ID="lblPlan1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlan1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. </span>Considero que los contenidos desarrollados en clases me aportan al perfil de egreso.</td>
                <td><asp:Label ID="lblPlan2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlan2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. </span>Al finalizar el curso, talleres, laboratorios etc. (el que corresponda) puedo visualizar la aplicación y utilidad concreta de los contenidos de la asignatura.</td>
                <td><asp:Label ID="lblPlan3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlan3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. </span>Considero que la duración de la asignatura es suficiente en relación a la cantidad y dificultad de los contenidos revisados en clases.</td>
                <td><asp:Label ID="lblPlan4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlan4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>METODOLOGÍA.</span></th>
                <th><asp:Label ID="lblPromMetodologia" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromMetodologiaCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. </span>El profesor nos presenta los contenidos y materias del curso de modo sistemático y claro, utilizando ejemplos y aplicando los conceptos a casos concretos.</td>
                <td><asp:Label ID="lblMetodologia1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. </span>Los recursos didácticos que utiliza el profesor en clases, me han ayudado a evidenciar aprendizajes respecto a contenidos abordados en la asignatura y/o a la aplicabilidad de los contenidos.</td>
                <td><asp:Label ID="lblMetodologia2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. </span>El profesor se preocupa de responder las dudas e inquietudes que le planteamos los estudiantes en su clase.</td>
                <td><asp:Label ID="lblMetodologia3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. </span>El profesor se preocupa que los estudiantes cumplan con sus deberes y tareas académicas.</td>
                <td><asp:Label ID="lblMetodologia4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>CONTENIDOS.</span></th>
                <th><asp:Label ID="lblPromContenidos" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromContenidosCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. </span>El profesor, antes de comenzar un tema nuevo, formula preguntas para indagar el nivel de conocimiento de los estudiantes y/o experiencias previas.</td>
                <td><asp:Label ID="lblContenido1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblContenido1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. </span>El nivel de profundidad de la revisión de las materias y contenidos en clases es adecuado.</td>
                <td><asp:Label ID="lblContenido2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblContenido2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. </span>Considero que los aprendizajes logrados en la asignatura me facilitan comprender otras disciplinas relacionadas, para ser aplicados en contextos situados.</td>
                <td><asp:Label ID="lblContenido3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblContenido3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. </span>El profesor establece relaciones entre los conocimientos de la asignatura y su aplicación en el quehacer profesional.</td>
                <td><asp:Label ID="lblContenido4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblContenido4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>CLIMA EDUCATIVO.</span></th>
                <th><asp:Label ID="lblPromClimaEd" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromClimaEdCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. </span>El profesor estimula la participación activa de las y los estudiantes en clases.</td>
                <td><asp:Label ID="lblClima1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. </span>El profesor mantiene una comunicación clara y empática con sus alumnos.</td>
                <td><asp:Label ID="lblClima2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. </span>El profesor estimula las capacidades de sus alumnos.</td>
                <td><asp:Label ID="lblClima3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. </span>El profesor muestra respeto y aceptación hacia los estudiantes.</td>
                <td><asp:Label ID="lblClima4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>EVALUACIÓN.</span></th>
                <th><asp:Label ID="lblPromEvaluacion" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromEvaluacionCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. </span>Las pruebas y exámenes evalúan contenidos que están relacionados con las materias del programa.</td>
                <td><asp:Label ID="lblEval1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. </span>El profesor da a conocer a todo el curso las pautas de corrección de los trabajos, pruebas o exámenes que toma.</td>
                <td><asp:Label ID="lblEval2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. </span>El profesor hace una entrega oportuna de la corrección (evaluación) de los trabajos, pruebas o exámenes que toma en el ramo.</td>
                <td><asp:Label ID="lblEval3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval3Carrera" runat="server"></asp:Label></td>
            </tr>
           
            <tr>
                <th><span>DEBERES DOCENTES.</span></th>
                <th><asp:Label ID="lblPromDeberes" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromDeberesCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. </span>El profesor asiste regularmente a clases.</td>
                <td><asp:Label ID="lblDeberes1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblDeberes1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. </span>El profesor inicia sus clases puntualmente.</td>
                <td><asp:Label ID="lblDeberes2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblDeberes2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. El profesor finaliza sus clases puntualmente.</span></td>
                <td><asp:Label ID="lblDeberes3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblDeberes3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>USO DE LA PLATAFORMA MOODLE</span></th>
                <th><asp:Label ID="lblPromMoodle" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromMoodleCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. El profesor realiza actividades formativas del módulo en la plataforma moodle.</span></td>
                <td><asp:Label ID="lblMoodle1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMoodle1Carrera" runat="server"></asp:Label></td>
            </tr>
             <tr>
                <td><span>2. El profesor presenta material de apoyo para el desarrollo del módulo en la plataforma moodle.</span></td>
                <td><asp:Label ID="lblMoodle2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMoodle2Carrera" runat="server"></asp:Label></td>
            </tr>
             <tr>
                <td><span>3. El profesor utiliza la plataforma como medio de comunicación con los estudiantes.</span></td>
                <td><asp:Label ID="lblMoodle3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMoodle3Carrera" runat="server"></asp:Label></td>
            </tr>
             <tr>
                <td><span>4. El profesor aplica el Reglamento de la carrera en relación a aprobación, asistencia y uso de plataforma moodle.</span></td>
                <td><asp:Label ID="lblMoodle4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMoodle4Carrera" runat="server"></asp:Label></td>
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
