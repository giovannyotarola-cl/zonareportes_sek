<%@ Page Title="Evaluación Jefe de Carrera" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="mostrarJefeCarrera.aspx.vb" Inherits="mostrarEvEstudianteDocente" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Evaluación Jefe de Carrera</h2>
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
                <td></td>
                <th><span>Profesor</span></th>
                <th><span>Carrera</span></th>
            </tr>
            <tr>
                <th><span>EVALUACIÓN ADMINISTRATIVA DOCENTE.</span></th>
                <th><asp:Label ID="lblPromEvaluacionAdminitrativa" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromEvaluacionAdminitrativaCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. Registra en el librto de clases los contenidos impartidos en cada sesión.</span></td>
                <td><asp:Label ID="lblEvaluacion1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEvaluacion1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. Asiste a los claustros de carrera.</span></td>
                <td><asp:Label ID="lblEvaluacion2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEvaluacion2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. Cumple con las funciones que la Unidad Académica le asigna (planificar, calendarizar) revisiones bibliográficas, entre otras.</span></td>
                <td><asp:Label ID="lblEvaluacion3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEvaluacion3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. Mantiene actualizada oportunamente su cuenta de portal docente.</span></td>
                <td><asp:Label ID="lblEvaluacion4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEvaluacion4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>5. Da a conocer a los estudiantes los contenidos y objetivos de la asignatura.</span></td>
                <td><asp:Label ID="lblEvaluacion5" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEvaluacion5Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>PLANEACIÓN DEL CURSO.</span></th>
                <th><asp:Label ID="lblPromPlaneacion" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromPlaneacionCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. Planifica por escrito sus clases al inicio del año/semestre académico.</span></td>
                <td><asp:Label ID="lblPlaneacion1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlaneacion1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. Ajusta sus actividades docentes al horario programado para su asignatura.</span></td>
                <td><asp:Label ID="lblPlaneacion2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlaneacion2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. Los contenidos registrados por el profesor en el libro se corresponden con los contenidos declarados en el programa de la asignatura.</span></td>
                <td><asp:Label ID="lblPlaneacion3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlaneacion3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. Orienta el contenido y objetivos de su asignatura hacia las capacidades definidas para el ciclo respectivo.</span></td>
                <td><asp:Label ID="lblPlaneacion4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlaneacion4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>5. Logra impartir más del 90% de los contenidos del programa en el tiempo(semestre/año) que dura la asignatura.</span></td>
                <td><asp:Label ID="lblPlaneacion5" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlaneacion5Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>METODOLOGÍA.</span></th>
                <th><asp:Label ID="lblPromMetodologia" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromMetodologiaCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. Muestra dominio del grupo curso.</span></td>
                <td><asp:Label ID="lblMetodologia1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. Presenta los contenidos y materias del curso de modo sistemático y claro, utilizando ejemplos y aplicando los conceptos a casos concretos.</span></td>
                <td><asp:Label ID="lblMetodologia2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. La metodología que utiliza en clases tiene como objetivo fundamental mejorara los aprendizajes de los estudiantes.</span></td>
                <td><asp:Label ID="lblMetodologia3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. Dentro del aula, busca promover experiencias de aprendizaje que consideren la diversidad del estudiantado presente en la clase.</span></td>
                <td><asp:Label ID="lblMetodologia4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>5. Incorpora las TIC's disponibles en la Universidad para el desarrollo de sus actividades docentes.</span></td>
                <td><asp:Label ID="lblMetodologia5" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia5Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>CLIMA EDUCATIVO.</span></th>
                <th><asp:Label ID="lblPromClima" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromClimaCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. Establece una relación cordial y de respeto con los estudiantes.</span></td>
                <td><asp:Label ID="lblClima1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. Muestra un liderazgo educativo motivante para los estudiantes.</span></td>
                <td><asp:Label ID="lblClima2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. Se preocupa de responder las dudas e inquietudes que le plantean los estudiantes en clases.</span></td>
                <td><asp:Label ID="lblClima3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. En clases mantiene una comunicación clara, sensible y empática con los estudiantes.</span></td>
                <td><asp:Label ID="lblClima4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblClima4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>EVALUACIÓN.</span></th>
                <th><asp:Label ID="lblPromEvaluacion" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPromEvaluacionCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. Desarrolla instrumentos de evaluación cuyo nivel de dificultad es coherente con el tratamiento que realizó de las materias en clases.</span></td>
                <td><asp:Label ID="lblEval1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. Cada vez que realiza una evaluación, sea un trabajo, prueba o examen, da a conocer a los estudiantes las pautas de correción.</span></td>
                <td><asp:Label ID="lblEval2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. En las correcciones de los trabajos, pruebas y exámenes, muestra a los estudiantes claramente sus errores y la forma en que pueden superarlos.</span></td>
                <td><asp:Label ID="lblEval3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. Realizó una entrega oportuna (según reglamento) de las correcciones y notas de cada evaluación que tomó en el transcurso de la asignatura.</span></td>
                <td><asp:Label ID="lblEval4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval4Carrera" runat="server"></asp:Label></td>
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
            <span>Firma Jefe Docente</span>
        </div>
        <div class="clear-fix"></div>
        <div class="firmaDireccionDocencia">
            <hr /><br />
            <span>Firma Dirección de Docencia</span>
        </div>
    </div>

    <input id="btnImprimir" type="submit" onclick="window.print()" value="Imprimir"/>
</asp:Content>

