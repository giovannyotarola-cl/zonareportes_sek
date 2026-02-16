<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cambioFechaMatriculas.aspx.cs" Inherits="cambioFechaMatricula.cambioFechaMatriculas" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script language="javascript">
        function Confirmar() {
            if (confirm('Desea Modificar la Fecha de Matrícula?'))
                return true;
            else
                return false;
        }
        function Salir() {
            if (confirm('Desea Salir?'))
                return true;
            else
                return false;
        }
        function closeWin() {
            if (confirm('Desea Salir'))
                myWindow.close();
            else
                return false;
        }
    </script>
    <form id="form1" runat="server">
        <main role="main">
            <div class="jumbotron">
                <div class="container header">
                    <img src="https://www.usek.cl/media/1492/logos-blanco-usek-2016.jpg?width=213&amp;height=90" />
                    <h2 class="display-5">Activación de Matrícula</h2>
                    <hr />
                </div>
            </div>
            <div class="container content">
                <div class="col-md-5">
                    <div class="form-area">
                        <h4></h4>
                        <div class="form-group">
                            <label><h4>Rut</h4></label>
                            <asp:TextBox ID="txtRut" CssClass="form-control" runat="server" Width="50%"></asp:TextBox>
                            <asp:Label ID="lblFormatoRut" runat="server" Text="RUT sin puntos, guión ni DV (Ejemplo: 14155660)" Font-Size="X-Small"></asp:Label>
                            <br />
                            <br />
                            <asp:Button ID="btnBuscarAlumno" runat="server" CssClass="btn btn-primary pull-right" Text="Buscar" OnClick="btnBuscarAlumno_Click" />
                            <asp:Button ID="btnSalir" runat="server" CssClass="btn btn-xs btn-success" Text="Salir" OnClick="btnSalir_Click" OnClientClick="javascript:window.close();"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <asp:GridView ID="grdAlumno" runat="server" BackColor="White" HorizontalAlign="Center" Visible="False" Font-Size="Small" Width="80%" AutoGenerateSelectButton="True" OnSelectedIndexChanged="grdAlumno_SelectedIndexChanged">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </table>
                <%--<asp:TextBox ID="txtFechaMatricula" CssClass="form-control" runat="server" Width="20%"></asp:TextBox>--%>
            </div>
            <div class="container content" style="height: 50px">
                <asp:CheckBox ID="chkActualizar" runat="server" Text="Actualizar Datos" Visible="false" />
                <asp:Label ID="lblInfonoEncontrada" runat="server" Visible="False" ForeColor="White"></asp:Label>
            </div>
            <div class="container content" id="datos_modificar" runat="server">
                        <h4>Modificar Fecha</h4>
                <div>
                    <asp:Label ID="lblTituloCodCli" runat="server" Text="CODCLI: " Visible="false"></asp:Label>
                    <asp:Label ID="lblCodCli" runat="server" Visible="false"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblTituloRut" runat="server" Text="RUT: " Visible="false"></asp:Label>
                    <asp:Label ID="lblRut" runat="server" Visible="false"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="lblResultado" runat="server" Visible="False" ForeColor="White"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label1" runat="server" Visible="false" Text=" "></asp:Label>
                </div>
                <div>
                    <asp:Button ID="btnBuscarOtro" runat="server" Text="Buscar otro Alumno" Visible="false" CssClass="btn btn-primary pull-right" />
                </div>
                        <table style="width: 95%">
                            <tr>
                                <td style="width:33%">
                                    <div class="form-group">
                                        <label>Año Matricula</label>
                                        <br />
                                        <%--<asp:TextBox ID="txtFechaMatricula" CssClass="form-control" runat="server" Width="20%"></asp:TextBox>--%>
                                        <asp:DropDownList ID="drpAnoMatricula" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="auto-style1"></div>
                                </td>
                                <td style="width:33%">
                                    <div class="form-group">
                                        <label>Periodo Matricula</label>
                                        <br />
                                        <%--<asp:TextBox ID="txtFechaMatricula" CssClass="form-control" runat="server" Width="20%"></asp:TextBox>--%>
                                        <asp:DropDownList ID="drpPeriodoMatricula" runat="server" CausesValidation="True" OnSelectedIndexChanged="drpPeriodoMatricula_SelectedIndexChanged" OnTextChanged="drpPeriodoMatricula_TextChanged">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="auto-style1"></div>
                                    </td>
                                <td style="width:33%">
                                    <div class="table-responsive">
                                        <label>Fecha Matricula</label>
                                        <%--<asp:TextBox ID="txtFechaMatricula" CssClass="form-control" runat="server" Width="20%"></asp:TextBox>--%>
                                        <asp:Calendar ID="clnFecha" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                            <NextPrevStyle VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#808080" />
                                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                            <SelectorStyle BackColor="#CCCCCC" />
                                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                            <WeekendDayStyle BackColor="#FFFFCC" />
                                        </asp:Calendar>
                                    </div>
                                </td>
                    </tr>
                            </table>
                        <div class="form-group">
                            <br />
                            <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-primary pull-right" Text="Actualizar Fecha" OnClientClick="return Confirmar();" OnClick="btnActualizar_Click" />
                        </div>
            </div>
        </main>
    </form>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .auto-style1 {
            height: 130px;
        }
    </style>
</asp:Content>

