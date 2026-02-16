<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="anexo_compromiso.aspx.cs" Inherits="AutoPostulacion.Reports.anexo_compromiso" %>--%>
<%@ Page Title="Anexo_compromiso" Language="C#" MasterPageFile="~/contratos.Master" AutoEventWireup="true" CodeBehind="anexo_compromiso.aspx.cs" Inherits="AutoPostulacion.Reports.anexo_compromiso" %>
<asp:Content ID="Anexo_compromiso" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td class="auto-style15">

            </td>
        </tr>
        <tr>
            <td style="width:60%">

            </td>
            <td style="width:40%" class="auto-style1">
                <asp:Image ID="imgLogo" runat="server" Height="40%" ImageUrl="~/Media/logo_sek_doc.jpg" Width="40%" />
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td style="width:95%">

                <p align="center" class="MsoNormal" style="margin-top:3.25pt;margin-right:228.45pt;
margin-bottom:0cm;margin-left:205.9pt;margin-bottom:.0001pt;text-align:center">
                    <b style="mso-bidi-font-weight:normal"><span lang="ES" style="mso-bidi-font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:105%;
mso-ansi-language:ES" class="auto-style13">DETALLE DE PAGO</span></b></p>

            </td>
        </tr>
        <tr>
            <td class="auto-style15">

            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td style="width:95%">

                <p class="auto-style2">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:
ES" class="auto-style13">ALUMNO:<span style="mso-spacerun:yes">&nbsp; 
                    <asp:Label ID="lblNombreAlumno1" runat="server"></asp:Label>
                    </span><o:p></o:p></span>
                </p>
                <p class="auto-style3">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:197%;font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES" class="auto-style13">Carrera: 
                    <asp:Label ID="lblCarrera1" runat="server"></asp:Label>
                    <o:p></o:p></span>
                </p>
                <p class="auto-style3">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:197%;font-family:
&quot;Arial&quot;,sans-serif;mso-ansi-language:ES" class="auto-style13">RUT Alumno:<span style="mso-spacerun:yes">&nbsp;&nbsp; 
                    <asp:Label ID="lblRutAlumno1" runat="server"></asp:Label>
                    </span><o:p></o:p></span>
                </p>
                <p class="auto-style2">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:
105%;mso-ansi-language:ES" class="auto-style13">FECHA: 
                    <asp:Label ID="lblFecha1" runat="server"></asp:Label>
                    </span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span>
                </p>
                <p class="auto-style3">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:197%;font-family:
&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:ES" class="auto-style13">Periodo Académico: 
                    <asp:Label ID="lblPeriodoAcademico" runat="server"></asp:Label>
                    <o:p></o:p>
                    </span>
                </p>
                <p class="auto-style3">
                    <o:p></o:p>
                </p>
                <p class="auto-style3">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:197%;font-family:
&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:ES" class="auto-style13">Aceptante</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;line-height:197%;
font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="auto-style3">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:197%;font-family:
&quot;Arial&quot;,sans-serif;mso-font-width:105%;mso-ansi-language:ES" class="auto-style13">Nombre:<span style="letter-spacing:"normal"> 
                    <asp:Label ID="lblNombreApoderado1" runat="server"></asp:Label>
                    </span><o:p></o:p></span>
                </p>
                <p class="auto-style3">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:197%;font-family:
&quot;Arial&quot;,sans-serif;mso-font-width:105%;mso-ansi-language:ES" class="auto-style13">RUT:<span style="letter-spacing:"normal"> 
                    <asp:Label ID="lblRutApoderado1" runat="server" ></asp:Label>
                    </span></span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;line-height:197%;
font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span>
                </p>
                <p class="auto-style3">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:197%;font-family:
&quot;Arial&quot;,sans-serif;mso-font-width:105%;mso-ansi-language:ES" class="auto-style13">Domicilio:<span style="letter-spacing:"normal">
                    <asp:Label ID="lblDomicilioApoderado1" runat="server"></asp:Label>
                    </span><o:p></o:p></span>
                </p>
                <p class="auto-style3">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:197%;font-family:
&quot;Arial&quot;,sans-serif;mso-font-width:105%;mso-ansi-language:ES" class="auto-style13">Fono: 
                    <asp:Label ID="lblFonoApoderado1" runat="server"></asp:Label>
                    </span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:
10.0pt;line-height:197%;font-family:&quot;Arial&quot;,sans-serif;mso-ansi-language:ES"><o:p></o:p></span>
                </p>
                <p class="auto-style3">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:197%;font-family:
&quot;Arial&quot;,sans-serif;mso-font-width:105%;mso-ansi-language:ES" class="auto-style13">Comuna: 
                    <asp:Label ID="lblComunaApoderado1" runat="server"></asp:Label>
                    <o:p></o:p></span>
                </p>
                <p class="auto-style3">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:197%;font-family:
&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:ES" class="auto-style13">Boleta N°: 
                    <asp:Label ID="lblNumPagare1" runat="server"></asp:Label>
                    </span><o:p></o:p>
                </p>
                <p class="auto-style3">
                    <o:p></o:p>
                </p>

            </td>
        </tr>
        <tr>
            <td class="auto-style15">
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%; margin-left:20px">
        <tr>
            <td style="width:5%">
                <span lang="ES" style="mso-bidi-font-size:
11.0pt;line-height:107%;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-font-width:110%;mso-ansi-language:
ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style13">1º<br />
                <br />
                <br />
                </span></td>
            <td style="width:95%">
                <p class="auto-style5">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style13">El Aceptante ha sido autorizado a pagar a plazo el arancel del presente período semestral académico. El pagaré N°<asp:Label ID="lblNumPagare2" runat="server"></asp:Label>
                    , corresponde al monto de dicho arancel. Para este efecto, el Aceptante gira y/o suscribe los documentos que<span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp; </span>se señalan con los vencimientos que se indican, sin que lo anterior implique ánimo de<span style="letter-spacing:.6pt"> </span>novar.</span><o:p></o:p></p>
                <p class="auto-style5">
                    <o:p></o:p></p>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                </td>
        </tr>
        <tr>
            <td style="width:5%">
                <span lang="ES" style="mso-bidi-font-size:
11.0pt;line-height:107%;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-font-width:110%;mso-ansi-language:
ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA" class="auto-style13">2º<br />
                <br />
                <br />
                </span></td>
            <td style="width:95%">
                <p class="auto-style6">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;line-height:
98%;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:ES" class="auto-style13">En caso que el Aceptante incurra en mora, simple retardo o atraso en el pago de las cuotas convenidas, se aplicará el interés máximo convencional para operaciones reajustables que la ley permita estipular, calculado sobre las cuotas impagas hasta la fecha de su pago efectivo. Asimismo, el incumplimiento en el pago de las obligaciones económicas con la Universidad facultará a la Universidad a resolver el contrato de servicios educativos de forma unilateral, lo que es comprendido y aceptado por el Aceptante y el Alumno.</span><o:p></o:p></p>
                <p class="auto-style6">
                    <o:p></o:p></p>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td class="auto-style17">
                   
            </td>
        </tr>
        <tr>
            <td>

                <p class="auto-style2">
                    <b style="mso-bidi-font-weight:
normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;
font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;mso-ansi-language:ES" class="auto-style20">Detalle Pagos Matrícula<o:p></o:p></span></b></p>

            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td>

                <table class="auto-style7" style="margin-left:20px">
                    <tr>
                        <td style="border: thin ridge #000000" class="auto-style10"><span class="nuevoEstilo1">Tipo Documento</span></td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Emisión</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Monto</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Banco</td>
                    </tr>
                    <tr>
                        <td style="border: thin ridge #000000">
                            <asp:Label ID="lblTipoDocumentoMatricula" runat="server" CssClass="nuevoEstilo3">Matrícula</asp:Label>
                        </td>
                        <td style="border: thin ridge #000000">
                            <asp:Label ID="lblFecEmisionMatricula" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                        </td>
                        <td style="border: thin ridge #000000">
                            <asp:Label ID="lblMontoMatricula" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                        </td>
                        <td style="border: thin ridge #000000">
                            <asp:Label ID="lblBancoMatricula" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td>
                                    <span lang="ES" style="font-size: 11.0pt; line-height: 107%; font-family: &quot;Arial&quot;,sans-serif; mso-fareast-font-family: Calibri; mso-fareast-theme-font: minor-latin; color: #545454; background: white; mso-ansi-language: ES; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">
                    <br clear="all" style="mso-special-character:line-break;page-break-before:
always" />
                                    <br />
                                    <br />
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td>

                <p class="auto-style2">
                    <b style="mso-bidi-font-weight:
normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;
font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;mso-ansi-language:ES" class="auto-style20">Detalle Pago Arancel<o:p></o:p></span></b></p>

            </td>
        </tr>
        <tr>
            <td>
                    <table class="auto-style7" style="margin-left:20px">
                    <tr>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Tipo Documento</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Folio</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Emisión</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Vencimiento</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Monto</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Banco</td>
                    </tr>
                    <tr>
                        <td style="border: thin ridge #000000">
                            <asp:Label ID="lblTipoDocumentoArancel" runat="server" CssClass="nuevoEstilo3" Text="Pagaré"></asp:Label>
                        </td>
                        <td style="border: thin ridge #000000">
                            <asp:Label ID="lblFolioArancel" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                        </td>
                        <td style="border: thin ridge #000000" class="auto-style11">
                            <asp:Label ID="lblFecEmisionArancel" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                        </td>
                        <td style="border: thin ridge #000000">
                            <asp:Label ID="lblFecVencimientoArancel" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                        </td>
                        <td style="border: thin ridge #000000">
                            <asp:Label ID="lblMontoArancel" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                        </td>
                        <td style="border: thin ridge #000000">
                            <asp:Label ID="lblBancoArancel" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td>

                <p class="auto-style2">
                    <b style="mso-bidi-font-weight:
normal"><span lang="ES" style="mso-bidi-font-size:10.0pt;
font-family:&quot;Arial&quot;,sans-serif;mso-font-width:115%;mso-ansi-language:ES" class="auto-style20">Detalle cuotas arancel<o:p></o:p></span></b></p>

            </td>
        </tr>
    </table>        
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td class="auto-style8">
                    <table class="auto-style7" style="margin-left:20px">
                    <tr>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Tipo Documento</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Folio</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">F.Emisión</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">F.Vencimiento</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Monto</td>
                        <td style="border: thin ridge #000000" class="nuevoEstilo1">Banco</td>
                    </tr>
                    <tr>
                        <td style="border: thin ridge #000000">
                            <table class="auto-style12">
                                <tr>
                                    <td class="auto-style8">
                                        <asp:Label ID="lblTipoDocumentoCuotaPagare1" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTipoDocumentoCuotaPagare2" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTipoDocumentoCuotaPagare3" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTipoDocumentoCuotaPagare4" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTipoDocumentoCuotaPagare5" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTipoDocumentoCuotaPagare6" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="border: thin ridge #000000">
                            <table class="auto-style12">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFolioCuotaArancel1" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFolioCuotaArancel2" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFolioCuotaArancel3" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFolioCuotaArancel4" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFolioCuotaArancel5" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFolioCuotaArancel6" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="border: thin ridge #000000">
                            <table class="auto-style12">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecEmisionCuotaArancel1" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecEmisionCuotaArancel2" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecEmisionCuotaArancel3" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecEmisionCuotaArancel4" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecEmisionCuotaArancel5" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecEmisionCuotaArancel6" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="border: thin ridge #000000">
                            <table class="auto-style12">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecVencimientoCuotaArancel1" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecVencimientoCuotaArancel2" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecVencimientoCuotaArancel3" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecVencimientoCuotaArancel4" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecVencimientoCuotaArancel5" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFecVencimientoCuotaArancel6" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="border: thin ridge #000000">
                            <table class="auto-style12">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMontoCuotaArancel1" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMontoCuotaArancel2" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMontoCuotaArancel3" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMontoCuotaArancel4" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMontoCuotaArancel5" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMontoCuotaArancel6" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="border: thin ridge #000000">
                            <table class="auto-style12">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBancoCuotaArancel1" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBancoCuotaArancel2" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBancoCuotaArancel3" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBancoCuotaArancel4" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBancoCuotaArancel5" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBancoCuotaArancel6" runat="server" CssClass="nuevoEstilo3"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
            </td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>
    </table>
    <table class="auto-style16">
        <tr>
            <td style="width:5%">

            </td>
            <td class="auto-style15">
            
                <br />
                <br />
            
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="width:100%">

            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td class="auto-style21">

                <span style="mso-bidi-font-size: 11.0pt; font-family: &quot;Arial&quot;,sans-serif; mso-font-width: 110%; mso-ansi-language: ES" class="auto-style13">3º</span><span style="font-size: 9.0pt; mso-bidi-font-size: 11.0pt; font-family: &quot;Arial&quot;,sans-serif; mso-font-width: 110%; mso-ansi-language: ES"><br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                 <br />
                </span>

            </td>
            <td style="width:95%">
            
                <p class="auto-style5">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-font-width:110%;mso-ansi-language:ES" class="auto-style13">La cobranza del saldo insoluto tendrá los siguientes gastos de cargo del deudor:</span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES"><o:p></o:p></span></p>
                <p class="auto-style5">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style13"><o:p>&nbsp;</o:p></span></p>
                <p class="auto-style9" style="mso-list: l0 level1 lfo1; tab-stops: 56.05pt">
                    <span class="auto-style13">
                    <![if !supportLists]></span><span style="mso-list:Ignore"><span lang="ES" style="letter-spacing:-.05pt;mso-font-width:99%;mso-ansi-language:
ES" class="auto-style13">a)</span><span lang="ES" style="font-size:10.0pt;letter-spacing:-.05pt;mso-font-width:99%;mso-ansi-language:
ES"><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Arial';" class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span class="auto-style13"><![endif]></span><span lang="ES" style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:
ES" class="auto-style13">La cobranza extrajudicial, tendrá los gastos que se indican, de acuerdo a la siguiente escala progresiva, en conformidad a lo dispuesto en la Ley Nº 19.659: Hasta 10 UF (de deuda) es un 9%. La parte que exceda de 10 UF y hasta 50 UF (de deuda) es un 6%. La parte que exceda 50 UF (de deuda) es un 3%, Estos porcentajes se aplicarán<span style="mso-spacerun:yes"> </span>una vez transcurridos los primeros 20 días de <span style="letter-spacing:.9pt">atraso</span>.</span><o:p></o:p></p>
                
                <p class="auto-style9" style="mso-list: l0 level1 lfo1; tab-stops: 56.05pt">
                    <o:p></o:p></p>
                <p class="auto-style5">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style13"><o:p>&nbsp;</o:p></span></p>
                <p class="auto-style9" style="mso-list: l0 level1 lfo1; tab-stops: 56.05pt">
                    <span class="auto-style13">
                    <![if !supportLists]></span><span style="mso-list:Ignore"><span lang="ES" style="letter-spacing:-.05pt;mso-font-width:99%;mso-ansi-language:ES" class="auto-style13">b)</span><span lang="ES" style="font-size:10.0pt;
letter-spacing:-.05pt;mso-font-width:99%;mso-ansi-language:ES"><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Arial';" class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span class="auto-style13"><![endif]></span><span lang="ES" style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:
ES" class="auto-style13">El no pago oportuno del capital anteriormente estipulado facultará a Universidad SEK para hacer exigible de inmediato el total adeudado, en cuyo caso el (los) deudor (es) se obliga (n) a pagar intereses penales a contar del día siguiente de la mora y hasta su pago total, a una tasa igual a la máxima permitida estipular para obligaciones en moneda nacional no reajustables vigente al tiempo de la mora.</span><o:p></o:p></p>

                <p class="auto-style9" style="mso-list: l0 level1 lfo1; tab-stops: 56.05pt">
                    <o:p></o:p></p>
                <p class="auto-style5">
                    <span lang="ES" style="mso-bidi-font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-ansi-language:ES" class="auto-style13"><o:p>&nbsp;</o:p></span></p>
                <p class="auto-style9" style="mso-list: l0 level1 lfo1; tab-stops: 56.05pt">
                    <span class="auto-style13">
                    <![if !supportLists]></span><span style="mso-list:Ignore"><span lang="ES" style="letter-spacing:-.05pt;mso-font-width:99%;mso-ansi-language:ES" class="auto-style13">c)</span><span lang="ES" style="font-size:10.0pt;
letter-spacing:-.05pt;mso-font-width:99%;mso-ansi-language:ES"><span style="font-style: normal; font-variant: normal; font-weight: normal; line-height: normal; font-family: 'Arial';" class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span><span class="auto-style13"><![endif]></span><span lang="ES" style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-font-width:110%;mso-ansi-language:
ES" class="auto-style13">El Aceptante deberá pagar los gastos de <span style="letter-spacing:1.45pt">protesto</span>.</span><o:p></o:p></p>
                <p class="auto-style9" style="mso-list: l0 level1 lfo1; tab-stops: 56.05pt">
                    <o:p></o:p></p>
                <p class="auto-style9" style="mso-list: l0 level1 lfo1; tab-stops: 56.05pt">
                    <o:p></o:p>
                </p>
                <p class="auto-style9" style="mso-list: l0 level1 lfo1; tab-stops: 56.05pt">
                    <o:p></o:p>
                </p>
                <p class="auto-style9" style="mso-list: l0 level1 lfo1; tab-stops: 56.05pt">
                    <o:p></o:p>
                </p>
            
            </td>
        </tr>
        <tr>
            <td class="auto-style22">
                </td>
        </tr>
    </table>     
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="mso-bidi-font-size: 11.0pt; mso-font-width: 110%; mso-ansi-language: ES;" class="auto-style14">

                4º<br />
                <br />
                <br />
                <br />
                <br />
                <br />

            </td>
            <td style="width:95%" class="auto-style18">
            
                <span lang="ES" style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;
mso-font-width:110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:
AR-SA" class="auto-style13">Para el caso de mora en el pago a sus respectivos vencimientos de todo o parte de las obligaciones contraídas, el Aceptante y el Alumno autorizan expresamente a Universidad SEK, para ingresar sus datos personales, tales como nombre,<span style="letter-spacing:-.4pt"> </span>RUT,<span style="letter-spacing:
-.25pt"> </span>domicilio<span style="letter-spacing:-.35pt"> </span>y<span style="letter-spacing:-.3pt"> </span>monto<span style="letter-spacing:-.05pt"> </span>adeudado,<span style="letter-spacing:-.35pt"> </span>al<span style="letter-spacing:-.15pt"> </span>sistema<span style="letter-spacing:-.25pt"> </span>de<span style="letter-spacing:-.2pt"> </span>información<span style="letter-spacing:-.1pt"> </span>comercial<span style="letter-spacing:-.25pt"> </span>como<span style="letter-spacing:-.25pt"> </span>DICOM<span style="letter-spacing:-.05pt"> </span>o<span style="letter-spacing:-.25pt"> </span>el<span style="letter-spacing:-.25pt"> </span>Boletín<span style="letter-spacing:-.25pt"> </span>Comercial, con la finalidad de obtener el pago de lo adeudado. Aceptante y el Alumno facultan expresamente a Universidad SEK para el ingreso de los datos personales de los primeros en el sistema de información comercial mencionado, sin perjuicio<span style="letter-spacing:-.4pt"> </span>de<span style="letter-spacing:-.4pt">
                </span>la<span style="letter-spacing:-.4pt"> </span>facultad<span style="letter-spacing:-.4pt"> </span>de<span style="letter-spacing:-.4pt"> </span>revocación<span style="letter-spacing:-.45pt"> </span>contemplada<span style="letter-spacing:
-.4pt"> </span>en<span style="letter-spacing:-.4pt"> </span>el<span style="letter-spacing:-.95pt"> </span>Artículo<span style="letter-spacing:-.3pt"> </span>4°<span style="letter-spacing:-.4pt"> </span>de<span style="letter-spacing:
-.4pt"> </span>la<span style="letter-spacing:-.45pt"> </span>Ley<span style="letter-spacing:-.4pt"> </span>N°19.628.<br />
                <br />
                </span>
            
            </td>
        </tr>
    
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="mso-bidi-font-size: 11.0pt; mso-font-width: 110%; mso-ansi-language: ES;" class="auto-style14">

                5º<br />
                <br />
                <br />
                <br />

            </td>
            <td style="width:95%" class="auto-style18">
            
                <span lang="ES" style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;
mso-font-width:110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:
AR-SA" class="auto-style13">Universidad SEK podrá hacer exigible el pago total de la suma de la deuda o del saldo a que ésta se halle reducida, considerando la obligación como de plazo vencido, en caso de mora o simple retardo en el pago de una cualquiera de las cuotas en que se divide la obligación, sea de capital y/o intereses, sean consecutivas o no, sin perjuicio de los demás derechos en su calidad de<span style="mso-spacerun:yes">&nbsp; </span>acreedor.<br />
                <br />
                </span>
            
            </td>
        </tr>
   
    </table>  
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="mso-bidi-font-size: 11.0pt; mso-font-width: 110%; mso-ansi-language: ES;" class="auto-style14">

                6º<br />
                <br />

            </td>
            <td style="width:95%" class="auto-style18">
            
                <span lang="ES" style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;
mso-font-width:110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:
AR-SA" class="auto-style13">Para todos los efectos, en el respectivo pagaré, ya individualizado; se constituye como codeudor solidario a Don(ña) 
                <asp:Label ID="lblNombreApoderado2" runat="server"></asp:Label>
                , RUT<span style="mso-spacerun:yes">&nbsp;&nbsp;</span><asp:Label ID="lblRutApoderado2" runat="server"></asp:Label>
                , domiciliado en </span><span style="mso-bidi-font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;
mso-font-width:110%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:
AR-SA" class="auto-style13">
                <asp:Label ID="lblDomicilioApoderado2" runat="server"></asp:Label>
                </span><span lang="ES" style="font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-fareast-font-family:&quot;Arial&quot;;mso-ansi-language:ES;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA">.<br />
                </span><span lang="ES" style="mso-bidi-font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
mso-fareast-font-family:&quot;Arial&quot;;mso-ansi-language:ES;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA"><br class="auto-style13" />
                </span>
            
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td>

            </td>
        </tr>
    </table>   
    <table class="nav-justified" style="width: 95%;margin-left:20px">
        <tr>
            <td style="width:33%">

                <asp:Image ID="Image1" runat="server" ImageUrl="~/Media/firma.png" />

            </td>
            <td style="width:33%">

                <div style="page: WordSection1;">
                    <p class="auto-style19">
                        &nbsp;</p>
                    <p class="auto-style2">
                        <o:p><span style="mso-font-width:
95%;mso-ansi-language:ES">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span lang="ES" style="mso-font-width:
95%;mso-ansi-language:ES">-------------------------------------------</span><o:p></o:p></o:p></p>
                </div>
                <span lang="ES" style="font-size:10.0pt;font-family:&quot;Arial&quot;,serif;
mso-fareast-font-family:&quot;Arial&quot;;mso-ansi-language:ES;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA">
                <%--<br clear="all" style="page-break-before:always;
mso-break-type:section-break" />--%>
                </span><span lang="ES" style="font-size:11.0pt;font-family:&quot;Arial&quot;,serif;
mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:105%;mso-ansi-language:
ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA"><span style="mso-tab-count:
1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:
105%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span lang="ES" style="font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:
105%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">Alumno</span></td>
            <td style="width:33%">

                <div style="page: WordSection1;">
                    <p class="auto-style19">
                        &nbsp;</p>
                    <p class="auto-style2">
                        <o:p><span style="mso-font-width:
95%;mso-ansi-language:ES">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span lang="ES" style="mso-font-width:
95%;mso-ansi-language:ES">-------------------------------------------</span><o:p></o:p></o:p></p>
                </div>
                <span lang="ES" style="font-size:10.0pt;font-family:&quot;Arial&quot;,serif;
mso-fareast-font-family:&quot;Arial&quot;;mso-ansi-language:ES;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA">
                <%--<br clear="all" style="page-break-before:always;
mso-break-type:section-break" />--%>
                </span><span lang="ES" style="font-size:11.0pt;font-family:&quot;Arial&quot;,serif;
mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:105%;mso-ansi-language:
ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA"><span style="mso-tab-count:
1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style="font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:
105%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size:11.0pt;font-family:
&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Arial&quot;;mso-font-width:
105%;mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">Aceptante</span></td>
        </tr>
    </table>                     
</asp:content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
    p.MsoNormal
	{margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Arial",serif;
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
        .auto-style2 {
            font-size: 10.0pt;
            font-family: "Arial", serif;
            margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
            margin-bottom: .0001pt;
        }
        .auto-style3 {
            line-height: 197%;
            font-size: 10.0pt;
            font-family: "Arial", serif;
            margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
            margin-bottom: .0001pt;
        }
        .auto-style5 {
            text-align: justify;
            font-size: 10.0pt;
            font-family: "Arial", serif;
            margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
            margin-bottom: .0001pt;
        }
        .auto-style6 {
            text-align: justify;
            line-height: 98%;
            font-size: 10.0pt;
            font-family: "Arial", serif;
            margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
            margin-bottom: .0001pt;
        }
        .auto-style7 {
            width: 100%;
            border: 1px solid #000000;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style9 {
            text-indent: -18.05pt;
            text-align: justify;
            font-size: 11.0pt;
            font-family: "Arial", serif;
            margin-left: 37.95pt;
            margin-right: 0cm;
            margin-top: 0cm;
            margin-bottom: .0001pt;
        }
        .auto-style10 {
            height: 22px;
        }
        .nuevoEstilo1 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: bold;
        }
        .nuevoEstilo2 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style11 {
            margin-left: 80px;
        }
        .nuevoEstilo3 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
        }
        .auto-style12 {
            width: 100%;
        }
        .auto-style13 {
            font-size: large;
        }
        .auto-style14 {
            font-size: large;
            width: 5%;
            font-family: Arial, sans-serif;
        }
        .auto-style15 {
            height: 46px;
        }
        .auto-style16 {
            width: 95%;
            height: 26px;
        }
        .auto-style17 {
            height: 10px;
        }
        .auto-style18 {
            text-align: justify;
        }
        .auto-style19 {
            font-size: 10.0pt;
            font-family: "Arial", serif;
            margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
            margin-bottom: .0001pt;
            height: 148px;
        }
        .auto-style20 {
            font-size: large;
            margin-left: 20px;
        }
        .auto-style21 {
            width: 5%;
        }
        .auto-style22 {
            height: 46px;
            width: 5%;
        }
    </style>
</asp:Content>

