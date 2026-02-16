<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="archivos.aspx.cs" Inherits="AutoPostulacion.archivos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            height: 30px;
            width: 153px;
        }
        .auto-style3 {
            height: 26px;
        }
        .auto-style4 {
           text-align: center;
           height: 30px;
        }
        .auto-style5 {
            
            height: 30px;
            width: 219px;
        }
        .fin {
            text-align: right;
        }

        .form-control {
            height:26px;
        }

        
    </style>

</head>
<body >
    <form id="form1" runat="server">
        <div class="content">
            <table  class="nav-justified">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblRut" runat="server" Text="Rut" />
                    </td>
                    <td class="auto-style3" colspan="2">
                        <asp:TextBox ID="txt_Rut" runat="server" Text="" CssClass="form-control" Enabled="false" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre" />
                    </td>
                    <td class="auto-style3"  colspan="2">
                        <asp:TextBox ID="txtNombre" runat="server" Text="" CssClass="form-control" Enabled="false" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lbl_ArchivoContrato" runat="server" Text="Contrato" />
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="btoVerContrato" runat="server" Text="Ver Archivo" class='btn btn-info btn-xs' Width="110px" OnClick="btoVerContrato_Click" />
                    </td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropEstContrato" runat="server"  Width="200px"> </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Anexo Contrato</td>
                    <td class="auto-style5">
                        <asp:Button ID="btoVerAnexContra" runat="server" Text="Ver Archivo" class='btn btn-info btn-xs'  Width="110px" OnClick="btoVerAnexContra_Click"   />
                    </td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropEstAnexCon" runat="server"  Width="200px" ></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Pagare</td>
                    <td class="auto-style5">
                       <asp:Button ID="btoVerPagare" runat="server" Text="Ver Archivo" class='btn btn-info btn-xs'  Width="110px" OnClick="btoVerPagare_Click" />
                    </td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="DropEstPagare" runat="server"  Width="200px" > </asp:DropDownList>
                    </td>
                </tr>     
                <tr  class="fin">
                    <td colspan="3">
                         <asp:Button runat="server" ID="btnGuardar" Text="Guardar" CssClass="btn btn-xs btn-success" Width="110px" Height="22px" OnClick="btnGuardar_Click"   />
                    </td>
                </tr>           
            </table>        
        </div>
    </form>
</body>
</html>
