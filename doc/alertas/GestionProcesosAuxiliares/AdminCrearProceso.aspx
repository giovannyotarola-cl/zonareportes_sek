<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="AdminCrearProceso.aspx.vb" Inherits="AdminCrearProceso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Agregar Proceso</h2>
    <div>
        <table>
            <tr>
                <td>
                    <span>Proceso</span>
                </td>
                <td>
                    <asp:TextBox ID="txtNombreProceso" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="txtNombreProceso"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Ubicación</span>
                </td>
                <td>
                    <asp:TextBox ID="txtUbicacion" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="txtUbicacion"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <span>Descripción</span>
                </td>
                <td>
                    <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="*" ControlToValidate="txtDescripcion"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:Button ID="btnAgregar" runat="server"  Text="Agregar"/>
    </div>
</asp:Content>

