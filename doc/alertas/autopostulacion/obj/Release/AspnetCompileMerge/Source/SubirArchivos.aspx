<%@ Page Title="Principal" Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="SubirArchivos.aspx.cs" Inherits="AutoPostulacion._SubirArchivos" %>

<asp:Content ID="SubirArchivo" ContentPlaceHolderID="MainContent" runat="server">

    <script src="Scripts/validarut.js?ver=0.1.4"></script>
    <script language="JavaScript">
        function Confirmar() {
            if (confirm('Desea Salir?'))
                return true;
            else
                return false;
        }
    </script>
    <div class="titulo text-center">
        <h1 style="background-color: #FFFFFF; color: #2E89B6;">Carga de Archivos</h1>
    </div>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="width: 5%; height: 27px;">
                <asp:Label ID="lbl_Rut" runat="server" Text="Rut" Width="5%" Visible="true"></asp:Label>
            </td>
            <td style="width: 15%; height: 27px;">
                <asp:TextBox ID="txt_Rut" runat="server" Width="98%" onchange="javascript:checkRutField(this.value);" value="" MaxLength="12" Visible="true" CausesValidation="True"></asp:TextBox>
            </td>
            <td style="width: 50%; height: 27px;">
                <asp:Button ID="bntBuscarRUT" runat="server" CommandArgument="" CssClass="btn btn-info btn-xs" ClientIDMode="Static" Visible="true" Text="Buscar" OnClick="bntBuscarRUT_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEspacio1" runat="server" Text=" " Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td>
                <asp:Label ID="lbl_hayArchivosCargados" runat="server" Text="" Visible="true"></asp:Label>                
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEspacio2" runat="server" Text=" " Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="width: 20%">
                <asp:Label ID="lbl_ArchivoContrato" runat="server" Visible="false">Contrato</asp:Label>
            </td>
            <td style="width: 40%">
                <asp:FileUpload ID="ruta_ArchivoContrato" runat="server" Width="90%" Visible="false"/>
            </td>
            <td style="width: 30%">
                <asp:Button ID="btn_descargaArchivoContrato" runat="server" CommandArgument="" CssClass="btn btn-info btn-xs" ClientIDMode="Static" Visible="false" Text="Descargar" />
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <asp:Label ID="lbl_ArchivoDetalle" runat="server" Visible="false">Anexo Compromiso</asp:Label>
            </td>
            <td style="width: 40%">
                <asp:FileUpload ID="ruta_ArchivoDetalle" runat="server" Width="90%" Visible="false"/>
            </td>
            <td style="width: 30%">
                <asp:Button ID="btn_descargaArchivoDetalle" runat="server" CommandArgument="" CssClass="btn btn-info btn-xs" ClientIDMode="Static" Visible="false" Text="Descargar" />
            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <asp:Label ID="lbl_ArchivoPagare" runat="server" Visible="false">Pagaré</asp:Label>
            </td>
            <td style="width: 40%">
                <asp:FileUpload ID="ruta_ArchivoPagare" runat="server" Width="90%" Visible="false"/>
            </td>
            <td style="width: 30%">
                <asp:Button ID="btn_descargaArchivoPagare" runat="server" CommandArgument="" CssClass="btn btn-info btn-xs" ClientIDMode="Static" Visible="false" Text="Descargar" />
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="height: 40px;">

            </td>
        </tr>
        <tr>
            <td style="width: 20%">
                <asp:Button ID="btn_subirArchivos" runat="server" CommandArgument="" CssClass="btn btn-info btn-xs" ClientIDMode="Static" Visible="false" Text="Cargar Archivos" OnClick="btn_subirArchivos_Click" />
            </td>
            <td style="width: 50%">

            </td>
            <td style="width: 20%">
                <asp:Button ID="btn_salir" runat="server" CssClass="btn btn-xs btn-success" Text="Salir" OnClientClick="return Confirmar();" OnClick="btn_salir_Click"/>
            </td>
        </tr>
    </table>

</asp:Content>
