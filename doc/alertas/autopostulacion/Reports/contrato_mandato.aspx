<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contrato_mandato.aspx.cs" Inherits="AutoPostulacion.Reports.contrato_mandato" %>--%>
<%@ Page Title="Contrato_Mandato" Language="C#" MasterPageFile="~/contratos.Master" AutoEventWireup="true" CodeBehind="contrato_mandato.aspx.cs" Inherits="AutoPostulacion.Reports.contrato_mandato" %>

<asp:Content ID="ContratoMandato" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td>
                   
                <br />
                   
            </td>
        </tr>
        <tr>
            <td style="width:95%" class="auto-style1">
                <asp:Image ID="imgLogo" runat="server" Height="45%" ImageUrl="~/Media/logo_sek_doc.jpg" Width="25%" ImageAlign="Left" />                
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td class="auto-style2">                
                <p align="center" class="MsoNormal">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:11.0pt;line-height:107%;font-family:
&quot;Arial&quot;,sans-serif;mso-font-width:120%;mso-ansi-language:ES" class="auto-style6"><span class="auto-style8">Contrato de Prestación de Servicios </span> <br class="auto-style8" /><span class="auto-style8">Educacionales</span><o:p></o:p></span></b></p>
                </asp:Label>
            </td>
        </tr>
    </table>
    <table class="auto-style3" style="margin-left:20px">
        <tr>
            <td>

                <div style="page: WordSection1;" class="auto-style4">
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.75pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">En Santiago de Chile a 
                        <asp:Label ID="lblFecha1" runat="server"></asp:Label>
                        <span style="mso-spacerun:yes">&nbsp;</span>entre Universidad SEK, corporación privada de educación superior, rol único tributario número 71.618.600-8, representada por doña Eva Flandes Aguilera, cédula nacional de identidad número 14.605.644-K, ambos domiciliados en Fernando Manterola N° 0789, Providencia, ciudad de Santiago, en adelante indistintamente “la Universidad” por una parte; y por la otra, don(a) 
                        <asp:Label ID="lblNombreAlumno1" runat="server"></asp:Label>
                        , cédula nacional de identidad número 
                        <asp:Label ID="lblRutAlumno1" runat="server"></asp:Label>
                        , domiciliado en 
                        <asp:Label ID="lblDomicilioAlumno1" runat="server"></asp:Label>
                        <span style="mso-spacerun:yes">&nbsp;</span>en adelante el “Alumno”, quienes podrán ser identificados en adelante indistintamente como “las Partes”, se ha convenido el siguiente Contrato de Prestación de Servicios Educacionales:<o:p></o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:.4pt;text-align:justify">
                        <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="text-align:justify">
                        <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style8">ANTECEDENTES:</span></b><b style="mso-bidi-font-weight:
normal"><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;
font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></b></p>
                    <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.75pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">La Universidad SEK es una Institución de Educación Superior fundada el año 1989, sin fines de lucro, autónoma y no acreditada, con personalidad jurídica y patrimonio propio.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:.25pt;text-align:justify">
                        <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="text-align:justify">
                        <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style8">DEFINICIONES.<o:p></o:p></span></b></p>
                    <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:115%;mso-ansi-language:ES" class="auto-style8">Para los efectos del presente contrato, se entenderá por:</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:.35pt;">
                        <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoListParagraph" style="margin-top:0cm;margin-right:5.9pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-indent:
0cm;mso-list:l0 level1 lfo1;tab-stops:20.35pt">
                        <![if !supportLists]><span style="mso-list:Ignore"><span lang="ES" style="mso-font-width:99%;mso-ansi-language:ES" class="auto-style7">a)</span><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Arial';"><span lang="ES" style="mso-font-width:99%;mso-ansi-language:ES" class="auto-style7">&nbsp;&nbsp;</span></span><span style="font:7.0pt &quot;Times New Roman&quot;"><span lang="ES" style="mso-font-width:99%;mso-ansi-language:ES" class="auto-style7">&nbsp;</span></span><span lang="ES" style="mso-font-width:99%;mso-ansi-language:ES"><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Times New Roman';" class="auto-style8"> </span></span></span><span class="auto-style8"><![endif]></span><span lang="ES" style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:
ES" class="auto-style8">Matrícula: Monto anual o semestral, dependiendo de los períodos académicos de la respectiva carrera, que deberá pagar el contratante a la Universidad para obtener el derecho a inscribirse en una determinada carrera o<span style="mso-spacerun:yes">&nbsp;</span>programa.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:.35pt;">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoListParagraph" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-indent:
0cm;mso-list:l0 level1 lfo1;tab-stops:19.15pt">
                        <span class="auto-style5">
                        <![if !supportLists]></span><span style="mso-list:Ignore"><span lang="ES" style="mso-font-width:99%;mso-ansi-language:ES" class="auto-style7">b)</span><span lang="ES" style="font-size:10.0pt;mso-font-width:99%;mso-ansi-language:ES"><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Arial';" class="auto-style7">&nbsp;&nbsp; </span></span></span><span class="auto-style7"><![endif]></span><span lang="ES" style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:
ES" class="auto-style8">Arancel académico: Monto anual o semestral, dependiendo de los períodos académicos de la respectiva carrera, que el alumno debe pagar a la Universidad como contraprestación por los servicios<span style="letter-spacing:2.2pt"> </span>educacionales.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:.35pt;">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoListParagraph" style="margin-top:0cm;margin-right:5.8pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-indent:
0cm;mso-list:l0 level1 lfo1;tab-stops:19.0pt">
                        <span class="auto-style7">
                        <![if !supportLists]></span><span style="mso-list:Ignore"><span lang="ES" style="mso-font-width:99%;mso-ansi-language:ES" class="auto-style7">c)</span><span lang="ES" style="font-size:10.0pt;mso-font-width:99%;mso-ansi-language:ES"><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Arial';" class="auto-style7">&nbsp;&nbsp;</span></span><span lang="ES" style="mso-font-width:99%;mso-ansi-language:ES"><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Times New Roman';" class="auto-style8"> </span></span></span><span class="auto-style8"><![endif]></span><span lang="ES" style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:
ES" class="auto-style8">Alumno Regular: Alumno con matrícula vigente en un determinado programa o carrera, que cumple con los deberes y obligaciones establecidos en los Reglamentos dictados por la Universidad SEK, y con los requisitos académicos determinados por cada programa, tanto por la Universidad como por la legislación nacional vigente a la fecha de<span style="letter-spacing:-1.1pt"> </span>matrícula.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">
                        <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">
                        <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">


                        <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;
mso-ansi-language:ES" class="auto-style8">PRIMERO: Solicitud de Matricula</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                   <p class="MsoBodyText" style="margin-top:.4pt;text-align:justify">
                        <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style8">El Alumno, solicita pura y simplemente, por este acto su inscripción o matrícula en la carrera de 
                        <asp:Label ID="lblCarrera1" runat="server"></asp:Label>
                        ,<span style="letter-spacing:-.9pt"> </span>en<span style="letter-spacing:-.45pt"> </span>jornada 
                        <asp:Label ID="lblJornada1" runat="server"></asp:Label>
                        ,<span style="letter-spacing:-.85pt"> </span>que<span style="letter-spacing:-.65pt"> </span>se<span style="letter-spacing:-.9pt"> </span>imparte<span style="letter-spacing:-.9pt"> </span>en<span style="letter-spacing:-.8pt"> </span>la 
                        <asp:Label ID="lblFacultad1" runat="server"></asp:Label>
                        </span><span lang="ES" style="mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;mso-ansi-language:
ES" class="auto-style8">,</span><span lang="ES" style="mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;mso-ansi-language:
ES"><span style="letter-spacing:-1.1pt" class="auto-style8"> </span></span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;mso-ansi-language:
ES"><span lang="ES" style="mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;mso-ansi-language:
ES" class="auto-style8">en<span style="letter-spacing:
-1.0pt"> </span>la<span style="letter-spacing:-1.0pt"> </span>localidad<span style="letter-spacing:-.75pt"> </span>Santiago,<span style="letter-spacing:
-1.1pt"> </span>modalidad<span style="letter-spacing:.95pt"> </span>para<span style="letter-spacing:-1.0pt"> </span>el<span style="letter-spacing:-.9pt"> </span>año<span style="letter-spacing:-1.0pt"> </span>académico<span style="letter-spacing:
-1.1pt"> </span>en<span style="letter-spacing:-1.0pt"> </span>curso,<span style="letter-spacing:-1.1pt"> </span>la<span style="letter-spacing:-1.0pt"> </span>cual<span style="letter-spacing:-.9pt"> </span>es<span style="letter-spacing:-1.05pt"> </span>aceptada<span style="letter-spacing:-.95pt"> </span>en<span style="letter-spacing:-1.0pt"> </span>este<span style="letter-spacing:-1.0pt"> </span>acto<span style="letter-spacing:-.95pt"> </span>por<span style="letter-spacing:-.9pt"> </span>la Universidad,<span style="letter-spacing:
-.7pt"> </span>en<span style="letter-spacing:-.55pt"> </span>los<span style="letter-spacing:-.6pt"> </span>términos<span style="letter-spacing:-.65pt"> </span>que<span style="letter-spacing:-.5pt"> </span>más<span style="letter-spacing:
-.65pt"> </span>adelante<span style="letter-spacing:-.4pt"> </span>se<span style="letter-spacing:-.65pt"> </span>expresan<span style="letter-spacing:-.4pt"> </span>y<span style="letter-spacing:-.65pt"> </span>adquiere<span style="letter-spacing:-.5pt"> </span>como<span style="letter-spacing:-.7pt"> </span>consecuencia,<span style="letter-spacing:-.65pt"> </span>la<span style="letter-spacing:-.55pt"> </span>calidad<span style="letter-spacing:-.55pt"> </span>de<span style="letter-spacing:-.5pt"> </span>Alumno<span style="letter-spacing:-.65pt"> </span>regular de<span style="letter-spacing:
-1.2pt"> </span>la<span style="letter-spacing:-1.2pt"> </span>Universidad<span style="letter-spacing:-1.15pt"> </span>para<span style="letter-spacing:-1.2pt"> </span>todos<span style="letter-spacing:-1.1pt"> </span>los<span style="letter-spacing:-1.1pt"> </span>efectos<span style="letter-spacing:-1.1pt"> </span>legales.</span></span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                    
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.65pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify;line-height:
98%">
                        <span class="auto-style71"><span class="auto-style8" lang="ES" style="mso-bidi-font-size: 10.0pt; line-height: 107%; font-family: &quot;Arial&quot;,sans-serif; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-font-width: 110%; mso-ansi-language: ES; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">Sin perjuicio de lo señalado en el párrafo precedente, el Alumno, no obstante encontrarse matriculado en la Universidad, podrá perder la calidad de Alumno regular, en el evento de incumplir con alguno de los deberes y obligaciones establecidos en los Reglamentos dictados por la Universidad o con alguno de los requisitos académicos determinados por cada carrera. La inscripción del Alumno en una carrera determinada, no obsta a que, con posterioridad pueda cambiar de carrera, jornada <span style="letter-spacing:
-.3pt">y/o </span>de localidad, debiendo matricularse para la carrera y localidad<span style="letter-spacing:-.65pt"> </span>respectiva.</span></span><u1:p></u1:p></p>
                    <p class="MsoBodyText" style="margin-top:.45pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:.05pt;margin-right:5.6pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify;line-height:
98%">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:
98%;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Se deja expresa constancia que en caso que el alumno ejerza su derecho a cambio de carrera, localidad, jornada, la matrícula y el arancel deberán ser ajustados en caso de ser procedente. Esto de acuerdo a los aranceles y matrículas vigentes para ese año respectivo de la nueva carrera y la localidad a la que se incorporará el alumno.</span></p>
                    <p class="MsoBodyText" style="margin-top:.05pt;margin-right:5.6pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify;line-height:
98%">
                        &nbsp;</p>
                    <span lang="ES" style="font-size: 11.0pt; line-height: 107%; font-family: &quot;Arial&quot;,sans-serif; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; color: #545454; background: white; mso-ansi-language: ES; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">
                    <br clear="all" style="mso-special-character:line-break;page-break-before:
always" />
                    </span>
                    <p class="MsoBodyText" style="margin-top:.05pt;margin-right:5.6pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify;line-height:
98%">
                        &nbsp;</p>
                </div>

            </td>
        </tr>
        <tr>
            <td>
                 <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p>&nbsp;</o:p></span>
                 </p>
                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;
mso-ansi-language:ES" class="auto-style8">SEGUNDO: Obligaciones de la Universidad.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:
98%;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">La Universidad se obliga a impartir al Alumno el plan de estudios de la carrera antes individualizada, de conformidad a las condiciones y procedimientos de evaluación y de promoción prescritos en el “Reglamento Académico” y demás normas vigentes.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;line-height:98%;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Las asignaturas que impartirá la Universidad durante el período académico, serán las que correspondan al currículo vigente de la carrera elegida, sea ella semestral o anual y aquellas otras actividades de nivelación, remediales y extra programáticas que se dispongan como complementarias al proceso enseñanza-aprendizaje que la Universidad determine. Los alumnos deberán observar las normas relativas a prerrequisitos y plazos para tomar dichos cursos, normas que se encuentran disponibles en<span style="letter-spacing:-1.35pt"> </span></span><a href="http://www.usek.cl/"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:windowtext;mso-font-width:110%;mso-ansi-language:ES;text-decoration:none;
text-underline:none" class="auto-style8">www.usek.cl.</span></a><span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:
98%;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Las Partes reconocen y aceptan la facultad de la Universidad para incorporar, durante el curso de los estudios, modificaciones que afecten la organización de dicho plan, la malla curricular y/ los nombres y contenidos de las asignaturas de la carrera, en razón de actualización tecnológica u otros motivos de ordenamiento y de eficiencia de los procesos académicos que determine la Vicerrectoría Académica de la Universidad.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;line-height:98%;font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
               
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">La Universidad SEK se reserva la facultad de no iniciar un determinado programa de estudios y/o carreras, o de no impartir determinadas asignaturas; adelantar su iniciación o término; o de modificar horarios y días, para el caso de no configurarse un grupo-curso, o de no corresponder al orden secuencial del semestre lectivo que corresponda dictar y, en todo caso, por razones de fuerza mayor.</span><o:p></o:p></p>
                <p class="MsoBodyText">
                    <o:p></o:p></p>

                <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">

<p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">

                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:120%;
mso-ansi-language:ES" class="auto-style8">TERCERO: Matricula, Arancel, Derecho de Titulación, Asignatura Sueltas y Otros Servicios Educacionales.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Durante el plazo y vigencia del presente contrato, el Alumno se obliga a pagar la respectiva matrícula, arancel, Derechos de Titulación, Asignaturas sueltas y otros importes por los servicios educacionales del período académico correspondiente.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Los montos de la matrícula, arancel y otros servicios educacionales de la carrera serán fijados por la Dirección de la Universidad de acuerdo a los factores económicos que incidan en la prestación de los servicios educacionales.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style8">Para efectos de informar al Alumno, los montos de los aranceles y matrículas correspondientes al año académico siguiente serán publicados en su página web.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">El Alumno deberá pagar a la Universidad una suma adicional por concepto de arancel de titulación, en caso de ser procedente. Su monto se informará junto a los aranceles y matrícula correspondiente al año académico, según lo establecido en el párrafo<span style="letter-spacing:.3pt"> </span>anterior.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">En caso de mora o simple retardo en el correcto y oportuno pago de las obligaciones económicas contraídas con la Universidad, ésta estará facultada para aplicar los intereses, multas y gastos de honorarios máximos establecidos por la ley, siendo facultativo para la Universidad el uso de los instrumentos comerciales indicados en el presente<span style="letter-spacing:-.25pt"> </span>contrato.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
11.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>
                  <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">
                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;
mso-ansi-language:ES" class="auto-style8">CUARTO: Mandato para la suscripción de pagarés en nombre y representación del<span style="mso-spacerun:yes">&nbsp;</span>Alumno.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>
                <div class="auto-style4">
                <span lang="ES" style="mso-bidi-font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:
110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style8">En virtud de lo previsto en el artículo 11 de la Ley Nº 18.092 sobre letras de cambio y pagaré, el suscriptor del pagaré Nº 
                <asp:Label ID="lblPagare1" runat="server"></asp:Label>
                , como su (s) aval (es) y codeudor (es) solidario (s), en caso de haberlo (en adelante el “Aval”), todos individualizados<span style="letter-spacing:.45pt"> </span>al<span style="letter-spacing:-.25pt"> </span>final<span style="letter-spacing:-.25pt"> </span>del<span style="letter-spacing:-.25pt"> </span>presente<span style="letter-spacing:-.2pt"> </span>instrumento,<span style="letter-spacing:
-.3pt"> </span>y<span style="letter-spacing:-.25pt"> </span>el<span style="letter-spacing:-.25pt"> </span>primero<span style="letter-spacing:-.35pt"> </span>en<span style="letter-spacing:-.2pt"> </span>su<span style="letter-spacing:
-.35pt"> </span>calidad<span style="letter-spacing:-.05pt"> </span>de<span style="letter-spacing:-.3pt"> </span>alumno<span style="letter-spacing:-.2pt"> </span>de 
                <asp:Label ID="lblCarrera2" runat="server"></asp:Label>
                , RUT Nº 
                <asp:Label ID="lblRutAlumno2" runat="server"></asp:Label>
                , y el segundo en su calidad de Aval del mismo, vienen en otorgar y conferir PODER ESPECIAL a Universidad SEK, a fin de que ésta, actuando a través de cualquiera de sus mandatarios, y en su nombre y representación, complete el pagaré suscrito por el suscriptor y el “Aval”, en favor de Universidad SEK, en cuanto al monto y a la fecha de vencimiento del mismo, según corresponda, o reconozca deudas del suscriptor<span style="letter-spacing:-.5pt"> </span>y<span style="letter-spacing:
-.75pt"> </span>el<span style="letter-spacing:-.6pt"> </span>“Aval”<span style="letter-spacing:-.5pt"> </span>originadas<span style="letter-spacing:
-.5pt"> </span>en<span style="letter-spacing:-.5pt"> </span>virtud<span style="letter-spacing:-.5pt"> </span>de<span style="letter-spacing:-.5pt"> </span>la<span style="letter-spacing:-.55pt"> </span>calidad<span style="letter-spacing:-.5pt"> </span>de<span style="letter-spacing:-.55pt"> </span>alumno<span style="letter-spacing:-.5pt"> </span>que<span style="letter-spacing:-.5pt"> </span>tiene<span style="letter-spacing:-.55pt"> </span>el<span style="letter-spacing:-.6pt"> </span>suscriptor.</span>
                    <span lang="ES" style="line-height: 107%; font-family: &quot;Arial&quot;,sans-serif; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; color: #545454; background: white; mso-ansi-language: ES; mso-fareast-language: EN-US; mso-bidi-language: AR-SA" class="auto-style8">
                    <br clear="all" style="mso-special-character:line-break;page-break-before:
always" />
                    </span>
                    <span lang="ES" style="mso-bidi-font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:
110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style5"><br />
                    </span></div>
            </td>
        </tr>
        <tr>
            <td>
                <p class="MsoBodyText">
                    &nbsp;</p>
                <p class="MsoBodyText">
                    &nbsp;</p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">La cantidad adeudada que la Universidad SEK deberá estampar en el documento serán todas aquellas sumas que los contratantes adeuden a la Universidad SEK en virtud del presente contrato de servicios, incluyendo matrícula, cuotas impagas y el total del saldo adeudado en virtud de la aceleración de la obligación de pago del arancel, gastos administrativos, los intereses, reajustes, gastos de cobranza y multas por mora.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;
font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style8"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">La suscripción, de dicho documento no constituirá novación de las obligaciones adquiridas y se llevará a efecto cuando el alumno que, no habiendo inscrito cursos en un período académico, cualquiera sea el motivo, no concurra a regularizar sus obligaciones con Universidad SEK.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style8"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">El presente poder es otorgado en los términos del Artículo 233 y siguientes del Código de Comercio. De todas formas, este mandato se <span style="letter-spacing:-.15pt">extinguirá́ una</span> vez que se pague el total de la deuda generada por el </span>
                    <span style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">alumno</span><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style8"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:
98%;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">El mandante podrá solicitarle al mandatario la rendición de cuentas de su encargo, según lo dispone la Ley. De todas maneras, se entiende que el mandatario <span style="letter-spacing:-.35pt">dará́ cuenta</span> del mismo mediante la entrega del estado de cuenta con el detalle de<span style="mso-spacerun:yes"> </span>la deuda generada por el<span style="letter-spacing:2.25pt"> </span>alumno.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;line-height:98%;
font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style8"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">El mandante podrá solicitarle al mandatario la rendición de cuentas de su encargo, según lo dispone la Ley. De todas maneras, se entiende que el mandatario <span style="letter-spacing:-.35pt">dará́ cuenta</span> del mismo mediante la entrega del estado de cuenta con el detalle de<span style="mso-spacerun:yes">&nbsp;</span>la deuda generada por el</span><span style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8"> </span>
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">alumno.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style8"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Para todos los efectos del presente poder especial, las partes firmantes y el mandatario fijan su domicilio en la comuna y ciudad de Santiago, sometiéndose a la jurisdicción de sus Tribunales Ordinarios de Justicia, sin perjuicio de lo que indica el artículo 50 A de la Ley N° 19.496, en lo relativo a lo dispuesto en el artículo 2 letra d) de dicha ley.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;
font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style8"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">La Universidad SEK no tendrá derecho a recibir remuneración o retribución alguna por el desempeño del cargo por tratarse de un mandato gratuito.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>
          
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:
98%;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">En<span style="letter-spacing:1.85pt"> </span>virtud<span style="letter-spacing:1.95pt"> </span>de<span style="letter-spacing:1.95pt"> </span>la<span style="letter-spacing:
-.9pt"> </span>presente<span style="letter-spacing:1.9pt"> </span>cláusula<span style="letter-spacing:1.9pt"> </span>don 
                    <asp:Label ID="lblNombreAceptante1" runat="server"></asp:Label>
                    ,<span style="letter-spacing:1.95pt"> </span>Estado<span style="letter-spacing:1.85pt"> </span>civil 
                    <asp:Label ID="lblEstadoCivilAceptante1" runat="server"></asp:Label>
                    ,<span style="letter-spacing:
-.95pt"> </span>cédula<span style="letter-spacing:1.9pt"> </span>nacional<span style="letter-spacing:1.8pt"> </span>de<span style="letter-spacing:-.95pt"> </span>identidad número 
                    <asp:Label ID="lblRutAceptante1" runat="server"></asp:Label>
                    ,<span style="letter-spacing:1.75pt"> </span>domiciliado<span style="letter-spacing:1.6pt"> </span>para<span style="letter-spacing:1.7pt"> </span>estos<span style="letter-spacing:1.75pt"> </span>efectos<span style="letter-spacing:1.75pt"> </span>en 
                    <asp:Label ID="lblDomicilioAceptante1" runat="server"></asp:Label>
                    , en adelante “Aval”, acepta y se constituye en calidad de tal de las obligaciones pecuniarias contraídas por el Alumno con la Universidad, por todo el periodo académico en el cual el Alumno se matricula, por lo cual el presente poder tendrá la finalidad de asegurar el pago de la matrícula y arancel correspondiente al periodo<span style="letter-spacing:2.2pt"> </span>académico.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;line-height:98%;font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>

                <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">

                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style8">QUINTO: Carácter de” Aval”.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">La fianza y co-deuda solidaria contraída en la cláusula precedente constituye una obligación accesoria para responder de<span style="mso-spacerun:yes">&nbsp;&nbsp; </span>las obligaciones económicas contraídas por el Alumno para con la Universidad, en virtud del presente contrato de prestación de servicios educacionales, pero no convierte al “Aval” en parte de este contrato. En consecuencia, la Universidad no contrae obligación alguna para con<span style="letter-spacing:1.95pt"> </span>éste.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">El “Aval” reconoce que, por la naturaleza del contrato la Universidad sólo se comunica directa y exclusivamente con el Alumno para todos los fines derivados del mismo, con la sola excepción del cobro de la matrícula y el arancel.</span><span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
12.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>

                        <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">

                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;
mso-ansi-language:ES" class="auto-style8">SEXTO: Autorización expresa</span></b><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:115%;mso-ansi-language:ES" class="auto-style8">.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">El alumno y/o “Aval” autorizan expresamente a la Universidad, para que durante toda la vigencia de éste contrato o durante el plazo que establezca la normativa y reglamentación sobre la materia, sus nombres, cédulas de identidad, y el monto de la eventual deuda morosa para con la Universidad, puedan ser enviados, procesados y comunicados en<span style="mso-spacerun:yes">&nbsp; </span>sistemas<span style="mso-spacerun:yes">&nbsp; </span>de<span style="mso-spacerun:yes">&nbsp; </span>información DICOM, para hacer pública su morosidad y así obtener la integridad del pago respectivo, todo de acuerdo a la ley 19.628, de protección de la vida privada. Esta autorización puede ser revocada, aunque sin efecto retroactivo, lo que también deberá hacerse por escrito</span><o:p></o:p></p>
                <span lang="ES" style="font-size: 11.0pt; line-height: 107%; font-family: &quot;Arial&quot;,sans-serif; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; color: #545454; background: white; mso-ansi-language: ES; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">
                    <br clear="all" style="mso-special-character:line-break;page-break-before:
always" />
                    </span>
                <p class="MsoBodyText">
                    <o:p></o:p></p>
            </td>
        </tr>
        <tr>
            <td>

<p class="MsoBodyText">
                    <span lang="ES" style="font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style8">SEPTIMO: Desistimiento.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Si el alumno y/o el sostenedor de los estudios se desistieran de este contrato suscrito, en el periodo comprendido entre la firma de la matrícula y hasta la fecha de inicio de clases regulares para los alumnos de cualquier nivel académico, definida en el calendario académico, se obligará libre y voluntariamente al pago por concepto de desistimiento, a un porcentaje del 15% del arancel anual valor contado. En todos los casos, la Universidad podrá hacer efectivo el cobro indicado, de forma libre y a su mera liberalidad, contra el alumno del cual se genera la obligación o contra el sostenedor financiero que firmare como garante de la responsabilidad financiera del alumno.<span style="letter-spacing:1.95pt"><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Esta cláusula no es aplicable a los alumnos que hubieren hecho uso del retracto legal dentro de los plazos establecidos por la ley.</span><span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
12.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>


                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">
                        <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">
                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style8">OCTAVO: Retracto</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Derecho de Retracto: Según la ley 19.496, modificada por la ley 19.955 de fecha 14 de julio 2004: En el caso de prestaciones de servicios educacionales de nivel superior, proporcionadas por centros de formación técnica, institutos profesionales y universidades, se faculta al alumno o a quién efectúe el pago en su representación para que, dentro del plazo de diez días contados desde aquél en que se complete la primera publicación de los resultados de las postulaciones a las universidades pertenecientes al Consejo de Rectores de las Universidades Chilenas, deje sin efecto el contrato con la respectiva Universidad, sin pago alguno por los servicios educacionales no prestados.<span style="letter-spacing:1.95pt"> </span>éste.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Para hacer efectivo el retracto a que se refiere este artículo, se requerirá ser alumno de primer año de una carrera o programa de pregrado y acreditar, ante la Universidad respecto de la cual se ejerce esta facultad, encontrarse matriculado en otra entidad de educación superior.</span><span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>
<p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">En ningún caso la Universidad podrá retener con posterioridad a este retracto los dineros pagados ni los documentos de pago o crédito otorgados en respaldo del período educacional respectivo, debiendo devolverlos todos en el plazo de 10 días desde que se ejerza el derecho a retracto. No obstante, lo dispuesto en el inciso anterior, la Universidad estará facultada para retener, por concepto de costos de administración, un monto de la matrícula que no podrá exceder al uno por ciento del arancel anual del programa o carrera.</span><span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
12.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>

                <p class="MsoBodyText">
                    <span lang="ES" style="font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style8">NOVENO: Aplicación de descuentos</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">La aplicación de los descuentos o beneficios otorgados por la universidad de acuerdo a sus convenios vigentes, solo podrán ser aplicados en el periodo de matrícula definido por la Universidad de acuerdo al calendario establecido por la Universidad.<span style="letter-spacing:1.95pt"> </span>éste.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>                
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
12.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>

                <p class="MsoBodyText">
                    &nbsp;</p>
                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:120%;
mso-ansi-language:ES" class="auto-style8">DÉCIMO: Condiciones de matrícula y actividades complementarias.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText" style="margin-top:.4pt;text-align:justify">
                        <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style8">De acuerdo a lo establecido en la ley, las partes aceptan que, en caso de incumplimiento de las obligaciones financieras derivadas del presente contrato, la Universidad estará facultada para suspender provisionalmente todos aquellos servicios de carácter complementario, no <span style="letter-spacing:1.7pt">académicos</span>.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText" style="font-size: small">
                    <span lang="ES" style="font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>

              <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">
                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;
mso-ansi-language:ES" class="auto-style8">DÉCIMO PRIMERO. Vigencia del contrato.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">El presente contrato de prestación de servicios educacionales comenzará a regir desde su suscripción y se mantendrá vigente durante todo el período semestral en que el alumno se encuentre matriculado como estudiante de la Universidad. Además, se deberán suscribir todos los semestres, los anexos del presente contrato, pagando la matrícula y arancel semestral respectivo, hasta la obtención del grado académico o título profesional, según corresponda, lo que es comprendido<span style="letter-spacing:
-.45pt"> </span>y<span style="letter-spacing:-.7pt"> </span>aceptado<span style="letter-spacing:-.45pt"> </span>por<span style="letter-spacing:-.4pt"> </span>el<span style="letter-spacing:-.55pt"> </span>codeudor<span style="letter-spacing:-.4pt"> </span>y<span style="letter-spacing:-.7pt"> </span>el<span style="letter-spacing:
-.45pt"> </span>Alumno.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>

                         <span lang="ES" style="font-size: 11.0pt; line-height: 107%; font-family: &quot;Arial&quot;,sans-serif; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; color: #545454; background: white; mso-ansi-language: ES; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">
                    <br clear="all" style="mso-special-character:line-break;page-break-before:
always" />
                    </span>
              
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
8.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:120%;
mso-ansi-language:ES" class="auto-style8">DÉCIMO SEGUNDO: Documentos integrantes del contrato.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Las Partes declaran y reconocen expresamente que forman parte del presente contrato los siguientes reglamentos, que se indican a continuación y que se encuentran debidamente singularizados en el portal web de la Universidad</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style8"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoListParagraph">
                    <span class="auto-style8">
                    <![if !supportLists]></span><span style="mso-list:Ignore"><span style="mso-font-width:79%" class="auto-style8">(i)</span><span style="font-size:10.0pt;mso-font-width:79%"><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Arial';" class="auto-style8">&nbsp;&nbsp;&nbsp;</span></span></span><span class="auto-style8"><![endif]></span><span style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%" class="auto-style8">Reglamento Académico<span style="letter-spacing:.05pt"> </span>General</span><span style="font-size:9.0pt;
mso-bidi-font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></p>
                <p class="MsoListParagraph">
                    <span class="auto-style8">
                    <![if !supportLists]></span><span style="mso-list:Ignore"><span style="mso-font-width:79%" class="auto-style8">(ii)</span><span style="font-size:10.0pt;mso-font-width:79%"><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Arial';" class="auto-style8">&nbsp;&nbsp;</span></span></span><span class="auto-style8"><![endif]></span><span style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%" class="auto-style8">Reglamento de<span style="letter-spacing:.45pt"> </span>convalidaciones</span><span style="font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></span></p>
                <p class="MsoListParagraph">
                    <span class="auto-style8">
                    <![if !supportLists]></span><span style="mso-list:Ignore"><span lang="ES" style="mso-font-width:79%;mso-ansi-language:ES" class="auto-style8">(iii)</span><span lang="ES" style="font-size:10.0pt;mso-font-width:79%;mso-ansi-language:ES"><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Arial';" class="auto-style8">&nbsp;</span></span></span><span class="auto-style8"><![endif]></span><span lang="ES" style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:
ES" class="auto-style8">Reglamento de Disciplina de los<span style="letter-spacing:-.5pt"> </span>Estudiantes</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoListParagraph">
                    <span class="auto-style8">
                    <![if !supportLists]></span><span style="mso-list:Ignore"><span lang="ES" style="mso-font-width:79%;mso-ansi-language:ES" class="auto-style8">(iv)</span><span lang="ES" style="font-size:10.0pt;mso-font-width:79%;mso-ansi-language:ES"><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Arial';" class="auto-style8">&nbsp;</span></span></span><span class="auto-style8"><![endif]></span><span lang="ES" style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:
ES" class="auto-style8">Reglamentos de Programas de Postgrado y Formación <span style="letter-spacing:
.65pt">Continua</span>.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
8.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>

                        <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">

                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style8">DÉCIMO TERCERO: Domicilio.</span></b><b style="mso-bidi-font-weight:
normal"><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;
font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style8">Las partes fijan como domicilio especial la ciudad de Santiago, para todos los efectos de presente contrato sin perjuicio de lo establecido en el artículo 50 A de la ley N°</span><span style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style8"> </span>
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style8">19.946.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">
                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;
mso-ansi-language:ES" class="auto-style8">DÉCIMO CUARTO. Ley aplicable y resolución de controversias.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Para todos los efectos legales este Contrato será regulado por la ley chilena. Con todo, cualquier diferencia, controversia o cumplimiento del presente contrato, se resolverá a través de los tribunales de justicia de competencia en virtud del emplazamiento del presente contrato.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;
font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText" style="font-size: small">
                    <span lang="ES" style="font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
<p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">

                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style8">DÉCIMO QUINTO: EJEMPLARES.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">En señal de la lectura y aceptación a las condiciones del presente Contrato, las Partes firman en 2 ejemplares del mismo tenor y valor, quedando cada parte con copias de dicho<span style="letter-spacing:2.4pt"> </span>documento.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
<p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">

                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style8">DÉCIMO SEXTO:  Personería.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">La personería de doña Eva Flandes Aguilera para representar a la UNIVERSIDAD SEK, consta en acta de la sesión extraordinaria<span style="letter-spacing:-.05pt"> </span>de<span style="letter-spacing:-.1pt"> </span>la<span style="letter-spacing:.25pt"> </span>junta<span style="letter-spacing:-.7pt"> </span>directiva<span style="letter-spacing:-.05pt"> </span>de<span style="letter-spacing:-.1pt"> </span>la<span style="letter-spacing:
-.1pt"> </span>Universidad<span style="letter-spacing:.05pt"> </span>SEK,<span style="letter-spacing:-.3pt"> </span>celebrada<span style="letter-spacing:-.05pt"> </span>en<span style="letter-spacing:-.2pt"> </span>Santiago<span style="letter-spacing:.05pt"> </span>de<span style="letter-spacing:-.1pt"> </span>Chile<span style="letter-spacing:-.05pt"> </span>el<span style="letter-spacing:-.15pt"> </span>día<span style="letter-spacing:-.1pt"> </span>27<span style="letter-spacing:-.3pt"> </span>de<span style="letter-spacing:-.2pt"> </span>noviembre<span style="letter-spacing:-.2pt"> </span>del<span style="letter-spacing:-.15pt"> </span>año 2017, debidamente reducida a escritura pública otorgada con fecha 30 de noviembre del año 2017 en la Notaría de Santiago<span style="letter-spacing:-.55pt"> </span>de<span style="letter-spacing:-.55pt"> </span>don<span style="letter-spacing:-.55pt"> </span>Eduardo<span style="letter-spacing:-.6pt"> </span>Diez<span style="letter-spacing:-.75pt"> </span>Morello.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>

            </td>
        </tr>
  </table>
  <table class="nav-justified" style="width: 95%">
      <tr>
          <td></td>
      </tr>  
      <tr>
          <td></td>
      </tr>  
      <tr>
          <td></td>
      </tr>  
      <tr>
            <td style="width:33%">

                <p class="MsoBodyText">
                    <span style="mso-font-width:95%;mso-ansi-language:ES">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                    <span lang="ES" style="mso-font-width:95%;mso-ansi-language:ES">---------------------------------------------------</span><span lang="ES" style="mso-ansi-language:ES"><o:p></o:p></span></p>
                <p align="center" class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style5">Alumno<o:p></o:p></span></p>
                <p align="center" class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style5">Rut: 
                    <asp:Label ID="lblRutAlumno3" runat="server"></asp:Label>
                    <o:p></o:p></span>
                </p>

            </td>
            <td style="width:33%">

                <asp:Image ID="Image1" runat="server" ImageUrl="~/Media/firma.png" />

            </td>
            <td style="width:34%">

                <p align="center" class="MsoBodyText">
                    <span lang="ES" style="mso-ansi-language:ES">---------------------------------------------------<o:p></o:p></span></p>
                <p align="center" class="MsoBodyText">
                    <span lang="ES" style="mso-font-width:105%;mso-ansi-language:ES" class="auto-style5">“</span><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style5">Aval”, Sostenedor Económico y</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p align="center" class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style5">Codeudor solidario </span>
                </p>
                <p align="center" class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style5">Rut: 
                    <asp:Label ID="lblRutAceptante2" runat="server"></asp:Label>
                    </span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span>
                </p>

            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }

        .auto-style2 {
            height: 19px;
            text-align: center;
        }

        p.MsoBodyText {
            margin-bottom: .0001pt;
            font-size: 10.0pt;
            font-family: "Arial",serif;
            margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }

        p.MsoListParagraph {
            margin-top: 0cm;
            margin-right: 0cm;
            margin-bottom: 0cm;
            margin-left: 42.15pt;
            margin-bottom: .0001pt;
            text-indent: -18.0pt;
            font-size: 11.0pt;
            font-family: "Arial",serif;
        }

        .auto-style3 {
            width: 95%;
            height: 615px;
        }

        .auto-style4 {
            text-align: justify;
        }

        .auto-style5 {
            font-size: small;
        }
        .auto-style6 {
            font-size: 1.90923e-038;
        }
        .auto-style7 {
            font-size: medium;
        }
        .auto-style8 {
            font-size: large;
        }
    </style>
</asp:Content>


