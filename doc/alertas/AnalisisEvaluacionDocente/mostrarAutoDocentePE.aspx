<%@ Page Title="Auto Evaluación Docente" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="mostrarAutoDocentePE.aspx.vb" Inherits="mostrarEvEstudianteDocente" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>AutoEvaluación Docente</h2>
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
                <td></td>
                <th><span>Profesor</span></th>
                <th><span>Carrera</span></th>
            </tr>
            <tr>
                <th><span>PLANEACIÓN DEL CURSO.</span></th>
                <th><asp:Label ID="lblPlaneacionCursoProm" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblPlaneacionCursoPromCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. Al comnezar el curso, doy a conocer a los estudiantes los contenidos y objetivos de la asignatura.</span></td>
                <td><asp:Label ID="lblPlan1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlan1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. Considero que la duración de la asignatura es suficiente en relación a la cantidad y dificultad de los contenidos que reviso en clases.</span></td>
                <td><asp:Label ID="lblPlan2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPlan2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>METODOLOGÍA.</span></th>
                <th><asp:Label ID="lblMetodologiaProm" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblMetodologiaPromCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. Presento los contenidos y materias del curso de modo sistemático y claro, utilizando ejemplos y aplicando los conceptos a casos concretos.</span></td>
                <td><asp:Label ID="lblMetodologia1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. La metodología que utilizo en clases, tiene como objetivo fundamental mejorar los aprendizajes de los estudiantes.</span></td>
                <td><asp:Label ID="lblMetodologia2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. Dentro del aula, busco promover experiencias de aprendizaje que consideren la diversidad del estudiantado presente en la clase.</span></td>
                <td><asp:Label ID="lblMetodologia3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblMetodologia3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th><span>CONTENIDOS.</span></th>
                <th><asp:Label ID="lblContenidosProm" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblContenidosPromCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. </span>El nivel de dificultad y profundidad de los contenidos y materias revisadas en el curso se relacionan con los objetivos del programa.</td>
                <td><asp:Label ID="lblContenido1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblContenido1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. A lo largo del curso, desarrollo progresivamente los contenidos de la asignatura, desde lo más simple a lo más complejo.</span></td>
                <td><asp:Label ID="lblContenido2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblContenido2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. </span>Considero que, a través de mi proceso de enseñanza los estudiantes podrían resolver problemas en diversos contextos.</td>
                <td><asp:Label ID="lblContenido3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblContenido3Carrera" runat="server"></asp:Label></td>
            </tr>
          
            <tr>
                <th><span>EVALUACIÓN.</span></th>
                <th><asp:Label ID="lblEvaluacionProm" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblEvaluacionPromCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. </span>El nivel de dificultad de las pruebas y exámenes aplicados es coherente con el tratamiento que realizo de las materias en clases.</td>
                <td><asp:Label ID="lblEval1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. Cada vez que realizo una evaluación, sea un trabajo, prueba o examen, doy a conocer a los estudiantes las pautas de corrección.</span></td>
                <td><asp:Label ID="lblEval2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. </span>En las correcciones de las evaluaciones, muestro a los estudiantes claramente sus errores y la forma en que pueden superarlos.</td>
                <td><asp:Label ID="lblEval3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. </span>Realizo una entrega oportuna (según reglamento) de las correcciones y notas de cada evaluación que tomo en el transcurso de la asignatura.</td>
                <td><asp:Label ID="lblEval4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEval4Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr id="filaDeberes">
                <th><span>DEBERES DOCENTES.</span></th>
                <th><asp:Label ID="lblDeberesProm" runat="server"></asp:Label></th>
                <th><asp:Label ID="lblDeberesPromCarrera" runat="server"></asp:Label></th>
            </tr>
            <tr>
                <td><span>1. Asisto regularmente a clases.</span></td>
                <td><asp:Label ID="lblDeberes1" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblDeberes1Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>2. Inicio mis clases puntualmente.</span></td>
                <td><asp:Label ID="lblDeberes2" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblDeberes2Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>3. Finalizo mis clases puntualmente.</span></td>
                <td><asp:Label ID="lblDeberes3" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblDeberes3Carrera" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><span>4. </span>Actualizo oportunamente la información de moodle.</td>
                <td><asp:Label ID="lblDeberes4" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblDeberes4Carrera" runat="server"></asp:Label></td>
            </tr>
           
        </tbody>
    </table>
    <table id="tablaTotales" style="display:none">
        <tr>
            <th><span>CANTIDAD ENCUESTAS REALIZADAS</span></th>
            <td><asp:Label ID="lblEncHechas" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <th><span>CANTIDAD ASIGNATURAS INSCRITAS</span></th>
            <td><asp:Label ID="lblEncTotal" runat="server"></asp:Label></td>
        </tr>
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

