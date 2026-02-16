<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contrato_mandato.aspx.cs" Inherits="AutoPostulacion.Reports.contrato_mandato" %>--%>
<%@ Page Title="Contrato_Mandato" Language="C#" MasterPageFile="~/contratos.Master" AutoEventWireup="true" CodeBehind="contrato_mandato - Copia.aspx.cs" Inherits="AutoPostulacion.Reports.contrato_mandato - Copia" %>

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
-1.0pt"> </span>la<span style="letter-spacing:-1.0pt"> </span>localidad,<span style="letter-spacing:
-1.1pt"> </span>modalidad<span style="letter-spacing:.95pt"> </span>para<span style="letter-spacing:-1.0pt"> </span>el<span style="letter-spacing:-.9pt"> </span>año<span style="letter-spacing:-1.0pt"> </span>académico<span style="letter-spacing:
-1.1pt"> </span>en<span style="letter-spacing:-1.0pt"> </span>curso,<span style="letter-spacing:-1.1pt"> </span>la<span style="letter-spacing:-1.0pt"> </span>cual<span style="letter-spacing:-.9pt"> </span>es<span style="letter-spacing:-1.05pt"> </span>aceptada<span style="letter-spacing:-.95pt"> </span>en<span style="letter-spacing:-1.0pt"> </span>este<span style="letter-spacing:-1.0pt"> </span>acto<span style="letter-spacing:-.95pt"> </span>por<span style="letter-spacing:-.9pt"> </span>la Universidad,<span style="letter-spacing:
-.7pt"> </span>en<span style="letter-spacing:-.55pt"> </span>los<span style="letter-spacing:-.6pt"> </span>términos<span style="letter-spacing:-.65pt"> </span>que<span style="letter-spacing:-.5pt"> </span>más<span style="letter-spacing:
-.65pt"> </span>adelante<span style="letter-spacing:-.4pt"> </span>se<span style="letter-spacing:-.65pt"> </span>expresan<span style="letter-spacing:-.4pt"> </span>y<span style="letter-spacing:-.65pt"> </span>adquiere<span style="letter-spacing:-.5pt"> </span>como<span style="letter-spacing:-.7pt"> </span>consecuencia,<span style="letter-spacing:-.65pt"> </span>la<span style="letter-spacing:-.55pt"> </span>calidad<span style="letter-spacing:-.55pt"> </span>de<span style="letter-spacing:-.5pt"> </span>Alumno<span style="letter-spacing:-.65pt"> </span>regular de<span style="letter-spacing:
-1.2pt"> </span>la<span style="letter-spacing:-1.2pt"> </span>Universidad<span style="letter-spacing:-1.15pt"> </span>para<span style="letter-spacing:-1.2pt"> </span>todos<span style="letter-spacing:-1.1pt"> </span>los<span style="letter-spacing:-1.1pt"> </span>efectos<span style="letter-spacing:-1.1pt"> </span>legales.</span></span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                    
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.65pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify;line-height:
98%">
                        <span class="auto-style71"><span class="auto-style8" lang="ES" style="mso-bidi-font-size: 10.0pt; line-height: 107%; font-family: &quot;Arial&quot;,sans-serif; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-font-width: 110%; mso-ansi-language: ES; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">Sin perjuicio de lo señalado en el párrafo precedente, el Alumno, no obstante encontrarse matriculado en la Universidad, podrá perder la calidad de Alumno regular, en el evento de incumplir con alguno de los deberes y obligaciones establecidos en los Reglamentos dictados por la Universidad o con alguno de los requisitos académicos determinados por cada carrera</span><span class="auto-style8" style="mso-bidi-font-size: 10.0pt; line-height: 107%; font-family: &quot;Arial&quot;,sans-serif; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-font-width: 110%; mso-ansi-language: ES; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">, los 
                        cuales se entienden conocidos y aceptados por el alumno en el presente acto</span><span class="auto-style8" lang="ES" style="mso-bidi-font-size: 10.0pt; line-height: 107%; font-family: &quot;Arial&quot;,sans-serif; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; mso-font-width: 110%; mso-ansi-language: ES; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">. La inscripción del Alumno en una carrera determinada, no obsta a que, con posterioridad pueda cambiar de carrera, jornada <span style="letter-spacing:
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
text-underline:none" class="auto-style8">www.usek.cl</span><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:windowtext;mso-font-width:110%;mso-ansi-language:ES;text-decoration:none;
text-underline:none" class="auto-style8">. Y que se entienden conocidas y aceptadas por el alumno en el presente acto.</span></a><span style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p> </o:p>
                    </span></p>
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
110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style8">En este acto, el Aceptante y quien comparece en este acto como "Aval" o Co-deudor solidario, ya individualizados, con el objeto de documentar el pago de cualquiera de las obligaciones pecunarias que asume en virtud del presente contrato, viene en conferir mandato especial a la Universidad SEK, facultándola expresamente para que a través de sus mandatarios pueda emitir, llenar y suscribir un pagaré a la orden de "Universidad SEK" por cada plan de pago que haya formalizado. Todos los antecedentes necesarios para suscribir el pagaré podrán ser llenados por la Universidad SEK en conformidad En virtud de lo previsto en el artículo 11 de la Ley Nº 18.092, siguiendo las siguientes instrucciones. La oportunidad a partir de la cual la Universidad SEK podrá proceder a emitir, llenar y suscribir el pagaré, será aquella en que se produzca el simple retardo o mora en el pago de una o varias, cualquiera que sea de las 
                    cuotas del Arancel del año respecto del cual da cuenta el Anexo I (Detalle de pago) del presente contrato. La fecha de emisión y/o suscripción del respectivo pagaré que la Universidad SEK deberá llenar en el documento será aquella en la cual se proceda a ejercer el presente mandato. La fecha de vencimiento del respectivo pagaré, que deberá llenarse, será la del día hábil bancario siguiente al de la fecha de emisión y suscripción del pagaré. La cantidad adeudada que la Universidad SEK deberá estampar en el documento será todas aquellas sumas que “Los Contratantes” adeuden a “Universidad SEK”, incluyendo cuotas impagas y el total del saldo adeudado en virtud de la aceleración de la obligación de pago del arancel anual, gastos administrativos los intereses, reajustes, gastos de cobranza y multas por mora. Se deja expresa constancia que cualquier dificultad que se suscite entre el Aceptante y la Universidad SEK relativa al contenido y monto del pagaré no afectará la validez de éste. El 
                    presente mandato es irrevocable mientras subsistan obligaciones que tenga los mandantes para con la Universidad SEK, en cuanto es de interés del mandante y del mandatario, quienes además lo somete a lo dispuesto en el artículo 241 (doscientos cuarenta y uno) del Código de Comercio. La suscripción o aceptación del mencionado pagaré, no constituirá novación de las obligaciones en ellos documentadas, pues sólo tiene como objeto facilitar el pago de las obligaciones asumidas en el presente contrato. La Universidad SEK no tendrá derecho a recibir remuneración o retribución alguna por el desempeño del presente contrato ni por el desempeño del encargo. Todos los gastos notariales y derechos que se causen con ocasión del otorgamiento del presente instrumento serán de cargo exclusivo del mandante o de su Co-deudor solidario indistintamente.</span><span style="mso-bidi-font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:
110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style8">
                    <br />
                    <br />
                    La suscripción de dicho documento no constituirá novación de las obligaciones adquiridas y se llevará a efecto cuando el alumno que, no habiendo inscrito cursos en un período académico, cualquiera sea el motivo, no concurra a regularizar sus obligaciones con Universidad SEK.
                    <br />
                    <br />
                    En virtud de la presente cláusula don (a) [lblNombreAceptante1], (Estado Civil ) [lblEstadoCivilAceptante1], cédula nacional de identidad Nº [lblRutAceptante1], domiciliado para estos efectos en [lblDomicilioAceptante1], comuna de
                <span style="mso-bidi-font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:
110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style8">[lblComunaAceptante1]</span>, ciudad de
                <span style="mso-bidi-font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:
110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style8">[lblCiudadAceptante1]</span>, en adelante el “Aval” o “Co-deudor solidario”, acepta y se constituye en calidad de tal de las obligaciones pecuniarias contraídas por el Alumno con la Universidad, por todo el periodo académico en el cual el Alumno se matrícula, por lo cual el presente mandato tendrá la finalidad de asegurar el pago de la matrícula y arancel correspondiente al periodo académico, siendo aplicable el presente contrato, en lo relativo a las garantías de las obligaciones, en su totalidad. </span><span lang="ES" style="mso-bidi-font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:
110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style8">&nbsp;</span><span lang="ES" style="mso-bidi-font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:
110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style5"><br />
                    </span></div>
            </td>
        </tr>
        <tr>
            <td>

                <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">

                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style8">QUINTO: Carácter de” Aval</span><span style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style8"> / Co-deudor solidario</span><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style8">”.</span><span lang="ES" style="font-size:9.0pt;
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
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">La aplicación de los descuentos o beneficios otorgados por la universidad de acuerdo a sus convenios vigentes, solo podrán ser aplicados en el periodo de matrícula definido por la Universidad de acuerdo al calendario establecido por la Universidad.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>                
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
12.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>

                <p class="MsoBodyText">
                    &nbsp;</p>
                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:120%;
mso-ansi-language:ES" class="auto-style8">DÉCIMO: </span></b></p>
                <p class="MsoBodyText" style="margin-top:.4pt;text-align:justify">
                        <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style8">Los valores de la matrícula y del arancel son totales e indivisibles durante el respectivo período académico, de manera que el mero hecho de convenirlos implica la obligatoriedad para el alumno y el codeudor solidario de pagarlos íntegramente desde el momento en que se matricule, sea que éste mantenga o no esta calidad durante el año académico, sea que se retire de la Universidad por su propia voluntad o sea excluido o expulsado por razones académicas, de disciplina o por otra que hagan incompatible su permanencia en la Universidad, de acuerdo a la normativa y Reglamento Académico vigente. Sin perjuicio de lo indicando en el párrafo anterior, en el evento que el alumno que se matricule por este instrumento antes del cierre académico del año académico anterior al de esta matrícula, y resulte eliminado académicamente de la carrera, este contrato quedará sin efecto, y el alumno tendrá derecho por esta sola causa a la devolución de los valores 
                    pagados o documentados por concepto de matrícula y/o aranceles que se hayan generado como consecuencia del presente contrato, devolución que se hará efectiva a partir de 30 días posterior a la solicitud de devolución (este párrafo no es aplicable a alumnos que se matriculen por primera vez). En el caso de que el alumno se haya matriculado con el arancel completo, y durante el año académico no puede tomar su carga académica correspondiente por carecer de los prerrequisitos académicos u otro tipo de impedimento académico, deberá igualmente pagar el arancel completo pactado, no procediendo ninguna rebaja de arancel por causa de la situación antes referida. Sin perjuicio de lo establecido en el primer párrafo de esta cláusula, en el caso de alumnos antiguos, en el evento que el alumno resulte eliminado académicamente al final del primer semestre académico, tendrá derecho sólo por esta causa a la condonación del porcentaje de Arancel pactado el periodo siguiente que no podrá cursar. </span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
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
mso-ansi-language:ES" class="auto-style8">DÉCIMO PRIMERO. Domicilio</span></span><span style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;
mso-ansi-language:ES" class="auto-style8"><span style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">.</span></span><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8"><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></span></b><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8"></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Las partes fijan como domicilio especial la ciudad de Santiago, para todos los efectos de presente contrato, sin perjuicio de lo establecido en el artículo 50 A de la ley N° 19.946.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
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
mso-ansi-language:ES" class="auto-style8">DÉCIMO SEGUNDO: Ley aplicable y resolución de controversias.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">Para todos los efectos legales este Contrato será regulado por la ley chilena. Con todo, cualquier diferencia, controversia o cumplimiento del presente contrato, se resolverá a través de los tribunales de justicia de competencia en virtud del emplazamiento del presente contrato. </span></p>

                        <p class="MsoBodyText" style="margin-top:.35pt;text-align:justify">
                        <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">

                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style8">DÉCIMO TERCERO: Ejemplares.</span></b><b style="mso-bidi-font-weight:
normal"><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;
font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:105%;mso-ansi-language:ES" class="auto-style8">En señal de la lectura y aceptación a las condiciones del presente Contrato, las Partes firman en 2 ejemplares del mismo tenor y valor, quedando cada parte con copias de dicho documento.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
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
mso-ansi-language:ES" class="auto-style8">DÉCIMO CUARTO. Personería.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style8">La personería de doña Eva Flandes Aguilera para representar a la UNIVERSIDAD SEK, consta en acta de la sesión extraordinaria de la junta directiva de la Universidad SEK, celebrada en Santiago de Chile el día 27 de noviembre del año 2017, debidamente reducida a escritura pública otorgada con fecha 30 de noviembre del año 2017 en la Notaría de Santiago de don Eduardo Diez Morello.</span><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style5"><o:p>&nbsp;</o:p></span></p>
                    <p class="MsoBodyText" style="margin-top:0cm;margin-right:5.85pt;margin-bottom:
0cm;margin-bottom:.0001pt;text-align:justify">

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


