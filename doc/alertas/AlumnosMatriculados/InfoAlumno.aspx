<%@ Page Title="" Language="VB" MasterPageFile="~/Info.master" AutoEventWireup="false" CodeFile="InfoAlumno.aspx.vb" Inherits="InfoAlumno" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <h3>INFORMACIÓN ALUMNO</h3>

    <table class="infoAlumno">
        <tbody>
            <tr class="inter">
                <td class="bolder">RUT ALUMNO</td>
                <td><asp:Label ID="lb_rut" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="bolder">NOMBRE</td>
                <td><asp:Label ID="lb_nombre" runat="server"></asp:Label></td>
            </tr>
            <tr class="inter">
                <td class="bolder">FECHA NACIMIENTO</td>
                <td><asp:Label ID="lb_fechanacimiento" runat="server"></asp:Label></td>
            </tr>
        </tbody>
    </table>

    <h3>INFORMACIÓN CONTACTO</h3>

    <table class="infoAlumno">
        <tbody>
            <tr class="inter">
                <td class="bolder">DIRECCIÓN</td>
                <td><asp:Label ID="lb_direccion" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="bolder">CELULAR</td>
                <td><asp:Label ID="lb_celular" runat="server"></asp:Label></td>
            </tr>
            <tr class="inter">
                <td class="bolder">FONO</td>
                <td><asp:Label ID="lb_fono" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="bolder">EMAIL</td>
                <td><asp:Label ID="lb_email" runat="server"></asp:Label></td>
            </tr>
        </tbody>
    </table>

    <table>
        <tbody>
            <tr class="inter">
                <td colspan="2">
                    <input type="button" class="float-right" value="Cerrar" onclick="javascrpt: window.close();" />
                </td>
            </tr>
        </tbody>
    </table>

</asp:Content>

