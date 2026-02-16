<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pagare.aspx.cs" Inherits="AutoPostulacion.Reports.pagare" %>--%>
<%@ Page Title="Pagare" Language="C#" MasterPageFile="~/contratos.Master" AutoEventWireup="true" CodeBehind="pagare.aspx.cs" Inherits="AutoPostulacion.Reports.pagare" %>
<asp:Content ID="Pagare" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td>
                   
            </td>
        </tr>
        <tr>
            <td style="width:95%" class="auto-style1">
                <asp:Image ID="imgLogo" runat="server" Height="25%" ImageUrl="~/Media/logo_sek_doc.jpg" Width="25%" />                
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td class="auto-style2">                
                <p align="center" class="MsoNormal">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:11.0pt;line-height:107%;font-family:
&quot;Arial&quot;,sans-serif;mso-font-width:120%;mso-ansi-language:ES" class="auto-style7">PAGARÉ Nº </span></b></p>
                </asp:Label>
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td class="auto-style9">

            </td>
        </tr>
        <tr>
            <td>

                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:
10.0pt;line-height:98%;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style7">Yo 
                    <asp:Label ID="lblNombreAlumno1" runat="server"></asp:Label>
                    <span style="mso-spacerun:yes">&nbsp;</span>cédula nacional de identidad Nº 
                    <asp:Label ID="lblRutAlumno1" runat="server"></asp:Label>
                    <span style="mso-spacerun:yes">&nbsp;</span>con domicilio en 
                    <asp:Label ID="lblDomicilioAlumno1" runat="server"></asp:Label>
                    <span style="mso-spacerun:yes">&nbsp;</span>comuna de 
                    <asp:Label ID="lblComunaAlumno1" runat="server"></asp:Label>
                    , ciudad de 
                    <asp:Label ID="lblCiudadAlumno1" runat="server"></asp:Label>
                    , fono , email </span><span class="auto-style7"><![if !supportNestedAnchors]><![endif]></span><span lang="ES" style="mso-bidi-font-size:
10.0pt;line-height:98%;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES"><span style="mso-spacerun:yes" class="auto-style7">&nbsp;</span></span><span lang="ES" style="mso-bidi-font-size:
10.0pt;line-height:98%;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style7">Debo y pagaré, incondicionalmente a la orden de Universidad SEK rol único tributario Nº 71.618.600-8, la cantidad<span style="letter-spacing:.1pt"> </span>de<span style="letter-spacing:.05pt"> </span>$ <span style="mso-spacerun:yes">&nbsp;</span><asp:Label ID="lblMontoPagare1" runat="server"></asp:Label>
                    pesos<span style="mso-spacerun:yes">&nbsp; </span>moneda<span style="letter-spacing:-.1pt"> </span>legal.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;line-height:98%;
font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style7">1.- La suma por los Servicios Educacionales contratados la pagaré a más tardar el día 
                    <asp:Label ID="lblFechaPagoPagare1" runat="server"></asp:Label>
                    .</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <o:p></o:p></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style7">2.- El pago deberá efectuarse en Santiago, comuna de Providencia, ciudad de Santiago, o en los lugares que alternativamente<span style="mso-spacerun:yes">&nbsp;</span>se encuentren debidamente publicitados a través del sitio<span style="letter-spacing:2.0pt"> </span>web.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <o:p></o:p></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style7">3.- Don (ña) 
                    <asp:Label ID="lblNombreApoderado1" runat="server"></asp:Label>
                    , cédula nacional de identidad Nº 
                    <asp:Label ID="lblRutApoderado1" runat="server"></asp:Label>
                    , con domicilio en 
                    <asp:Label ID="lblDomicilioApoderado1" runat="server"></asp:Label>
                    , comuna de 
                    <asp:Label ID="lblComunaApoderado1" runat="server"></asp:Label>
                    , ciudad de 
                    <asp:Label ID="lblCiudadApoderado1" runat="server"></asp:Label>
                    , fono 
                    <asp:Label ID="lblFonoApoderado1" runat="server"></asp:Label>
                    , email <span style="mso-spacerun:yes">&nbsp;</span><asp:Label ID="lblMailApoderado1" runat="server"></asp:Label>
                    ,</span><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style7">declara expresamente que viene a constituirse en “Aval” y codeudor solidario de las obligaciones referidas en el presente<span style="mso-spacerun:yes">&nbsp; </span>pagaré.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <o:p></o:p></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style7">4.- El no pago oportuno del capital anteriormente estipulado facultará a Universidad SEK para hacer exigible de inmediato el total adeudado, en cuyo caso el (los) deudor (es) se obliga (n) a pagar intereses penales a contar del día siguiente de la mora y hasta su pago total, a una tasa igual a la máxima permitida estipular para obligaciones en moneda nacional no reajustables vigente al tiempo de la mora.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <o:p></o:p></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style7">5.- Adicionalmente serán de cargo del (los) deudor (es) todos los gastos de cobranza en que se haya incurrido a fin de obtener<span style="mso-spacerun:yes">&nbsp;&nbsp; </span>el pago de la obligación<span style="letter-spacing:-1.3pt"> </span>vencida.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <o:p></o:p></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style7">6.- Todas las obligaciones que emanen de este pagaré serán solidarias para él o los suscriptores y demás obligados a su pago,<span style="mso-spacerun:yes">&nbsp;&nbsp; </span>y<span style="letter-spacing:
-.8pt"> </span>serán<span style="letter-spacing:-.6pt"> </span>indivisibles<span style="letter-spacing:-.5pt"> </span>conforme<span style="letter-spacing:-.6pt"> </span>a<span style="letter-spacing:-.6pt"> </span>los<span style="letter-spacing:
-.5pt"> </span>artículos<span style="letter-spacing:-.4pt"> </span>1.526<span style="letter-spacing:-.55pt"> </span>No<span style="letter-spacing:-.6pt"> </span>4,<span style="letter-spacing:-.6pt"> </span>1.528<span style="letter-spacing:-.65pt"> </span>y<span style="letter-spacing:-.6pt"> </span>1.531<span style="letter-spacing:-.55pt"> </span>del<span style="letter-spacing:-.65pt"> </span>Código<span style="letter-spacing:-.6pt"> </span>Civil.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <o:p></o:p></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style7">7.- El (los) deudor (es) liberan al tenedor de la obligación de protesto, pero en caso que el tenedor opte hacerlo, El (los) deudor (es) se obliga (n) a pagar todo gasto, derecho e impuesto que dicha diligencia origine.</span><span lang="ES" style="font-size:9.0pt;
mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <o:p></o:p></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;
mso-ansi-language:ES" class="auto-style7">8.- Para los efectos de la eventual cobranza judicial de la suma adeudada, el (los) deudor (es) constituyen domicilio en la comuna de Santiago, sometiéndome a la jurisdicción y competencia de sus<span style="letter-spacing:2.5pt"> </span>tribunales.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <o:p></o:p></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:
98%;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:ES" class="auto-style7">9.- En este acto, en forma expresa y para los efectos de obtener la integridad<span style="mso-spacerun:yes">&nbsp; </span>del pago de las obligaciones<span style="mso-spacerun:yes">&nbsp; </span>representadas en<span style="mso-spacerun:yes">&nbsp;&nbsp; </span>este instrumento, el (los) deudor (es) autorizan a Universidad SEK, en los términos señalados en el Artículo 4 de la Ley No 19.628 para que, en el sólo evento de incurrir en mora en el pago de la suma señalada en el presente pagaré, ésta ingrese los datos personales del (los) deudor (es) y los antecedentes de la mora, todo ello en lo referido a las obligaciones que emanan del presente pagaré, en algún sistema de información comercial, facultando expresamente para que se realice su digitación, procesamiento y comunicación, sea pública o privada, en línea o en cualquier otra forma. Esta autorización puede ser revocada sólo por escrito, no teniendo dicha 
                    revocación efecto<span style="letter-spacing:-1.95pt"> </span>retroactivo.</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;line-height:98%;
font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <o:p></o:p></p>
                <div class="auto-style22">
                <span lang="ES" style="mso-bidi-font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-font-width:
110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style7">10.- Los eventuales cambios que se produzcan en las condiciones del presente instrumento, <span style="letter-spacing:-.15pt">ya </span>sea que se establezcan en prórrogas y/o renegociaciones, deberán ser suscritas y aceptadas expresamente por el suscriptor, el deudor y el (los) aval (es) y/o codeudor(es) solidario(s) según<span style="letter-spacing:1.8pt"> </span>corresponda.</span><span lang="ES" style="mso-bidi-font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-font-width:
110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style8"><br />
                </span>
<span lang="ES" style="font-size: 11.0pt; line-height: 107%; font-family: &quot;Arial&quot;,sans-serif; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; color: #545454; background: white; mso-ansi-language: ES; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">
                    <br clear="all" style="mso-special-character:line-break;page-break-before:
always" />
                    </span>
                </div>
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td>

                <p class="MsoBodyText">
                    &nbsp;</p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:
110%;mso-ansi-language:ES" class="auto-style7">11.- El (los) deudor (es), se obligan a informar oportunamente y por escrito al Departamento de Finanzas de Universidad SEK acerca de cualquier cambio de domicilio que efectúen durante la vigencia del presente pagaré y mientras mantengan la condición de deudor (es).</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
9.5pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style7">En Santiago, a</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>

            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td class="auto-style16">

                <p class="MsoBodyText">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:120%;
mso-ansi-language:ES" class="auto-style7">Suscriptor</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></b></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="width: 400px; text-align: justify;">
                    <!--[if gte vml 1]><v:shape id="_x0000_s1026"
 style='position:absolute;left:0;text-align:left;margin-left:610.7pt;
 margin-top:338.45pt;width:177.8pt;height:119.05pt;z-index:251658240;
 mso-position-horizontal-relative:page' coordorigin="12214,6769" coordsize="3556,2381"
 o:spt="100" adj="0,,0" path="m9170,154r2645,m11827,142r,1786m11815,1918r-2645,m9161,1928r,-1786e"
 filled="f" strokeweight=".96pt">
                    <span class="auto-style8">
 <v:stroke joinstyle="round" xmlns:v="urn:schemas-microsoft-com:vml"/>
 <v:formulas xmlns:v="urn:schemas-microsoft-com:vml"/>
 <v:path arrowok="t" o:connecttype="segments" xmlns:v="urn:schemas-microsoft-com:vml"/>
 <w:wrap anchorx="page" xmlns:w="urn:schemas-microsoft-com:office:word"/>
</v:shape><![endif]--><![if !vml]><![endif]></span><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style7">Firma y Huella Suscriptor C.I. Nº: <span style="mso-spacerun:yes">&nbsp;<asp:Label ID="lblRutAlumno2" runat="server"></asp:Label>
                    </span><o:p></o:p></span></p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:
105%;mso-ansi-language:ES" class="auto-style7">NOMBRE: 
                    <asp:Label ID="lblNombreAlumno2" runat="server"></asp:Label>
                    </span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span>
                </p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style7">DOMICILIO DEUDOR: 
                    <asp:Label ID="lblDomicilioAlumno2" runat="server"></asp:Label>
                    <o:p></o:p></span>
                </p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style7">COMUNA: 
                    <asp:Label ID="lblComunaAlumno2" runat="server"></asp:Label>
                    <o:p></o:p></span>
                </p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style7">CIUDAD: 
                    <asp:Label ID="lblCiudadAlumno2" runat="server"></asp:Label>
                    <o:p></o:p></span>
                </p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style7">TELÉFONO: 
                    <asp:Label ID="lblFonoAlumno2" runat="server"></asp:Label>
                    <o:p></o:p></span>
                </p>
                <p class="MsoBodyText" style="text-align: justify">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style7">EMAIL: </span><span class="auto-style7"><![if !supportNestedAnchors]><![endif]>
                    </span>
                    <asp:Label ID="lblMailAlumno2" runat="server" CssClass="auto-style7" Font-Names="Arial"></asp:Label>
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span>
                </p>

            </td>
            <td class="auto-style5">

            </td>
            <td class="auto-style6">

                <asp:Panel ID="Panel1" runat="server" BorderColor="Black" BorderStyle="Solid" Height="120px" Width="120px">
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">

            </td>
            <td class="auto-style18">

            </td>
            <td class="auto-style19">

            </td>
        </tr>
        <tr>
            <td class="auto-style16">

            </td>
            <td class="auto-style5">

            </td>
            <td class="auto-style6">

            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td class="auto-style4">

            </td>
            <td class="auto-style4">
                
                <p class="MsoBodyText">
                    <!--[if gte vml 1]><o:wrapblock><v:line
  id="_x0000_s1027" style='position:absolute;z-index:251656192;
  mso-wrap-distance-left:0;mso-wrap-distance-right:0;
  mso-position-horizontal-relative:page' from="219.85pt,10.7pt" to="390.6pt,10.7pt"
  strokeweight=".14028mm">
  <w:wrap type="topAndBottom" anchorx="page" xmlns:w="urn:schemas-microsoft-com:office:word"/>
 </v:line><![endif]--><![if !vml]><span style="mso-ignore:vglayout">
                    <table align="left" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="0" width="292"></td>
                        </tr>
                        <tr>
                            <td class="auto-style10">----------------------------------------------------</td>
                            <td class="auto-style10">
                                </td>
                        </tr>
                    </table>
                    </span><![endif]><!--[if gte vml 1]></o:wrapblock><![endif]-->
                    <br clear="ALL" style="mso-ignore:vglayout" />
                    <span lang="ES" style="font-size:7.0pt;mso-bidi-font-size:10.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span>
                </p>
                <p align="center" class="MsoBodyText">
                    &nbsp;</p>
                <p align="center" class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES">Firma Suscriptor</span><span lang="ES" style="font-size:
9.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                
            <td class="auto-style4">

            </td>
        </tr>
            
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td class="auto-style15">

                <p class="MsoBodyText" style="font-family: Arial, sans-serif; font-size: large">
                    <strong>Aval y Sostenedor Económico</strong></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="font-size:
9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES"><o:p>&nbsp;</o:p></span></p>
                <p class="MsoBodyText" style="width: 468px">
                    <!--[if gte vml 1]><v:shape id="_x0000_s1026"
 style='position:absolute;left:0;text-align:left;margin-left:610.7pt;
 margin-top:338.45pt;width:177.8pt;height:119.05pt;z-index:251658240;
 mso-position-horizontal-relative:page' coordorigin="12214,6769" coordsize="3556,2381"
 o:spt="100" adj="0,,0" path="m9170,154r2645,m11827,142r,1786m11815,1918r-2645,m9161,1928r,-1786e"
 filled="f" strokeweight=".96pt">
                    <span class="auto-style8">
 <v:stroke joinstyle="round" xmlns:v="urn:schemas-microsoft-com:vml"/>
 <v:formulas xmlns:v="urn:schemas-microsoft-com:vml"/>
 <v:path arrowok="t" o:connecttype="segments" xmlns:v="urn:schemas-microsoft-com:vml"/>
 <w:wrap anchorx="page" xmlns:w="urn:schemas-microsoft-com:office:word"/>
</v:shape><![endif]--><![if !vml]><![endif]></span><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style7">Firma y Huella </span><span style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style7">Aval y Codeudor Solidario</span><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style7"> C.I. Nº: <span style="mso-spacerun:yes">&nbsp;<asp:Label ID="lblRutApoderado2" runat="server"></asp:Label>
                    </span><o:p></o:p></span></p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:
105%;mso-ansi-language:ES" class="auto-style7">NOMBRE: 
                    <asp:Label ID="lblNombreApoderado2" runat="server"></asp:Label>
                    </span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span>
                </p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style7">DOMICILIO </span>
                    <span style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style7">AVAL Y SOSTENEDOR ECONOMICO</span><span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style7">: 
                    <asp:Label ID="lblDomicilioApoderado2" runat="server"></asp:Label>
                    <o:p></o:p></span>
                </p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style7">COMUNA: 
                    <asp:Label ID="lblComunaApoderado2" runat="server"></asp:Label>
                    <o:p></o:p></span>
                </p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style7">CIUDAD: 
                    <asp:Label ID="lblCiudadApoderado2" runat="server"></asp:Label>
                    <o:p></o:p></span>
                </p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style7">TELÉFONO: 
                    <asp:Label ID="lblFonoApoderado2" runat="server"></asp:Label>
                    <o:p></o:p></span>
                </p>
                <p class="MsoBodyText">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style7">EMAIL: </span><span class="auto-style7"><![if !supportNestedAnchors]><![endif]>
                    <asp:Label ID="lblMailApoderado2" runat="server" Font-Names="Arial"></asp:Label>
                    </span>
                    <span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span>
                </p>

            </td>
            <td class="auto-style5">

            </td>
            <td>

                <asp:Panel ID="Panel2" runat="server" BorderColor="Black" BorderStyle="Solid" Height="120px" Width="120px">
                </asp:Panel>
        </tr>
        <tr>
            <td class="auto-style20">

            </td>
            <td class="auto-style21">

            </td>
            <td class="auto-style21">

            </td>
        </tr>
        <tr>
            <td class="auto-style15">

            </td>
            <td>

            </td>
            <td>

            </td>
        </tr>
    </table
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td class="auto-style4">

            </td>
            <td class="auto-style4">
                
                <p class="MsoBodyText">
                    <!--[if gte vml 1]><o:wrapblock><v:line
  id="_x0000_s1027" style='position:absolute;z-index:251656192;
  mso-wrap-distance-left:0;mso-wrap-distance-right:0;
  mso-position-horizontal-relative:page' from="219.85pt,10.7pt" to="390.6pt,10.7pt"
  strokeweight=".14028mm">
  <w:wrap type="topAndBottom" anchorx="page" xmlns:w="urn:schemas-microsoft-com:office:word"/>
 </v:line><![endif]--><![if !vml]><span style="mso-ignore:vglayout">
                    <table align="left" cellpadding="0" cellspacing="0">
                        <tr>
                            <td height="0" width="292"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                ----------------------------------------------------</td>
                        </tr>
                    </table>
                    </span><![endif]><!--[if gte vml 1]></o:wrapblock><![endif]-->
                    <br clear="ALL" style="mso-ignore:vglayout" />
                    <span lang="ES" style="font-size:7.0pt;mso-bidi-font-size:10.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span>
                </p>
                <p align="center" class="MsoBodyText">
                    &nbsp;</p>
                <p align="center" class="MsoBodyText">
                    <span lang="ES" style="font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES">Firma Aval y Codeudor Solidario</span><span lang="ES" style="font-size:
9.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                
            <td class="auto-style4">

            </td>
        </tr>
            
    </table>

</asp:content>

<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style2 {
            height: 19px;
            text-align: center;
        }
    p.MsoBodyText
	{margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Times New Roman",serif;
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
p.MsoListParagraph
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:42.15pt;
	margin-bottom:.0001pt;
	text-indent:-18.0pt;
	font-size:11.0pt;
	font-family:"Times New Roman",serif;
	}
        a:link
	{color:blue;
	text-decoration:underline;
	text-underline:single;
        }
        .auto-style4 {
            width: 33%;
        }
        .auto-style5 {
            width: 150px;
        }
        .auto-style6 {
            text-align: right;
        }
        .auto-style7 {
            font-size: large;
        }
        .auto-style8 {
            font-size: medium;
        }
        .auto-style9 {
            height: 38px;
        }
        .auto-style10 {
            height: 15px;
        }
        .auto-style15 {
            width: 685px;
        }
        .auto-style16 {
            width: 744px;
        }
        .auto-style17 {
            width: 744px;
            height: 51px;
        }
        .auto-style18 {
            width: 150px;
            height: 51px;
        }
        .auto-style19 {
            text-align: right;
            height: 51px;
        }
        .auto-style20 {
            width: 685px;
            height: 52px;
        }
        .auto-style21 {
            height: 52px;
        }
        .auto-style22 {
            text-align: justify;
        }
    </style>
</asp:Content>