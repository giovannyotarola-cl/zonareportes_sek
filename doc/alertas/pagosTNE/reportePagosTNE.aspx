<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="reportePagosTNE.aspx.cs" Inherits="pagosTNE.reportePagosTNE" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <form id="form1" runat="server">
        <main role="main">
            <div class="jumbotron">
                <div class="container header">
                    <img src="https://www.usek.cl/media/1492/logos-blanco-usek-2016.jpg?width=213&amp;height=90" />
                    <h2 class="display-5">Reporte de Pagos TNE</h2>
                    <hr />
                </div>
            </div>
            <div class="container content">
                <!-- Example row of columns -->
                <div class="col-md-5">
                    <div class="form-area">
                        <h4>Filtros Disponibles</h4>
                        <div class="form-group">
                            <label>Rut</label>
                            <%--<input id="txtApellidoPaterno" type="text" class="form-control" name="Apellido Paterno" placeholder="Apellido Paterno">--%>
                            <asp:TextBox ID="txtRut" CssClass="form-control" runat="server" Width="50%"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Nombres</label>
                            <%--<input id="txtApellidoMaterno" type="text" class="form-control" name="Apellido Materno" placeholder="Aepllido Materno">--%>
                            <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" Width="70%"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Apellido Paterno</label>
                            <%--<input id="txtAno" type="text" class="form-control" name="Año" placeholder="Año">--%>
                            <asp:TextBox ID="txtApellidoPaterno" CssClass="form-control" runat="server" Width="70%"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Apellido Materno</label>
                            <%--<select runat="server" id="drpCarrera" name="drpCarrera" class="form-control"></select>--%>
                            <asp:TextBox ID="txtApellidoMaterno" CssClass="form-control" runat="server" Width="70%"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Año</label>
                            <%--<select runat="server" id="drpJornada" name="drpJornada" class="form-control"></select>--%>
                            <asp:TextBox ID="txtAno" CssClass="form-control" runat="server" Width="20%"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Carrera</label>
                            <%--<select runat="server" id="drpTipo" name="drpTipo" class="form-control"></select>--%>
                            <asp:TextBox ID="txtCarrera" CssClass="form-control" runat="server" Width="60%"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Jornada</label>
                            <%--<button type="submit" id="btnBuscar" name="submit" class="btn btn-primary pull-right">Buscar</button>--%>
                            <asp:DropDownList ID="drpJornada" CssClass="form-control" runat="server" Width="30%">
                                <asp:ListItem Value="Todas">Todas</asp:ListItem>
                                <asp:ListItem>Diurna</asp:ListItem>
                                <asp:ListItem>Vespertina</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Tipo</label>
                            <%--<button type="submit" id="btnBuscar" name="submit" class="btn btn-primary pull-right">Buscar</button>--%>
                            <asp:DropDownList ID="drpTipoPago" CssClass="form-control" runat="server" Width="60%">
                                <asp:ListItem>Todos</asp:ListItem>
                                <asp:ListItem Value="Revalidacion">Revalidación Pase Escolar</asp:ListItem>
                                <asp:ListItem Value="Pase">Pase Escolar</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <hr />
            </div>
            <div class="col-md-5">

            </div>
            <div class="container content">
                <%--<button type="submit" id="btnBuscar" name="submit" class="btn btn-primary pull-right">Buscar</button>--%>
                <table style="width: 95%">
                    <tr>
                        <td style="width: 20%" class="col-md-5">
                            <asp:Button ID="btnBuscarDatos" runat="server" CssClass="btn btn-primary pull-right" Text="Buscar Datos" OnClick="btnBuscarDatos_Click" />
                        </td>
                        <td style="width: 60%"></td>
                        <td style="width: 20%" class="col-md-5">
                            <asp:Button ID="btnGenerarExcel" runat="server" CssClass="btn btn-primary pull-right" Text="Generar Excel" OnClick="btnGenerarExcel_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="container content">
                <br />
                <asp:Label ID="lblCantidadRegistros" runat="server" ForeColor="White"></asp:Label>
                <br />
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <asp:GridView ID="grdPagosTNE" runat="server" CssClass="mGrid" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" OnPageIndexChanging="grdPagosTNE_PageIndexChanging" OnSelectedIndexChanged="grdPagosTNE_SelectedIndexChanged" Font-Names="Arial" Font-Size="XX-Small" PageSize="25" Width="90%" HorizontalAlign="Center">
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
            </div>
        </main>
        <footer class="container footers">
            <p>&copy; USEK 2017-2018</p>
        </footer>
    </form>
</asp:Content>



