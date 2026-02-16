<%@ Page Title="Principal" Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="Condiciones.aspx.cs" Inherits="AutoPostulacion._Condiciones" %>

<asp:Content ID="Condiciones" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script language="JavaScript">
        function Confirmar() {
            if (confirm('Desea Salir?'))
                return true;
            else
                return false;
        }
    </script>
    <script>
        $(document).ready(function () {
            $("#<%= btnContrato.ClientID.ToString() %>").on("click", function () {
                $('#<%= btnSubir.ClientID.ToString() %>').show(); //muestro mediante id
            });
        });
    </script>
    <div class="titulo text-center">
        <h1 style="background-color: #FFFFFF; color: #2E89B6;">Condiciones</h1>
    </div>
    <div class="row">
    </div>
    <div class="container-content">
        <table class="nav-justified" style="width: 98%">
            <tr>
                <td style="height: 26px"></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRutAlumno" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblNombreAlumno" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblNombreCarrera" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 26px"></td>
            </tr>
            <tr>
                <td style="height: 97px">
                        <asp:TextBox ID="txt_Condiciones" runat="server" Enabled="False" Width="100%" EnableTheming="False" EnableViewState="False" TextMode="MultiLine" Text="Estimado Alumno(a): 
Al aceptar estas condiciones, se procederá a mostrar los botones para generar la documentación necesaria (Se debe esperar la descarga del documento seleccionado antes de descargar el siguiente), para poder continuar con el proceso. Usted deberá imprimir estos archivos, los cuales luego de ser leído y aceptados, tendrán que ser firmados, timbrados con su huella digital (donde corresponda) y digitalizados en formato PDF, para luego ser cargados a esta plataforma mediante el botón subir archivo.
En caso de que usted sea su propio aval, el documento correspondiente a Pagaré SOLAMENTE deberá ser firmado en la sección de &quot;Suscriptor&quot;."
                            Rows="7"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 26px"></td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="lblEstadoDeuda" runat="server" Style="color: #FF0000" Visible="False"></asp:Label>

                </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="lblEstadoMatricula" runat="server" Style="color: #006600" Visible="False"></asp:Label>

                </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="lblUltimaMatricula" runat="server" Style="color: #FF0000" Visible="False"></asp:Label>

                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chk_aceptar" runat="server" Text="Acepto las condiciones" AutoPostBack="True" CausesValidation="True" OnCheckedChanged="chk_aceptar_CheckedChanged" Style="text-align: left" />
                </td>
            </tr>
        </table>
    </div>
    <div class="container-content">
        <table class="nav-justified" style="width: 95%">
            <tr>
                <td style="height: 26px"></td>
            </tr>
            <tr>
                <td style="width: 15%">
                    <asp:Label ID="lbl_FormaPago" runat="server" Text="Forma de Pago" Visible="false" Style="text-align: left"></asp:Label>
                </td>
                <td style="width: 15%">
                    <asp:DropDownList ID="drpFormaPago" runat="server" Width="90%" Visible="false">
                        <asp:ListItem Value="Pagaré"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 15%"></td>
                <td style="width: 45%"></td>
            </tr>
            <tr>
                <td style="height: 26px"></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnAceptar" runat="server" CssClass="btn btn-info btn-xs" Text="Generar Documentación" Visible="False" Width="100%" OnClick="btnAceptar_Click" />
                </td>
                <tr>
                    <td>
                        <asp:Button ID="btnContrato" runat="server" CssClass="btn btn-info btn-xs" Text="Generar Contrato" Visible="False" Width="100%" OnClick="btnContrato_Click" />
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:Button ID="btnDetalle" runat="server" CssClass="btn btn-info btn-xs" Text="Generar Detalle de Pago" Visible="False" Width="100%" OnClick="btnDetalle_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnPagare" runat="server" CssClass="btn btn-info btn-xs" Text="Generar Pagaré" Visible="False" Width="100%" OnClick="btnPagare_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSubir" runat="server" CssClass="btn btn-info btn-xs" Text="Subir Documentos"  style=display:none;  Width="100%"  OnClick="btnSubir_Click" />
                </td>
            </tr>
        </table>
                    
        <table class="nav-justified" style="width: 95%">
            <tr>
                <td style="height: 33px"></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn_salir" runat="server" CssClass="btn btn-xs btn-success" Text="Salir" OnClick="btn_salir_Click" OnClientClick="return Confirmar();" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
