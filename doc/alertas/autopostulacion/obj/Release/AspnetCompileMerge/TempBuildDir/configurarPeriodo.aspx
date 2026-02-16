<%@ Page Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="configurarPeriodo.aspx.cs" Inherits="AutoPostulacion.configurarPeriodo" %>

<asp:Content ID="ConfigurarPeriodo" ContentPlaceHolderID="MainContent" runat="server">
    <script language="JavaScript">
        var myWindow;

        function url() {
            hidden = open('MantencionCarrerasAgregar.aspx', 'NewWindow', 'top=0,left=0,width=800,height=600,status=no,resizable=no,scrollbars=no');
        }
        function openWin() {
            myWindow = window.open("MantencionCarrerasAgregar.aspx", "_blank", "width=500, height=500");
        }
        function openWinEliminar() {
            myWindow = window.open("MantencionCarrerasEliminar.aspx", "_blank", "width=500, height=500");
        }
        function Confirmar() {
            if (confirm('Desea Salir?'))
                return true;
            else
                return false;
        }
        function ConfirmarActualizarFechas() {
            if (confirm('Desea Actualizar las fechas?'))
                return true;
            else
                return false;
        }
    </script>
    <div class="titulo text-center">
        <h1 style="background-color: #FFFFFF; color: #2E89B6;">Configuración de Periodo</h1>
    </div>
    <div style="height: 32px">
    </div>
    <div>
        <table style="width: 95%">
            <tr>
                <td style="width: 20%">
                    <asp:Label ID="lblPeriodoActual" runat="server" Text="Periodo Actual" Font-Bold="True" Font-Size="Medium"></asp:Label>
                </td>
                <td style="width: 30%">
                    <asp:Label ID="lblFechaPeriodoActual" runat="server" Text=""></asp:Label>
                </td>
                <td style="width: 30%">
                    <asp:Label ID="lblFechaUltimaMatricula" runat="server" Text="Fecha Máxima Última Cuota" Font-Bold="True"></asp:Label>
                </td>
                <td style="width: 20%">
                    <asp:Label ID="lblFechaUltimaMatriculaActual" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div style="height: 24px">
    </div>
    <div>
        <table style="width: 95%">
            <tr>
                <td style="width: 20%; height: 24px;">

                    <asp:Label ID="lblAno" runat="server" Text="Año" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="lblSemestre" runat="server" Text="Semestre" Font-Bold="True"></asp:Label>
                    <div style="height: 154px">
                        <asp:Label ID="lbl_ano_selected" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lbl_semestre_selected" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lbl_fechaultcuota_selected" runat="server" Visible="False"></asp:Label>
                    </div>
                </td>
                <td style="width: 30%; height: 24px;">
                    <asp:DropDownList ID="drpAno" runat="server">
                    </asp:DropDownList>
                    <br />
                    <asp:DropDownList ID="drpSemestre" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                    </asp:DropDownList>
                    <div style="height: 154px"></div>
                </td>
                <td style="width: 30%; height: 24px;">
                    <asp:Calendar ID="clndFechaUltimaCuota" runat="server" BackColor="White" BorderColor="#3366CC" CellPadding="1" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" BorderWidth="1px">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" Font-Bold="True" BorderWidth="1px" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>

                </td>
                <td style="width: 20%; height: 24px;"></td>
            </tr>
            <tr>
                <td style="width: 20%">&nbsp;</td>
                <td style="width: 30%">&nbsp;</td>
                <td style="width: 30%"></td>
                <td style="width: 20%"></td>
            </tr>
            <tr>
                <td style="width: 20%; height: 22px;">&nbsp;</td>
                <td style="width: 30%; height: 22px;">&nbsp;</td>
                <td style="width: 30%; height: 22px;"></td>
                <td style="width: 20%; height: 22px;"></td>
            </tr>
            <tr>
                <td style="width: 20%; height: 22px;">
                    <asp:Button ID="btnActualizarPeriodo" runat="server" Text="Actualizar Periodo" CssClass="btn btn-info btn-xs" OnClick="btnActualizarPeriodo_Click" OnClientClick="return ConfirmarActualizarFechas();" />
                </td>
                <td style="width: 30%; height: 22px;"></td>
                <td style="width: 30%; height: 22px;">
                    <asp:Button ID="btnFechaMaximaUltimaCuota" runat="server" CssClass="btn btn-info btn-xs" Text="Actualizar Fecha" Visible="false" />
                </td>
                <td style="width: 20%; height: 22px;"></td>
            </tr>
        </table>
        <div>
        </div>
        <table style="width: 95%">
            <tr>
                <td style="width: 30%"></td>
                <td style="width: 30%"></td>
                <td style="width: 30%">&nbsp;</td>
                <td style="width: 10%"></td>
            </tr>
            <tr>
                <td style="width: 30%">
                    <asp:Button ID="btn_salir" runat="server" CssClass="btn btn-xs btn-success" Text="Salir" OnClick="btn_salir_Click" OnClientClick="return Confirmar();" />
                </td>
                <td style="width: 30%"></td>
                <td style="width: 30%"></td>
                <td style="width: 10%"></td>
            </tr>
        </table>
    </div>
</asp:Content>
