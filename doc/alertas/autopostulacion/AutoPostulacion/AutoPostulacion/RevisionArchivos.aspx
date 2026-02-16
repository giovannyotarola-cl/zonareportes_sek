<%@ Page Title="Principal" Language="C#" MasterPageFile="~/SiteMenu.Master" AutoEventWireup="true" CodeBehind="RevisionArchivos.aspx.cs" Inherits="AutoPostulacion._RevisionArchivos" %>

<asp:Content ID="RevisionArchivo" ContentPlaceHolderID="MainContent" runat="server">
    <script language="JavaScript">
        function Confirmar() {
            if (confirm('Desea Salir?'))
                return true;
            else
                return false;
        }

    </script>

        <script type="text/javascript">
    $(function () {
        $(".identifyingClass").click(function () {
            var my_id_value = $(this).data('id');
            $(".modal-body #hiddenValue").val(my_id_value);
        })
    });
</script>

    <script src="Scripts/validarut.js?ver=0.1.4"></script>
    <div class="titulo text-center">
        <h1 style="background-color: #FFFFFF; color: #2E89B6;">Revisión de Archivos Enviados</h1>
    </div>
    <table class="nav-justified" style="width: 95%">
        <td style="height:20px">
        </td>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="width: 5%">
                <asp:Label ID="lbl_Rut" runat="server" Text="Rut" style="font-weight: 700"></asp:Label>
            </td>
            <td style="width: 15%">
                <asp:TextBox ID="txt_Rut" runat="server" onchange="javascript:checkRutField(this.value);" value="" MaxLength="12" Width ="98%"></asp:TextBox>
            </td>
            <td style="height: 10%">
                <asp:Button ID="bntBuscar" runat="server" CommandArgument="" CssClass="btn btn-info btn-xs" ClientIDMode="Static" Visible="true" Text="Buscar" OnClick="bntBuscar_Click" />
            </td>
            <td style="height: 40%"></td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="height: 28px">

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_FechaRecepcionDocumentos" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_StatusRevision" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%; height: 34px;">
        <td style="height:20px">
        </td>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="width: 18%">
                <asp:Label ID="lbl_ArchivoContrato" runat="server" Visible="false" style="font-weight: 700">Contrato</asp:Label>
            </td>
            <td style="width: 65%; font-size: x-small;">
                <asp:Label ID="lbl_RutaArchivoContrato" runat="server" ClientIDMode="Static" Visible="false" />
                <asp:HyperLink id="link_RutaArchivoContrato" NavigateUrl="#" Text="" runat="server" Target="_blank"></asp:HyperLink>
            </td>
            <td style="height: 10%">               
                <asp:DropDownList ID="ListEstContrato" runat="server" Height="16px" Width="140px" Visible="false" >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 18%; height: 10%;">
                <asp:Label ID="lbl_ArchivoDetalle" runat="server" Visible="false" style="font-weight: 700">Anexo Compromiso</asp:Label>
            </td>
            <td style="width: 65%; font-size: x-small; height: 10%;">
                <asp:Label ID="lbl_RutaArchivoDetalle" runat="server" ClientIDMode="Static" Visible="false" />
                <asp:HyperLink id="link_RutaArchivoDetalle" NavigateUrl="#" Text="" runat="server" Target="_blank"></asp:HyperLink>
            </td>
            <td style="height: 10%">              
                <asp:DropDownList ID="ListEstAnexContrato" runat="server" Height="16px" Width="140px" Visible="false" >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 18%">
                <asp:Label ID="lbl_ArchivoPagare" runat="server" Visible="false" style="font-weight: 700">Pagaré</asp:Label>
            </td>
            <td style="width: 65%; font-size: x-small;">
                <asp:Label ID="lbl_RutaArchivoPagare" runat="server" ClientIDMode="Static" Visible="false" />
                <asp:HyperLink id="link_RutaArchivoPagare" NavigateUrl="#" Text="" runat="server" Target="_blank"></asp:HyperLink>
            </td>
            <td style="height: 10%">              
                <asp:DropDownList ID="ListEstPagare" runat="server" Height="16px" Width="140px" Visible="false"  >
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="height: 30px">

                <center><asp:Button ID="btoGuardar" runat="server" Text="Guardar" CssClass="btn btn-info btn-xs" ClientIDMode="Static" Visible="False" data-dismiss="modal" /></center>

            </td>
        </tr>
    </table>
        <table class="nav-justified" style="width: 95%">
        <tr>
            <td style="height: 30px">

            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 98%; height: 29px;">
        <tr>
            <td style="width: 98%">
                <asp:Label ID="lbl_envioMail" runat="server" Text="Envío de Mail" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 98%">
        <tr>
            <td style="width: 15%">
                <asp:Label ID="lbl_MailAlumno" runat="server" Text="Mail Alumno" Visible="false"></asp:Label>
            </td>
           <td style="width: 40%">
               <asp:TextBox ID="txt_MailAlumno" runat="server" Width ="80%" Visible =" false"></asp:TextBox>
            </td>
            <td style="width: 45%">

            </td>
        </tr>
    </table>
    <table class="nav-justified" style="width: 98%">
        <tr>
            <td style="width: 98%; height: 108px;">
                <asp:TextBox ID="txt_cuerpoMail" runat="server" Enabled="true" Width="98%" Height="100px" EnableTheming="False" EnableViewState="False" TextMode="MultiLine">Estimado Alumno(a),
Junto con saludar, el motivo de este correo es informar que su documentación ha sido revisada y aprobada, por lo cual está en condiciones de acercarse a la Sede para finalizar con el trámite de Matrícula.

Saluda atentamente:
______________________
</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 24px">

            </td>
        </tr>
        <table class="nav-justified" style="width: 98%">
            <tr>
                <td style="width: 80%">
                    <asp:Button ID="btn_envioMail" runat="server" CommandArgument="" CssClass="btn btn-info btn-xs" ClientIDMode="Static" Visible="true" Text="Enviar Mail" OnClick="btn_envioMail_Click" />
                </td>
                <td style="width: 20%">
                    <asp:Button ID="btn_salir" runat="server" CssClass="btn btn-xs btn-success"  Text="Salir" onclick="btn_salir_Click" OnClientClick="return Confirmar();"/>
                </td>
            </tr>
        </table>
    </table>

<a href='#' data-target='#my_modal' data-toggle='modal' class='identifyingClass' data-id='my_id_value'>Open Modal</a>


    <div class="modal fade" id="my_modal" tabindex="-1" role="dialog" aria-labelledby="my_modalLabel">
    <div class="modal-dialog" role="dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal Title</h4>
            </div>
            <div class="modal-body">
                Modal Body
                <input type="hidden" name="hiddenValue" id="hiddenValue" value="" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Guardar</button>
            </div>
        </div>
    </div>
</div>
</asp:Content>
